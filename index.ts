import { YA_BE } from "./greet.ts";

const filenames = Deno.args;
YA_BE();
for (const filename of filenames) {
  const file = await Deno.open(filename);
  await Deno.copy(file, Deno.stdout);
  file.close();
}
