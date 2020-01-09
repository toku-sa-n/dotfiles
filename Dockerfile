FROM gentoo/portage:latest as portage
FROM gentoo/stage3-amd64:latest
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
RUN emerge-webrsync
RUN useradd -m -s /bin/bash foo
RUN emerge zsh
USER foo
WORKDIR /home/foo/
ADD . ./dotfiles
RUN dotfiles/scripts/link_dotfiles.sh all
RUN dotfiles/scripts/link_download_dir.sh
CMD cd dotfiles && ./test.sh
