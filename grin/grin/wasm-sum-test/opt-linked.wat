(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func))
  (import "env" "_prim_int_print" (func $_prim_int_print (type 0)))
  (func $__wasm_call_ctors (type 1))
  (func $grinMain (type 1)
    i32.const 5050
    call $_prim_int_print)
  (table (;0;) 1 1 anyfunc)
  (memory (;0;) 1025)
  (global (;0;) (mut i32) (i32.const 65536))
  (global (;1;) i32 (i32.const 65540))
  (global (;2;) i32 (i32.const 65540))
  (global (;3;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__heap_base" (global 1))
  (export "__data_end" (global 2))
  (export "grinMain" (func $grinMain))
  (export "_heap_ptr_" (global 3))
  (data (i32.const 65536) "\00\00\00\00"))