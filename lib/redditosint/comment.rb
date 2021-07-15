require 'time'

class Redditosint::Comment
    attr_reader :author, :subreddit, :permalink, :timestamp, :text

    def initialize(params={})
        @author = params[:author]
        @subreddit = params[:subreddit]
        @permalink = params[:permalink]
        @timestamp = Time.parse(params[:timestamp])
        @text = params[:text]
    end
    
