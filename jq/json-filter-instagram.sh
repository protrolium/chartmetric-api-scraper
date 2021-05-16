for i in *.json; \
  do cat "$i" \
  | jq \
    '.[]
    | {"obj":
        {"top countries": .top_countries[:10],
        "top cities": .top_cities[:10],
        "audience gender per age": .audience_genders_per_age,
        "audience ethnicities": .audience_ethnicities,
        "audience genders": .audience_genders,
        "audience interests": [.audience_interests[] | select(.name=="Gaming")],
        "engagement rate": .engagement_rate,
        "is verified": .is_verified,
        "audience brand affinities": [.audience_brand_affinities[]
          | select(.name=="Activision Blizzard" or
            .name=="Bethesda Softworks" or
            .name=="Blizzard Entertainment" or
            .name=="DC Entertainment" or
            .name=="DreamWorks" or
            .name=="GameStop" or
            .name=="Gaming" or
            .name=="Grand Theft Auto" or
            .name=="Hot Topic" or
            .name=="League of Legends" or
            .name=="Marvel" or
            .name=="Marvel Entertainment" or
            .name=="Mortal Kombat" or
            .name=="Nintendo" or
            .name=="Playstation" or
            .name=="Pokemon" or
            .name=="Power Rangers" or
            .name=="Star Wars" or
            .name=="Walt Disney" or
            .name=="World of Warcraft" or
            .name=="Xbox")]
          }
        }' \
  > ../filtered-json/"${i%}"; \
done
