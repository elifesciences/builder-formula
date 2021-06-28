# Pluto is a kubernetes management tool
# it reports on deprecated api usage within Helm charts.

install-pluto:
    archive.extracted:
        - name: /usr/share/pluto
        - source: https://github.com/FairwindsOps/pluto/releases/download/v3.4.1/pluto_3.4.1_linux_amd64.tar.gz
        - source_hash: aa42314c78f2ad6352266821c5927a548dc0811074ee889b4fcd47085e011a60
        - enforce_toplevel: False

    file.symlink:
        - name: /usr/bin/pluto
        - target: /usr/share/pluto/pluto
