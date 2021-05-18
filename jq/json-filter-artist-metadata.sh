for i in *.json; \
  do cat "$i" \
  | jq \
   '.[]
   | {"obj":
      {"artist_id": .id,
      "name": .name,
      "code2": .code2,
      "gender": .gender,
      "isni": .isni,
      "cm_artist_rank": .cm_artist_rank,
      "hometown_city": .hometown_city,
      "current_city": .current_city,
      "current_city_id": .current_city_id,
      "band_members": .band_members,
      "description": .description
    }
  }' \
   > ../filtered-json/"${i%}"; \
 done
