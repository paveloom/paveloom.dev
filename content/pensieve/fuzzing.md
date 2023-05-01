# Fuzzing

In programming and software development, fuzzing or fuzz testing is an automated software testing technique that involves providing invalid, unexpected, or random data as inputs to a computer program. The program is then monitored for exceptions such as crashes, failing built-in code assertions, or potential memory leaks. Typically, fuzzers are used to test programs that take structured inputs. This structure is specified, e.g., in a file format or protocol and distinguishes valid from invalid input. An effective fuzzer generates semi-valid inputs that are "valid enough" in that they are not directly rejected by the parser, but do create unexpected behaviors deeper in the program and are "invalid enough" to expose corner cases that have not been properly dealt with.

Read more on [Wikipedia](https://en.wikipedia.org/wiki/Fuzzing).

#### Fuzzing engines
- [AFL++](https://aflplus.plus)
- [Centipede](https://github.com/google/centipede)
- [Honggfuzz](https://honggfuzz.dev)
- [LibFuzzer](https://llvm.org/docs/LibFuzzer.html)

#### Fuzzing infrastructure
- [ClusterFuzz](https://google.github.io/clusterfuzz)

#### Continuous integration
- [OSS-Fuzz](https://google.github.io/oss-fuzz)

#### Resources
- [`google/fuzzing`](https://github.com/google/fuzzing/tree/master/docs)
- [2019] [The Day I Fell in Love with Fuzzing](https://nullprogram.com/blog/2019/01/25)
