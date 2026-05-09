# >>> local_install >>> {{{
if [ -d "$HOME/local_install" ]; then
    export LOCAL_INSTALL=$HOME/local_install
    export PATH=$LOCAL_INSTALL/bin:$PATH
    export LD_LIBRARY_PATH=$LOCAL_INSTALL/lib:$LOCAL_INSTALL/lib64:$LD_LIBRARY_PATH
    if [ -d "$HOME/local_install/lib/pkgconfig" ]; then
        export PKG_CONFIG_PATH="$LOCAL_INSTALL/lib/pkgconfig:"$PKG_CONFIG_PATH
    fi
    if [ -d "$HOME/local_install/share/pkgconfig" ]; then
        export PKG_CONFIG_PATH="$LOCAL_INSTALL/share/pkgconfig:"$PKG_CONFIG_PATH
    fi
fi
# }}}

# >>> cross-compile tools >>> {{{
if [ -d "$HOME/local_install/cross-tools" ]; then
    export CROSS_COMPILE_TOOLS=$HOME/local_install/cross-tools
    export PATH=$CROSS_COMPILE_TOOLS/bin:$PATH
fi
# }}}
#
# >>> gdb for m1 mac >>> {{{
if [ -d "$HOME/local_install/gdb-for-m1" ]; then
    export M1_GDB=$HOME/local_install/gdb-for-m1
    export PATH=$M1_GDB/bin:$PATH
fi
# }}}

# >>> cuda >>> {{{
if [ -d "/usr/local/cuda" ]; then
    export CUDA_PATH="/usr/local/cuda"
    export PATH=$CUDA_PATH/bin:$PATH
    export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH
fi
# }}}

# >>> cpptools >>> {{{
if [ -d "$HOME/local_install/download/cpptools" ]; then
    export CPPTOOLS_PATH="$HOME/local_install/download/cpptools"
fi
# }}}

#
if [ -d "$HOME/Qt/6.2.4/gcc_64" ]; then
    export QT_PATH="$HOME/Qt/6.2.4/gcc_64"
    export PATH=$QT_PATH/bin:$PATH
    export LD_LIBRARY_PATH=$QT_PATH/lib:$LD_LIBRARY_PATH
fi

if [ -d "$HOME/.emacs.d/bin" ]; then
    export PATH=$HOME/.emacs.d/bin:$PATH
fi

if [ -d "$HOME/local_install/spark-3.5.3-bin-hadoop3" ]; then
    export SPARK_PATH="$HOME/local_install/spark-3.5.3-bin-hadoop3"
    export PATH=$SPARK_PATH/bin:$PATH
fi

if [ -d "$HOME/.composer/vendor/bin" ]; then
    export COMPOSER_PATH="$HOME/.composer/vendor"
    export PATH=$COMPOSER_PATH/bin:$PATH
fi

# Java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home
# export JAVA_HOME=/usr/local/Cellar/openjdk/24.0.1
export JAVA_HOME=/Users/lengwenhao02/Library/Java/JavaVirtualMachines/corretto-1.8.0_442/Contents/Home
PATH=$JAVA_HOME/bin:$PATH
export M2_HOME=$HOME/dev_kit/apache-maven-3.9.2
PATH=$PATH:$M2_HOME/bin

# Mysql
export MYSQL_HOME=/usr/local/mysql
PATH=$MYSQL_HOME/bin:$PATH
