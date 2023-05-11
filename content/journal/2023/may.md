# May 2023

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
