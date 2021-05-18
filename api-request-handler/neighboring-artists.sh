#! /bin/bash
# ctrl-z to pause script (timeout).
# `$ jobs' to view all currently stopped jobs,
# `$ fg` to resume
# `$ bash -x scriptname` to view printout of commands as they run

artistId=var/artist-id-complete.txt
artistName=var/artist-name-complete.txt
tokenAuth=var/token.txt

# id array
declare -a id
id=(`cat "$artistId"`)

# artist name array
declare -a art
art=(`cat "$artistName"`)

# random index test to check that artist and id are matching
# echo ${idArray[474]} && echo ${artistArray[474]}

for ((i=0; i<${#id[@]}; i++)); do
  #make sure our token is updated
  declare token
  token=`cat "$tokenAuth"`

  # curl command
  curl -H "Authorization: Bearer $token" "https://api.chartmetric.com/api/artist/${id[$i]}/neighboring-artists?metric=cm_artist_rank&limit=30" \
  -o ../data/neighboring-audience-stats/json/raw-json/${art[$i]}.json;

  # print the saved output and display last portion of token string
  echo "Saving ${art[$i]} at id: ${id[$i]} with token: ${token: -9}";

  sleep 6;

done

echo "Process Complete"
