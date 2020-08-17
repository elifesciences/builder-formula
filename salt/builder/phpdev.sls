phive:
    cmd.run:
        - runas: elife
        - name: |
            set -e
            wget -O phive.phar https://phar.io/releases/phive.phar
            wget -O phive.phar.asc https://phar.io/releases/phive.phar.asc
            gpg --keyserver pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79
            gpg --verify phive.phar.asc phive.phar
            chmod +x phive.phar
            sudo mv phive.phar /usr/local/bin/phive

php-fixer:
    cmd.run:
        - name: |
            phive install php-cs-fixer --global --trust-gpg-keys "E82B2FB314E9906E"

yarn:
    cmd.run:
        - name: |
            set -e
            curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
            echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    
    pkg.installed:
        - name: yarn
        - update: true
        - require:
            - cmd: yarn
