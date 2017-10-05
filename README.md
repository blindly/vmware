# vmware

- Requirements
  - VRA 7+ 
  - cloud client
- Scripts
  - blueprintPKG.sh
    - Logs into VRA via cloudclient and creates a package for all blueprints. 
  - propertyGroupPKG.sh
    - Logs into VRA via cloudclient and creates a package for all property groups. Note: Only the property groups with visibility "This Tenant" is seen.