Python Question
========
Question
------
### What is __init__.py?
```
It is used to import a module in a directory, which is called package import.
```



### pdb - The Python Debugger



### lambda
```
lambda arg1, arg2, ...argN : expression using arguments
```



### class method vs static method
```
# s.py
class S:
   nInstances = 0
   def __init__(self):
      S.nInstances = S.nInstances + 1

   @staticmethod
   def howManyInstances():
      print('Number of instances created: ', S.nInstances)
```



### what is map, filter, reduce ?
```
# filter(aFunction, aSequence): returns a new list that contains only those elements for which the function returned "True"
# map(aFunction, aSequence): do function
# reduce(aFunction, aSequence): accept two arguments (x and y), return 1
```



### *args and **kwargs
```
Putting *args and/or **kwargs as the last items in our function definition's argument.

*args without names
**kwargs with names
kargs_function(**{'uno':'one','dos':'two','tres':'three'})
kargs_function(dos='two', tres='three', uno='one')
```

Module
-------
### class
```
class A:
    def __init__(self):
        pass
```



### collections
```
import collections

d = collections.defaultdict()

q = collections.deque()
q.append("a") # right element
q.extend([])
q.pop() # right element
```



### logging
```
import logging
logging.basicConfig(filename='example.log',level=logging.DEBUG)

logger.debug( “XXX" )
```



### openfile

```
try:
    with open('filename','r') as f:
        print(f.read())
except IOError:
    print "No such file exists"
```



###  generators