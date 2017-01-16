PATHS=(
  $HOME/bin
  $HOME/.nvm/versions/node/v7.3.0/bin
)

export PATH="$(IFS=:; echo "${PATHS[*]}"):$PATH"
