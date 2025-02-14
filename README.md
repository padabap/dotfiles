# Joyce's dotfiles
My dotfiles (and other files that helps me set up a clean install of MacOS).

## Installation 

Feel free to use my defaults/prefered settings, but do read through them first to remove things you don't want. 

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

I set my preferred MacOS preferences programatically via `mac-preferences.sh`. To use the script, you can run the following:

```bash
chmod u+x mac-preferences.sh
./mac-preferences.sh
```

## Forking

If you want to fork my dotfiles as a starting point to creating your own, I suggest setting up symbolic links to the files in your repo so you don't have to keep copying them back/forth into your home directory as you update them. You can do so with something similar to this:

```bash
# Symbolically link setting/preferences files to the ones in your repo
ln -sv ../dotfiles/.gitignore ~
ln -sv ../dotfiles/.zshrc ~
ln -sv ../dotfiles/alias.zsh $ZSH_CUSTOM
```

## Files

A list of the files and their usages:

- `.gitconfig`: Aliases and other preferences for git
- `.gitconfig.local`: User name and email for git. Update with your own information.
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
