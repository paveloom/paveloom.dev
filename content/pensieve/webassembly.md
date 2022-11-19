# WebAssembly

WebAssembly (sometimes abbreviated Wasm) defines a portable binary-code format and a corresponding text format for executable programs as well as software interfaces for facilitating interactions between such programs and their host environment.

The main goal of WebAssembly is to enable high-performance applications on web pages, "but it does not make any Web-specific assumptions or provide Web-specific features, so it can be employed in other environments as well." It is an open standard and aims to support any language on any operating system, and in practice all of the most popular languages already have at least some level of support.

Read more on [Wikipedia](https://en.wikipedia.org/wiki/WebAssembly).

#### Sites
- [WebAssembly](https://webassembly.org) ⭐

#### Standards and interfaces
- [Component Model](https://github.com/WebAssembly/component-model)
- [The WebAssembly System Interface (WASI)](https://wasi.dev)
    - [`wasi-nn`](https://github.com/WebAssembly/wasi-nn): Neural Network proposal for WASI
- [WAGI: WebAssembly Gateway Interface](https://github.com/deislabs/wagi)

#### Example modules
- [Wavacity](https://wavacity.com): A free, open source audio editor for the web

#### Runtimes
- [Wasm3](https://github.com/wasm3/wasm3)
- [WasmEdge](https://wasmedge.org)
- [Wasmer](https://wasmer.io)
- [Wasmtime](https://wasmtime.dev)
- [WebAssembly Micro Runtime (WAMR)](https://github.com/bytecodealliance/wasm-micro-runtime)

#### Toolchains
- [Binaryen](https://github.com/WebAssembly/binaryen): Optimizer and compiler/toolchain library for WebAssembly
- [Cranelift](https://github.com/bytecodealliance/wasmtime/blob/main/cranelift/README.md): A low-level retargetable code generator. It translates a target-independent intermediate representation into executable machine code
- [Emscripten](https://emscripten.org): A complete compiler toolchain to WebAssembly, using LLVM, with a special focus on speed, size, and the Web platform
- [Wasienv](https://github.com/wasienv/wasienv): WASI Development Toolchain for C/C++

#### Tools
- [`wasm-pack`](https://github.com/rustwasm/wasm-pack): Rust to Wasm workflow tool

#### Community

##### Forums
- [Wasm Builders](https://www.wasm.builders)

##### Companies and organizations
- [Bytecode Alliance](https://bytecodealliance.org)
- [Fermyon](https://www.fermyon.com)

##### News
- [WebAssembly Weekly](https://wasmweekly.news)

##### Showcase
- [Made with WebAssembly](https://madewithwebassembly.com)

#### Resources

##### Text
- [Wasm By Example](https://wasmbyexample.dev)
- [Wasmer vs. Wasmtime](https://wasmer.io/wasmer-vs-wasmtime)
- [2022] [Avoiding allocations in Rust to shrink Wasm modules](https://nickb.dev/blog/avoiding-allocations-in-rust-to-shrink-wasm-modules) ⭐
- [2022] [Isolates, microVMs, and WebAssembly](https://notes.crmarsh.com/isolates-microvms-and-webassembly)
- [2022] [Performance Comparison between WASM/Yew and JavaScript/React — Part 1](https://medium.com/@0x4ndy/performance-comparison-between-wasm-yew-and-javascript-react-part-1-5accafce6315)
- [2022] [Performance Comparison between WASM/Yew and JavaScript/React — Part 2](https://medium.com/@Lukeish/performance-comparison-between-wasm-yew-and-javascript-react-part-2-200ac2e4e368)
- [2022] [Recommendations when publishing a Wasm library](https://nickb.dev/blog/recommendations-when-publishing-a-wasm-library) ⭐
- [2022] [The Go WebAssembly ABI at a Low Level](https://xeiaso.net/talks/wasm-abi)
- [2022] [The Promise of WASM](https://www.wasm.builders/antweiss/the-promise-of-wasm-58gp)
- [2022] [The WebAssembly Component Model](https://www.fermyon.com/blog/webassembly-component-model)
- [2022] [WebAssembly: The Future Looks Bright](https://chsrbrts.medium.com/webassembly-the-future-looks-bright-6c76a0afc621) ⭐
- [2022] [Why WebAssembly Belongs Outside the Browser](https://www.wasm.builders/thomastaylor312/why-webassembly-belongs-outside-the-browser-331a)
- [2020] [Can WASM become the new Docker?](https://adlrocha.substack.com/p/adlrocha-can-wasm-become-the-new)

##### Video
- [2022] [Rust & Wasm (Safe and fast web development)](https://www.youtube.com/watch?v=P4LMfkFLRsI)
- [2020] [WebAssembly and the Elusive Universal Binary](https://www.youtube.com/watch?v=4ZMY3QE5t9o&t=279s)
