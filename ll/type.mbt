

/// http://llvm.org/docs/LangRef.html#type-system
pub enum Type {
  VoidType
  IntegerType(~bit_width : UInt)
  PointerType(~refer_type : Type, ~addr_space : AddrSpace)
  F32 // FloatingPointType Float
  F64 // FloatingPointType Double
  FunctionType(~result_type : Type, ~arg_types : Array[Type], ~is_variable_arg : Bool)
  VectorType(~size : UInt, ~element_type : Type)
  StructureType(~is_packed : Bool, ~field_types : Array[Type])
  ArrayType(~size : UInt64, ~element_type : Type)
  NamedTypeReference(Name) // http://llvm.org/docs/LangRef.html#opaque-structure-types
  MetadataType // only to be used as a parameter type for a few intrinsics
  LabelType // only to be used as the type of block names
  TokenType
} derive (Eq)

pub let void : Type = VoidType

pub let i1 : Type = IntegerType(bit_width = 1)

pub let i8 : Type = IntegerType(bit_width = 8)

pub let i16 : Type = IntegerType(bit_width = 16)

pub let i32 : Type = IntegerType(bit_width = 32)

pub let i64 : Type = IntegerType(bit_width = 64)

pub let i128 : Type = IntegerType(bit_width = 128)

pub fn ptr(t : Type) -> Type {
  PointerType(refer_type = t, addr_space = AddrSpace(0))
}

pub let f32 : Type = F32
pub let f64 : Type = F64
