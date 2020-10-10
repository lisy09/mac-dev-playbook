#!/usr/bin/env bash

REPO_DIR=~/develop/repo
if [[ ! -e $REPO_DIR ]]; then
    mkdir -p $REPO_DIR
fi

# setup fortune
FORTUNES_DIR=$REPO_DIR/fortunes
git clone https://github.com/ruanyf/fortunes.git $FORTUNES_DIR
strfile $FORTUNES_DIR/data/fortunes
strfile $FORTUNES_DIR/data/chinese
strfile $FORTUNES_DIR/data/tang300
strfile $FORTUNES_DIR/data/song100
strfile $FORTUNES_DIR/data/diet
mv $FORTUNES_DIR/data/* /usr/local/share/games/fortunes/
rm -rf $FORTUNES_DIR

# setup pokemonsay
POKEMONSAY_DIR=$REPO_DIR/pokemonsay 
git clone -b unicode http://github.com/possatti/pokemonsay $POKEMONSAY_DIR
cd $POKEMONSAY_DIR
./install.sh
mv ~/bin/pokemonsay /usr/local/bin/
mv ~/bin/pokemonthink /usr/local/bin/

# add fish to shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher add oh-my-fish/theme-bobthefish
fisher add jethrokuan/fzf