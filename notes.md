

Revising the architecture to better match Dybvig's P523 compiler
----------------------------------------------------------------

* to do: figure out where to introduce the Tail context. It seems to
  happen in Dybvig's A10, but that assignment doesn't say anything
  about it.

* to do: insert type checking


R1:
    exp ::= x | n | (op exp*) | (let ([x exp]) exp)
    R1 ::= (program exp)
  
flatten (uncover-locals, remove-let, remove-complex-opera*)
|
V
C0:
    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
    tail ::= (return exp) | (block stmt* tail)
    C0 ::= (program (x*) tail)

select-instructions
|
V

assign-homes
|
V

patch-instructions
|
V

print-x86
|
V



--------------------------------------------------------------------------------

R2:

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program exp)


remove-complex-opera* (rco)
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program exp)

create-CFG
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*)
    tail ::= (jump label) | (if (rel-op exp*) label label) | (return exp)
    stmt ::= (assign x exp)
    CFG ::= (program ([label . (block stmt* tail)] tail)

flatten (uncover-locals, remove-let, remove-complex-opera*)
|
V
C1:
    arg ::= x | n | #t | #f
    stmt ::= (assign x arg) | (assign (op arg*))
    pred ::= #t | #f | (pred-op val*) | (if pred pred pred) | (begin stmt* pred)
    tail ::= (return exp) | (block stmt* tail)
    C1 ::= (program (x*) tail)

select-instructions
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (if exp exp exp) | (op arg*) | (begin stmt* exp)
    stmt ::= instr | (if exp stmt stmt) | (begin stmt* stmt)
    iarg ::= (var x) | (int n)
    instr ::= (addq iarg iarg) | ...
    pseudo-x86 :: (program (x*) stmt)

uncover-live, build-interference, allocate-registers
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (if exp exp exp) | (op arg*) | (begin stmt* exp)
    stmt ::= instr | (if exp stmt stmt) | (begin stmt* stmt)
    iarg ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq iarg iarg) | ...
    pseudo-x86 :: (program (x*) stmt)

expose-basic-blocks (create-cfg)
|
V

    inst ::= ...
    stmt ::= (jump label) | (if (pre-op arg*) label label) | (begin instr* stmt)
    cfg-x86 ::= (program ([label . stmt]*) stmt)

optimize-jumps
|
V

    stmt ::= (jump label) | (if (pre-op arg*) label label) | (begin instr* stmt)
    cfg-x86 ::= (program ([label . stmt]*) stmt)

print-x86
|
V




