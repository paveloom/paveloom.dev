# April 2023

### Friday, 7 {#7}

#### [PMG](../../git.md#pmg) {#7#pmg}

Fixed the fitting procedure today in accordance with the new description. Found some mistakes in the previous implementation.

Was trying to figure out why the uncertainties in the azimuthal velocity inherited from the uncertainties in the catalog velocities are different from the previous versions of the program. Yep, still a mystery, but seems like the new ones are the correct ones.

### Thursday, 6 {#6}

#### Recurse Center

Applied to the [Recurse Center](https://www.recurse.com) today. Fingers crossed!

### Wednesday, 5 {#5}

#### [PMG](../../git.md#pmg) {#5#pmg}

Done more requests. Stopped at fixing the fitting procedure: turns out I was optimizing the wrong parameters all along, but since they didn't conflict with the correct ones in the subroutine, the results are still technically correct. There are changes to the formulae, though, so I will have to account to that, too.

### Tuesday, 4 {#4}

#### [PMG](../../git.md#pmg) {#4#pmg}

`Params` are now a serializable object, and I'm almost done with making the same for the `Object` type, too. I would like to make [`serde`](https://serde.rs) serialize `Option<T>` as `T` when it's a `Some<T>` variant and skip it if it's a `None` variant. Right now it writes the tag before the value, which is somewhat annoying to parse.

### Monday, 3 {#3}

#### [PMG](../../git.md#pmg) {#3#pmg}

There is now a rotation curve computed based on the fitted parameters (the model is still linear, though). Somehow implementing it took more time than I have expected. Made some design decisions: going to flatten out the data objects, so they represent the output records as close as possible (getting rid of those pesky `Measurement`s). Had a weird thing happening in a Julia script, turned out to be a data race bug (yikes!).

### Sunday, 2 {#2}

#### `flatpak-github-actions`

Sometimes you just wonder, does it make sense to resurrect a [5-months old issue](https://github.com/flatpak/flatpak-github-actions/issues/105) which lost all relevance...

#### [PMG](../../git.md#pmg) {#2#pmg}

Finished some requests. One of them required me to drop the functionality of configuring the bounds for the parameters via CLI. I distinctly remember investing some time into bringing it in a while back, and now it's gone (it's not a hard feature, though). I like to think about things like this as "design evolution", even though it's mostly just going back and forth and testing what sticks.

### Saturday, 1 {#1}

#### Codon

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/224257) to add [Codon](https://docs.exaloop.io/codon) to Nixpkgs.

This took two days. The worst part was to bypass issues with [CMake](https://cmake.org) and [CPM](https://github.com/cpm-cmake/CPM.cmake). Also, I ended up compiling a [fork](https://github.com/exaloop/llvm-project) of [LLVM](https://llvm.org), which wasn't as bad as I thought. It doesn't take much RAM and disk space if you compile it with [Clang](https://clang.llvm.org/) in the Release mode and link it with [`ldd`](https://lld.llvm.org). Takes about half an hour on my laptop.

#### Gut

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/224267) to add [Gut](https://gut-cli.dev) to Nixpkgs.

It takes a couple of minutes to package a pure Go module.
