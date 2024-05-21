# function ffw [WORD] | returns files that contain [WORD]
function ffw {
    find . -type f -exec grep -l $1 {} \;
}

# function gp [PORT] | returns the pids using [PORT]
function gp {
    echo
    lsof -i tcp:$1 | awk {'print $1"  "$2"  "$3'} | column -t
    echo
}

# function kpid [PID] | kills the [PID] and reinstates the port
function kpid {
    kill -9 $1
}



# function sa [ALIAS] | returns [ALIAS] and its signature if found in search 
function sa {
    echo
    FOUND=false
    grep "# alias \<$1\>" ~/dotfiles/.zsh/aliases.zsh | while read -r line ; do
            line=(${(s/# /)line})
            FOUND=true
            hook=${arr[1]}
            name=(${(@s/alias /)hook})
            ali=${name[1]}
            FOUND=true
            arr=(${(@s/|/)line})
            linked=${arr[2]}
            description=${arr[3]}
    done

    if [[ $FOUND = false ]]
    then
        printf '\033[38;5;117m%s \033[38;5;247m~ \033[38;5;196m%s\033[38;5;253m%s\n' "$1" "is not defined" " as a user alias"
    else
        printf '\033[38;5;247m\033[38;5;117m%s\033[38;5;149m%s \033[38;5;249m-> \033[38;5;104m%s\n' "$ali: " "$linked" "$description"
    fi
    echo
}

# function ga [] | returns all the user defined aliases
function ga {
    echo
    print -P "User Defined Aliases\n%F{250}---------------------------------------------------------------"
    FOUND=false
    I=0
    
    grep "# alias " ~/dotfiles/.zsh/aliases.zsh | while read -r line ; do
        line=(${(s/# /)line})
        FOUND=true
        arr=(${(@s/|/)line})
        hook=${arr[1]}
        name=(${(@s/alias /)hook})
        ali=${name[1]}
        FOUND=true
        arr=(${(@s/|/)line})
        linked=${arr[2]}
        description=${arr[3]}
        printf '\033[38;5;247m* \033[38;5;117m%s\033[38;5;247m: \033[38;5;149m%s \033[38;5;247m-> \033[38;5;104m%s\n' "$ali" "$linked" "$description"
    done

    if [[ $FOUND = false ]]
    then
        printf '\033[38;5;247m%s\033[38;5;196m%s\033[38;5;149m%s\n' "There are " "NO" " user defined aliases" 
    fi
    print -P "%F{250}---------------------------------------------------------------"
    echo
}

# function sf [FUNCTION] | returns [FUNCTION] and its signature if found in search 
function sf {
    echo
    FOUND=false
    for file in $(find ~/dotfiles/.zsh/functions -type f) ; do
        I=0
        grep "# function \<$1\> " $file  -A 2 | while read -r line ; do
            if [[ $I -eq 0 ]] ;
            then
                FOUND=true
                line=(${(s/#/)line})
                arr=(${(@s/|/)line})

                functionSignature=${arr[1]}
                description=${arr[2]}
                parts=(${(@s/ /)functionSignature})
                # echo $parts
                command=${parts[2]}
                param=${parts[3]}
                FOUND=true
                coolPath=(${(s/benjamin/)file})
                cool=${coolPath[2]}
                printf '\033[38;5;247m%s\033[38;5;248m%s\033[38;5;219m~%s\033[38;5;247m\n' "" "" "$cool"
                print -P "%F{247}-----------------------------"
                printf '\033[38;5;247m\033[38;5;117m%s \033[38;5;149m%s \033[38;5;247m->\033[38;5;104m%s\n' "$command" "$param" "$description"
            fi
            I=$((I+1))
        done
    done

    if [[ $FOUND = false ]]
    then

        printf '\033[38;5;117m%s \033[38;5;247m~ \033[38;5;196m%s\033[38;5;253m%s\n' "$1" "is not defined" " as a user function"
    fi
    echo
}

# function gf [] | returns all user defined functions and their descriptions
function gf {
    echo
    print -P "User Defined Functions\n%F{247}---------------------------------------------------------------"
    FOUND=false
    
    for file in $(find ~/dotfiles/.zsh/functions -type f) ; do
        grep "# function " $file | while read -r line ; do
            if [[ "$line" == *"grep"* ]]; then
                # Do nothing
            else
                FOUND=true
                line=(${(s/#/)line})
                arr=(${(@s/|/)line})

                functionSignature=${arr[1]}
                description=${arr[2]}
                parts=(${(@s/ /)functionSignature})
                # echo $parts
                command=${parts[2]}
                param=${parts[3]}
                FOUND=true
                coolPath=(${(s/benjamin/)file})
                cool=${coolPath[2]}
                printf '\033[38;5;249m* \033[38;5;117m%s \033[38;5;149m%s \033[38;5;249m->\033[38;5;104m%s\033[38;5;247m | \033[38;5;249m%s\n' "$command" "$param" "$description" "~$cool"
            fi
        done
    done

    if [[ $FOUND = false ]]
    then
        printf '\033[38;5;250m%s\033[38;5;196m%s\033[38;5;250m%s\n' "There are " "NO" " user defined functions" 
    fi
    print -P "%F{247}---------------------------------------------------------------"
    echo
}

# function ge [] | returns all user defined functions and alias
function ge {
    ga && gf
}

# function se [ALIAS/FUNCTION] | returns if [ALIAS/FUNCTION] is already defined
function se {
    sa $1 && sf $1
}

# function euf [FUNCTION] | opens vscode to specified [FUNCTION]
function euf {

    for file in $(find ~/dotfiles/.zsh/functions -type f) ; do
        line="$(grep "\<function $1\>" $file -nHo)"
        arr=(${(@s/:/)line})
        file=${arr[1]}
        line_number=${arr[2]}
        if [[ $line_number -gt 0 ]]
        then
            nvim +$line_number $file
        fi
    done
}
