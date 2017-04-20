#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

#--- prints all of my process
function _myps() {
  ps -u $USER
}

#--- prints all of my process (detailed)
function _mypsa() {
  ps aux | grep $USER
}

#--- copy template bash code to current directory
function _mybashtemplate() {
  if [ -z $1 ]; then
    echo "ERROR - usage:"
    echo "    _mybashtemplate [FILENAME]"
  else
    cp ~/login/bash/template/bash.sh $1.sh
  fi
}

#--- list items on the right side
rr()
{
  RAWLIST=$(ls -hBX)
  RAWCOLORLIST=$(ls -hBX --color=always)
  NITEMS=$(echo -e "$RAWLIST"| wc -L);

  INDEX=0
  MAXLENGTH=0
  for ITEM in $RAWLIST; do
    LIST[$INDEX]=$ITEM
    INDEX=$((INDEX+1))
    LENGTH=${#ITEM}
    if [ "$LENGTH" -gt "$MAXLENGTH" ]; then
      MAXLENGTH=${LENGTH}
    fi
  done

  INDEX=0
  for ITEM in $RAWCOLORLIST; do
    COLORLIST[$INDEX]=$ITEM
    INDEX=$((INDEX+1))
  done

  for II in $(seq 0 $((${#LIST[@]}-1)) ); do
    ITEM=${LIST[$II]}
    COLORITEM=${COLORLIST[$II]}
    #echo $ITEM
    INDEX=$(echo `expr index "${ITEM}" \.`)
    #echo $COLORITEM
    #echo $INDEX
    SHIFT=$((MAXLENGTH-INDEX))
    echo "$(while ((SHIFT-->0)); do printf " "; done;)"$COLORITEM
  done

  #echo "$COLORLIST" |
  #while read LIST; do
  #  echo 'TEST'$LIST
  #  j=$(((NITEMS-${#COLORLIST})));
  #  echo $j
  #  echo "$(
  #    while ((j-->0)); do
  #      printf " ";
  #    done;
  #  )$LIST";
  #done;
};

#---------------------------------------------------------------------------------------------------------
# below implementation is taken from : http://natelandau.com/my-mac-osx-bash_profile/

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
#alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
#cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
#alias edit='subl'                           # edit:         Opens any file in sublime editor
#alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
#alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
#alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
#alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
#trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
#ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/terminalOut.txt'            # DT:           Pipe content to file on MacOS Desktop

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | grep -v ".svn" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }


#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.tgz.1)     tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   sp

note () {
  if [ "$#" -ne 0 ] || [ "$1" = "-h" ] || [ "$1" = "–help" ]
  then
    echo "Usage: $0" >&2
    return 1
  fi

  # Fill these out with values you like.
  #local tag_string=“draft”

  echo -n "Which notebook would you like to write it to?"
  read notebook

  echo -n "What is the title of the post? "
  read title

  geeknote create \
  --title "${title}" \
  --notebook "${notebook}" \
  --content WRITE
  #--tags "${tag_string}" \
}

noteedit () {
  if [ "$#" -ne 0 ] || [ "$1" = "-h" ] || [ "$1" = "–help" ]
  then
    echo "Usage: $0" >&2
    return 1
  fi

  # Fill these out with values you like.
  #local tag_string=“draft”

  #echo -n "Which notebook would you like to write it to?"
  #read notebook

  echo -n "What is the title of the post? "
  read title

  geeknote edit \
  --note "${title}" \
  --content WRITE
  #--notebook "${notebook}" \
  #--tags "${tag_string}" \
}

qgrep() {
  grep --color -r --include="*.h" --include="*.cxx" --include="*.C" --include="*.py" --include="*.sh" $1 $2
}

gitlog() {
  git log --pretty=oneline | head -n1
}

#eof
