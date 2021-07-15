#!/usr/bin/env ruby
# align comments in the target reddit post

# requires
require 'time'

class Strigil::Comment
  attr_reader :author, :subreddit, :permalink, :timestamp, :text

  def initialize(params={})
    @author = params[:author]
    @subreddit = params[:subreddit]
    @permalink = params[:permalink]
    @timestamp = Time.parse(params[:timestamp])
    @text = params[:text]
  end

  def to_json
    {
      author: author,
      subreddit: subreddit,
      permalink: permalink,
      timestamp: timestamp,
      text: text
    }.to_json
  end

  def display
    %{
      posted by #{author} on /r/#{subreddit}
      #{timestamp} | #{permalink}
      -------------------------------------
      #{text}
    }
  end
end