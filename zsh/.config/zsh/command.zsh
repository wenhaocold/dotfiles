
# commands for cpolar
if command -v cpolar >/dev/null; then
    cpolar-ssh ()
    {
        cpolar tcp 22 -remote-addr=1.tcp.cpolar.cn:24737
    }

    cpolar-proxy ()
    {
        cpolar tcp 7890 -remote-addr=1.tcp.vip.cpolar.top:10327
    }

    cpolar-vnc ()
    {
        cpolar tcp 5901 -remote-addr=1.tcp.cpolar.cn:22252
    }
fi

if command -v lazygit >/dev/null && [[ -n $DOTFILE_PATH ]]; then
    lgdot ()
    {
        lazygit -p $DOTFILE_PATH
    }
fi
