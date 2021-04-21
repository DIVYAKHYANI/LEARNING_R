#import positive and negative words
pos=readLines("positive_words.txt")
neg=readLines("neagtive_words.txt")

install.packages("stringr")
library("stringr")

install.packages("plyr")
library("plyr")

score.sentiment=function(sentences, pos.words, neg.words,
                         progress='none')
{
  scores =lapply(sentences,
                 function(sentence,pos.words,neg.words)
                   {
                   #remove punctuation using global substitute
                   sentence = gsub("[[:punct:]]","",sentence)
                   #remove control characters
                   sentence = gsub("[[:cntrl:]]","",sentence)
                   #remove digits
                   sentence = gsub('\\d+','',sentence)
                   
                   #define error handling function when trying to lower
                   tryTolower= function(x)
                   {
                     #create missing value
                     y= NA
                     #tryCatch Error
                     try_error = tryCatch(tolower(x), error=function(e) e)
                     #if not an error
                     if(!inherits(try_error,"error"))
                       y=tolower(x)
                     #result
                     return(y)
                     
                   }
                   #use trytolower with sapply
                   sentence=sapply(sentence,tryTolower)
                   
                   #split sentence into words with str_split
                   word.list=str_split(sentence,"\\s+")
                   words=unlist(word.list)
                   
                   #compare words to the dictionaries of positive and negative terms
                   pos.matches=match(words,pos.words)
                   neg.matches=match(words,neg.words)
                   
                   #get the position of that matched term or NA
                   #we just want a TRUE/FALSE
                   pos.matches=!is.na(pos.matches)
                   neg.matches=!is.na(neg.matches)
                   
                   #final score
                   score=sum(pos.matches)-sum(neg.matches)
                   return(score)
                 },pos.words,neg.words,.progress=.progress)
  #data frame with scores for each sentence
  scores.df=data.frame(text=sentences,score=progress)
  return(scores.df)
}

install.packages(c("devtools", "rjson", "bit64", "httr"))
library(devtools)
install_github("geoffjentry/twitteR")
library(twitteR)
library("openssl")
install.packages("httpuv")
library("httpuv")
install.packages("tm")
library("tm")
library("stringr")
install.packages("dplyr")
library("dplyr")

api_key <- " code"
api_secret <- "code"
access_token <- "code"
access_secret <- "code"

setup_twitter_oauth(api_key,api_secret,access_token,access_secret)
origop <- options("httr_oauth_cache")
#error s using direct authentication

#tweets for companies -may not get the full 900
bayertweets= searchTwitter("#bayer",n=900, lang="en",cainfo="cacert.pem")
pfizertweets= searchTwitter("#pfizer",n=900, lang="en",cainfo="cacert.pem")
rochetweets= searchTwitter("#roche",n=900, lang="en",cainfo="cacert.pem")
novartistweets= searchTwitter("#novartis",n=900, lang="en",cainfo="cacert.pem")

#get texts
baeyer_txt=sapply(bayertweets, function(x) x$getText())
pfizer_txt=sapply(pfizertweets, function(x) x$getText())
roche_txt=sapply(rochetweets, function(x) x$getText())
novartis_txt=sapply(novartistweets, function(x) x$getText())

#how many tweets
nd=c(length(baeyer_txt),length(pfizer_txt), length(roche_txt), length(novartis_txt))

#join texts
company= c(baeyer_txt,pfizer_txt,roche_txt,novartis_txt)

#apply function score.sentiment
scores=score.sentiment(company,pos,neg,progress='text')

#add variables to data frame
scores$company=factor(rep(c("baeyer","pfizer","roche","novartis"),nd))
scores$very.pos=as.numeric(scores$score >= 2)
scores$very.neg=as.numeric(scores$score <=-2)

#how many very positives and very negatives
numpos=sum(scores$very.pos)
numneg=sum(scores$very.neg)

#global score
global_score=round(100 * numpos/(numpos + numneg) )

head(scores)
par(bty="1")
boxplot(score e-company, data=scores, col=c("red","grey"))

library("latice")

histogram(data=scores, ~score | company, main="sentiment analysis of 4 comapnies", col=c("red","grey")
        xlab="",sub="Sentiment Score")













