# Provide some common utility functions

############################################################
# Check if a version is available against a list of versions
# Globals:
#   BACKUP_DIR
#   ORACLE_SID
# Arguments:
#   requested_version
#   available_versions
# Returns:
#   None
############################################################
function check_version {
  requested_version=$1
  available_versions=${2}
  available=0
  for version in ${available_versions}
  do
    if [ $version = $requested_version ];then
      available=1
      break
    fi
  done

  if [ "$available" -eq 0 ]; then
    echo "Requested version is not available"
    echo "Please try with one of these: ${available_versions}"
    exit 1
  fi
}

############################################################
# Get the latest version available in a list of versions
# Globals:
#   BACKUP_DIR
#   ORACLE_SID
# Arguments:
#   available_versions
# Returns:
#   latest_version
############################################################
function latest_version {
  echo "$1" | rev | cut -d " " -f1 | rev
}

# vim: ai ts=2 sw=2 et sts=2 ft=sh
