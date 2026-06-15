# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -o interactive ]] || return

typeset -a zshrc_modules=(
  envvar
  zimrc
  completion
  setopt
  bindkey
  alias
  distro_spec
  autojump
  chpwd
  highlight
)

for f in "${zshrc_modules[@]}"; do
  [[ -r "$HOME/.zshrc.d/$f.zsh" ]] && source "$HOME/.zshrc.d/$f.zsh"
done
unset f zshrc_modules

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
