for i in *.json; \
  do cat "$i" \
  | jq \
    '.[]
    | {"obj":
        {"related artists": .[:20]
          }
        }' \
  > ../filtered-json/"${i%}"; \
done
