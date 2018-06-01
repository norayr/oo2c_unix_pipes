It is very Unixy to use pipes in your application. Pipes are very handy when you create separate console and graphical applications, or even when you need to call one console application from other and get it's output to parse.
However Oberon programmers may have difficulties using this option simply because there were no library which exports functions for using pipes.

This example illustrates how to prepare stdio.h Oberon binding by using H2O and how to use pipe functions like popen() in Oberon by using oo2c compiler.

upd: i don't know if it even works, and why did i publish it back then.
i just noticed some mistakes and fixed those. decided to not delete from github yet.
