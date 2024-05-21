# function nd [DIRECTORY] | creates and moves you into directory [DIRECTORY]
function nd {
    mkdir $1 && cd $1
}

# function qcd [DIRECTORY] | cd without having to type the whole name
function qcd {
    if [[ $# -ne 1 ]]; then
        echo "Usage: qcd <filename>"
        return 1
    fi

    result=($(ls -d -- *$1*))
    if [[ ${#result[@]} -eq 1 ]]; then
        cd $result[1]
    elif [[ ${#result[@]} -gt 1 ]]; then
        echo "Too Many Results 💔 Try Again With More Refined Search" | print -P "%F{yellow}"
    else
        echo "No Results 💔 Maybe you are in the wrong directory?" | print -P "%F{red}"
    fi
}

# function cdown [] | clear the downloads folder completely
function cdown {
    ~/Downloads/
    rm -rf * || echo "No Results" | print -P "%F{red}"
    rm -rf .* || echo "No Results"
}

# function new [FILE_TYPE,PROJECT_NAME] | creates project named PROJECT_NAME of FILE_TYPE
function new {
    local switch=$1
    local module=$2
    cd ~
    cd Documents/Code
    local current="/Users/benjamin/Documents/Code/"$switch
    local goCurrent="/Users/benjamin/Documents/Code/"$switch
    local copyFrom=$current"/DEFAULTS/"

    case $switch in
        go)
            cd $switch
            nd $module
            go mod init $module
        ;;
        cs)
            cd $switch
            mkdir $module
            cd $module
            dotnet new console
            mkdir .vscode
            mv ./*.json .vscode
        ;;
        rs)
            cd $switch
            cargo new $module
            cd $module
        ;;
        zig)
            cd $switch
            mkdir $module
            cd $module
            zig init-exe
        ;;
        cpp | js | ts | py | pl | rb | exs | lua | pkl | kt)
            cd $switch
            mkdir $module
            cd $module
        ;;
        *)
        echo "Unknown switch: $switch"
        return 1
        ;;
    esac
    # Copy Template
    cpd $copyFrom ./

    # Unique Edge Cases
    if [[ $switch == "exs" ]]; then
        cpd $copyFrom ./
        return 1
    fi
}

# function run [FILE_TYPE] | runs any user configured FILE_TYPE
function run {
    if [[ $1 == "cpp" ]]; then
        g++ *.cpp
       ./a.out
    elif [[ $1 == "java" ]]; then
        javac *.java
        java Main
    elif [[ $1 == "rs" ]]; then
        cargo run main.rs
    elif [[ $1 == "cs" ]]; then
        dotnet run Program.cs
    elif [[ $1 == "py" ]]; then
        python3 main.py
    elif [[ $1 == "ts" ]]; then
        bun main.ts
    elif [[ $1 == "js" ]]; then
        bun main.js
    elif [[ $1 == "go" ]]; then
        go run .
    elif [[ $1 == "pl" ]]; then
        perl main.pl
    elif [[ $1 == "rb" ]]; then
        ruby main.rb
    elif [[ $1 == "exs" ]]; then
        elixir main.exs
    elif [[ $1 == "lua" ]]; then
        lua main.lua
    elif [[ $1 == "zig" ]]; then
        zig build run
    elif [[ $1 == "pkl" ]]; then
        pkl eval *.pkl
    elif [[ $1 == "kt" ]]; then
        kotlinc main.kt && kotlin MainKt
    fi
}

# function icloud [] | changes the current directory to the icloud directory
function icloud {
    "/Users/benjamin/Library/Mobile Documents/com~apple~CloudDocs"
}
