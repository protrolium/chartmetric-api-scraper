awk 'FNR == 1 && NR!=1{next;}{print}' *_artist_id.csv > merged/merged_artist_id.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_band_members.csv > merged/merged_band_members.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_cm_artist_rank.csv > merged/merged_cm_artist_rank.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_code2.csv > merged/merged_code2.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_current_city.csv > merged/merged_current_city.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_current_city_id.csv > merged/merged_current_city_id.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_description.csv > merged/merged_description.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_gender.csv > merged/merged_gender.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_hometown_city.csv > merged/merged_hometown_city.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_isni.csv > merged/merged_isni.csv &&
awk 'FNR == 1 && NR!=1{next;}{print}' *_name.csv > merged/merged_name.csv
