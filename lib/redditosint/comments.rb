#!/usr/bin/env ruby

# requires
require 'fileutils'

class Redditosint::Comments
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
    unless File.exist?('./data/')
      FileUtils.mkdir('./data/')
    end
    File.open("./data/comments.json", 'w') do |f|
      f.write(log_to_json)
    end
  end

  def clear
    @log = []
  end

  private

  def log_to_json
    result = '['
    log.each do |comment|
      result << comment.to_json
      result << ',' unless comment == log.last
    end
    result << ']'
    result 
  end
end