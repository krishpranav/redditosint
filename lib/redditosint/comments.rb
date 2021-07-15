#!/usr/bin/env ruby

require 'fileutils'

class Rubyosint::Comments
    attr_accessor :log

    def initialize
        @log = []
    end

    def add_comments(comments)
        @log += comments
    end

    def add_comment(comment)
        @log.push(comment)
    end

    def save
        unless File.exists?('./data/')
            FileUtils.mkdir('./data/')
    end
    File.open("./datat/comments.json", 'w') do |f|
        f.write(log_to_json)
    end
end
    
