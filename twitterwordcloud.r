library(twitteR)
library(tm)
library(wordcloud)
library(RCurl)
consumer_key <- "OO6kkA9VMtkJB0fVqIcvm0pK4"
consumer_secret <- "zaz7XxR26ScUKHJoVsu7GajjGt9fPbltsKFb6q0bo6QVqcsRFL"
access_token <- "303037600-SUZFT3uoXUunHOKI11i4y8XUQWYmVOlU4ip3D1QG"
access_secret <- "YnFBT8AzWSpwqMwzhIhRzf5GGQzn9apnHAtbZ7gAgYvYg"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets = searchTwitteR("AUSvBAN",n=1500, resultType = "recent")
tweet_text = sapply(tweets, function(x) x$getText())
tweet_text <- iconv(tweet_text,"UTF-8")
tweet_corpus = Corpus(VectorSource(tweet_text))
tweet_clean = tm_map(tweet_corpus, removePunctuation)
tweet_clean = tm_map(tweet_clean, content_transformer(tolower))
tweet_clean = tm_map(tweet_clean, removeWords, stopwords("english"))
tweet_clean = tm_map(tweet_clean, removeNumbers)
tweet_clean = tm_map(tweet_clean, stripWhitespace)
tweet_clean = tm_map(tweet_clean, removeWords, c("india"))
wordcloud(tweet_clean, max.words=1500, colors = rainbow(50), random.order = "TRUE")

