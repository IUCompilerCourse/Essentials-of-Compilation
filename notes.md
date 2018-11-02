



--------------------------------------------------------------------------------
R1: Integers and Variables

    exp ::= x | n | (op exp*) | (let ([x exp]) exp)
    R1 ::= (program exp)

uniquify
|
V

    exp ::= x | n | (op exp*) | (let ([x exp]) exp)
    R1' ::= (program () exp)

remove-complex-opera*
|
V

    arg ::= x | n
    exp ::= arg | (op arg*) | (let ([x exp]) exp)
    R1' ::= (program () exp)

create-CFG (the graph is empty for this assignment)
|
V

    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
    tail ::= (return exp) | (seq stmt tail)
    C0 ::= (program () ((label . tail)*))

uncover-locals
|
V

    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
    tail ::= (return exp) | (seq stmt tail)
    C0 ::= (program ((locals . x*)) ((label . tail)*))
    
select-instructions
|
V

    imm ::= (var x) | (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | (retq) | ...
    block ::= (block () instr*)
    x86 ::= (program ((locals . x*)) ((label . block)*))

assign-homes
|
V

    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    block ::= (block () instr*) 
    x86 ::= (program ((stack-space . n)) ((label . block)*))
    
patch-instructions
|
V

    same grammar as above

print-x86
|
V



--------------------------------------------------------------------------------

R2: Booleans and Conditionals

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program exp)

type-check
|
V

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program ((type . type)) exp)

remove-complex-opera*
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*) | (let ([x exp]) exp) | (if exp exp exp)
    R2 ::= (program ((type . type)) exp)

create-CFG
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*)
    tail ::= (return exp) | (seq stmt tail)
           | (goto label) | (if (op arg*) (goto label) (goto label))
    stmt ::= (assign x exp)
    C1 ::= (program ((type . type)) ((label . tail)*))

optimize-jumps
|
V

    same grammar as above

uncover-locals
|
V

    arg ::= x | n | #t | #f
    exp ::= arg | (op arg*)
    tail ::= (return exp) | (seq stmt tail)
           | (goto label) | (if (op exp*) (goto label) (goto label))
    stmt ::= (assign x exp)
    C1 ::= (program ((type . type) (locals . x*)) 
                    ((label . tail)*))

select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    block ::= (block () instr*)
    x86 ::= (program ((locals . x*) (type . type)) ((label . block)*))

uncover-live
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | (jmp label) | (jmp-if cc label) | (retq)
    block ::= (block (lives ls*) instr*)
    x86 ::= (program ((locals . x*) (type . type)) ((label . block)*))

build-interference
|
V

    block ::= (block () instr*)
    x86 ::= (program ((locals . x*) (type . type) (conflicts . graph))
                     ((label . block)*))

allocate-registers
|
V

    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq)
    block ::= (block () instr*)
    x86 ::= (program ((locals . x*) (type . type))
                     ((label . block)*))
    
print-x86
|
V

--------------------------------------------------------------------------------

R3: Vectors

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
    R3 ::= (program exp)

type-check
|
V

    type ::= ... | Void | (Vector type*)
    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
          | (has-type exp type)
    R3 ::= (program ((type . type)) exp)

expose-allocation
|
V

    type ::= ... | Void | (Vector type*)
    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void) | (has-type exp type)
          | (collect n) | (allocate n type) | (global-value x)
    R3 ::= (program ((type . type)) exp)

remove-complex-opera*
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= arg | (op arg*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void) | (has-type exp type)
          | (collect n) | (allocate n type) | (global-value x)
    R3 ::= (program ((type . type)) exp)

create-CFG
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= arg | (op arg*) | (allocate n type) | (global-value x) 
          | (has-type exp type)
    tail ::= (goto label) | (if (op arg*) (goto label) (goto label))
          | (return exp) | (seq stmt tail)
    stmt ::= (assign x exp) | (collect n)
    C2 ::= (program ((type . type)) ((label . tail)*))

uncover-locals
|
V

    ...
    C2 ::= (program ((locals . ((x . type)*)) (type . type) 
                     (flow-graph . ((label . tail)*))) tail)

select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    block ::= (block () instr*)
    x86 ::= (program ((locals . ((x . type)*)) (type . type))
                     ((label . block)*))

uncover-live
|
V

    imm ::= (var x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    block ::= (block (lives x**) instr*)
    x86 ::= (program ((locals . ((x . type)*)) (type . type))
                     ((label . block)*))

build-interference
|
V

    ...
    x86 ::= (program ((locals . ((x . type)*)) (type . type) 
                      (conflicts . graph))
                     ((label . block)*))

build-move-graph
|
V

    ...
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (conflicts . graph) (move-graph . graph))
                         ((label . block)*))

allocate-registers
|
V

    imm ::= (reg x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    x86 ::= (program ((locals . ((x . type)*)) (type . type))
                     ((label . block)*))

patch-instructions
|
V

    same as above

print-x96
|
V

--------------------------------------------------------------------------------

R4: Functions

    type ::= ... | (type* -> type)
    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
          | (exp exp*)
    def ::= (define (var [var : type]*) : type exp)
    R4 ::= (program def* exp)

type-check
|
V

    R4 ::= (program () def+)

uniquify
|
V

    same as above

limit-functions
|
V

    same as above, but with a limit on the number of parameters to a function

reveal-functions
|
V

    exp ::= (function-ref label) | (app exp exp*) | ...
    tail ::= x | n | #t | #f | (op exp*) | (let ([x exp]) tail) 
          | (if exp tail tail)
          | (vector exp*) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
          | (function-ref label) | (tailcall exp exp*)
    def ::= (define (var [var : type]*) : type tail)
    F1 ::= (program () def+)

expose-allocations
|
V

    same as above

remove-complex-opera*
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= ... | (op arg*) | (app arg arg*) | ...
    tail ::= ... | (op arg*) | (tailcall arg arg*) | ... 
    def ::= (define (var [var : type]*) : type tail)
    F1 ::= (program () def+)

create-CFG
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= arg | (op arg*) | (allocate n type) | (global-value x) 
          | (has-type exp type) | (app arg arg*)
    tail ::= (goto label) | (if (op arg*) (goto label) (goto label))
          | (return exp) | (seq stmt tail) | (tailcall arg arg*)
    stmt ::= (assign x exp) | (collect n)
    def ::= (define (var [var : type]*) : type ((label . tail)*))
    C3 ::= (program ((type . type)) def+)


|
V
