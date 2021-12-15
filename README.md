# test-pyfastx

Testing an [issue](https://github.com/lmdu/pyfastx/issues/37) found while using [pyfastx](https://github.com/lmdu/pyfastx/).



## Repository

Dockerfile to reproduce the issue. Only library version is pinned, while at the moment python version is not. 

### Using the Docker file

```bash
sudo docker build -t pyfastx:test .
```

### Result

In my test I got this output (relevant part):

```text
Step 13/14 : RUN python --version
 ---> Running in b32ed95ec437
Python 3.9.5
Removing intermediate container b32ed95ec437
 ---> 83c5c2fd5bbd
Step 14/14 : RUN python /test/test.py /test/test.fa
 ---> Running in 077ba0ce4146
Pyfastx version 0.8.4
1 comment
nocomment comment
ERROR: Sequence nocomment should have no comments
last butlast
last butlast
Removing intermediate container 077ba0ce4146
```

## Issue description

Using pyfastx version 0.8.4, I tried iterating over records but the "comment" attribute is not reset. 
Is there a safer way to iterate (I would like not to assume FASTA format) or did I just miss something obvious?

File (`test.fa`): 
```text test.fa
>1 comment
TTTTTTTT
>3
atatat
```

Code:
```python
import pyfastx
fa = pyfastx.Fastx("test.fa")
for name,seq,comment in fa:
    print(comment)
```

Output:
```text
comment
comment
```
