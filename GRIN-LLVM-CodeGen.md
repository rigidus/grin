# Differences to Boquist's PhD thesis RISC backend

- support for multiple types (float, int, etc.)
- LLVM is typed ; values must have proper types i.e.
- no register pinning ; instead pass registers (e.g. heap pointer) as local parameter
- rely on LLVM register allocator


Boquist's RISC backend only supports int type ; there are problematic expressions: unit (A Int | B Float)

IDEA:
  GRIN must be monomorph in LLVM type system
  Vectorisation is an efficient mapping to product types

node = tag + simple values + node pointers
con data = simple values + node pointers
slim layout: tag + con data
fat layout: tag + con1 data + ... + conN data

IDEA:
  support array literals
  support struct literals

HINT:
  fetch, store, update must be layout monorphic
  the only supported cast is pointer cast

## Legalisation
  implement new GRIN transformations
  - llvm monomorphisation ; split polymorphic (in LLVM type system) GRIN node components
  - node layout calculation

  It is possible to put monomorphisation into the vectorisation transformation as it is already relies on the HPT result.

## Notes
  - CodeGen supports monomorphic GRIN ; monomorphic GRIN validation pass
  - new transformation: grin-monomorphisation
      turns variadic typed GRIN into monomorphic type GRIN (using HPT result)
  - GRIN type system
      node
      heap location
      simple type
      tag

  - GRIN type system for LLVM codegen
      node TAG
      heap location
      simple type LLVM TYPE
      tag N
  - new transformation: llvm-monomorphisation
      makes GRIN monomorphic in LLVM type system (using HPT result)

  - GRIN transformations must not lose information. If the information is only stored in the TAG info table then the TAG info table must be part of the GRIN language. e.g. as types

LLVM bitcast experiments
  - convert i16 to <i8,i8>
  - convert i8 to <i2,i2,i2,i2>

# LLVM codegen from high level GRIN

It is possible to compile to LLVM from high level GRIN without analysis.
However an universal value representation is required where every GRIN register is mapped to a vector of universal values.
Basically an interpreter can be generated for the input source code.
If the source language can provide type information then the value representation can be more efficient.