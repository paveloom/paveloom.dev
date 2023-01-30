# Rust

Rust is a multi-paradigm, general-purpose programming language. Rust emphasizes performance, type safety, and concurrency. Rust enforces memory safety—that is, that all references point to valid memory—without requiring the use of a garbage collector or reference counting present in other memory-safe languages. To simultaneously enforce memory safety and prevent concurrent data races, Rust's borrow checker tracks the object lifetime and variable scope of all references in a program during compilation. Rust is popular for systems programming but also offers high-level features including functional programming constructs.

Read more on [Wikipedia](https://en.wikipedia.org/wiki/Rust_(programming_language)).

#### Official

##### Sites
- [Rust](https://www.rust-lang.org) ⭐

##### Documentation
- [Rust Book](https://doc.rust-lang.org/book) ⭐
- [Rust By Example](https://doc.rust-lang.org/stable/rust-by-example) ⭐
- [Rust Compiler Error Index](https://doc.rust-lang.org/error-index.html)
- [The Cargo Book](https://doc.rust-lang.org/cargo) ⭐
- [The Edition Guide](https://doc.rust-lang.org/edition-guide)
- [The Rust Reference](https://doc.rust-lang.org/reference)
- [The Rust Standard Library](https://doc.rust-lang.org/std) ⭐
- [The Rust Unstable Book](https://doc.rust-lang.org/nightly/unstable-book)
- [The Rustonomicon](https://doc.rust-lang.org/nomicon)
- [The `rustc` book](https://doc.rust-lang.org/rustc)
- [The `rustdoc` book](https://doc.rust-lang.org/rustdoc)

##### Core
- [Chalk](https://github.com/rust-lang/chalk): An implementation and definition of the Rust trait system using a PROLOG-like logic solver
- [Polonius](https://github.com/rust-lang/polonius): Defines the Rust borrow checker

#### Community

##### Documentation
- [Rust Book experiment](https://rust-book.cs.brown.edu)

##### Blogs
- [Faster than Lime](https://fasterthanli.me) ⭐
- [Read Rust](https://readrust.net)
- [Sylvain Kerkour's blog](https://kerkour.com/posts) ⭐

##### Books
- [Asynchronous Programming in Rust](https://rust-lang.github.io/async-book)
- [Black Hat Rust](https://kerkour.com/black-hat-rust)
- [Code Like a Pro in Rust](https://www.manning.com/books/code-like-a-pro-in-rust)
- [Command Line Applications in Rust](https://rust-cli.github.io/book)
- [Comprehensive Rust](https://google.github.io/comprehensive-rust/welcome.html) ⭐
- [High Assurance Rust](https://highassurance.rs)
- [Learning Rust With Entirely Too Many Linked Lists](https://rust-unofficial.github.io/too-many-lists)
- [Programming Rust, 2nd Edition](https://www.oreilly.com/library/view/programming-rust-2nd/9781492052586/)
- [Refactoring to Rust](https://www.manning.com/books/refactoring-to-rust)
- [Rust API Guidelines](https://rust-lang.github.io/api-guidelines)
- [Rust Atomics and Locks](https://www.oreilly.com/library/view/rust-atomics-and/9781098119430)
- [Rust Cookbook](https://rust-lang-nursery.github.io/rust-cookbook) ⭐
- [Rust Design Patterns](https://rust-unofficial.github.io/patterns)
- [Rust and WebAssembly](https://rustwasm.github.io/docs/book)
- [Rust for Rustaceans](https://nostarch.com/rust-rustaceans)
- [Rust in Action](https://www.manning.com/books/rust-in-action)
- [The Embedded Rust Book](https://doc.rust-lang.org/stable/embedded-book)
- [The Rust Performance Book](https://nnethercote.github.io/perf-book)
- [The Rust Programming Language, 2nd Edition](https://nostarch.com/rust-programming-language-2nd-edition)
- [The Rust Rand Book](https://rust-random.github.io/book)
- [Zero To Production In Rust](https://www.zero2prod.com)

##### Courses
- [Rust in Motion](https://www.manning.com/livevideo/rust-in-motion)
- [Rustlings](https://github.com/rust-lang/rustlings)

##### Libraries
- [`faer`](https://github.com/sarah-ek/faer-rs): A collection of crates that implement low level linear algebra routines in pure Rust
- [Kanal](https://github.com/fereidani/kanal): Fastest sync and async channel that Rust deserves
- [`log`](https://docs.rs/log/latest/log): A lightweight logging facade
- [`nom`](https://github.com/Geal/nom): Rust parser combinator framework
- [Serde](https://serde.rs): A framework for serializing and deserializing Rust data structures efficiently and generically ⭐
- [Tokio](https://tokio.rs): An asynchronous runtime for the Rust programming language ⭐
- [Yew](https://yew.rs): A modern Rust framework for creating multi-threaded front-end web apps using WebAssembly

##### News
- [Awesome Rust Weekly](https://rust.libhunt.com/newsletter)
- [Inside Rust Blog](https://blog.rust-lang.org/inside-rust)
- [Rust Blog](https://blog.rust-lang.org) ⭐
- [This Week in Rust](https://this-week-in-rust.org) ⭐

##### Podcasts
- [The Rustacean Station Podcast](https://rustacean-station.org) ⭐

##### Sites
- [Are we (I)DE yet?](https://areweideyet.com)
- [Are we game yet](https://arewegameyet.rs)
- [Are we learning yet?](https://www.arewelearningyet.com)
- [Are we stack-efficient yet?](https://arewestackefficientyet.com)
- [Are we web yet?](https://www.arewewebyet.org)
- [Blessed](https://blessed.rs/crates): An unofficial guide to the Rust ecosystem
- [Design Patterns in Rust](https://refactoring.guru/design-patterns/rust) ⭐
- [Rust Academy](https://rust-academy.com)
- [Rust Language Cheat Sheet](https://cheats.rs) ⭐
- [Rust Magazine](https://rustmagazine.github.io)
- [Rust Quiz](https://dtolnay.github.io/rust-quiz)
- [RustRepo](https://rustrepo.com)
- [School of Rust](https://rust-school.io)

##### Tools
- [`cargo-c`](https://github.com/lu-zero/cargo-c): Build and install C-compatible libraries
- [`cargo-careful`](https://www.ralfj.de/blog/2022/09/26/cargo-careful.html): Run your Rust code with extra careful debug checking
- [Prusti](https://github.com/viperproject/prusti-dev): A static verifier for Rust, based on the Viper verification infrastructure
- [Rudra](https://github.com/sslab-gatech/Rudra): Rust Memory Safety & Undefined Behavior Detection

#### Resources

##### Text
- [A curated list of Rust code and resources](https://github.com/rust-unofficial/awesome-rust) ⭐
- [Awesome Rust Books](https://github.com/sger/RustBooks) ⭐
- [How to minimize Rust binary size](https://github.com/johnthagen/min-sized-rust) ⭐
- [Idiomatic Rust](https://github.com/mre/idiomatic-rust) ⭐
- [Learn X in Y minutes where X = Rust](https://learnxinyminutes.com/docs/rust) ⭐
- [Not-Yet-Awesome Rust](https://github.com/not-yet-awesome-rust/not-yet-awesome-rust)
- [2023] [Is coding in Rust as bad as in C++?](https://quick-lint-js.com/blog/cpp-vs-rust-build-times) ⭐
- [2022] [34 Must Know Terms for Embedded Rust Newbies](https://apollolabsblog.hashnode.dev/34-must-know-terms-for-embedded-rust-newbies)
- [2022] [6 things you can do with the Cow in Rust](https://dev.to/kgrech/6-things-you-can-do-with-the-cow-in-rust-4l55) ⭐
- [2022] [A Better Way to Borrow in Rust: Stack Tokens](https://lucumr.pocoo.org/2022/11/23/stack-tokens)
- [2022] [A very small Rust binary indeed](https://darkcoding.net/software/a-very-small-rust-binary-indeed)
- [2022] [Basics of asynchronous Rust with Tokio](https://jbarszczewski.com/basics-of-asynchronous-rust-with-tokio)
- [2022] [Comparing Rust supply chain safety tools](https://blog.logrocket.com/comparing-rust-supply-chain-safety-tools)
- [2022] [Hard Mode Rust](https://matklad.github.io//2022/10/06/hard-mode-rust.html)
- [2022] [Practical Parsing in Rust with `nom`](https://naiveai.hashnode.dev/practical-parsing-nom)
- [2022] [Rewriting the Modern Web in Rust](https://implfuture.dev/blog/rewriting-the-modern-web-in-rust)
- [2022] [Ten challenges for Rust](https://www.ncameron.org/blog/ten-challenges-for-rust)
- [2022] [What are Rust’s biggest weaknesses?](https://www.reddit.com/r/rust/comments/yxtjdc/what_are_rusts_biggest_weaknesses)
- [2022] [Why Rust?](https://www.rerun.io/blog/why-rust)
- [2021] [From Python into Rust](https://github.com/rochacbruno/py2rs) ⭐
- [2020] [Revisiting a 'smaller Rust'](https://without.boats/blog/revisiting-a-smaller-rust)
- [2020] [Why Discord is switching from Go to Rust](https://discord.com/blog/why-discord-is-switching-from-go-to-rust) ⭐
- [2019] [Learn Rust the Dangerous Way](https://cliffle.com/p/dangerust)
- [2019] [Notes on a smaller Rust](https://without.boats/blog/notes-on-a-smaller-rust)
- [2019] [Thoughts on Rust after six months](https://127.io/2019/02/22/rust-six-months-later)
- [2016] [Elegant Library APIs in Rust](https://deterministic.space/elegant-apis-in-rust.html)

##### Video
- [No Boilerplate](https://www.youtube.com/channel/UCUMwY9iS8oMyWDYIe6_RmoA) ⭐
- [2022] [Boxes, Heaps, and Stacks](https://www.youtube.com/watch?v=DEE1GKMbtgw)
