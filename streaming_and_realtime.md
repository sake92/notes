
https://gist.github.com/danilobatistaqueiroz/0f3100d36f200afef3b4d87ce0bb1d52


There are 3 very important aspects of (distributed) software systems:
- reliability: correctness, fault tolerance
- scalability: autoscaling
- maintainability: code organization, ease of deployment, complexity, extensibility

Failure vs fault:
- failure: total crash, nothing works
- fault: crash of system part, stuff could work partially..

Latency vs response time:
- latency: time request waiting in queueu to be processed
- response time: time of user waiting for response

## Realtime systems

They react **immediatelly as the events happen**.  
For example a pacemaker must react realtime as a heart ticks, or else you'd die.  
Other examples are video calls, online stocks etc.

## Streaming systems

These systems are consumers of events data.  
Similar to realtime systems in regards to **reacting to events**,
but these could be seconds or even days away from when that event happened.  
We could've stored the tweets in a db, and only when a client requests them we send it to them.







