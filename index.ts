import { YA_BE } from "./greet.ts";

const filenames = Deno.args;
YA_BE();
let x = null;
for (const filename of filenames) {
  const file = await Deno.open(filename);
  await Deno.copy(file, Deno.stdout);
  file.close();
}
