FROM debian
COPY . /dotfiles/
WORKDIR /dotfiles/
RUN bash bootstrap.sh
RUN bash copy_dotfiles.sh

