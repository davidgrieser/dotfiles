function set-aws {
  #aws configure list-profiles > /tmp/aws-profiles
  PROFILES_OUTPUT=$(aws configure list-profiles )
  PROFILES=("${(f)PROFILES_OUTPUT}")
  if [[ $# -eq 0 ]]; then
    echo "Please provide a AWS profile name"
    return
  fi
  for PROFILE in ${PROFILES}
  do
    #echo "Checking <$1> against <${PROFILE}>"
    if [[ ${PROFILE} == $1 ]]; then
      export AWS_PROFILE=$1
      echo "Set AWS_PROFILE=$1"
      return
    fi
  done
  echo "'$1' not a registered profile"
  echo "AWS_PROFILE=$AWS_PROFILE still set"
  #if [[ $1 == default ]]; then
  #  export AWS_PROFILE=$1
  #elif [[ $1 == sf-c1 ]]; then
  #  export AWS_PROFILE=$1
  #else
  #fi
}

