## Automate deployments via cloudclient
1. List catalog item
  1. vra catalog list
2. Generate template
  2. vra catalog request generate template
  2. Example: vra catalog request generate template --id <id from catalog items step above> --groupid <group id from catalog items step above> --reason "test" --description "test" --export /tmp/linux.json