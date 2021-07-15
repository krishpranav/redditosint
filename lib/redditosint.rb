class Redditosint
    def self.engage(user)
      client_config
  
      puts "Initializing client..."
      client = Redditosint::RedditosintClient.new(
        username: @username,
        password: @password,
        browser: @browser,
        target: user
      )
  
      puts "Initializing comments store..."
      comments = Redditosint::Comments.new
  
      puts "Beginning scrape. This may take a while."
      processing = true
      while processing == true
        comments.add_comments(client.pull_comments)
  
        begin
          client.iterate
        rescue EndOfQueueError
          processing = false
  
          client.close
          comments.save
  
          puts "Pulled #{comments.log.size} comments."
          puts "JSON data stored in ./data/comments.json"
  
          comments.clear
        end
      end
    end
  
    private
  
    def self.client_config
      puts "Valid Reddit account details are neccessary to scrape correctly."
      puts "This information is _not_ sent to any third party - it is simply"
      puts "used to properly configure how user comments are displayed in"
      puts "order to scrape them correctly. Feel free to use a throwaway."
      puts "Username:"
      print "> "
      @username = gets.chomp
      puts "Password:"
      print "> "
      @password = gets.chomp
      puts "Do you have Chrome or Firefox installed?"
      puts "Type either 'chrome' or 'firefox' without quotes."
      @browser = gets.chomp
    end
  end
  
  class ConfigurationError < StandardError
  end
  
require 'redditosint/comment'
require 'redditosint/comments'
require 'redditosint/comments_parser'
require 'redditosint/redditosint_client'
