# If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will load a random theme each time Oh My Zsh is loaded, in which case, to know which specific one was 
# loaded, run: echo $RANDOM_THEME See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

#necessary for Wayland (e.g. Rviz2 will not run otherwise)
export QT_QPA_PLATFORM=xcb

# Uncomment the following line to use case-sensitive completion. CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable. 
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior zstyle ':omz:update' mode disabled # disable automatic updates zstyle ':omz:update' mode 
# auto # update automatically without asking zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days). zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up. DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls. DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title. DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction. ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion. You can also set it to another string to have that shown instead of the default 
# red dots. e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f" Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765) 
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, 
# much faster. DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time stamp shown in the history command output. You can set one of the optional three 
# formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format using the strftime function format specifications, see 'man strftime' for details. 
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom? ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? Standard plugins can be found in $ZSH/plugins/ Custom plugins may be added to $ZSH_CUSTOM/plugins/ Example format: 
# plugins=(rails git textmate ruby lighthouse) Add wisely, as too many plugins slow down shell startup.
plugins=(git fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#Sources for Manjaro (Main Distro)
if [[ -f /etc/os-release && "$(grep '^ID=' /etc/os-release)" == "ID=manjaro" ]]; then

    source /usr/local/texlive/2024/bin/x86_64-linux

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/thomas/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/thomas/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/thomas/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/thomas/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

fi

# Sources like ROS which only should be sourced when I am in my Ubuntu distro
if [[ -f /etc/os-release && "$(grep '^ID=' /etc/os-release)" == "ID=ubuntu" ]]; then
    export PATH="$PATH:/opt/nvim/nvim-linux64/bin"
    alias whichRos="echo $ROS_DISTRO" 
    #source /opt/ros/noetic/setup.zsh
    source /opt/ros/humble/setup.zsh
    source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
    export PATH="$PATH:/opt/nvim-linux64/bin"
    source /opt/ros/humble/share/ros2cli/environment/ros2-argcomplete.zsh

    source $HOME/workspaces/unilidar_sdk/unitree_lidar_ros2/install/setup.zsh

fi

alias dots="cd ~/dots" alias fhnotes="nvim ~/Documents/FH_Vault/Vault"

alias eb="vi ~/.zshrc" alias sb="source ~/.zshrc"

eval "$(starship init zsh)"


export ROS_DOMAIN_ID=30 #TURTLEBOT3
export ROS_DOMAIN_ID=30 #TURTLEBOT3
