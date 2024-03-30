#!/bin/bash
# shellcheck disable=SC1091,2154
source config.sh

if [[ "${main_translation}" == "true" ]]; then
  if_not_main=""
else
  if_not_main="${standard_translation}"
fi
sed -i "s/###### 1$/###### ¶ 1/g" "${reading_dir}/"*.md
# Book 42: Luke
sed -i "s/###### 5$/###### ¶ 5/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 8$/###### ¶ 8/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 21$/###### ¶ 21/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 24$/###### ¶ 24/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 26$/###### ¶ 26/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 46$/###### ¶ 46/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 56$/###### ¶ 56/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 57$/###### ¶ 57/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 59$/###### ¶ 59/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 67$/###### ¶ 67/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 80$/###### ¶ 80/g" "${reading_dir}/luke1${if_not_main}.md"
sed -i "s/###### 8$/###### ¶ 8/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 15$/###### ¶ 15/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 21$/###### ¶ 21/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 22$/###### ¶ 22/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 25$/###### ¶ 25/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 33$/###### ¶ 33/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 36$/###### ¶ 36/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 41$/###### ¶ 41/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 52$/###### ¶ 52/g" "${reading_dir}/luke2${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 10$/###### ¶ 10/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 15$/###### ¶ 15/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 21$/###### ¶ 21/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 23$/###### ¶ 23/g" "${reading_dir}/luke3${if_not_main}.md"
sed -i "s/###### 5$/###### ¶ 5/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 9$/###### ¶ 9/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 13$/###### ¶ 13/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 14$/###### ¶ 14/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 16$/###### ¶ 16/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 31$/###### ¶ 31/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 38$/###### ¶ 38/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 40$/###### ¶ 40/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 42$/###### ¶ 42/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 44$/###### ¶ 44/g" "${reading_dir}/luke4${if_not_main}.md"
sed -i "s/###### 12$/###### ¶ 12/g" "${reading_dir}/luke5${if_not_main}.md"
sed -i "s/###### 17$/###### ¶ 17/g" "${reading_dir}/luke5${if_not_main}.md"
sed -i "s/###### 27$/###### ¶ 27/g" "${reading_dir}/luke5${if_not_main}.md"
sed -i "s/###### 29$/###### ¶ 29/g" "${reading_dir}/luke5${if_not_main}.md"
sed -i "s/###### 33$/###### ¶ 33/g" "${reading_dir}/luke5${if_not_main}.md"
sed -i "s/###### 6$/###### ¶ 6/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 12$/###### ¶ 12/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 17$/###### ¶ 17/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 20$/###### ¶ 20/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 27$/###### ¶ 27/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 37$/###### ¶ 37/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 46$/###### ¶ 46/g" "${reading_dir}/luke6${if_not_main}.md"
sed -i "s/###### 2$/###### ¶ 2/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 11$/###### ¶ 11/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 24$/###### ¶ 24/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 31$/###### ¶ 31/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 36$/###### ¶ 36/g" "${reading_dir}/luke7${if_not_main}.md"
sed -i "s/###### 4$/###### ¶ 4/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 9$/###### ¶ 9/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 11$/###### ¶ 11/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 16$/###### ¶ 16/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 19$/###### ¶ 19/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 22$/###### ¶ 22/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 26$/###### ¶ 26/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 32$/###### ¶ 32/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 34$/###### ¶ 34/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 40$/###### ¶ 40/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 43$/###### ¶ 43/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 49$/###### ¶ 49/g" "${reading_dir}/luke8${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 10$/###### ¶ 10/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 12$/###### ¶ 12/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 23$/###### ¶ 23/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 28$/###### ¶ 28/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 37$/###### ¶ 37/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 46$/###### ¶ 46/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 49$/###### ¶ 49/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 51$/###### ¶ 51/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 57$/###### ¶ 57/g" "${reading_dir}/luke9${if_not_main}.md"
sed -i "s/###### 13$/###### ¶ 13/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 16$/###### ¶ 16/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 17$/###### ¶ 17/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 21$/###### ¶ 21/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 23$/###### ¶ 23/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 25$/###### ¶ 25/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 38$/###### ¶ 38/g" "${reading_dir}/luke10${if_not_main}.md"
sed -i "s/###### 5$/###### ¶ 5/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 9$/###### ¶ 9/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 14$/###### ¶ 14/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 24$/###### ¶ 24/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 27$/###### ¶ 27/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 29$/###### ¶ 29/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 33$/###### ¶ 33/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 37$/###### ¶ 37/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 42$/###### ¶ 42/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 45$/###### ¶ 45/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 53$/###### ¶ 53/g" "${reading_dir}/luke11${if_not_main}.md"
sed -i "s/###### 4$/###### ¶ 4/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 8$/###### ¶ 8/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 13$/###### ¶ 13/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 22$/###### ¶ 22/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 33$/###### ¶ 33/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 35$/###### ¶ 35/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 41$/###### ¶ 41/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 49$/###### ¶ 49/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 54$/###### ¶ 54/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 57$/###### ¶ 57/g" "${reading_dir}/luke12${if_not_main}.md"
sed -i "s/###### 6$/###### ¶ 6/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 10$/###### ¶ 10/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 20$/###### ¶ 20/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 22$/###### ¶ 22/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 31$/###### ¶ 31/g" "${reading_dir}/luke13${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke14${if_not_main}.md"
sed -i "s/###### 12$/###### ¶ 12/g" "${reading_dir}/luke14${if_not_main}.md"
sed -i "s/###### 15$/###### ¶ 15/g" "${reading_dir}/luke14${if_not_main}.md"
sed -i "s/###### 25$/###### ¶ 25/g" "${reading_dir}/luke14${if_not_main}.md"
sed -i "s/###### 34$/###### ¶ 34/g" "${reading_dir}/luke14${if_not_main}.md"
sed -i "s/###### 3$/###### ¶ 3/g" "${reading_dir}/luke15${if_not_main}.md"
sed -i "s/###### 8$/###### ¶ 8/g" "${reading_dir}/luke15${if_not_main}.md"
sed -i "s/###### 11$/###### ¶ 11/g" "${reading_dir}/luke15${if_not_main}.md"
sed -i "s/###### 25$/###### ¶ 25/g" "${reading_dir}/luke15${if_not_main}.md"
sed -i "s/###### 10$/###### ¶ 10/g" "${reading_dir}/luke16${if_not_main}.md"
sed -i "s/###### 14$/###### ¶ 14/g" "${reading_dir}/luke16${if_not_main}.md"
sed -i "s/###### 16$/###### ¶ 16/g" "${reading_dir}/luke16${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke16${if_not_main}.md"
sed -i "s/###### 19$/###### ¶ 19/g" "${reading_dir}/luke16${if_not_main}.md"
sed -i "s/###### 5$/###### ¶ 5/g" "${reading_dir}/luke17${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke17${if_not_main}.md"
sed -i "s/###### 11$/###### ¶ 11/g" "${reading_dir}/luke17${if_not_main}.md"
sed -i "s/###### 20$/###### ¶ 20/g" "${reading_dir}/luke17${if_not_main}.md"
sed -i "s/###### 22$/###### ¶ 22/g" "${reading_dir}/luke17${if_not_main}.md"
sed -i "s/###### 9$/###### ¶ 9/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 15$/###### ¶ 15/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 28$/###### ¶ 28/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 31$/###### ¶ 31/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 35$/###### ¶ 35/g" "${reading_dir}/luke18${if_not_main}.md"
sed -i "s/###### 11$/###### ¶ 11/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 28$/###### ¶ 28/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 29$/###### ¶ 29/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 41$/###### ¶ 41/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 45$/###### ¶ 45/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 47$/###### ¶ 47/g" "${reading_dir}/luke19${if_not_main}.md"
sed -i "s/###### 9$/###### ¶ 9/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 19$/###### ¶ 19/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 27$/###### ¶ 27/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 34$/###### ¶ 34/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 41$/###### ¶ 41/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 45$/###### ¶ 45/g" "${reading_dir}/luke20${if_not_main}.md"
sed -i "s/###### 5$/###### ¶ 5/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 10$/###### ¶ 10/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 12$/###### ¶ 12/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 20$/###### ¶ 20/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 25$/###### ¶ 25/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 29$/###### ¶ 29/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 34$/###### ¶ 34/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 37$/###### ¶ 37/g" "${reading_dir}/luke21${if_not_main}.md"
sed -i "s/###### 3$/###### ¶ 3/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 7$/###### ¶ 7/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 14$/###### ¶ 14/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 24$/###### ¶ 24/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 28$/###### ¶ 28/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 31$/###### ¶ 31/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 35$/###### ¶ 35/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 47$/###### ¶ 47/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 54$/###### ¶ 54/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 63$/###### ¶ 63/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 66$/###### ¶ 66/g" "${reading_dir}/luke22${if_not_main}.md"
sed -i "s/###### 6$/###### ¶ 6/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 8$/###### ¶ 8/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 13$/###### ¶ 13/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 18$/###### ¶ 18/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 26$/###### ¶ 26/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 27$/###### ¶ 27/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 32$/###### ¶ 32/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 33$/###### ¶ 33/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 39$/###### ¶ 39/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 44$/###### ¶ 44/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 50$/###### ¶ 50/g" "${reading_dir}/luke23${if_not_main}.md"
sed -i "s/###### 13$/###### ¶ 13/g" "${reading_dir}/luke24${if_not_main}.md"
sed -i "s/###### 28$/###### ¶ 28/g" "${reading_dir}/luke24${if_not_main}.md"
sed -i "s/###### 36$/###### ¶ 36/g" "${reading_dir}/luke24${if_not_main}.md"
sed -i "s/###### 44$/###### ¶ 44/g" "${reading_dir}/luke24${if_not_main}.md"
sed -i "s/###### 50$/###### ¶ 50/g" "${reading_dir}/luke24${if_not_main}.md"
