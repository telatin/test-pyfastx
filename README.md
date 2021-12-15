# test-pyfastx

Testing an [issue](https://github.com/lmdu/pyfastx/issues/37) found while using [pyfastx](https://github.com/lmdu/pyfastx/).

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

## Repository

Dockerfile to reproduce the issue
