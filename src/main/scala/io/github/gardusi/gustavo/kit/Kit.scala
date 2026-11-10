package io.github.gardusi.gustavo.kit

object Kit:
  def greet(name: String): String = s"Hello, $name"

  def chunk[A](items: List[A], size: Int): List[List[A]] =
    require(size > 0, "size must be positive")
    items.grouped(size).toList
