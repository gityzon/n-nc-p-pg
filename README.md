# n-nc-p-pg

Nginx+NextCloud+php+pgSQL on replit.

#### APP:

[NextCloud](https://nextcloud.com/)

### Packages:

THEY ARE TOO MUCH THAT I CAN NOT LIST OUT!

Read replit.nix for more information

### Feature:

Nginx(v1.20.2) as frontend but not configured well(your data is expose to net!).

Webdav service goes well,although there are a few problem I could not fix.

You can use sqlite or PostgreSQL by yourself.

### Deploy:

   Choose "Import from GitHub".

<a href="https://replit.com/github/gityzon/n-nc-p-pg">
  <img alt="Run on Repl.it" src="https://replit.com/badge/github/github/gityzon" style="height: 40px; width: 190px;" />
</a>

If you use mobile phone,please set the UA of Browser as "Desktop" or maybe replit can not work.

### For edu:

1. Create a Bash-language project.

2. Copy these code to Replit's Shell and ←

   `git clone https://github.com/gityzon/n-nc-p-pg && mv -b n-nc-p-pg/* ./ && mv -b n-nc-p-pg/.[^.]* ./ && rm -rf *~ && rm -rf n-nc-p-pg`

3. After "Loading Nix environment..." is done, ▶RUN!!!

## Warn:

Please read "main.sh" for managing your site.

Maybe php works slow if you didn't config it,you may read [this document](https://docs.nextcloud.com/server/20/admin_manual/configuration_server/caching_configuration.html?highlight=apcu) to enhance the performance.
