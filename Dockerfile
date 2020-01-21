FROM gentoo/portage:latest as portage
FROM gentoo/stage3-amd64:latest
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
RUN emerge-webrsync
RUN useradd -m -s /bin/bash foo
RUN echo "ACCEPT_KEYWORDS=\"~amd64\"" >> /etc/portage/make.conf
RUN MAKEOPTS="-j$(($(nproc)+1))" emerge app-shells/zsh dev-vcs/git sys-kernel/gentoo-sources
USER foo
WORKDIR /home/foo/
ADD . ./dotfiles
RUN dotfiles/scripts/link_dotfiles.sh all
RUN dotfiles/scripts/link_download_dir.sh
RUN dotfiles/scripts/git_setting.sh
USER root
RUN /home/hiroki/foo/dotfiles/scripts/update_kernel.sh
USER foo
WORKDIR /home/foo
CMD cd dotfiles && ./test.sh
