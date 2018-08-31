
## Concurrency

### Thread
```python
from threading import Thread

th = Thread(target=func, args=())
th.start()
th.join()
```

### Mutex
```python
from threading import Lock, RLock

lock = Lock()
lock.acquire()
lock.release()

with lock:
    pass

# RLock could be recursively called in same child.
```


### Semaphores


### Condition Variable
```python
from threading import Condition

cv = Condition()

# Consumer
with cv:
    cv.wait()

# Producer
with cv:
    cv.notify()

```


### Queue
```python
from queue import Queue

q = Queue()

# Producer
q.put(None)

# Consumer
q.get() # block
q.task_done() # finish

# main thread
q.join()

```

#### Producer-Worker example
```python
def worker():
    while True:
        item = q.get()
        if item is None:
            break
        do_work(item)
        q.task_done()

q = queue.Queue()
threads = []
for i in range(num_worker_threads):
    t = threading.Thread(target=worker)
    t.start()
    threads.append(t)

for item in source():
    q.put(item)

# block until all tasks are done
q.join()

# stop workers
for i in range(num_worker_threads):
    q.put(None)
for t in threads:
    t.join()
```



### Deadlock
#### Kind
- Accidental release
- Recursive Deadlock
- Deadlock through Task Death
- Priority Inversion
- Semaphore as a signal

#### Prevent


## Network
https://yuchengkai.cn/docs/zh/cs/


## Data struct
https://yuchengkai.cn/docs/zh/cs/dataStruct.html
