class Redditosint::CommentsParser

    def self.parse(client)
      comments = get_comments(client)
  
      comments.map do |comment|
        Redditosint::Comment.new(
          author: get_author(comment),
          subreddit: get_subreddit(comment),
          permalink: get_permalink(comment),
          timestamp: get_timestamp(comment),
          text: get_text(comment)
        )
      end
    end
  
    private
  
    def self.get_comments(client)
      client.find_elements(class: "comment")
    end
  
    def self.get_author(comment)
      comment.attribute("data-author")
    end
  
    def self.get_subreddit(comment)
      comment.attribute("data-subreddit")
    end
  
    def self.get_permalink(comment)
      'https://reddit.com/r/' + comment.attribute("data-permalink")
    end
  
    def self.get_timestamp(comment)
      get_entry(comment).find_element(tag_name: "time").attribute(:title)
    end
  
    def self.get_text(comment)
      get_entry(comment).find_element(class: "usertext-body").text
    end
  
    def self.get_entry(comment)
      comment.find_element(class: "entry")
    end
  end