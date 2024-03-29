source /etc/profile

# Go
export GOPATH="$HOME/go"

export PATH="$PATH:$GOPATH/bin"

# Arduino
export ARDUINO_DIR="/usr/share/arduino"

# Android
export ANDROID_HOME=$HOME/opt/android
export PATH=$PATH:$HOME/opt/android/tools
export PATH=$PATH:$HOME/opt/android/platform-tools

# Home bin directory
export PATH="$PATH:$HOME/.bin"

# Local bin path
export PATH="$PATH:$HOME/.local/bin"

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="./node_modules/.bin:$PATH"
