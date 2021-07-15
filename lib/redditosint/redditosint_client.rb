#!/usr/bin/env ruby

# requires
require 'selenium-webdriver'
require 'webdrivers'

class Redditosint::RedditosintClient
  attr_reader :client

  def initialize(params)
    target = params[:target]
    username = params[:username]
    password = params[:password]

    @client = Selenium::WebDriver.for(params[:browser].to_sym)

    login_and_make_legacy(username, password)

    client.navigate.to "https://reddit.com/u/#{target}/comments"
  end

  def pull_comments
    Redditosint::CommentsParser.parse(client)
  end

  def close
    client.close
  end

  def iterate
    begin
      client.find_element(link_text: "next ›").click
    rescue
      raise EndOfQueueError
    end
  end

  private

  def login_and_make_legacy(username, password)
    login_to_reddit(username, password)
    set_legacy_preference
  end

  def login_to_reddit(username, password)
    client.navigate.to 'https://reddit.com/login'

    login_panel = client.find_element(id: "login-form")

    username_field = login_panel.find_element(id: "user_login")
    password_field = login_panel.find_element(id: "passwd_login")
    login_button = login_panel.find_element(tag_name: "button", class: "c-btn")

    username_field.send_keys(username)
    password_field.send_keys(password)

    login_button.click

    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until do
      client.find_element(id: "header-bottom-right").find_element(link_text: username)
    end
  end

  def set_legacy_preference
    client.navigate.to 'https://reddit.com/prefs/'

    legacy_box = client.find_element(id: "profile_opt_out")

    unless legacy_box.attribute(:checked)
      legacy_box.click

      save_button = client.find_element(class: "save-preferences")
      save_button.click
    end
  end

end

class EndOfQueueError < StandardError
end