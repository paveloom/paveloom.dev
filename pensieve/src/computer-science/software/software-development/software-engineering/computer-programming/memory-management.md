# Memory management

Memory management is a form of resource management applied to computer memory. The essential requirement of memory management is to provide ways to dynamically allocate portions of memory to programs at their request, and free it for reuse when no longer needed. This is critical to any advanced computer system where more than a single process might be underway at any time.

Read more on [Wikipedia](https://en.wikipedia.org/wiki/Memory_management).

#### Approaches
- [Garbage collection](https://en.wikipedia.org/wiki/Garbage_collection_(computer_science))
  - [Reference counting](https://en.wikipedia.org/wiki/Reference_counting)
  - [Tracing garbage collection](https://en.wikipedia.org/wiki/Tracing_garbage_collection)
- [Manual memory management](https://en.wikipedia.org/wiki/Manual_memory_management)
- [Region-based memory management](https://en.wikipedia.org/wiki/Region-based_memory_management)
- [Stack-based memory allocation](https://en.wikipedia.org/wiki/Stack-based_memory_allocation)

#### Techniques
- [Borrow checker](https://en.wikipedia.org/wiki/Borrow_checker)
- [Resource acquisition is initialization (RAII)](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization)

#### Issues
- [Fragmentation](https://en.wikipedia.org/wiki/Fragmentation_(computing))
- [Memory leak](https://en.wikipedia.org/wiki/Memory_leak)
- [Unreachable memory](https://en.wikipedia.org/wiki/Unreachable_memory)

#### Resources

##### Text
- [2022] [mmap(1Tb): A Rust arena allocator (ab)using Linux overcommit](https://vgel.me/posts/mmap-arena-alloc)
- [2022] [Safety in Non-Memory-Safe Languages](https://verdagon.dev/blog/when-to-use-memory-safe-part-1) ⭐
- [2022] [Untangling Lifetimes: The Arena Allocator](https://www.rfleury.com/p/untangling-lifetimes-the-arena-allocator) ⭐
- [2021] [Arenas in Rust](https://manishearth.github.io/blog/2021/03/15/arenas-in-rust)
- [2019] [Memory Management in Lobster](https://aardappel.github.io/lobster/memory_management.html)

##### Video
- [2022] [Memory safety in C++, Zig, & Rust (Part 1)](https://www.youtube.com/watch?v=qeiRGbYCD-0)
- [2020] [What's a Memory Allocator Anyway?](https://www.youtube.com/watch?v=vHWiDx_l4V0) ⭐
