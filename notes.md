

Revising the architecture to better match Dybvig's P523 compiler
----------------------------------------------------------------

* to do: figure out where to introduce the Tail context. It seems to
  happen in Dybvig's A10, but that assignment doesn't say anything
  about it.

* to do: insert type checking


R1:
    exp ::= x | n | (op exp*) | (let ([x exp]) exp)
    R1 ::= (program exp)

remove-complex-opera*
|
V

    arg ::= x | n
    exp ::= arg | (op arg*) | (let ([x exp]) exp)
    R2 ::= (program exp)


create-CFG (the graph is empty for this assignment)
|
V

    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
	tail ::= (return exp) | (stmt . tail)
    CFG ::= (program tail)

uncover-locals
|
V

    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
	tail ::= (return exp) | (stmt . tail)
    CFG ::= (program (x ...) tail)
    
select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    x86-CFG ::= (program (x ...) instr ...)
    

assign-homes
|
V

    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    x86 ::= (program stack-size instr ...)
    
patch-instructions
|
V

    same grammar as above

print-x86
|
V



--------------------------------------------------------------------------------

R2:

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program exp)

type-check
|
V

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program (type type) exp)

remove-complex-opera*
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program (type type) exp)

create-CFG
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*)
    tail ::= (jump label) | (if (rel-op exp*) label label) | (return exp)
	         | (stmt . tail)
    stmt ::= (assign x exp)
    CFG ::= (program (type type) ([label . tail] ...) tail)

optimize-jumps
|
V

    same grammar as above

uncover-locals
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*)
    tail ::= (jump label) | (if (rel-op exp*) label label) | (return exp)
	      | (stmt . tail)
    stmt ::= (assign x exp)
    CFG ::= (program (x*) (type type) ([label . tail] ...) tail)

select-instructions
|
V

    tail ::= (jmp label) | (jmp-if cc label label) | (retq) | (instr . tail)
    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    x86-CFG ::= (program (x ...) (type type) ([label . tail] ...) tail)

uncover-live, build-interference, allocate-registers
|
V

    tail ::= (jmp label) | (jmp-if cc label label) | (retq) | (instr . tail)
    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    x86-CFG ::= (program (x ...) (type type) ([label . tail] ...) tail)
    
print-x86
|
V

