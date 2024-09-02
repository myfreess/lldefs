pub enum Constant {
  // merge two concept
  // http://llvm.org/docs/LangRef.html#constants
  // http://llvm.org/docs/LangRef.html#constant-expressions
  Int(~bit_width : UInt, ~value : BigInt)
  Float(~value : Float)
  Double(~value : Double)
  Null(~const_type : Type)
  AggregateZero(~const_type : Type)
  Struct(~struct_name : Name?, ~is_packed : Bool, ~members : Array[Constant])
  Array(~member_type : Type, ~members : Array[Constant])
  Vector(~member : Array[Constant])
  Undef(~const_type : Type)
  BlockAddr(~block_addr_fn : Name, ~block_addr : Name)
  GlobalReference(Type, Name)
  TokenNone
  // https://releases.llvm.org/2.6/docs/ReleaseNotes.html
  // The add, sub and mul instructions now support optional "nsw" and "nuw" bits which indicate that the operation is guaranteed to not overflow 
  // (in the signed or unsigned case, respectively
  Add(~nsw : Bool, ~nuw : Bool, ~operand0 : Constant, ~operand1 : Constant)
  Sub(~nsw : Bool, ~nuw : Bool, ~operand0 : Constant, ~operand1 : Constant)
  Mul(~nsw : Bool, ~nuw : Bool, ~operand0 : Constant, ~operand1 : Constant)
  UDiv(~exact : Bool, ~operand0 : Constant, ~operand1 : Constant)
  SDiv(~exact : Bool, ~operand0 : Constant, ~operand1 : Constant)
  FAdd(~operand0 : Constant, ~operand1 : Constant)
  FSub(~operand0 : Constant, ~operand1 : Constant)
  FMul(~operand0 : Constant, ~operand1 : Constant)
  FDiv(~operand0 : Constant, ~operand1 : Constant)
  URem(~operand0 : Constant, ~operand1 : Constant)
  SRem(~operand0 : Constant, ~operand1 : Constant)
  FRem(~operand0 : Constant, ~operand1 : Constant)
  Shl(~nsw : Bool, ~nuw : Bool, ~operand0 : Constant, ~operand1 : Constant)
  LShr(~exact : Bool, ~operand0 : Constant, ~operand1 : Constant)
  AShr(~exact : Bool, ~operand0 : Constant, ~operand1 : Constant)
  And(~operand0 : Constant, ~operand1 : Constant)
  Or(~operand0 : Constant, ~operand1 : Constant)
  Xor(~operand0 : Constant, ~operand1 : Constant)
  GetElementPtr(~inBounds : Bool, ~address : Constant, ~indices : Array[Constant])
  Trunc(~operand : Constant, ~operand_type : Type)
  ZExt(~operand : Constant, ~operand_type : Type)
  SExt(~operand : Constant, ~operand_type : Type)
  PtrToInt(~operand : Constant, ~operand_type : Type)
  InttoPtr(~operand : Constant, ~operand_type : Type)
  BitCast(~operand : Constant, ~operand_type : Type)
  AddrSpaceCast(~operand : Constant, ~operand_type : Type)
  ICmp(~pred : IntegerPredicate, ~operand0 : Constant, ~operand1 : Constant)
  FCmp(~pred : DoublePredicate, ~operand0 : Constant, ~operand1 : Constant)
  Select(~condition : Constant, ~then_value : Constant, ~else_value : Constant)
  ExtractElement(~vector : Constant, ~index : Constant)
  InsertElement(~vector : Constant, ~index : Constant, ~element : Constant)
  ExtractValue(~aggregate : Constant, ~indices : Array[UInt])
  InsertValue(~aggregate : Constant, ~indices : Array[UInt], ~element : Constant)
} derive(Eq)

// LLVM types don't include signedness
fn signed_integer_value(self : Constant) -> BigInt {
  match self {
    Int(_) as constint => {
      let n = constint.bit_width.to_int64()
      todo("")
    }
  }
}