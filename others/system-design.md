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
- Design goal
  - latency
  - CAP
- Deep dive


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
- Estimation:
  - QPS?
    - if 1 machine support 1M QPS, we might need 10M QPS
  - How many machine needed?
    - 1 machine has 72 or 144 GB memory, 30TB needs 400 machine
- Design goal
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
  - Deep Dive
    - shard increase by time, cannot have fix shard
    - Consistent Hashing

#### Highly Available Database (NoSQL like)


#### Highly Consistent Database (SQL like)


### Web
#### Design URL Shortener


#### Design Search Typeahead


#### Design Messenger


#### Design Twitter


## Reference
[Paper](http://dancres.github.io/Pages/)
- Blog
  - https://www.jyt0532.com/2017/03/27/system-design/
  - http://www.mitbbs.com/article_t/JobHunting/32777529.html
  - [Big data process](https://blog.csdn.net/v_july_v/article/details/7382693)
