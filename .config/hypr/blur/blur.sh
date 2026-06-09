#!/bin/bash

# جلب الحالة الحالية للـ blur (يرجع 1 إذا شغال و 0 إذا طافي)
CURRENT_STATUS=$(hyprctl getoption decoration:blur:enabled | awk 'NR==1 {print $2}')

if [ "$CURRENT_STATUS" -eq 1 ]; then
    # إذا كان شغال، نطفيه ونقفل الأنميشن تبعه عشان الأداء
    hyprctl keyword decoration:blur:enabled false
else
    # إذا كان طافي، نشغله
    hyprctl keyword decoration:blur:enabled true
fi