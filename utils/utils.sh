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