Gem::Specification.new do |s|
    s.name = "redditosint"
    s.version = '2.0.0'
    s.date = '2021-15'
    s.license = 'MIT'
  
    s.author = "Krisna Pranav"
    s.email = 'krisna.pranav@gmail.com'
    s.homepage = 'https://github.com/krishpranav/redditosint'
  
    s.summary = "A simple ruby tool that scrapes reddit user's comment history and saves into a JSON file"
  
    s.files = [
      'lib/redditosint.rb',
      'lib/redditosint/comment.rb',
      'lib/redditosint/comments.rb',
      'lib/redditosint/comments_parser.rb',
      'lib/redditosint/redditosint_client.rb'
    ]
    s.require_paths = ["lib"]
    s.add_runtime_dependency "selenium-webdriver", ["~> 3.11"]
    s.add_runtime_dependency "webdrivers", ["~> 3.2"]
  end