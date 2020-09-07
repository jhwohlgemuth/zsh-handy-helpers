Oh-my-zsh Handy Helpers Plugin
==============================
> [Aliases](#Aliases) and [helper functions](#Functions) that you can use with [oh-my-zsh](https://ohmyz.sh/)

Installation
------------

```bash
git clone https://github.com/jhwohlgemuth/zsh-handy-helpers.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-handy-helpers
```

Usage
-----

- Add `zsh-handy-helpers` to the plugins array in your `.zshrc` file:

```bash
plugins=(... zsh-handy-helpers)
```

- Open a new terminal or execute `source ~/.zshrc`

Aliases
-------
| Alias | Command    |
| :---  | :---       |
| rf    | `rm -frd`  |

Functions
---------

| Name                               | Command | Tested |
| :---                               | :---    | :---   |
| `clean` **FOLDERNAME**             | Delete FOLDERNAME, create FOLDERNAME, enter FOLDERNAME | yes |
| `create_ssh_key`                   | Create SSH key (with no passphrase) for use with services like GitHub.com | yes |
| `did` **MESSAGE** [**TAG**]        | Save **MESSAGE** to `~/did.txt` log | yes |
| `dip` **ID**                       | Get Docker container IP address (can use container name or ID) | yes |
| `dra`                              | Remove all Docker containers | yes |
| `fix_enospc_issue`                 | Fix common issue with [filesystem event watchers](https://man7.org/linux/man-pages/man7/inotify.7.html) | yes |
| `fix_ssh_key_permissions`          | Resolve common permission issue with SSH configuration file | yes |
| `iter` **FUNCTION**                | Higher order function that will apply **FUNCTION** to items in a list | yes |
| `prevent_user` **USERNAME** **$1** | Higher order helper function | yes |
| `prevent_root` **$1**              | Helper function to be used within functions in order to prevent execution as root | yes |
| `qr` **DATA**                      | Create a QR in your terminal with **DATA** (good for passing a URL to your phone) | yes |
| `timestamp`                        | Create a timestamp | yes |


Examples
--------

- Prevent executing a function as root:
```bash
foo()  {
    prevent_root "$0"
    echo "This will only show if not root"
}
```
