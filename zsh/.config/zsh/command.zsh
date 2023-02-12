
# commands for cpolar
if command -v cpolar >/dev/null; then
    cpolar-ssh ()
    {
        cpolar tcp 22 -remote-addr=1.tcp.vip.cpolar.top:11022
    }

    # cpolar-proxy ()
    # {
    #     cpolar tcp 7890 -remote-addr=1.tcp.vip.cpolar.top:10327
    # }

    cpolar-vnc ()
    {
        cpolar tcp 5901 -remote-addr=1.tcp.vip.cpolar.top:10168
    }
fi

if command -v lazygit >/dev/null && [[ -n $DOTFILE_PATH ]]; then
    lgdot ()
    {
        lazygit -p $DOTFILE_PATH
    }
fi

vineovim ()
{
    vi $NVIM_CONFIG_PATH
}

vizsh ()
{
    vi $ZSH_CONFIG_PATH
}

LFCD="$HOME/.config/lf/lfcd.sh"  #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
