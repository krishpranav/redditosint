#!/usr/bin/env ruby


# requires
require 'selenium-webdriver'
require 'webdrivers'

class Redditosint::RedditClient
    attr_reader :client

    def initialize(params)
        target = params[:target]
        username = params[:username]
        password = params[:password]

        @client = Selenium::WebDriver.for(params[:browser].to_sym)

        login_and_make_legacy(username, password)

        client.navigate.to "https://reddit.com/u/#{target}/comments"
    end
    