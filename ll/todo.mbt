type TODO

fn todo[T](msg : String) -> T {
  abort("TODO: \{msg}")
}