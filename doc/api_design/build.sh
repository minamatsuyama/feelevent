#!/bin/sh -e

function beautify_md() {
  # jsonでエスケープしている場合、markdown化する時に<pre>(バックスラッシュ3つ)で
  # 囲われているところでエスケープ文字が入るのでそれを削除する
  sed -e 's/\\\\//g' $1 > $2

  echo '***\n©1PAC. INC.' >> $2
}

if [ "${DOC_LANG-undef}" = "undef" ]; then
  lang='ja'
else
  lang=${DOC_LANG}
fi

echo '# combine start'
bundle exec prmd combine --meta meta_${lang}.yml -o build/api_${lang}.json schemata_${lang}/
#bundle exec prmd doc --prepend overview_${lang}.md build/api_${lang}.json > build/api_${lang}_tmp.md
bundle exec prmd render --template ./templates --prepend overview_${lang}.md build/api_${lang}.json > build/api_${lang}_tmp.md
beautify_md build/api_${lang}_tmp.md build/api_${lang}.md
echo '# combine end'

echo '# unit start'
files=`find schemata_${lang} -type f | awk -F'\.' '{print $1}' | awk -F"schemata_${lang}/" '{print $2}'`

for file in $files; do
  bundle exec prmd combine --meta meta_${lang}.yml -o build/tmp.json schemata_${lang}/${file}.yml
  bundle exec prmd render --template ./templates --prepend overview_unit_${lang}.md build/tmp.json > build/unit/${lang}/tmp.md
  beautify_md build/unit/${lang}/tmp.md build/unit/${lang}/${file}.md
done
echo '# unit end'

# 一時ファイルの削除
rm -f build/tmp.json
rm -f build/api_${lang}_tmp.md
rm -f build/unit/${lang}/tmp.md

echo '########################################'
echo "Generated >> ${lang}.md"
