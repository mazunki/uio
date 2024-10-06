
# IN4120: Search Technology

- IR: information retrieval
- collection: set of documents

(1) user task => (2) info need => (3) query => (4) search engine => (5) query refinement => { results <= collection ; goto 3 }
- precision: fraction of retrieved documents which are relevant to the user's *information need* (e.g. false positives)
- recall: fraction of *relevant documents* which are found from the collection (e.g. false negatives)

## brutus && caesar && !calpurnia
### grep
- slow
- not versatile (i.e proximity)
- negative query is not trivial (TODO: why)
- no ranked results

### incidence vectors
matrix containing boolean values describing if document contains match

this allows us to AND(brutus, caesar, NOT(calpurnia)) instead
110 100 ∧ 110 111 ∧ ¬010 000
110 100 ∧ 110 111 ∧ 101 111
100 100

problem? this doesn't scale.
- very large matrix
- super sparse (most datapoints are 0 because there's no match)

instead? build a list for each term
AND(brutus, caesar, NOT(calpurnia))
[1, 2, 4, 11, 31, 45, 173, 174] ∧ [1, 2, 4, 5, 6, 16, 57, 132] ∧ ¬[2, 31, 54, 101]
[1, 2, 4] ∧¬ [2, 31, 54, 101]
[1, 4]

### inverted indexes
**postings**: lists containing document matches
**dictionary**: <document: postings>

document => tokenizer (capture tokens) => linguistic models (modify tokens) => indexer (get inverted indexes dictionary)

### text processing

- *tokenization*: cut character sequences into word tokens
- *normalization*: reducing various valid inputs to a known form
- *stemming*: distinguish base stem of word, allowing various declinations to match same query
- *stop words*: omit common words (or not)

**steps**:
- sequence tokens: build pairs of (modified) tokens with its document location
- sort <token, document> pairs by the term
- build frequency dictionary
- build postings dictionary <freqdict, document location>


# 2024-09-02 (lecture uhh 3?)
[slides](~/uio/IN4120/in3120-2024.git/slides/strings-galore.pdf)

- prefix, infix, suffix : substrings

redusere problemer til prefixsøk, siden det er et lettere (og til en viss grad løst) problem

for å redusere til prefixsøk: permuterm index
- rotasjoner

[trie](https://en.wikipedia.org/wiki/Trie): digital/k-ary tree

## edit distance
damerau-levensthein: damerau added transposition
their original implementation was recursive, which is awful for performance haha yes, hence why we build an edit table instead

[the algorithm](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance) is symmetrical, and most follow the triangle uhhh proposition ¿(x+y < x+y+z)? makes it a valid distance metric

for performance optimization of huge tables (allows you to parallelize across threads) (currently fastest known method to calculate this)
- represent tables with bit vector per row and columns, calculate edit distance with bitwise operations

when looking at tables, we'll notice that if prefix hasn't changed on either row or column, we don't need to recalculate that row or column for further edit distance queries. we can thus search for many words at once by keeping track of the offset position for all the strings by reusing matching prefixes

by capping the edit distance at some number we can skip a bunch of words which are too far from what we care about
- [ukonnen cuttoff](https://en.wikipedia.org/wiki/Ukkonen's_algorithm)

## inverted index
[slides](~/uio/IN4120/in3120-2024.git/slides/stanford/lecture-03-tolerant-retrieval.pdf)

[japanese word boundary issue @ fediverse](https://peoplemaking.games/@eniko/112846810231566117)


# 2024-09-09 (lecture uhh last of 3rd, 4)

23 september: probably no lecture, we'll see (my dumb ass will probably show up regardless cuz i will fogor)

context sensitive: build graph of surrounding options

genererer ordliste fra corpus, eventuelt filtrere vekk ord som ikke eksistererer i ordlisten ved query spelling correction suggestions

*jaccard coefficient*: using intersection over union as a measurement of overlap/similarity. for our sets we use the words' n-grams
q: are n-grams sets or vectors?

soundex = phonetic equivalence algorithm. convert inputs and corpus into its phonetic expressions, and compare the outputs (i.e a reduced type of normalized form). it's kinda shit (made in 1918). instead, ¿double metadon?

## chapter 4

- [MapReduce (dean, ghemawat, 2004)](https://static.googleusercontent.com/media/research.google.com/en//archive/mapreduce-osdi04.pdf)


# 2024-09-20 (lecture 5)

we want to compress the inverted index in memory, but ideally keep some extra space for posting lists too. 

*lossy compression*: we can drop things from the index which we assume the user won't ask for, e.g:
- numbers
- casing
- 30 most common words / 150 most common words: connectors, etc
- stemming


as document size increases, the rate of number of unique words will decrease. we are unlikely to see new words after we've seen most other ones.

we can estimate unique words with heaps' law, an empirical law:
- `M = kT^b`
- M being the size of vocabulary
- T being the number of tokens in the document
- k around 30..100 (depends on language)
- b circa 0.5 (also depends on language)

(exercise for exam??)

heaps' law speaks of the size of the vocabulary as document size increases. can be used to estimate thingies with log(M) as `log k + b log T`


collection frequency (how many token appears in total) vs document frequency (in how many documents the token appears)

zipf law speaks of the frequency of words in a collection.
when we plot rank to collection frequency, we observe `cfᵢ ∝ 1/i`, where i is the rank.

average word in english document ~4.5 characters. average word in english dictionary ~8 characters

using a long ass string containing all the words, and just using pointers into the single string can save some space. we could also point into a block containing several words, but then we'd need to store the size of the string in-string

`8automat*a1.e2.ic3.ion` can represent all words `automata`, `automate`, `automatic`, `automation`

gap encoding, delta coding, difference coding: different names for storing the difference between `curr => next` instead of the whole values of the entries. this saves space because big number go brr

variable length encoding (generally bytes), and variable bit encoding: ups and downs for each of them


variable byte (vb) encoding: base 128 (2⁷). first bit (eg 8-bit) is a continuation byte. if set, it means we're done

elias-delta encoding: gamma code applied twice. best for small numbers, gets progressively worse when representing big numbers

simple9 = use 4 + 28 bits where 4 bits are used to represent how the 28 bits are partitioned. eg `2*14` or `3*9`

pfor-delta = split up exceptions into end-of-"list" in reverse order, and specify the offset until the next exception

# 2024-09-30 (lecture 6)
[slides](slides/stanford/lecture-07-vectorspace.pdf)

tf = term frequency
idf = inverted document frequency

one dimension per word
embedded vector : around 1000 dimensions (smaller version of the other frequency matrices?)

not many people care about recall, except some niches cases (e.g lawyers...). most people care much more about sorting of matches.

soft-AND = matching `n` out of `m` clauses

in order to rank matches, we generally prefer to doing it in-place, instead of having to do a second pass after finding all matches

`jaccard(a,b) := len(a ∩ b) / len(a ∨ b)`

sparse vector : includes a bunch of zeroes
frequency often just refers to count

`w_{t,d} := 1 + log(tf_d)`

`log-frequency = sum_{t ∈ q∩d)  (1 × log(tf_{t,d}))`

`idf_t = log(N/df_t)` where N is the number of documents

idf has no effect on one-term queries

tf-idf weighting refers to the product of term frequency with inverted document frequency.

`score(q,d) := sum_{t ∈ q∩d}(tf.idf_{t,d})`

nowadays, this is done by machine learning functions, much better than humans. we're manually building a relevance function here.

metric : distance to self is 0, distance between two points is symmetric, must follow the triangle inequality rule
we prefer using the angle difference instead of the distance

one of many length normalization techniques:
`L_2 := ||x||_2 = sqrt(sum(x²))`

if we divide the distance by the L_2 distance, we get a unit vector for the metric
![hehe](~/art/pics/tux.png)

`cos(q,d) = (q·d)/|q|·|d| = sum(q_i · d_i)/(sqrt(sum q_i²)·sqrt(sum(d_i²)))`

if we already converted to unit vectors, this becomes `cos(q,d) = q · d = sum_i q_i · d_i` instead. `i` values go to `|V|`

when we take the cos-distance between two documents, we could verify authorship of a document


when using a sieve, we consider that the root of the sieve is the worst match. if new match is better than the root, we get rid of her


#  (lecture 6)



