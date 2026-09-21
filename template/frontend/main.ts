import { greet } from "./greet.ts";

const target = document.getElementById("app");
if (target) {
  target.textContent = greet("world");
}
