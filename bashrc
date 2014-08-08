# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Language support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# User specific aliases and functions
   if [ "x$DISPLAY" == "x" ]
   then
       function tvim(){ tmux new-session "vim $@" ; }
   else
       function tvim(){ tmux -2 new-session "TERM=screen-256color vim $@" ; }
   fi

#Submission
alias psub="qsub -b y -V -cwd -pe smp"
alias nsub="qsub -V -cwd -b y"
#ArrayJob
alias rasengansub="qsub -b y -cwd -V -t 1-200 -tc 20 /export2/home/uesu/local/bin/rasengan"

alias remove="rm -i"
alias lsa="ls -alh"

#NUS HPC GPU cluster
alias gpugold="ssh -Y a0046510@172.25.192.196"

#Private GPU cluster
alias anqigpu="ssh -Y uesu@172.18.53.108"
#then ssh -Y cfagpu

alias cancer="ssh wesley@cancer.bic.nus.edu.sg"
alias mercury="ssh mercury.bic.nus.edu.sg"

#PDF conversion tools
alias pdfc="gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combined.pdf -dBATCH *.pdf"
alias pdf2jpg="for file in *.pdf; do convert -verbose -colorspace RGB -interlace none -density 300x300 -quality 100 \$file ${file%%pdf}jpg; done"

#TMUX
alias attach="tmux attach"

alias rsync2cancer="rsync -aHP /export2/home/uesu/cancer/wesley/ wesley@cancer.bic.nus.edu.sg:/home/wesley/"

#MEGAN 
alias MEGANCMD="xvfb-run -a /export2/home/uesu/megan/MEGAN -g -d -E"

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PERL5LIB=/export2/home/uesu/perl5/lib/perl5
export DIR_4_TCOFFEE="/export2/home/uesu/local/tcoffee/Version_10.00.r1613"

export MAFFT_BINARIES="$DIR_4_TCOFFEE/plugins/linux/"

export CACHE_4_TCOFFEE="/export2/home/uesu/.t_coffee/cache/"

export TMP_4_TCOFFEE="$DIR_4_TCOFFEE/tmp/"

export LOCKDIR_4_TCOFFEE="$DIR_4_TCOFFEE/lck/"

export PERL5LIB="$PERL5LIB:$DIR_4_TCOFFEE/perl"

export EMAIL_4_TCOFFEE="wesley@bic.nus.edu.sg"

export PATH=$DIR_4_TCOFFEE/bin:$PATH



#MARK##################################################
export MARKPATH=$HOME/.marks
function jump { 
        cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
        mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
        rm -i "$MARKPATH/$1"
}
function marks {
        ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
      local curw=${COMP_WORDS[COMP_CWORD]}
        local wordlist=$(find $MARKPATH -type l -printf "%f\n")
          COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
            return 0
}
complete -F _completemarks jump unmark
############################################################
