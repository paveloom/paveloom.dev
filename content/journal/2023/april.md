# April 2023

### Sunday, 9 {#9}

#### [PMG](../../git.md#pmg) {#8#pmg}

Okay, here's an example of what I'm trying to deal with here:

```rust
fn compute_l_1<F>(
    objects: &mut Objects<F>,
    fit_params: &Params<F>,
    par_pairs: &mut Vec<(F, F, F)>,
) -> Result<F>
where
    F: Debug
        + Default
        + Display
        + SampleUniform
        + Sync
        + Send
        + ArgminFloat
        + argmin_math::ArgminMul<std::vec::Vec<F>, std::vec::Vec<F>>
        + argmin_math::ArgminZeroLike,
    StandardNormal: Distribution<F>,
    std::vec::Vec<F>: argmin_math::ArgminL2Norm<F>,
    std::vec::Vec<F>: argmin_math::ArgminSub<std::vec::Vec<F>, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminAdd<std::vec::Vec<F>, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminSub<F, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminAdd<F, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminMul<F, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminDot<std::vec::Vec<F>, F>,
    std::vec::Vec<F>: argmin_math::ArgminMul<std::vec::Vec<F>, std::vec::Vec<F>>,
    std::vec::Vec<F>: argmin_math::ArgminL1Norm<F>,
    std::vec::Vec<F>: argmin_math::ArgminSignum,
    std::vec::Vec<F>: argmin_math::ArgminMinMax,
{
    // <...>
}
```

I mean, are trait bounds really worth it?! And that's just me using [`argmin`](https://argmin-rs.org)'s `Vec` backend. It's a complete nightmare if I switch to the `ndarray` or the `nalgebra` backend.

On a positive side, it takes about 4-5 iterations to find the minimum of the reduced parallax function with L-BFGS. Instead of exactly 100000 with simulated annealing. I checked the function, too: it seems to always have a local minimum near the observed parallax.

#### Recurse Center {#9#recurse-center}

[Implemented](https://github.com/paveloom/mini-database-server-in-zig) the [database server task](https://www.recurse.com/pairing-tasks) in [Zig](https://ziglang.org) for the [Recurse Center](https://www.recurse.com) interview.

Had the conversational interview yesterday. First time speaking to a native English speaker, by the way! Using voice, that is.

### Saturday, 8 {#8}

#### [PMG](../../git.md#pmg) {#8#pmg}

The discrete rotation curve on the fitted rotation curve plot is now computed against the optimized parameters.

Started changing the algorithm for the inner optimization from [simulated annealing](https://en.wikipedia.org/wiki/Simulated_annealing) to [L-BFGS](https://en.wikipedia.org/wiki/Limited-memory_BFGS). This should hopefully speed things up. Right now I'm doing exactly 100000 iterations for the search of the reduced parallax, which is definitely excessive. There is no guarantee that this a local optimization problem instead of the global one, though.

### Friday, 7 {#7}

#### [PMG](../../git.md#pmg) {#7#pmg}

Fixed the fitting procedure today in accordance with the new description. Found some mistakes in the previous implementation.

Was trying to figure out why the uncertainties in the azimuthal velocity inherited from the uncertainties in the catalog velocities are different from the previous versions of the program. Yep, still a mystery, but seems like the new ones are the correct ones.

### Thursday, 6 {#6}

#### Recurse Center {#6#recurse-center}

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
