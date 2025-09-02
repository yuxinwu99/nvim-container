# Use the official Arch Linux base image
FROM archlinux:latest

# Install sudo, Neovim, and dev tools
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    neovim \
    curl \
    git \
    ripgrep \
    fd \
    python \
    python-pip \
    nodejs \
    npm \
    unzip \
    base-devel \
    sudo \
    zsh \
    && pacman -Scc --noconfirm

# Create a user and add to sudoers
RUN useradd -m devuser && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to user
USER devuser
WORKDIR /home/devuser

# Copy Neovim config
COPY --chown=devuser:devuser nvim /home/devuser/.config/nvim

# Default command
CMD [ "zsh" ]
