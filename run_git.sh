#!/bin/sh

# Set config user
# -----------------------

echo "[INPUT] git config --global user.name:"
read INPUT_NAME
if [ "$INPUT_NAME" ==  "" ]; then
  echo "ERROR: empty name"
  exit;
fi
# setup git
git config --global user.name $INPUT_NAME 

echo "[INPUT] git config --global user.email:"
read INPUT_EMAIL
if [ "$INPUT_EMAIL" ==  "" ]; then
  echo "ERROR: empty email"
  exit;
fi
# setup git
git config --global user.email $INPUT_EMAIL 

echo "[INFO] generated ~/.gitconfig"


# Set display branch
# -----------------------

curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
mv git-completion.bash ~/.git-completion.bash
mv git-prompt.sh ~/.git-prompt.sh

cat <<EOF >> ~/.bashrc
if [ -f "~/.git-completion.bash" ]; then
  source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
PS1='[\t] \u@\h \$(__git_ps1 "\[\033[32m\]%s\[\033[0m\]")\n\w\$ '
EOF

