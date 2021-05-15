for i in *.json; \
  do cat "$i" \
    | jq '.[]
      | {"obj":
          [.
            [:29]
              | .[]
                | { "rank": .rank,
                    "name": .name,
                    "position": .position,
                    "id": .id,
                    "spotify_popularity": .spotify_popularity,
                    "spotify_followers": .spotify_followers,
                    "spotify_monthly_listeners": .spotify_monthy_listeners,
                    "spotify_where_people_listen": .sp_where_people_listen,
                    "spotify_listeners_to_follower_ratio": .spotify_listeners_to_follower_ratio,
                    "spotify_followers_to_listener_ratio": .sp_followers_to_listener_ratio,
                    "cm_artist_rank": .cm_artist_rank,
                    "facebook_likes": .fs_likes,
                    "facebook_talks": .fs_talks,
                    "twitter_followers": .ts_followers,
                    "twitter_retweets": .ts_retweets,
                    "instagram_followers": .ins_followers,
                    "youtube_channel_views": .ycs_views,
                    "youtube_subscribers": .ycs_subscribers,
                    "soundcloud_followers": .ss_followers,
                    "latest_album_release_date": .latest_album_release_date,
                    "latest_album_upc": .latest_album_upc,
                    "tiktok_likes": .tiktok_likes,
                    "tiktok_followers": .tiktok_followers,
                    "youtube_faily_video_views": .youtube_daily_video_views,
                    "youtube_monthly_video_views": .youtube_monthly_video_views,
                    "twitch_followers": .twitch_followers,
                    "twitch_views": .twitch_views,
                    "twitch_weekly_viewer_hours": .twitch_weekly_viewer_hours,
                    "twitch_monthly_viewer_hours": .twitch_monthly_viewer_hours,
                    "genres": .genres
                  }
            ]
          }' \
  > ../filtered-json/"${i%_1}"; \
done

# jq '.[] | {"obj": [ .[:29] | .[] | {"name": .name, "rank": .rank, "spotify_where_people_listen": [.sp_where_people_listen[] | {"code2": .code2, "listeners": .listeners, "name": .name}], "spotify_listeners_to_follower_ratio": .sp_listeners_to_follower_ratio }]}'

# cat 9lokknine.json | jq '.[] | {"obj": [ .[:29] | .[] | {"name": .name, "rank": .rank, "spotify_where_people_listen": .sp_where_people_listen, } ]}'

# cat 9lokknine.json | jq '.[] | {"obj": .[:29] | .[] | {"rank": .rank, "name": .name, "position": .position, "id": .id, "spotify_popularity": .spotify_popularity, "spotify_followers": .spotify_followers, "spotify_monthly_listeners": .spotify_monthy_listeners, "spotify_where_people_listen": .sp_where_people_listen, "spotify_listeners_to_follower_ratio": .spotify_listeners_to_follower_ratio, "spotify_followers_to_listener_ratio": .sp_followers_to_listener_ratio, "cm_artist_rank": .cm_artist_rank, "facebook_likes": .fs_likes, "facebook_talks": .fs_talks, "twitter_followers": .ts_followers, "twitter_retweets": .ts_retweets, "instagram_followers": .ins_followers, "youtube_channel_views": .ycs_views, "youtube_subscribers": .ycs_subscribers, "soundcloud_followers": .ss_followers, "latest_album_release_date": .latest_album_release_date, "latest_album_upc": .latest_album_upc, "tiktok_likes": .tiktok_likes, "tiktok_followers": .tiktok_followers, "youtube_faily_video_views": .youtube_daily_video_views, "youtube_monthly_video_views": .youtube_monthly_video_views, "twitch_followers": .twitch_followers, "twitch_views": .twitch_views, "twitch_weekly_viewer_hours": .twitch_weekly_viewer_hours, "twitch_monthly_viewer_hours": .twitch_monthly_viewer_hours, "genres": .genres } }'
