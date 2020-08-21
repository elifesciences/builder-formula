install-flux:
    file.managed:
        - name: /usr/bin/fluxctl
        - source: https://github.com/fluxcd/flux/releases/download/1.20.2/fluxctl_linux_amd64
        - mode: 0755
        - source_hash: a3ace35ebc5dc96a00c118e1c51eaf4f21a2507affbf79f7418e41b5766bdcc6
