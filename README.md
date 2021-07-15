# redditosint
A simple ruby tool that scrapes reddit user's comment history and saves into a JSON file

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

# Installation
```
git clone https://github.com/krishpranav/redditosint
cd redditosint
bundle installl
```

(or)

```rb
gem install redditosint
irb
require redditosint
redditosint.engage('exampleusername')
```

# Output
```json
{
  "author": "exampleusername"
  "subreddit": "examplesubject"
  "permalink": "https://www.reddit.com/r/examplesubject/comments/8830oa/example_post/dsads3/"
  "timestamp": "2019-2-19 19:18:21 -0100"
  "text": "Some Text Here "
}
```
