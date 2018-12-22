alias ..="cd .."
alias -- -="cd -"
alias lsa="ls -al"

alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias arbi="cd ~/arbisoft"
alias work="cd ~/workspace"
alias philu="subl $HOME/philu.sublime-project"
alias ducsd="cd $HOME/arbisoft/ucsd/edx/devstack && workon ucsd"
alias eucsd="cd $HOME/arbisoft/ucsd/edx/edx-platform && workon ucsd"
alias evucsd="cd $HOME/arbisoft/ucsd/events"
alias sucsd="subl $HOME/ucsd.sublime-project"

alias gxi="cd $HOME/gxi && cargo run &"

# Git aliaes
alias checkout="git checkout"
alias clone="git clone"
alias fetch="git fetch"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias branch="git branch"

alias cod4="docker start fervent_kowalevski"

alias test_transformers="paver test_system -t openedx/features/caliper_tracking/tests/tests.py::CaliperTransformationTestCase::test_caliper_transformers --fasttest"
