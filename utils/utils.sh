# Provide some common utility functions

############################################################
# Check if a version is available against a list of versions
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
# Arguments:
#   available_versions
# Returns:
#   latest_version
############################################################
function latest_version {
  echo "$1" | rev | cut -d " " -f1 | rev
}

############################################################
# Get the latest version available in a list of versions
# Arguments:
#   version1
#   version2
# Returns:
#   1 if version1 is greater than version2
#   2 if version2 is greater than version1
#   0 if version1 and version2 are equal
############################################################
function vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

# vim: ai ts=2 sw=2 et sts=2 ft=sh
