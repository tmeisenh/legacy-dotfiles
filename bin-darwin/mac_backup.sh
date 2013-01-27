#/bin/sh

# Back up everything on my mac

STORAGE_DIR=/Volumes/User/travis/Storage/backups/constantine

touch $STORAGE_DIR/lock.tbm

DATA_FILE=$STORAGE_DIR/travis-Home_`date +%F`_.tar.gz
MUSIC_FILE=$STORAGE_DIR/travis-Music_`date +%F`_.tar.gz
DESKTOP_FILE=$STORAGE_DIR/travis-Desktop_`date +%F`_.tar.gz
DOCUMENTS_FILE=$STORAGE_DIR/travis-Documents_`date +%F`_.tar.gz
PICTURES_FILE=$STORAGE_DIR/travis-Pictures_`date +%F`_.tar.gz
LIBRARY_FILE=$STORAGE_DIR/travis-Library_`date +%F`_.tar.gz
MOVIES_FILE=$STORAGE_DIR/travis-Movies_`date +%F`_.tar.gz

echo "Beginning backup of home directory for travis.  Remember ~/Movies/grendel and ~/Storage are excluded."
echo "Also, most important UNIX files are in subversion too."

cd /Volumes/User/

tar -pzcf $DATA_FILE \
	--exclude=./travis/Desktop \
	--exclude=./travis/Documents \
	--exclude=./travis/Movies \
	--exclude=./travis/Music \
	--exclude=./travis/Pictures \
	--exclude=./travis/Library \
	--exclude=./travis/Storage \
	--exclude=./travis/.svn \
	 ./travis

echo ""
echo ""
echo "Done with base home directory, starting data specific tar-balls..."

cd /Volumes/User/travis

tar -pzcf $MUSIC_FILE ./Music
echo ""
echo ""
echo "Done with music."

tar -pzcf $DESKTOP_FILE ./Desktop
echo ""
echo ""
echo "Done with desktop."

tar -pzcf $DOCUMENTS_FILE ./Documents
echo ""
echo ""
echo "Done with documents."

tar -pzcf $PICTURES_FILE ./Pictures
echo ""
echo ""
echo "Done with pictures."

tar -pzcf $MOVIES_FILE --exclude=./Movies/grendel ./Movies
echo ""
echo ""
echo "Done with movies."

tar -pzcf $LIBRARY_FILE ./Library
echo ""
echo ""
echo "Done with library."
echo "Done with everything."

rm -f $STORAGE_DIR/lock.tbm
#scp $DATA_FILE travis@grendel:~/backups
