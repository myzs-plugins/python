# shellcheck disable=SC1090,SC2148

_myzs:internal:module:initial "$0"

if _myzs:internal:checker:command-exist "conda"; then
  __base_conda="/usr/local/Caskroom/miniconda/base"
  __conda_bin="$__base_conda/bin"

  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$($__conda_bin/conda 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    __conda_script="$__base_conda/etc/profile.d/conda.sh"
    if _myzs:internal:checker:file-exist "$__conda_script"; then
      _myzs:internal:load "conda profile" "$__conda_script"
    else
      _myzs:internal:path-append "$__conda_bin"
    fi
  fi

  unset __conda_setup __conda_script __conda_bin __base_conda
  # <<< conda initialize <<<
fi
