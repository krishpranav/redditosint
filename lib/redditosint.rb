#!/usr/bin/evn ruby

class Rubyosint
    def self.engage(user)
        client_config

        puts "Initializing client..."
        client = Rubyosint::RubyosintClient.new(
            username: @username,
            password: @password,
            browser: @browser,
            target: user
        )

        puts "Initialize comments store..."
        comments = Rubyosint::Comments.new

        puts "Beginning scrape. This may take some time...."
        processing = true
        while processing == true
            comments.add_comments(client.pull_comments)
            


# requires
require 'redditosint/comment'
require 'redditosint/comments'
require 'redditosint/comments_parser'
require 'redditosint/strigil_client'