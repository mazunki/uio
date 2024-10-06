
with open("test", "r") as f:
    terms = f.read().split("\n")
    terms = terms[:-1]
print(terms)

minterms = [ "".join([line[5+i] for line in terms]) for i in range(7) ]
for d in range(len(minterms)):
    minterm = minterms[d]
    print(chr(97+d)+": "+" ".join([minterm[nibble:nibble+4] for nibble in range(0, len(minterm)//4)]))
