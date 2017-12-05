# Proxy setup

## Shell variables
Add the following code to `~/.zshrc`,

```
export PROXY_USER_NAME="" #Fill this
export PROXY_PASSWORD="" #Fill this
export PROXY_URL="" #Fill this

set_proxy() {
  export HTTPS_PROXY="http://$PROXY_USER_NAME:$PROXY_PASSWORD@$PROXY_URL"
  export ALL_PROXY=$HTTPS_PROXY
  export all_proxy=$HTTPS_PROXY
  export HTTP_PROXY=$HTTPS_PROXY
  export http_proxy=$HTTPS_PROXY
  export https_proxy=$HTTPS_PROXY
}

unset_proxy()
{
  export HTTPS_PROXY=""
  export ALL_PROXY=$HTTPS_PROXY
  export all_proxy=$HTTPS_PROXY
  export HTTP_PROXY=$HTTPS_PROXY
  export http_proxy=$HTTPS_PROXY
  export https_proxy=$HTTPS_PROXY
}

set_proxy 
```

## Configuring apt for proxy setup
Run `sudo vi /etc/apt/apt.conf`, 

```
Acquire::http::proxy "PROXY_URL";
Acquire::https::proxy "PROXY_URL";
```
*PROXY_URL* is `https://$PROXY_USER_NAME:$PROXY_PASSWORD@PROXY_URL` - the conf file can't use variables, so make sure you replace them
