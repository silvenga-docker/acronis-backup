```
Usage: installer [OPTION...]
  -v, --version                                    show version information
      --product-info                               print product info
      --snapapi-list                               print binary snapapi versions
      --components-list                            print installer components
  -a, --auto                                       automatic (unattended) setup
      --skip-prereq-check                          skip prerequisites check
      --skip-prereq-check                          skip prerequisites check
      --force-weak-snapapi                         force weak snapapi(do not try to build)
      --skip-svc-start                             skip services start
  -t, --strict                                     make all warnings into errors
  -n, --nodeps                                     ignore dependencies during unattended setup
  -u, --uninstall                                  uninstall
      --purge                                      removes all configuration files
  -s, --disable-native-shared                      Use own redistributable libraries even if they are already present in the system.
  -d, --debug                                      verbose log information
      --tmp-dir=STRING                             specifies a directory used for storing temporary files during the installation (the default is /var/tmp/)
  -i, --id=STRING                                  specifies component to be installed (only for unattended installation)
  -e, --ssl=STRING                                 use ssl
  -p, --port=STRING                                port address
      --skip-registration                          skip registration on rain/ams
  -C, --ams=STRING                                 ams address
  -g, --login=STRING                               ams login
  -w, --password=STRING                            ams password
      --token=STRING                               ams token
      --unit=STRING                                ams unit
      --reg-transport=STRING                       Type of transport that will be use for agent registration. To register via https without certificate verification, specify 'https'. To
                                                   register via https with certificate verification using system CA, specify 'https-ca-system'. To register via https with certificate
                                                   verification using CA bundle delivered with the product, specify 'https-ca-bundle'. To register via https with certificate
                                                   verification using pinned public key, specify 'https-pinned-public-key'. In this case parameter 'reg-transport-pinned-public-key' must
                                                   be specified.
      --reg-transport-pinned-public-key=STRING     Pinned public key. If this parameter is specified, parameter 'reg-transport' must be equal to 'reg-transport-pinned-public-key' or be
                                                   ommited.
  -L, --license-server=STRING                      specifies address of Acronis License Server
  -W, --web-server-port=INT                        specifies port for Web Server
      --ams-tcp-port=INT                           specifies TCP port for communication between the product components
      --http-proxy-host=STRING                     IP/name of HTTP proxy server
      --http-proxy-port=INT                        Port of HTTP proxy server
      --http-proxy-login=STRING                    Login for HTTP proxy server
      --http-proxy-password=STRING                 Password for HTTP proxy server
  -B, --packages-bundle=STRING                     bundle with packages file name
      --language=STRING                            force language, available languages:en,bg,cs,da,de,es,fr,ko,id,it,hu,ms,nl,ja,nb,pl,pt,pt_BR,ru,fi,sr,sv,tr,zh,zh_TW

Help options:
  -?, --help                                       Show this help message
      --usage                                      Display brief usage message
```
