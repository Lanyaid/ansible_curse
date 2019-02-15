#!/bin/bash

if [ "$1" == "--list" ] ; then
cat<<EOF
{
  "bash_hosts": {
        "hosts": [
          "127.0.0.1",
          "10.220.21.27"
        ],
        "vars": {
          "host_proxy_var": "proxy2"
        }
  },
  "_meta": {
        "hostvars": {
          "127.0.0.1": {
                "host_specific_var": "towerhost"
          },
          "10.220.21.27": {
                "host_specific_var": "testhost"
          }
        }
  }
} 
EOF
elif [ "$1" == "--host" ]; then
  echo '{"_meta": {"hostvars": {}}}'
else
  echo "{ }"
fi


