dotfiles
========
My $HOME.  Probably of no use to anyone else but this works for me.  I tried OMZ and zprezto but I guess I'm too much of a crusty unix guy b/c I just like my old stuff.

USB ssh stick
1 format your usb stick (ext2fs is a good for linux/bsd, for mac use Mac OSX Journaled Case Sensitive)
2 set /etc/fstab properly 
3 Create the ssh-key
```
  ssh-keygen -t rsa -b 2048 -C "youremail@something.com" -f /path/to/usb
```
5 Give it a password too :^)

Now you have a usb key that contains your ssh key.  What can you do with this?
You can setup ssh to use it.
```
$ cat $HOME/.ssh/config
Host baba
  HostName something.com
  Port 22
  User fooey
$ ssh baba
```

For one, you can set up github to use it.
* Copy the public key into your clipboard (xclip helps or pbcopy for mac)
* Paste the public key into your github user's list of keys
* Edit any .git/config for any repos you checked out over https and change that url to use the git@github.com one.
* Edit $HOME/.ssh/config
```
Host github.com
  IdentityFile /path/to/usb/id_rsa
```


