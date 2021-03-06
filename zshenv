export ZSHENV_LOADED=1
if [[ -d ~/.gem/ruby/ ]] && ls ~/.gem/ruby/ >/dev/null 2>&1; then
	for dir in ~/.gem/ruby/*; do
		if [[ -d $dir/bin ]]; then
			export PATH="$dir/bin:$PATH"
		fi
	done
fi
export PATH=$HOME/bin:/usr/lib/ccache:/opt/cxgames/bin:${PATH}
export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.3/bin/
export PATH=$PATH:$HOME/.local/share/android-sdks/tools:$HOME/.local/share/android-sdks/platform-tools
if which mvim >/dev/null 2>&1; then
	export EDITOR="mvim -f"
else
	export EDITOR="vim"
fi
export LESS="--ignore-case -R"
export DEBFULLNAME="Abhishek Mukherjee"
which vimmanpager > /dev/null 2>&1 && export MANPAGER="vimmanpager"
which vimpager >/dev/null 2>&1 && export PAGER="vimpager" && alias less=vimpager && alias zless=vimpager
export DEBEMAIL="linkinpark342@gmail.com"

export CC="gcc"
#CFLAGS_OPTIMIZATIONS="-march=core2 -pipe"
#CFLAGS_WARNINGS="-Wall -Wextra -Wmissing-declarations -Wunsafe-loop-optimizations -Wwrite-strings"
#CFLAGS_FEATURES="-fopenmp"
#CFLAGS_OTHERS=""
#export CFLAGS="${CFLAGS_OPTIMIZATIONS} ${CFLAGS_WARNINGS} ${CFLAGS_FEATURES} ${CFLAGS_OTHERS}"
#CXXFLAGS_WARNINGS="-Wabi -Wctor-dtor-privacy -Woverloaded-virtual"
#CXXFLAGS_DEFINES="-D_GLIBCXX_PARALLEL"
#CXXFLAGS_OTHERS="-std=c++0x"
#export CXXFLAGS="${CFLAGS} ${CXXFLAGS_WARNINGS} ${CXXFLAGS_DEFINES} ${CXXFLAGS_OTHERS}"
export WANAL="-pedantic -Weffc++"
export PALUDIS_OPTIONS="--log-level warning"
export INQUISITIO_OPTIONS="--log-level warning"
export BROWSER="/usr/bin/google-chrome"
export TZ='America/New_York'
export QEMU_AUDIO_DRV=pa
export PYTHONUSERBASE="$HOME/.local/lib/python2.6/"
export PYTHONPATH="$HOME/.local/lib/python2.6/"
export SDL_AUDIODRIVER="pulse"
export LANG="en_US.UTF-8"
export LOCALE="$LANG"
export HADOOP_HOME=/opt/hadoop
export PATH="$PATH:$HADOOP_HOME/bin"

export CVSROOT=":pserver:webadmin@source.tripadvisor.com:/home/CVS"
export ANT_HOME=/usr/local/ant

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export OSTYPE=linux

should_set_trtop()
{
	local shellpid="$(echo $(ps -o ppid= -p $$))"
	local proc="$(ps -o cmd= -p $shellpid)"
	if [[ $proc == tmux* ]] && [[ $SHLVL -le 2 ]]; then
		return 0
	else
		return 1
	fi
}

if should_set_trtop && [[ -z $TRTOP ]] && [[ -f $HOME/.trtop_env ]]; then
	export TRTOP=$(cat $HOME/.trtop_env)
fi

typeset -a find_directories
[[ -d /lib/terminfo ]] && find_directories+=(/lib/terminfo)
[[ -d /user/share/terminfo ]] && find_directories+=(/user/share/terminfo)

if [[ $TERM != *256* ]] && [[ ${#find_directories} -gt 0 ]]; then
	if find ${find_directories[@]} -name 'xterm-256color' > /dev/null 2>&1; then
		export TERM="xterm-256color"
	fi
fi

if [[ -f $HOME/.zshenv.local ]]; then
	source ~/.zshenv.local
fi
