

Revising the architecture to better match Dybvig's P523 compiler
----------------------------------------------------------------

* to do: figure out where to introduce the Tail context. It seems to
  happen in Dybvig's A10, but that assignment doesn't say anything
  about it.

* to do: insert type checking

R2:

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program exp)

flatten (uncover-locals, remove-let, remove-complex-opera*)
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (if exp exp exp) | (op arg*) | (begin stmt* exp)
    stmt ::= (set! x exp) | (if exp stmt stmt) | (begin stmt* stmt)
    C2 ::= (program (x*) stmt)

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




