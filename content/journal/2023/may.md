# May 2023

### Monday, 1 {#1}

#### [PMG](../../git.md#pmg) {#1#pmg}

Aight, it's done. I've put the parallax smoothness check in a loop, and inside that loop is the previous loop for checking the discrepancies via frozen profiles. The parallax interval (both for finding the minimum and checking the smoothness of the inner target function in its vicinity) is bound to 3 sigmas, the interval for other discrepancies is now increased to 5 sigmas. It mostly works now, and I'm very much eager to stop at this implementation of the optimization routine (because, to be frank, I'm burned out).
