# System Design

## Read
- https://www.interviewbit.com/courses/system-design/
- https://github.com/donnemartin/system-design-primer
- https://github.com/tuliren/grokking-system-design


## Ask
- Ask for requirement
  - MVP model ?
  - traffic / latency / consistency or availability
- Feature expectations
- Estimation
  - QPS (query per second)
  - machine, default 72GB / 144GB RAM, 10TB disk
- Design Goals
  - latency
  - CAP
- Deep Dive


## Common design
### Storage Scalability
#### Design Cache
- Features
  - maybe total size of few TBs
  - drop key on full
  - Access pattern
    - write through
    - write around
    - write back
- Estimation
  - QPS?
    - if 1 machine support 1M QPS, we might need 10M QPS
  - How many machine needed?
    - 1 machine has 72 or 144 GB memory, 30TB needs 400 machine
- Design Goals
  - Latency, low
  - Consistency or Availability
    - choose Availability
- Deep Dive
  - single machine
    - LRU
    - write code
    - multi thread LRU
      - operation:
        - read
        - write
        - full
  - shard
    - how to shard
      - mod
      - consistent hashing (ring)
    - shard goes down?


#### Sharding a Database
- Features
  - data size
  - data input per day
  - single machine spec, memory, disk
- Estimation
  - compute machine needs
    - increase of data to add machine
- Design Goals
- Deep Dive
  - shard increase by time, cannot have fix shard
  - Consistent Hashing
    - virtual node

#### Highly Available Database (NoSQL like)
- Features
- Estimation
- Design Goals
  - low latency
  - Availability > Consistency
- Deep Dive
  - sharding
  - should we normalized ?
  - Single point of failure
    - master-salve
    - multi-master
  - peer to peer system
    - consistent hashing
  - how to store replica
    - the next node will save it
  - operation
    - Write request: need W acknowledgements
    - Read request: need R acknowledgements
    - Read and Write consistency: with P replica => W + R > P
      - read fast: R = 1, W = P
      - write fast: W = 1, R = P
      - balance: W = R = (P + 1) / 2
  - machine go down:
    - replica


#### Highly Consistent Database (SQL like)
- Features
- Estimation
- Design Goals
  - latency: good to have, not necessary
  - Consistency > Availability
- Deep Dive
  - sharding
  - normalized
    - if need to join, will not be short latency
  - replica
    - one replica
      - always consistent
      - lost data
    - many replica
      - maintain replica sync
      - master node and data node
  - trade-off
    - one replica
      - write fast
      - lost data
    - many replica
      - write slow

#### Raft
https://raft.github.io/


### Web
#### Design URL Shortener
- Features
  - Shortening: Take a url and return a much shorter url.
  - Redirection: Take a short url and redirect to the original url.
  - Custom url: Allow the users to pick custom shortened url.
  - Analytics: Usage statistics for site owner.
- Estimation
  - amount
    - url = 1024 byte
    - 100 M per month
    - 5 year = 6 B = base62 ^ 6
    - Use 6 char
  - read / write
- Design Goals
  - latency: low, like DNS
  - trade off
- Skeleton of the design
  - API
    - ShorteningAPI(url)
    - RedirectionAPI(hash)
  - read flow
  - write flow
- Deep Dive
  - How to compute the hash
    - hash + salt and choose one that is not collision
  - convert hash to base 62
  - fault tolerance, use load balance
  - SQL or noSQL
    - we don't need join
    - size is huge
    - noSQL win
  - schema
    - hash -> url
  - how to do sharding
- Bonus
  - enhance read query
    - redis or memcache
    - R + W > P
      - R = 1, W = P
  - sharding on SQL
  - down time on SQL DB


#### Design Search Typeahead
- Features
  - How many candidate should we provide
  - spell check?
  - How to choose
    - frequency
  - realtime? low latency?
- Estimation
  - How many query per day
    - per second?
  - How many data should we store?
- Design
  - low latency
  - Availability > Consistency
- Skeleton of the design
  - Read: List(string) getTopSuggestions(string currentQuery)
  - Write: void updateSuggestions(string searchTerm)
  - data struct
    - prefix free
    - trie
- Deep Dive:
  - Application layer:
    - Stateless + load balancer
  - Database layer:
    - Trie
    - Trie on store top 5 result
    - how to update
      - update every node on write
    - Frequent write will effect
      - Sampling, 1 in 100 or 1 in 1000
      - offline update, batch update
    - sharding
      - don't use a-z
      - take few prefix and hash it


#### Design Messenger
- Features:
  - 1:1 conversation
  - 10B message
    - reason size of message, 64Kb
- Estimation
  - data size
- Design Goals
  - low latency
  - Consistency > Availability
- Skeleton of the design
  - sendMessage(senderId, recepientId, messageContent, clientMessageId)
    - clientMessageId is based on time, so we could know the order
  - ConversationResult fetchConversation(userId, pageNumber, pageSize, lastUpdatedTimestamp)
  - MessageResult fetchMessages(userId, pageNumber, pageSize, lastUpdatedTimestamp)
  - write flow
  - read flow
- Deep Dive:
  - Application layer:
  - Database layer:
    - need to join
    - data is huge
    - read-write pattern
      - heavy write
    - noSQL
  - Schema
    - noSQL is denormalized form. Two copy of every message.
    - userId as rowId, used for sharding
  - Caching


#### Design Twitter
- Features
  - post tweet
  - following
  - favoriting tweets
  - Feed: see tweet from other user
- Estimation
  - 500 million tweets per day with 100 million daily active users
  - follower: 200 per user on average
  - favoriting: 2 on average
- Design Goals:
  - low latency
  - Availability > Consistency
- Skeleton of the design
  - data
    - tweet: content, user, timestamp, number of favorite
    - user profile
    - Feed: 20 tweet a time
  - API
    - addTweet(userId, tweetContent, timestamp)
    - followUser(userId, toFollowUserId)
    - favoriteTweet(userId, tweetId)
    - getUserFeed(user, pageNumber, pageSize, lastUpdatedTimestamp)
- Deep Dive
  - Application layer:
  - Database layer:
    - need join
      - user -> followers relation
      - tweets -> favorited by users relation
    - data size
      - large data
    - SQL
  - Schema
    - Users
      - Id
      - ...
    - Tweet
      - Id
      - userId
      - content
      - ctime
    - Follow
      - follower (userId)
      - followee
    - favorite
      - userId
      - tweetId
  - Index
    - follower_id in `Follow` for follower query
    - user_id, created_at in `Tweet` for feed
    - tweet_id in `favorites`
  - How to sharding
    - by user
    - by time
    - hybrid
      - by user
      - cache by time
  - Corner case
    - high favorite tweet / follower tweet
      - need to update
      - favorited table write freq, lock


## Reference
[Paper](http://dancres.github.io/Pages/)
- Blog
  - https://www.jyt0532.com/2017/03/27/system-design/
  - http://www.mitbbs.com/article_t/JobHunting/32777529.html
  - [Big data process](https://blog.csdn.net/v_july_v/article/details/7382693)
