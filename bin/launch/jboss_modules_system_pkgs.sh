function configure_jboss_modules_system_pkgs() {
  JBOSS_MODULES_SYSTEM_PKGS="org.jboss.logmanager,jdk.nashorn.api"

  if [ -n "$JBOSS_MODULES_SYSTEM_PKGS_APPEND" ]; then
    JBOSS_MODULES_SYSTEM_PKGS="$JBOSS_MODULES_SYSTEM_PKGS,$JBOSS_MODULES_SYSTEM_PKGS_APPEND"
  fi
}
