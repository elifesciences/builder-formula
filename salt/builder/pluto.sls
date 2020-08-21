# Pluto is a kubernetes management tool
# it reports on deprecated api usage within Helm charts.

install-pluto:
    archive.extracted:
        - name: /usr/share/pluto
        - source: https://github.com/FairwindsOps/pluto/releases/download/v3.4.1/pluto_3.4.1_linux_amd64.tar.gz
        - source_hash: e6172e27ea954fdc7df75d076d496d987816bd9f180cd7829887a17de056466f
        - enforce_toplevel: False

    file.symlink:
        - name: /usr/bin/pluto
        - target: /usr/share/pluto/pluto
