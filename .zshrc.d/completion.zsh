if (( $+functions[compdef] ))
then
    autoload -Uz _gradle

    _gradle_wrapper() {
        local service=$words[1]
        _gradle "$@"
    }

    compdef _gradle_wrapper ./gradlew
fi
