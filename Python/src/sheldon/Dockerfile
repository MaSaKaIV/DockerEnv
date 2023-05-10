FROM masakai54/debian:latest

ARG USERNAME=masakai

# Reinstall packages required by zplug
RUN sudo apt-get update &&\
    sudo apt-get install -y zsh git &&\
    sudo rm -rf /var/lib/apt/lists/*

# copying my custom files
COPY --chown=${USERNAME}:${USERNAME} etc/.zshrc /home/${USERNAME}/.zshrc
COPY --chown=${USERNAME}:${USERNAME} etc/.p10k.zsh /home/${USERNAME}/.p10k.zsh
COPY --chown=${USERNAME}:${USERNAME} etc/MesloLGS_NF_Regular.ttf /home/${USERNAME}/.fonts/MesloLGS_NF_Regular.ttf
# Install sheldon
RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | sudo bash -s -- --repo "rossmacarthur/sheldon" --to /usr/local/bin

SHELL ["/usr/bin/zsh", "-c"]

COPY etc/plugins.toml /home/${USERNAME}/.config/sheldon/plugins.toml
RUN echo "N" | zsh -ic "sheldon init --shell zsh"
RUN zsh -ic "eval \"$(sheldon source)"\"
SHELL ["/usr/bin/zsh", "-c"]

ENV SHELL="/usr/bin/zsh"
CMD ["/usr/bin/zsh"]