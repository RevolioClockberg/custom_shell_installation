#!/bin/sh


## Package installation
install_cmd = get_installation_cmd()
package_to_install=("bash" "curl" "vim")
for i in "{$package_to_install[@]}"; do
    [[ "$(which $i)" ]] && echo "$i already installed" || $install_cmd $i
done


## Bash configuration
echo "## Export\nset bell-style visible\nexport LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8\nexport GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01\nexport EDITOR=vim" >> ~/.bashrc

## Cargo installation
curl https://sh.rustup.rs -sSf | sh
cargo update

## Starship installation
cargo install starship
starship preset tokyo-night --output ~/.config/starship.toml


## Functions
get_installation_cmd() {
    download_cmd=unknown
    os_type="$(uname -s)"

    if [ "$os_type" = Linux ]; then
        if [ "$(uname -o)" = Android ]; then
            os_type="Android"
        fi
    fi

    case "$os_type" in
        Linux)
            if cat /etc/os-release | grep -q 'archlinux'; then
                [[ "$(which pacman)" ]] && download_cmd='pacman -S' || err "can't find pacman on ArchLinux distro"
                
            fi
            if cat /etc/os-release | grep -q 'debian'; then
                [[ "$(which apt-get)" ]] && download_cmd='apt-get install' || err "can't find apt-get on Debian like distro"
                
            fi
            if cat /etc/os-release | grep -q 'rhel'; then
                [[ "$(which dnf)" ]] && download_cmd='dnf install' || err "can't find dnf on RedHat like distro"
                download_cmd='dnf install'
            fi
            ;;
        
        Darwin)
            [[ "$(which brew)" ]] && download_cmd='brew install' || err "can't find brew on Apple Darwin distro"
            ;;
        
        FreeBSD)
            [[ "$(which pkg)" ]] && download_cmd='pkg install' || err "can't find pkg on BSD distro"
            ;;
        
        *)
            err "unrecognized OS: $os_type"
            ;;
    esac

    return $download_cmd
}
