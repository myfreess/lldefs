

pub enum Definition {
  GlobalDef
  TypeDef
  MetadataDef
  NamedMetadataDef
  ModuleInlineAssembly
  FunctionArreibutes
  COMBAT
}

pub struct Module {
  module_name : String
  sourece_file_name : String
  data_layout : TODO
  target_triple : String?
  definitions : Array[Definition]
}

