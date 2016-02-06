PATHS=(
  $HOME/.npm-packages/bin
  /usr/lib/jvm/default/bin
  $HOME/bin
  /usr/bin
)

export PATH="$(IFS=:; echo "${PATHS[*]}"):$PATH"
