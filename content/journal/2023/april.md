# April 2023

### Monday, 17 {#17}

#### [PMG](../../git.md#pmg) {#17#pmg}

Implemented a couple of requests. Fitting is seemingly correct now, but the procedure is somewhat unstable. Had to fiddle with the cost function tolerances to make it work for the current samples.

Almost done with reintroducing computation of the confidence intervals: the bracketing requirement of the [Brent method](https://docs.rs/argmin/0.8.1/argmin/solver/brent/struct.BrentOpt.html) is giving me a hard time.

### Sunday, 16 {#16}

#### [PMG](../../git.md#pmg) {#16#pmg}

Switched to local methods for both optimizations. This took quite a bit of trial and error, but now I'm using [L-BFGS](https://docs.rs/argmin/0.8.1/argmin/solver/quasinewton/struct.LBFGS.html) with the [More-Thuente line search](https://docs.rs/argmin/0.8.1/argmin/solver/linesearch/struct.MoreThuenteLineSearch.html) for the outer optimization and [Golden-section search](https://docs.rs/argmin/0.8.1/argmin/solver/goldensectionsearch/struct.GoldenSectionSearch.html) for the inner optimization.

Also, found out that floating-point arithmetic operations are not associative. Since I'm using parallel fold and reduce operations in the outer optimization, this actually affects the result, compared to a sequential fold. Will try to fix this tomorrow.

### Saturday, 15 {#15}

#### Codon {#15#codon}

I've created a [PR](https://github.com/NixOS/nixpkgs/pull/226125) to update [Codon](https://docs.exaloop.io/codon) in [Nixpkgs](https://github.com/NixOS/nixpkgs) yesterday. A user reported that Codon's dependencies have a different hash on Darwin systems. So, to test that, I've installed [macOS Catalina](https://en.wikipedia.org/wiki/MacOS_Catalina) in a virtual machine ([QEMU](https://en.wikipedia.org/wiki/QEMU), accelerated by [KVM](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine)).

I first tried the scripts in the [`kholia/OSX-KVM`](https://github.com/kholia/OSX-KVM) repository. Tip: replace `-device virtio-net-pci` with `-device e1000-82545em` in the `OpenCore-Boot.sh` script if you have [`virt-manager`](https://virt-manager.org) installed and its network interface (`virbr0`) is started. In my case, though, the virtual machine just failed to start the installation process after downloading the installation files (which took a while!).

I then tried the scripts from the [`foxlet/macOS-Simple-KVM`](https://github.com/foxlet/macOS-Simple-KVM) repository, and after a bit of tweaking they worked fine (the scripts are similar, really). The installation worked as expected, and I got a working Apple system. There is no guest support, though, so no clipboard integration (I used [Pastebin](https://pastebin.com) instead), and I had to tweak the resolution by modifying a file in the EFI partition.

Anyhow, it works, and I compiled a fork of [LLVM](https://llvm.org) (which is required for Codon) on a Darwin system.

#### [PMG](../../git.md#pmg) {#15#pmg}

Added a stab at computing the confidence intervals of the fitted parameters. However, it's broken right now, because I had to lower the number of iterations for the simulated annealing.

Turns out the outer optimization problem is also a local one, so I will be switching to local optimization methods. This should simplify the whole procedure. However, it also means that I will have to deal with making generics and [`argmin`](https://www.argmin-rs.org) work nicely (again!).

#### Recurse Center {#15#recurse-center}

Had a pair programming interview yesterday, got a rejection today. Oh well!

### Thursday, 13 {#13}

#### [`simulated_annealing`](../../git.md#simulated_annealing) {#13#simulated-annealing}

A small update to the library I've written as part of a university course: you can now use closures for all the custom functions.

### Tuesday, 11 {#11}

#### [PMG](../../git.md#pmg) {#11#pmg}

Almost done with implementing an algorithm for computing the confidence intervals for the fitted parameters. It's gonna be painful to test, I can already tell: it's an iterative root-finding Brent method (hopefully it will work) for each of the 9 parameters, where *each iteration* is a global optimization problem.

Also, found out that I need to capture outside world in the closures passed to my implementation of the simulated annealing algorithm, so I went and patched that (the commit is almost done).

### Monday, 10 {#10}

#### [PMG](../../git.md#pmg) {#10#pmg}

[`argmin`](https://argmin-rs.org)'s [L-BFGS](https://docs.rs/argmin/latest/argmin/solver/quasinewton/struct.LBFGS.html) solver with the [More-Thuente line search](https://docs.rs/argmin/latest/argmin/solver/linesearch/struct.MoreThuenteLineSearch.html) failed consistently on later iterations with `Search direction must be a descent direction`. I guess that's because the gradient of the inner target function is getting too small. Kept [my implementation of simulated annealing](https://github.com/paveloom-r/simulated_annealing), but reduced the number of iterations. Seems like it's not that important to have exact values of the reduced parallaxes since both optimizations use different streams of the pseudo-random number generator. Meaning, if a set of parameters is found to be optimal at some iteration, it will be found to be optimal again at the same iteration if reduced parallaxes differ only in mantissa.

### Sunday, 9 {#9}

#### [PMG](../../git.md#pmg) {#9#pmg}

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

#### Codon {#1#codon}

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/224257) to add [Codon](https://docs.exaloop.io/codon) to Nixpkgs.

This took two days. The worst part was to bypass issues with [CMake](https://cmake.org) and [CPM](https://github.com/cpm-cmake/CPM.cmake). Also, I ended up compiling a [fork](https://github.com/exaloop/llvm-project) of [LLVM](https://llvm.org), which wasn't as bad as I thought. It doesn't take much RAM and disk space if you compile it with [Clang](https://clang.llvm.org/) in the Release mode and link it with [`ldd`](https://lld.llvm.org). Takes about half an hour on my laptop.

#### Gut

Created a [pull request](https://github.com/NixOS/nixpkgs/pull/224267) to add [Gut](https://gut-cli.dev) to Nixpkgs.

It takes a couple of minutes to package a pure Go module.
