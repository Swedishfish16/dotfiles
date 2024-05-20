#!/bin/bash
 
DOTFILES_DIR="$HOME/dotfiles"

#Functon to create symbolic links
create_links() {
	
	# .zshrc
	rm -rf "$HOME/.zshrc"
	ln -sfn "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
	echo "Created symbolic link for $HOME/dotfiles/.zshrc at $HOME/.zshrc"

	#.tmux.conf
	rm -rf "$HOME/.tmux.conf"
	ln -sfn "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
	echo "Created symbolic link for $HOME/dotfiles/.tmux.conf at $HOME/.tmux.conf"
	
	# .tmux directory
	rm -rf "$HOME/.tmux"
	ln -sfn "$DOTFILES_DIR/.tmux" "$HOME/.tmux"
	echo "Created symbolic link for $HOME/dotfiles/.tmux.conf at $HOME/.tmux"
	
	# .config directory (for neovim and others)
	rm -rf "$HOME/.config"
	ln -sfn "$DOTFILES_DIR/.config" "$HOME/.config"
	echo "Created symbolic link for $HOME/dotfiles/.tmux.conf at $HOME/.config"

}

#Function to install Zsh
install_zsh() {
	sudo apt install zsh
}

#Function to install Tmux
install_tmux(){
	sudo apt install tmux
}

#Fucntion to install Neovim
install_neovim() {
	#Download neovim AppImage
	wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -P /tmp

	#Make the AppImage executeable
	chmod +x /tmp/nvim.appimage

	#Move the AppImage to a directory in Path
	sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
}

#Install dependencies
install_dependencies() {
	sudo apt update
	sudo apt upgrade
	sudo apt install -y build-essential
	sudo apt install -y clang
	sudo apt install -y fuse
}

#Main function
main() {
	echo "Installing dependencies..."
	install_dependencies

	echo "Installing ZSH..."
	install_zsh

	echo "Installing Tmux..."
	install_tmux
	
	echo "Installing Neovim..."
	install_neovim

	echo "Creating symbolic links for configuration..."
	create_links

	echo "Setup complete."
}

#Run main function
main

