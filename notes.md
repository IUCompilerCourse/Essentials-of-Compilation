



--------------------------------------------------------------------------------
R1:

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
    C0 ::= (program () tail)

uncover-locals
|
V

    arg ::= x | n
    exp ::= arg | (op arg*)
    stmt ::= (assign x exp)
    tail ::= (return exp) | (seq stmt tail)
    C0 ::= (program ((locals . x*)) tail)
    
select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | (retq) | ...
    x86 ::= (program ((locals . x*)) instr*)

assign-homes
|
V

    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ...
    x86 ::= (program ((stack-space . n)) instr*)
    
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
           | (goto label) | (if (op arg*) ((goto label)) ((goto label)))
    stmt ::= (assign x exp)
    C1 ::= (program ((type . type) (flow-graph . ((label . tail)*))) tail)

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
           | (goto label) | (if (op exp*) ((goto label)) ((goto label)))
    stmt ::= (assign x exp)
    C1 ::= (program ((type . type) (flow-graph . ((label . tail)*))
                     (locals . x*)) 
                    tail)

select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    x86 ::= (program ((locals . x*) (type . type) 
                      (flow-graph . ((label . instr*)*))) instr*)

uncover-live
|
V

    imm ::= (var x) | (deref r n) | (int n)
    instr ::= (addq imm imm) | (jmp label) | (jmp-if cc label) | (retq)
	block ::= (block (lives ls*) instr*)
    x86 ::= (program ((locals . x*) (type . type)
                      (flow-graph . ([label . block]*))) block)

build-interference
|
V

    x86 ::= (program ((locals . x*) (type . type)
                      (flow-graph . ([label . block]*))
						  (conflicts . graph))
					     block)

allocate-registers
|
V

    imm ::= (reg r) | (deref r n) | (int n)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq)
    x86 ::= (program  ((locals . x*) (type . type) 
                       (flow-graph . ((label . instr*)*))) instr*)
    
print-x86
|
V

--------------------------------------------------------------------------------

R3:

    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp+) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
    R2 ::= (program exp)

type-check
|
V

    type ::= ... | Void | (Vector type*)
    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp+) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void)
          | (has-type exp type)
    R2 ::= (program ((type . type)) exp)

expose-allocation
|
V

    type ::= ... | Void | (Vector type*)
    exp ::= x | n | #t | #f | (op exp*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp+) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void) | (has-type exp type)
          | (collect n) | (allocate n type) | (global-value x)
    R2 ::= (program ((type . type)) exp)

remove-complex-opera*
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= arg | (op arg*) | (let ([x exp]) exp) | (if exp exp exp)
          | (vector exp+) | (vector-ref exp n) | (vector-set! exp n exp)
          | (void) | (has-type exp type)
          | (collect n) | (allocate n type) | (global-value x)
    R2 ::= (program ((type . type)) exp)

create-CFG
|
V

    arg ::= x | n | #t | #f | (void)
    exp ::= arg | (op arg*) | (allocate n type) | (global-value x) 
          | (has-type exp type)
    tail ::= (goto label) | (if (op arg*) ((goto label)) ((goto label)))
          | (return exp) | (seq stmt tail)
    stmt ::= (assign x exp) | (collect n)
    C1 ::= (program ((type . type) (flow-graph . ((label . tail)*))) tail)

uncover-locals
|
V

    ...
    C1 ::= (program ((locals . ((x . type)*)) (type . type) 
                     (flow-graph . ((label . tail)*))) tail)

select-instructions
|
V

    imm ::= (var x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (flow-graph . ((label . instr*)*))) instr*)

uncover-live
|
V

    imm ::= (var x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    block ::= (block (lives x**) instr*)
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (flow-graph . ((label . block)*))) block)

build-interference
|
V

    ...
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (conflicts . graph)
                          (flow-graph . ((label . instr*)*))) instr*)

build-move-graph
|
V

    ...
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (conflicts . graph) (move-graph . graph)
                          (flow-graph . ((label . instr*)*))) instr*)

allocate-registers
|
V

    imm ::= (reg x) | (deref r n) | (int n) | (global-value x)
    instr ::= (addq imm imm) | ... | (jmp label) | (jmp-if cc label) | (retq) 
    x86-CFG ::= (program ((locals . ((x . type)*)) (type . type) 
                          (flow-graph . ((label . instr*)*))) instr*)

patch-instructions
|
V

    same as above

print-x96
