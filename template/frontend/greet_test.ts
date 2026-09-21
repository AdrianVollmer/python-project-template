import { assertEquals } from "jsr:@std/assert@1";
import { greet } from "./greet.ts";

Deno.test("greet", () => {
  assertEquals(greet("world"), "Hello, world!");
});
