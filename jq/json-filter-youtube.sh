for i in *.json; \
  do cat "$i" \
  | jq \
    '.[]
    | {"obj":
        {"top countries": .top_countries[:10],
        "audience gender per age": .audience_genders_per_age,
        "audience genders": .audience_genders,
        "subscribers": .subscribers,
        "avg likes per post": .avg_likes_per_post,
        "avg comments per post": .avg_commments_per_post,
        "engagement rate": .engagement_rate,
      }
    }' \
  > ../filtered-json/"${i%}"; \
done
