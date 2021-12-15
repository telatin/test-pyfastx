import pyfastx
import sys
input = sys.argv[1] if len(sys.argv) > 1 else "test.fa"
fa = pyfastx.Fastx(input)
for name,seq,comment in fa:
    print(name, comment)
    if name == "nocomment" and len(comment) > 0:
       print("ERROR: Sequence", name, "should have no comments")
