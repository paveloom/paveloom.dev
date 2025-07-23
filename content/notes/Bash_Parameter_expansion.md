+++
title = "Bash: Parameter expansion"
+++

In Bash, the `$` character can be used to introduce parameter expansion.

Here's a brief list of such parameter expansions:

- Use default value: `${parameter:-word}`
- Assign default value: `${parameter:=word}`
- Display error if null or unset: `${parameter:?word}`
- Use alternate value: `${parameter:+word}`
- Substring expansion:
  - `${parameter:offset}`
  - `${parameter:offset:length}`
- Names matching prefix:
  - `${!prefix*}`
  - `${!prefix@}`
- List of array keys:
  - `${!name[@]}`
  - `${!name[*]}`
- Parameter length: `${#parameter}`
- Remove matching prefix pattern:
  - `${parameter#word}`
  - `${parameter##word}`
- Remove matching suffix pattern
  - `${parameter%word}`
  - `${parameter%%word}`
- Pattern substitutions:
  - `${parameter/pattern/string}`
  - `${parameter//pattern/string}`
  - `${parameter/#pattern/string}`
  - `${parameter/%pattern/string}`
- Case modification:
  - `${parameterˆpattern}`
  - `${parameterˆˆpattern}`
  - `${parameter,pattern}`
  - `${parameter,,pattern}`
- Parameter transformation: `${parameter@operator}`
  - `U`: all uppercase
  - `u`: first character uppercase
  - `L`: all lowercase
  - `Q`: quoted for input
  - `E`: expand backslash sequences
  - `P`: prompt string
  - `A`: assignment statement
  - `K`: quoted key-value pairs
  - `a`: parameter's attributes
  - `k`: like `K`, but keys and values are separate words

See [`man bash`](https://www.man7.org/linux/man-pages/man1/bash.1.html) for more information.
