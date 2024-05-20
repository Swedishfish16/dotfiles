#!/bin/bash


#Define array of configurations and their corresponding symbolic link targets
configurations=(
	"$HOME/dotfiles/.zshrc:$HOME/.zshrc"
	"$HOME/.tmux:$HOME/.tmux"
	"$HOME/.tmux.conf:$HOME/.tmux.conf"
	"$HOME/.bashrc:$HOME/.bashrc"
	"$HOME/.config:$HOME/.config"
	"$HOME/.vimrc:$HOME/.vimrc"
) 

#Functon to create symbolic links
create_links() {
	for config in "${configurations[@]}"; do
		#split config and link target using:
		IFS=':' read -ra parts <<< "$config"
		config_file="${parts[0]}"
		config_target="${parts[1]}"

		#Create symlink
		ln -s "$config_file" "$link_target"

		#Print message
		echo "Created symbolic link for $config_file at $link_target"
	done
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

