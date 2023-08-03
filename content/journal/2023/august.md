# August 2023

### Thursday, 3 {#3}

#### [Kirk](../../git.md#kirk) {#3#kirk}

Found out what was causing the issue: I had to switch from the [`g_input_stream_read_all_async`](https://docs.gtk.org/gio/method.InputStream.read_all_async.html) function to the [`g_input_stream_read_async`](https://docs.gtk.org/gio/method.InputStream.read_async.html) function. Seems like it was trying to read it all and failing for some reason until the timeout.

Got the authentication working! Added a simple light bulb that changes color to indicate the success of the verification.

#### Time tracking {#3#time-tracking}

- Today [06:55:15]
    - Producing [04:23:48]
        - Software engineering [04:23:48]
            - [Kirk](../../git.md#kirk) [04:23:48]
    - Consuming [02:31:27]
        - Reading [01:44:43]
            - [1991] [Objectivism: The Philosophy of Ayn Rand](https://en.wikipedia.org/wiki/Objectivism:_The_Philosophy_of_Ayn_Rand) [01:44:43]
        - Research [00:46:44]
            - [The Monthly method](https://monthlymethod.com) and their resources [00:46:44]

### Wednesday, 2 {#2}

#### [Kirk](../../git.md#kirk) {#2#kirk}

Figured out how to wrap a chain of asynchronous operations into a new asynchronous operation and pass data in between using [`GTask`](https://docs.gtk.org/gio/class.Task.html). Wrote a lot of asynchronous functions for logging in [Qobuz](https://www.qobuz.com). By the end of the day I was able to get a response! Albeit, sometimes I get it, and sometimes I don't. I think this might be related to a socket not being closed, I once had a similar issue with [`mini-database-server-in-zig`](../../git.md#mini-database-server-in-zig), but never found out why Linux be like that.

#### Time tracking {#2#time-tracking}

- Today [06:06:43]
    - Producing [05:01:39]
        - Software engineering [05:01:39]
            - [Kirk](../../git.md#kirk) [05:01:39]
    - Consuming [01:05:04]
        - Research [01:05:04]
            - Quantifying time investment [01:05:04]
                - [2021] [My year in data](https://samplesize.one/blog/posts/my_year_in_data)
                - [2017] [Time Well Spent](https://putanumonit.com/2017/05/09/time-well-spent)

### Tuesday, 1 {#1}

#### [Kirk](../../git.md#kirk) {#1#kirk}

Was working on making the "Verify credentials" button work. Really struggling with figuring out how to do a proper composition of asynchronous tasks. I don't quite understand the examples in the [`GTask`](https://docs.gtk.org/gio/class.Task.html)'s documentation.

#### Time tracking {#1#time-tracking}

- Today [07:31:58]
    - Producing [05:05:27]
        - Software engineering [05:05:27]
            - [Kirk](../../git.md#kirk) [05:05:27]
    - Consuming [02:26:31]
        - Reading [01:05:30]
            - [1991] [Objectivism: The Philosophy of Ayn Rand](https://en.wikipedia.org/wiki/Objectivism:_The_Philosophy_of_Ayn_Rand) [01:05:30]
        - Research [01:21:01]
            - Debugging [Nix](https://nixos.org) closure sizes [01:21:01]
                - [2022] [NixCon 2022: Debugging Closure Sizes Graphically with nix-closure-graph](https://jade.fyi/nixcon2022)
