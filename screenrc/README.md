Notes
-----

You have a machine (let's call it `A`), and you want to ssh to
machine `B`.

* put `a/.screenrc` to your home folder on machine `A`
* put `b/.screenrc` to your home folder on machine `B`

On both machines, add the content of `bashrc` to the end
of your `~/.bashrc` file (otherwise I had problems with
`screen`).

On machine `A`, use this command to ssh to machine `B`:

```
screen -t TITLE ssh -t USERNAME@HOST screen
```

It will launch `screen` on both machines. `TITLE` is the name
of the `screen` session, `USERNAME@HOST` is used for ssh.
