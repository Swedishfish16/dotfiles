#!/bin/bash
 

#Functon to create symbolic links
create_links() {
	
	# .zshrc
	ln -sfn "~/dotfiles/.zshrc" "~/.zshrc"
	echo "Created symbolic link for $HOME/dotfiles/.zshrc at $HOME/.zshrc"

	#.tmux.conf
	ln -sfn "~/dotfiles/.tmux.conf" "~/.tmux.conf"
	echo "Created symbolic link for $HOME/dotfiles/.tmux.conf at $HOME/.tmux.conf"
	
	# .tmux directory
	ln -sfn "~/dotfiles/.tmux" "~/.tmux"
	echo "Created symbolic link for $HOME/dotfiles/.tmux.conf at $HOME/.tmux"
	
	# .config directory (for neovim and others)
	ln -sfn "~/dotfiles/.config" "~/.config"
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
	sudo apt install -y fuse
	# Add other dependencies here
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

