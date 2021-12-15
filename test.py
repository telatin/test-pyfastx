"""
A test script to check that sequences without comments
are properly managed by pyfastx.
A test file with a sequence named "nocomment" that must
be without comments, preceded by at least one sequence with
a comment, should trigger the behaviour.
"""
import pyfastx
import sys
input = sys.argv[1] if len(sys.argv) > 1 else "test.fa"
fa = pyfastx.Fastx(input)
for name,seq,comment in fa:
    print(name, comment)
    if name == "nocomment" and len(comment) > 0:
       print("ERROR: Sequence", name, "should have no comments")
