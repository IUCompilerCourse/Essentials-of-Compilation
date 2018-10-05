

Revising the architecture to better match Dybvig's P523 compiler
----------------------------------------------------------------

* to do: figure out where to introduce the Tail context. It seems to
  happen in Dybvig's A10, but that assignment doesn't say anything
  about it.

* to do: insert type checking

R2:

	e ::= x | n | #t | #f | (op e*) | (let ([x e]) e) | (if e e e)
	R2 ::= (program e)

normalize-context (where is this needed? perhaps not thanks to type system?)
|
V

    v ::= x | n | #t | #f | (op v*) | (let ([x v]) v) | (if p v v) 
	p ::= #t | #f | (pred-op v*) | (let ([x v]) p) | (if p p p)
	R2' ::= (program v)
    
uncover-locals and remove-let
|
V

    v ::= x | n | #t | #f | (if p v v) | (val-op v*) (begin f* v)
	f ::= (set! x v) | (if p f f) | (begin f* f)
	p ::= #t | #f | (if p p p) | (pred-op v*) | (begin f* p)
	UIL ::= (program (x*) v)

  Note: Dybvig doesn't allow variables in p, instead converts them:
  
    x
	=>
	(if (eq? x #f) #f #t)

flatten-args (remove-complex-opera*)
|
V

    arg ::= x | n | #t | #f
    v ::= x | n | #t | #f | (if p v v) | (val-op arg*) (begin f* v)
	f ::= (set! x v) | (if p f f) | (begin f* f)
	p ::= x | #t | #f | (if p p p) | (pred-op arg*) | (begin f* p)
	UIL' ::= (program (x*) v)

select-instr
|
V

    arg ::= (var x) | (int n)
    instr ::= (addq arg arg) | ...
	f ::= instr | (if p f f) | (begin f* f)
	p ::= x | #t | #f | (if p p p) | (pred-op arg*) | (begin f* p)
    pseudo-x86 :: (program (x*) f)

uncover-live, build-interference, allocate-registers
|
V

    arg ::= (reg r) | (int n)
    instr ::= (addq arg arg) | ...
	f ::= instr | (if p f f) | (begin f* f)
	p ::= x | #t | #f | (if p p p) | (pred-op arg*) | (begin f* p)
    pseudo-x86 ::= (program (x*) f)

expose-basic-blocks
|
V

    f ::= instr
	t ::= (jump label) | (if (pre-op arg*) label label) | (begin f* t)
    cfg-x86 ::= (program ([label t]*) t)




optimize-jumps
|
V


print-x86





