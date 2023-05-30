# May 2023

### Monday, 30 {#30}

#### AirVPN

[Mullvad](https://mullvad.net) announced yesterday that [they will be removing the support for forwarded ports](https://mullvad.net/en/blog/2023/5/29/removing-the-support-for-forwarded-ports), disabling the ability to add new ports immediately and removing all existing forwarded ports on July, 1st. Unfortunately, this affects me since I'm very active in the [BitTorrent](https://en.wikipedia.org/wiki/BitTorrent) and [Soulseek](https://en.wikipedia.org/wiki/Soulseek) P2P-networks, which rely solely on [port forwarding](https://en.wikipedia.org/wiki/Port_forwarding) (to establish a connection one of the peers *must* have an open port, and of course many people torrent behind VPNs).

After some research, I decided to switch to [AirVPN](airvpn.org). They support up to 20 port forwards, but also *seemingly* take a [stance](https://airvpn.org/aboutus) at protecting the privacy of their users. They provide a config generation tool, and I've imported several WireGuard configs on my NixOS machine via `NetworkManager`:

```bash
ln -s NL-Alblasserdam-Celaeno.conf Celaeno.conf
nmcli connection import type wireguard file Celaeno.conf
```

### Monday, 29 {#29}

#### [PMG](../../git.md#pmg) {#29#pmg}

Started writing the presentation.

Found a bunch of small typos in the diploma... and missing error lines on the rotation curve plots.

### Saturday, 27 {#27}

#### C

Today I learned that C doesn't have boolean types (well, without including the standard library header `stdbool.h`). I mean, makes sense, but I guess I'll have to get used to inserting `0` and `1` instead of `false` and `true`, respectively. The tricks with the bitwise XOR operator (`x ^= 1`) and explicit negation (`x = !x`) are neat, but they obfuscate the logic. K&R suggest using symbolic constants, but I prefer `boolean`-ish variable names (e.g., `if (empty) {}`).

I am happy with how snappy `clangd` is, and compilation times (I'm using `clang`) in a release mode are almost instant.

#### [PMG](../../git.md#pmg) {#27#pmg}

Fixed another error when computing the estimate mean error. I was mutating the same vector of parameters when computing the finite differences (and so I was accidentally computing a half of the forward finite difference instead of the full central one).

### Friday, 26 {#26}

#### C

Started reading [The C Programming Language](https://en.wikipedia.org/wiki/The_C_Programming_Language). Learned how to set up a very basic C project using [Clang](https://clang.llvm.org), [Meson](https://mesonbuild.com), [Nix](https://nixos.org), and how to set up [`clangd`](https://clangd.llvm.org) (ain't that straightforward with how Nix works).

#### [PMG](../../git.md#pmg) {#26#pmg}

Forgot to extract a square root when computing the estimate mean error, fixed that.

### Thursday, 25 {#25}

#### [PMG](../../git.md#pmg) {#25#pmg}

Covariance matrices and related to them matrices are now computed. Added model confidence intervals on the rotation curves plots.

### Wednesday, 24 {#24}

#### Codon

I might have just wasted a huge part of my free day updating the [Nixpkgs package](https://github.com/NixOS/nixpkgs/pull/226125) of [Codon](https://github.com/exaloop/codon) from `0.16.0` to `0.16.1` only to realize later that the dependency hashes are the same...

Also, yeah, I finally got some free time away from the diploma.

### Tuesday, 23 {#23}

#### [PMG](../../git.md#pmg) {#23#pmg}

Finished the diploma.

### Monday, 22 {#22}

#### [PMG](../../git.md#pmg) {#22#pmg}

Edited the diploma according to the received remarks. Somehow that took the whole day...

### Sunday, 21 {#21}

#### [PMG](../../git.md#pmg) {#21#pmg}

Corrected the way an extra error term is added to the velocity uncertainties. There are now two sets of bars for the non-from-Reid objects on the rotation curves. Added a near the solar circle sample that is self-consistent.

And finally, I finished writing the diploma! Will have to insert the new results tomorrow, though, but still!

### Saturday, 20 {#20}

#### [PMG](../../git.md#pmg) {#20#pmg}

Added a variant for the optimal sample of HMSFRs, but with disabled inner optimization and outliers checks (to check for the effect of assuming zero parallax errors separately from the effect of reducing the sample volume).

Added most of the results to the diploma.

### Friday, 19 {#19}

#### [PMG](../../git.md#pmg) {#19#pmg}

Added variants for checking self-consistency of the models. Added a comparison chart for original parallaxes vs. reduced ones (it shows that the algorithm of getting proper parallaxes via the statistical method works). Switched to the `chi^2_3` characteristic when checking for outliers for the variants with disabled inner optimization.

That's kinda it... just gotta put the results into the diploma now.

### Thursday, 18 {#18}

#### Nixpkgs

An [update](https://github.com/NixOS/nixpkgs/pull/232581) to [`obs-studio-plugins.advanced-theme-switched`](https://github.com/WarmUpTill/SceneSwitcher) required me to [add](https://github.com/NixOS/nixpkgs/pull/232578) [`libremidi`](https://github.com/jcelerier/libremidi) to [Nixpkgs](https://github.com/NixOS/nixpkgs). Did that.

#### [PMG](../../git.md#pmg) {#18#pmg}

Added result variants with the inner optimization disabled for comparison.

The mean systematical error in parallaxes is now computed.

### Wednesday, 17 {#17}

#### [PMG](../../git.md#pmg) {#17#pmg}

Finished with the errands. Added a section to the diploma about applying the algorithm.

### Tuesday, 16 {#16}

#### [PMG](../../git.md#pmg) {#16#pmg}

Welp, turns out I've got the L' thing wrong. Struggled, but made it proper today.

Also, there are a bunch of other errands, and not much time left...

### Monday, 15 {#15}

#### [PMG](../../git.md#pmg) {#15#pmg}

Wrote about the samples today. Started writing about the inner target function not being smooth. This required me to write some extra code to compute and plot the inner profiles, and to find the objects with more than one local minima on these profiles and to plot their (X, Y) distribution. The latter is almost done, and hopefully it will show what I think it should.

### Sunday, 14 {#14}

#### [PMG](../../git.md#pmg) {#14#pmg}

Wrote about the algorithm in the diploma.

### Saturday, 13 {#13}

#### [PMG](../../git.md#pmg) {#13#pmg}

Added a four-dimensional method (next to the one-dimensional one) for checking for outliers. Okay, I hope *this* is the last change to the algorithm.

Wrote most of the theory in the diploma. Thinking about writing about more practical bits of the algorithm next, separate from the theory.

### Friday, 12 {#12}

#### [PMG](../../git.md#pmg) {#12#pmg}

Outliers are now searched with L' = 3 first, then with L' = 1. This is (hopefully) a final touch, and the realization of the method of parametric modelling of the Galaxy is now complete.

Was also writing the theoretical part of the diploma. That's definitely taking a while...

### Thursday, 11 {#11}

#### [PMG](../../git.md#pmg) {#11#pmg}

Made the HMSFRs sample more uniform by adding an extra error term to the non-from-Reid objects. The `best_n` for HMSFRs is found to be 3, and the profiles and relative errors are adequate now.

Started making the outliers routine more intricate.

### Wednesday, 10 {#10}

#### [PMG](../../git.md#pmg) {#10#pmg}

Finished with the introduction, started writing the theoretical part of the diploma.

### Tuesday, 9 {#9}

#### [PMG](../../git.md#pmg) {#9#pmg}

Still writing an introduction...

I've learned how to create bibliographies today in XeTeX. Basically, I've set up a combination of [Zotero](https://www.zotero.org) (with their browser add-on) and [Better BibTeX](https://retorque.re/zotero-better-bibtex) for automatic generation of `.bib` files, and a combination of [`tectonic`](https://tectonic-typesetting.github.io), [`biber`](https://github.com/plk/biber) and [`biblatex`](https://sourceforge.net/projects/biblatex) for typesetting.

### Monday, 8 {#8}

#### [PMG](../../git.md#pmg) {#8#pmg}

Started writing the text of the diploma.

### Sunday, 7 {#7}

#### [PMG](../../git.md#pmg) {#7#pmg}

Okay, computing errors works now for all models. Many don't converge well, though, but it's fine.

### Saturday, 6 {#6}

#### [PMG](../../git.md#pmg) {#6#pmg}

Finished with other errands. Computing the errors for all models. This takes forever...

### Friday, 5 {#5}

#### [PMG](../../git.md#pmg) {#5#pmg}

Okay, I was able to make the inner optimization mostly work by switching to subintervals and finding the global minimum in the interval that way. The interval is now expanded from ±3 to ±6 to ±9 sigmas as necessary.

### Thursday, 4 {#4}

#### [PMG](../../git.md#pmg) {#4#pmg}

Started reimplementing the optimization process to make it possible to go through all degrees of the polynomial of the rotation curve via the same sample (by sharing the blacklist). This will allow us to define which degree is the best.

### Tuesday, 2 {#2}

#### [PMG](../../git.md#pmg) {#2#pmg}

Added an option to output extra information about the blacklisted objects. It's their (X, Y) distribution, discrepancies, and inner profiles.

### Monday, 1 {#1}

#### [PMG](../../git.md#pmg) {#1#pmg}

Aight, it's done. I've put the parallax smoothness check in a loop, and inside that loop is the previous loop for checking the discrepancies via frozen profiles. The parallax interval (both for finding the minimum and checking the smoothness of the inner target function in its vicinity) is bound to 3 sigmas, the interval for other discrepancies is now increased to 5 sigmas. It mostly works now, and I'm very much eager to stop at this implementation of the optimization routine (because, to be frank, I'm burned out).
