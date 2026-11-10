package io.github.gardusi.gustavo.kit

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

class KitTest:
  @Test def greets(): Unit =
    assertEquals("Hello, Scala", Kit.greet("Scala"))

  @Test def chunks(): Unit =
    assertEquals(List(List(1, 2), List(3)), Kit.chunk(List(1, 2, 3), 2))
