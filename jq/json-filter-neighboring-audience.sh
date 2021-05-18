for i in *.json; \
  do cat "$i" \
    | jq '.[]
      | {"obj":
          {"related artists": .[:29]
            | [.[]
              | { "rank": .rank,
                  "name": .name,
                  "position": .position,
                  "id": .id,
                  "spotify_popularity": .sp_popularity,
                  "spotify_followers": .sp_followers,
                  "spotify_monthly_listeners": .sp_monthly_listeners,
                  "spotify_where_people_listen_1_code_2": .sp_where_people_listen[0].code2,
                  "spotify_where_people_listen_1_name": .sp_where_people_listen[0].name,
                  "spotify_where_people_listen_1_listeners": .sp_where_people_listen[0].listeners,
                  "spotify_where_people_listen_2_code_2": .sp_where_people_listen[1].code2,
                  "spotify_where_people_listen_2_name": .sp_where_people_listen[1].name,
                  "spotify_where_people_listen_2_listeners": .sp_where_people_listen[1].listeners,
                  "spotify_where_people_listen_3_code_2": .sp_where_people_listen[2].code2,
                  "spotify_where_people_listen_3_name": .sp_where_people_listen[2].name,
                  "spotify_where_people_listen_3_listeners": .sp_where_people_listen[2].listeners,
                  "spotify_where_people_listen_4_code_2": .sp_where_people_listen[3].code2,
                  "spotify_where_people_listen_4_name": .sp_where_people_listen[3].name,
                  "spotify_where_people_listen_4_listeners": .sp_where_people_listen[3].listeners,
                  "spotify_where_people_listen_5_code_2": .sp_where_people_listen[4].code2,
                  "spotify_where_people_listen_5_name": .sp_where_people_listen[4].name,
                  "spotify_where_people_listen_5_listeners": .sp_where_people_listen[4].listeners,
                  "spotify_listeners_to_follower_ratio": .sp_listeners_to_followers_ratio,
                  "spotify_followers_to_listener_ratio": .sp_followers_to_listeners_ratio,
                  "cm_artist_rank": .cm_artist_rank,
                  "facebook_likes": .fs_likes,
                  "facebook_talks": .fs_talks,
                  "twitter_followers": .ts_followers,
                  "twitter_retweets": .ts_retweets,
                  "instagram_followers": .ins_followers,
                  "youtube_channel_views": .ycs_views,
                  "youtube_subscribers": .ycs_subscribers,
                  "soundcloud_followers": .soundcloud_followers,
                  "latest_album_release_date": .latest_album_release_date,
                  "latest_album_upc": .latest_album_upc,
                  "tiktok_likes": .tiktok_likes,
                  "tiktok_followers": .tiktok_followers,
                  "youtube_daily_video_views": .youtube_daily_video_views,
                  "youtube_monthly_video_views": .youtube_monthly_video_views,
                  "twitch_followers": .twitch_followers,
                  "twitch_views": .twitch_views,
                  "twitch_weekly_viewer_hours": .twitch_weekly_viewer_hours,
                  "twitch_monthly_viewer_hours": .twitch_monthly_viewer_hours,
                  "genres": .genres
                }
               ]
           }
        }' \
  > ../filtered-json/"${i%_1}"; \
done
