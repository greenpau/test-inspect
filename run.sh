ACTION_VERSION=`cat ../contributor-compliance-action/VERSION`
UPDATE_FILE=.github/workflows/contributors.yml
UPDATE_LINE=$(grep -Fn 'id: inspection' $UPDATE_FILE | cut -d":" -f1)
UPDATE_LINE=$((UPDATE_LINE+1))
USAGE_LINE="uses: greenpau/contributor-compliance-action@v$ACTION_VERSION"

sed -i '/contributor-compliance-action/d' $UPDATE_FILE
sed -i ''"${UPDATE_LINE}"' i '"        ${USAGE_LINE}"'' $UPDATE_FILE
sed -i ''"${UPDATE_LINE}"' s/^/        /' $UPDATE_FILE

RUN_DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo $RUN_DATE >> 123
git add .
git commit -m "update github workflows ${RUN_DATE}"
git push
