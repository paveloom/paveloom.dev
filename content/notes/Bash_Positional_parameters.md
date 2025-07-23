+++
title = "Bash: Positional parameters"
+++

To parse positional parameters in Bash, you can use the `getopts` builtin.

It's syntax is `getopts optstring name`, where `optstring` contains the option characters to be recognized. If a character is followed by a colon, the option is expected to have an argument, which should be separated from it by white space. `name` is the name of the variable to put the current option in. The value of an argument is stored in `OPTARG`.

See [`man bash`](https://www.man7.org/linux/man-pages/man1/bash.1.html) for more information.

To add support for long option names, you can make use of the `set` builtin to add a single letter option to the positional parameters if a long option is found. Here's an example of that:

```bash
function handle_args()
{
    for arg in "$@"; do
        shift
        case "$arg" in
        "--debug") set -- "$@" '-d' ;;
        "--help") set -- "$@" '-h' ;;
        "--ignore") set -- "$@" '-i' ;;
        "--name") set -- "$@" '-n' ;;
        "--publish") set -- "$@" '-p' ;;
        *) set -- "$@" "$arg" ;;
        esac
    done

    while getopts ":dhin:p" opt; do
        case $opt in
        d) option_debug_enabled=true ;;
        h)
            echo "$0 usage:"
            echo "    -d, --debug   Enable debug messages"
            echo "    -h, --help    Show the usage message"
            echo "    -i, --ignore  Ignore existing packages"
            echo "    -n, --name    Build the package with this name"
            echo "    -p, --publish Publish the packages"
            exit 0
            ;;
        i) option_ignore_enabled=true ;;
        n) option_package_name="$OPTARG" ;;
        p) option_publish_enabled=true ;;
        *) warn "unknown option $OPTARG" ;;
        esac
    done
}
```
