#!/usr/bin/env ruby 


class Redditosint::CommentParser

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

