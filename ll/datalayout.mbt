pub enum Endianness {
  LittleEndian
  BigEndian
} derive (Eq)

pub struct AlignmentInfo {
  abi_alignment : UInt
  preferred_alignment : UInt
} derive (Eq)


fn AlignmentInfo::new(abi_alignment : UInt, preferred_alignment : UInt) -> AlignmentInfo {
  AlignmentInfo::{ abi_alignment : abi_alignment, preferred_alignment : preferred_alignment }
}

pub enum AlignType {
  IntegerAlign
  VectorAlign
  FloatAlign
} derive (Eq, Hash)

pub enum Mangling {
  ELFMangling
  MIPSMangling
  MachOMangling
  WindowsCOFFMangling
} derive (Eq)

pub struct DataLayout {
  endianness : Endianness
  mangling : Mangling?
  stack_alignment : UInt?
  pointer_layouts : @hashmap.T[AddrSpace, (UInt, AlignmentInfo)]
  type_layouts : @hashmap.T[(AlignType, UInt), AlignmentInfo]
  aggregate_layout : AlignmentInfo
  native_sizes : @hashset.T[UInt]?
}

pub fn default_layout(endianness : Endianness) -> DataLayout {
  DataLayout::{
    endianness : endianness,
    mangling : None,
    stack_alignment : None,
    pointer_layouts : @hashmap.from_array([(AddrSpace(0), (64, AlignmentInfo::new(64, 64)))]),
    type_layouts : @hashmap.from_array([
      ((IntegerAlign, 1), AlignmentInfo::new(8, 8)),
      ((IntegerAlign, 8), AlignmentInfo::new(8, 8)),
      ((IntegerAlign, 16), AlignmentInfo::new(16, 16)),
      ((IntegerAlign, 32), AlignmentInfo::new(32, 32)),
      ((IntegerAlign, 64), AlignmentInfo::new(32, 64)),
      ((FloatAlign, 32), AlignmentInfo::new(32, 32)),
      ((FloatAlign, 64), AlignmentInfo::new(64, 64)),
      ((VectorAlign, 64), AlignmentInfo::new(64, 64)),
      ((VectorAlign, 128), AlignmentInfo::new(128, 128))
    ]),
    aggregate_layout : AlignmentInfo::new(0, 64),
    native_sizes : None
  }
}