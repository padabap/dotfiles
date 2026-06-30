# Joyce's macOS Setup

How I set up a new macOS. 

## Install [Homebrew](https://brew.sh)

Paste this into the macOS Terminal:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install my apps

1. Prefer using homebrew for app installation when possible

```
# GUI Applications
brew install --cask sublime-text         # text editor
brew install --cask 1password            # password manager
brew install --cask 1password-cli        
brew install --cask iterm2               # terminal emulator
brew install --cask alfred               # keyboard-driven productivity application
brew install --cask rectangle            # window management application
brew install --cask google-chrome        # browser
brew install --cask dropbox              # cloud-based file storage
brew install --cask mark-text            # markdown editor
brew install --cask spotify              # audio streaming platform

# Command-Line Tools
brew install git                         # version control
brew install jq                          # JSON processor
brew install zsh                         # extended and upgraded version of Bash
brew install ffmpeg                      # audio and video file manipulator
brew install bat                         # feature-rich version of cat
```

2. Install [Tailscale](https://tailscale.com) by downloading the official masOS app from its website. The GUI is not available via Homebrew and I prefer it to the CLI.

## Install and configure [Oh My Zsh](https://ohmyz.sh)

1. Do the installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Clone the plugins I use

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete;

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Setup configuration files

My dotfiles (and other files that helps me set up a clean install of MacOS).

1. Copy configuration files

You can copy/paste the files you want individually, or to copy everything, run the following code block. 

**Warning:** This code block may overwrite your existing files!

```bash
# Copies over all the cloned files except the ones specifically excluded to your home directory.
rsync --exclude ".git" \
  --exclude ".DS_Store" \
  --exclude "README.md" \
  --exclude "LICENSE" \
  --exclude "alias.zsh" \
  --exclude "mac-preferences.sh" \
  --exclude "iterm2_profiles.json" \
  -avh --no-perms ./ ~;
# Copies over alias.zsh file to your $ZSH_CUSTOM directory. This works only if you use Oh My Zsh.
cp alias.zsh $ZSH_CUSTOM/alias.zsh
# Copies over iterm2_profiles.json as a dynamic profile
cp ./iterm2_profiles.json ~/Library/Application\ Support/iTerm2/DynamicProfiles
```

2. I set my preferred MacOS preferences programatically via `mac-preferences.sh`. To use the script, you can run the following:

```bash
chmod u+x mac-preferences.sh
./mac-preferences.sh
```

3. `.gitconfig.local` needs to be updated with an actual name and email.

### Forking

If you want to fork my dotfiles as a starting point to creating your own, I suggest setting up symbolic links to the files in your repo so you don't have to keep copying them back/forth into your home directory as you update them. You can do so with something similar to this:

```bash
# Symbolically link setting/preferences files to the ones in your repo
ln -sv ../dotfiles/.gitignore ~
ln -sv ../dotfiles/.zshrc ~
ln -sv ../dotfiles/alias.zsh $ZSH_CUSTOM
```

### Files

A list of the files and their usages:

- `.gitconfig`: Aliases and other preferences for git
- `.gitconfig.local`: User name and email for git
- `.gitignore`: A global ignore list of all files to exclude from git commits
- `.zshrc`: configuration file for Zsh, my preferred shell. 
- `alias.zsh`: Some alises I use. These could go in the `.zshrc` file, but I keep it separate for better readability. Since I use Oh My Zsh, I prefer to put any customizations in the `$ZSH_CUSTOM` directory.
- `mac-preferences.sh`: A shell script to set my preferred MacOS preferences programatically
- `iterm2_profiles.json`: My custom iTerm2 (my preferred Terminal replacement) profiles
  - Customizations for the profile `joycewoo-iterm-default`:
    - Use Solarized Dark theme
    - Use Source Code Pro font size 13
    - Save terminal logs to ~/Desktop/logs folder
    - Add mac keyboard shortcuts:
      - Moving between words: option+left/right
      - Go to start/end of line: cmd+left/right

## App specific setup

Most CLI apps will require logging in. Only apps requiring more detailed setups are included here.

### Alfred

Setup sync via my Dropbox/Alfred folder

### iTerm2

Setup default profile to be my `joycewoo` profile,  from this repo's `iterm2_profiles.json` file. 

1. Open iTerm2's preferences

2. Go to "Profiles"

3. Select joycewoo in the "Profile Name" list

4. Go to "Other Actions" > "Set as Default"


