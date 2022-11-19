
# Linux

## Memory, RAM, CPUs

The `-h` means "human friendly", displays KB, MB, GB instead of bytes.

```sh
# memory stats
free -h

# top processes
top -o %MEM
## also useful
htop

# disk stats
df -h
```

## Processes

```sh
# find a process by name
pgrep -f an_expression

# kill a process by PID
kill -9 <pid>
```