# zsh-git-url

## Usage

### Example

convert git url to a http url

```sh
>>> git-url git@github.com/xxx/xxx.git
http://github.com/xxx/xxx
```

or enter a git repo

```sh
>>> git remote -v
origin git@github.com/xxx/xxx.git (fetch)
origin git@github.com/xxx/xxx.git (push)
>>> git-url
http://github.com/xxx/xxx
```

## Installation

### Oh My Zsh

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/xueyuelei/zsh-git-url ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-git-url
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

    ```sh
    plugins=( 
        # other plugins...
        zsh-git-url
    )
    ```

3. Start a new terminal session.

### Manual (Git Clone)

1. Clone this repository somewhere on your machine. This guide will assume `~/.zsh/zsh-git-url`.

    ```sh
    git clone https://github.com/zsh-users/zsh-git-url ~/.zsh/zsh-git-url
    ```

2. Add the following to your `.zshrc`:

    ```sh
    source ~/.zsh/zsh-git-url/zsh-git-url.plugin.zsh
    ```

3. Start a new terminal session.
