pub enum Name {
  Name(String)
  UnName(UInt)
} derive (Eq)

pub fn mk_name(str : String) -> Name {
  fn is_ascii(ch : Char) -> Bool {
    ch.to_int() <= 128
  }
  fn not_name(s : String) -> Bool {
    let str = s.to_array()
    for i = 0; i < str.length(); i = i + 1 {
      if is_ascii(str[i]) {
        continue
      } else {
        return true
      }
    } else {
      return false
    }
  }
  if not_name(str) {
    let msg = "Only ASCII strings are automatically converted to LLVM names."
    abort(msg)
  } else {
    Name(str)
  }
}