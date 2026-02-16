# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias zotero=/scratch_ssd/ssd_sdb/Software/Zotero_linux-x86_64/zotero
alias vial=/scratch_ssd/ssd_sdb/Software/Vial-v0.7.5-x86_64.AppImage
alias texstudio=/scratch_ssd/ssd_sdb/Software/texstudio-4.0.1-x86_64.AppImage
# alias cryptomator=/scratch_ssd/ssd_sdb/Software/cryptomator-1.15.1-x86_64.AppImage
alias vi=nvim
alias tw=timew

#set PATH for star-ccm
#export PATH=${PATH}:/scratch_ssd/StarCCM/15.04.010-R8/STAR-CCM+15.04.010-R8/star/bin
source ~/.flexlmrc

# bash completion additions
source ~/.bash_completion/timew-bashcompletion/timew
source ~/.bash_completion/_python-argcomplete

# openBLAS Threads
export OPENBLAS_NUM_THREADS=1
# openMPI lib path
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib/:$LD_LIBRARY_PATH
export PATH=/usr/lib64/openmpi/bin/:$PATH

# Adding semtex to path
#SemtexFolder=~/Semtex/Semtex-V9/semtex
#export PATH=$SemtexFolder/utility:$PATH
#export PATH=$SemtexFolder/dns:$PATH
#export PATH=$SemtexFolder/elliptic:$PATH
#export PYTHONPATH=$SemtexFolder/python:$PYTHONPATH
export PATH=~/code/Semtex/semtex4rik/buildtest2:$PATH
alias SEM6='SemtexFolder=~/code/Semtex/Semtex-V6_Non-Newt_Scat/NonNewt/semtex; export PATH=$SemtexFolder/utility:$PATH; export PATH=$SemtexFolder/dns:$PATH; export PATH=$SemtexFolder/elliptic:$PATH'
alias SEM91='SemtexFolder=~/code/Semtex/Semtex-V9/semtex; export PATH=$SemtexFolder/utility:$PATH; export PATH=$SemtexFolder/dns:$PATH; export PATH=$SemtexFolder/elliptic:$PATH'
alias SEMGIT='export PATH=~/code/Semtex/semtex4rik/build:$PATH'

# Adding sview to path
export PATH=~/code/Semtex/sview:$PATH

# Adding python scripts to path
export PATH=~/code/Python/pythonplotutilities/bin:$PATH
export PATH=~/code/Python/semtex-field-utilities/bin:$PATH

# Adding local software to path
export PATH=/scratch_ssd/ssd_sdb/Software/bin:$PATH
#export LD_LIBRARY_PATH=/scratch_ssd/ssd_sdb/Software/lib/:/scratch_ssd/ssd_sdb/Software/lib64/:$LD_LIBRARY_PATH
#alias gcc_exec='export GCC_EXEC_PREFIX=/scratch_ssd/ssd_sdb/Software/usr/local/lib/gcc/'

# Java 21
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-21.0.8.0.9-1.el9.x86_64/
export PATH=$JAVA_HOME/bin:$PATH

#OpenFOAM 6 
#alias of6='source $HOME/OpenFOAM/OpenFOAM-6/etc/bashrc WM_LABEL_SIZE=64 WM_MPLIB=OPENMPI FOAMY_HEX_MESH=yes'

# Paraview
alias paraViewLocal='export PATH=/scratch_ssd/ssd_sdb/Software/ParaView-5.9.1-MPI-Linux-Python3.8-64bit/bin:$PATH; export LD_LIBRARY_PATH=/scratch_ssd/ssd_sdb/Software/ParaView-5.9.1-MPI-Linux-Python3.8-64bit/lib/:$LD_LIBRARY_PATH'
alias pythonPara='export PYTHONPATH=/scratch_ssd/ssd_sdb/Software/ParaView-5.9.1-MPI-Linux-Python3.8-64bit/lib/python3.8/site-packages:$PYTHONPATH'

# TexLive2021
export MANPATH=/scratch_ssd/ssd_sdb/texlive/2021/texmf-dist/doc/man:$MANPATH
export INFOPATH=/scratch_ssd/ssd_sdb/texlive/2021/texmf-dist/doc/info:$INFOPATH
export PATH=/scratch_ssd/ssd_sdb/texlive/2021/bin/x86_64-linux:$PATH

# matlab library
#export LD_PRELOAD=/smsoft/CENTOS-7/MATLAB/R2018b/sys/os/glnxa64/libstdc++.so.6.0.22
export LD_PRELOAD=

# custom pip site-packages; use pip install --install-options="--prefix=~/Software/pip/" ...
export PYTHONPATH=/scratch_ssd/ssd_sdb/Software/pip/lib/python2.7/site-packages/gmsh-4.6.0-Linux64-sdk/bin:/scratch_ssd/ssd_sdb/Software/pip/lib/python2.7/site-packages/gmsh-4.6.0-Linux64-sdk/lib:$PYTHONPATH
export PYTHONPATH=/scratch_ssd/ssd_sdb/Software/pip/lib/python3.6/site-packages:$PYTHONPATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/smsoft/CENTOS-7/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/smsoft/CENTOS-7/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/smsoft/CENTOS-7/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/smsoft/CENTOS-7/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

