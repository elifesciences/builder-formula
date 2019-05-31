{% set user = pillar.elife.deploy_user.username %}

builder repo:
    git.latest:
        - user: {{ user }}
        - name: https://github.com/elifesciences/builder
        - target: /home/{{ user }}/builder
        - unless:
            # once cloned, you're in charge of pulling updates
            - test -d /home/{{ user }}/builder

{% set vault_version = '0.11.0' %}
{% set vault_hash = 'ca9316e4864a9585f7c6507e38568053' %}
{% set vault_archive = 'vault_' + vault_version + '_linux_amd64.zip' %}
vault-binary:
    file.managed:
        - name: /root/{{ vault_archive }}
        - source: https://releases.hashicorp.com/vault/{{ vault_version }}/{{ vault_archive }}
        - source_hash: md5={{ vault_hash }}

    archive.extracted:
        - name: /opt/vault/
        - source: /root/{{ vault_archive }}
        - enforce_toplevel: False
        - require:
            - file: vault-binary

vault-symlink:
    file.symlink:
        - name: /usr/local/bin/vault
        - target: /opt/vault/vault
        - require:
            - vault-binary

terraform binary:
    file.managed:
        - name: /root/terraform-0.11.14.zip
        - source: https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
        - source_hash: c0451cb56abe5b1565fdf1d65950b566

    archive.extracted:
        - name: /opt/terraform/
        - source: /root/terraform-0.11.14.zip
        - enforce_toplevel: False
        - require:
            - file: terraform binary

terraform symlink:
    file.symlink:
        - name: /usr/local/bin/terraform
        - target: /opt/terraform/terraform
        - require:
            - terraform binary

configure builder:
    cmd.run:
        - cwd: /home/{{ user }}/builder
        - user: {{ user }}
        - name: ./update.sh --exclude virtualbox vagrant ssh-agent
        - require:
            - terraform symlink
            - vault-symlink
            - builder repo
