

URL=`svn info | awk '$1 == "URL:" {print $2}'`
REV=`svn info | awk '$1 == "Revision:" {print $2}'`

echo $URL
echo $REV

TD=`mktemp -d /tmp/XXXXXXXXXXXXX`

( cd $TD 
  svn export $URL
  mv wessels dnscap-$REV
  tar czvf /tmp/dnscap-$REV.tar.gz dnscap-$REV
)

rm -rfv $TD
echo "install -m 644 -o $USER /tmp/dnscap-$REV.tar.gz /usr/local/www/drupal5/files/dnscap"
install -m 644 -o $USER /tmp/dnscap-$REV.tar.gz /usr/local/www/dnscap
