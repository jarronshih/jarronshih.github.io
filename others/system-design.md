# System Design

## Read
- https://www.interviewbit.com/courses/system-design/
- https://github.com/donnemartin/system-design-primer


## Ask
- Ask for requirement
  - MVP model ?
  - traffic / latency / consistency or availability
- Feature expectations
- Estimations
  - QPS (query per second)
  - machine, default 72GB RAM, 10TB disk
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
- Feature
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
- Feature
- Estimation
- Design Goals
  - low latency
  - Availability > Consistency
- Deep Dive
  - sharding
  - normalized
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
- Feature
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
- Feature
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
  

#### Design Search Typeahead


#### Design Messenger


#### Design Twitter


## Reference
[Paper](http://dancres.github.io/Pages/)
- Blog
  - https://www.jyt0532.com/2017/03/27/system-design/
  - http://www.mitbbs.com/article_t/JobHunting/32777529.html
  - [Big data process](https://blog.csdn.net/v_july_v/article/details/7382693)
