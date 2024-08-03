pub enum IntegerPredicate {
  EQ
  NE
  UGT
  UGE
  ULT
  ULE
  SGT
  SGE
  SLT
  SLE
}  derive (Eq)

pub enum DoublePredicate {
  False
  OEQ
  OGT
  OGE
  OLT
  OLE
  ONE
  ORD
  UNO
  UEQ
  UGT
  UGE
  ULT
  ULE
  UNE
  True
} derive (Eq)