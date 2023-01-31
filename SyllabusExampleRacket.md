## Syllabus Example for a Compiler Course based on Essentials of Compilation (Racket)

High-level programming languages like Racket make it easier to program
compared to low-level languages such as x86 assembly code. But how do
high-level languages work? There's a big gap between them and machine
instructions for modern computers. In this class you learn how to
translate Racket programs all the way to x86 assembly language.

Traditionally, compiler courses teach one phase of the compiler at a
time, such as parsing, semantic analysis, and register allocation. The
problem with that approach is it is difficult to understand how the
whole compiler fits together and why each phase is designed the way it
is. Instead, each week we implement a progressively larger subset of
the input language. The very first subset is a tiny language of
integer arithmetic, and by the time we are done the language includes
first-class functions.

**Prerequisites:** Fluency in Racket is highly recommended as students
will do a lot of programming in one of those languages. Prior
knowledge of an assembly language helps, but is not required.

**Textbook: Essentials of Compilation: An Incremental Approach in Racket** 

The textbook is available from MIT Press
[here](https://mitpress.mit.edu/9780262047760/essentials-of-compilation/)
and the PDF of the book is available
[here](https://www.dropbox.com/s/ktdw8j0adcc44r0/book.pdf?dl=1).

If you have suggestions for improvement, please either send an email
to Jeremy or, even better, make edits to a branch of the book and
perform a pull request. The book is at the following location on
github:

    https://github.com/IUCompilerCourse/Essentials-of-Compilation

**Lecture:**  Times and location.

**Office hours**

* Instructor 1: Times and location.
* Instructor 2: Times and location.

**Topics:**

* Instruction Selection

* Register Allocation

* Static type checking

* Conditional control flow

* Mutable data

* Garbage collection

* Procedures and calling conventions

* First-class functions and closure conversion

* Dynamic typing

* Generics

* High-level optimization (inlining, constant folding, copy
  propagation, etc.)

**Grading:**

Course grades are based on the following items.

* Assignments (including final project) (40%)
* Midterm Exam (25%)
* Final Exam  (35%)

**Assignments:**

Organize into teams of 2-4 students. Assignments will be due bi-weekly
on Mondays at 11:59pm. Teams that include one or more graduate
students are required to complete one challenge exercise per
assignment.

Assignments will be graded based on how many test cases they succeed
on. Partial credit will be given for each "pass" of the compiler.
Some of the tests are in the public support code (see Resources
below). The testing will be done on a linux (ubuntu) machine. The
testing will include both new tests and all of the tests from prior
assignments.

You may request feedback on your assignments prior to the due date.
Just submit your work and send us email.

Students are responsible for understanding the entire assignment and
all of the code that their team produces. The midterm and final exam
are designed to test a student's understanding of the assignments.

Students are free to discuss and get help on the assignments from
anyone or anywhere. When posting questions on Slack, it is OK to post
your code.

In contrast, for exams, students are asked to work alone. The exams
are closed book.

The Final Project is at the end of the semester.

**Late assignment policy:** Assignments may be turned in up to one
week late with a penalty of 10%.

**Slack Chat/Messaging:**

  TBD

**Schedule**

	Day     | Lecture Topic                                        | Assignment Due
	--------|------------------------------------------------------|--------------------------
	Aug. 22 | Introduction                                         |
	Aug. 25 | Compiling from LVar to x86                           | 
	Aug. 30 | Uniquify, Remove Complex Operands, Explicate Control | 
	Sep. 1  | Select Instructions through Prelude & Conclusion     |
	Sep. 5  |                                                      | Integers and Variables
	Sep. 6  | Register Allocation: liveness, interference          |
	Sep. 8  | Code Review: Integers and Variables                  |
	Sep. 13 | Register Allocation: graph coloring                  |
	Sep. 15 | L_If language, type checking, and x86_If             |
	Sep. 19 |                                                      | Register Allocation
	Sep. 20 | Conditionals and Explicate Control                   |
	Sep. 22 | Code Review: Register Allocation                     |
	Sep. 27 | Conditionals: Select Instr., Reg. Alloc., Opt. Jumps |
	Sep. 29 | Loops and Dataflow Analysis                          |
	Oct. 3  |                                                      | Booleans and Conditionals
	Oct. 4  | Loops: RCO, Explicate, Challenge                     | 
	Oct. 6  | Tuples and Garbage Collection                        |
	Oct. 11 | Tuples and GC, cont'd                                |
	Oct. 13 | Arrays, Structs, Generational GC                     |
	Oct. 17 |                                                      | Loops
	Oct. 18 | Review for Midterm                                   |
	Oct. 20 | **Midterm Exam**                                     |
	Oct. 25 | Compiling Functions to x86                           |
	Oct. 27 | Compiling Functions, cont'd                          |
	Oct. 31 |                                                      | Tuples and GC
	Nov. 1  | Lexically Scoped Functions                           |
	Nov. 3  | Lexically Scoped Functions, cont'd                   |
	Nov. 8  | Optimize Closures                                    | 
	Nov. 10 | Dynamic Typing                                       |
	Nov. 14 |                                                      | Functions
	Nov. 15 | Code Review                                          |
	Nov. 17 | Gradual Typing                                       |
	Nov. 18 |                                                      | Proposal for Final Project 
	Dec. 1  | Generics                                             |
	Dec. 6  | No Class                                             |
	Dec. 8  | Review for Final Exam                                |
	Dec. 9  |                                                      | Final Project
	Dec. 13 | **Final Exam**                                       |

**Resources:**

* Lecture videos recorded from the [IU 2020 Compiler course](https://iucompilercourse.github.io/IU-P423-P523-E313-E513-Fall-2020/).
* Github repository for the support code and test suites
    - for [Racket](https://github.com/IUCompilerCourse/public-student-support-code) 
* [Racket Download](https://download.racket-lang.org/)
* [Racket Documentation](https://docs.racket-lang.org/)
* [Notes on x86-64 programming](http://web.cecs.pdx.edu/~apt/cs491/x86-64.pdf)
* [x86-64 Machine-Level Programming](https://www.cs.cmu.edu/~fp/courses/15411-f13/misc/asm64-handout.pdf)
* [Intel x86 Manual](http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-manual-325462.pdf?_ga=1.200286509.2020252148.1452195021)
* [System V Application Binary Interface](https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf)
* [Uniprocessor Garbage Collection Techniques](https://iu.instructure.com/courses/1735985/files/82131907/download?wrap=1) by Wilson. 
* [Fast and Effective Procedure Inlining](https://www.cs.indiana.edu/~dyb/pubs/inlining.pdf) by Waddell and Dybvig.


