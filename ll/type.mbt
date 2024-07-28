pub enum FloatingPointKind {
  HalfFP
  FloatFP
  DoubleFP
  FP128FP
  X86_FP80FP
  PPC_FP128FP
}

/// http://llvm.org/docs/LangRef.html#type-system
pub enum Type {
  VoidType
  IntegerType(~bit_width : UInt)
  PointerType(~refer_type : Type, ~addr_space : AddrSpace)
  FloatingPointType(~fp_kind : FloatingPointKind)
  FunctionType(~result_type : Type, ~arg_types : Array[Type], ~is_variable_arg : Bool)
  VectorType(~size : UInt, ~element_type : Type)
  StructureType(~is_packed : Bool, ~field_types : Array[Type])
  ArrayType(~size : UInt64, ~element_type : Type)
  NamedTypeReference(Name) // http://llvm.org/docs/LangRef.html#opaque-structure-types
  MetadataType // only to be used as a parameter type for a few intrinsics
  LabelType // only to be used as the type of block names
  TokenType
}

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

pub let half : Type = FloatingPointType(fp_kind = HalfFP)

pub let float : Type = FloatingPointType(fp_kind = FloatFP)

pub let double : Type = FloatingPointType(fp_kind = DoubleFP)

pub let fp128 : Type = FloatingPointType(fp_kind = FP128FP)

pub let x86_fp80 : Type = FloatingPointType(fp_kind = X86_FP80FP)

pub let ppc_fp128 : Type = FloatingPointType(fp_kind = PPC_FP128FP)

