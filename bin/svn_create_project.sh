#/bin/sh

svn_user=svn
svn_url=/usr/local/svnrepo
svn_bin=/usr/local/bin
svn_skele_dir=/tmp/app_root
svn_admin_opts="--fs-type fsfs"

echo ""
echo "Ok, I'm going to create a new Subversion project."
echo "I can create the repo using svnadmin, but you have to run me on the server."
echo "First, I'm going to need some information..."
echo ""
echo "Please enter the application name, this will serve as the base name for your app."
read app_name
echo ""

echo "Should I create the repo? (y/n)"
read create_repo
echo ""

echo "Can I use the default svn_url? (y/n)"
echo "Default: ${svn_url}"
read use_default_url
echo ""

if [ ${use_default_url} = "n" ] || [ ${use_default_url} = "N" ]
then
	echo "Please specify the url: "
	read svn_url
fi


if [ ${create_repo} = y ] || [ ${create_repo} = Y ]
then
	echo "BDB file system? (y/n)"
	read use_bdb
fi

if [ ${create_repo} = y ] || [ ${create_repo} = Y ]
then
	svn_admin_opts="--fs-type bdb"
fi

echo ""
echo "########################################"
echo "Please veryif the following information before I create things..."
echo "svn user: "${svn_user}
echo "svn url: " ${svn_url}
echo "Application name: " ${app_name}
echo "Create repo: " ${create_repo}
echo "Use BRB file system? " ${use_bdb}
echo ""
echo "Proceed? (y/n)"
read proceed

if [ ${proceed} = n ] || [ ${proceed} = N ]
	then
	echo "Aborting..."
	exit 0
fi

# Make the default file structure
echo " Creating skeletion directory in tmp dir..."
rm -rf $svn_skele_dir
mkdir $svn_skele_dir
mkdir $svn_skele_dir/branches $svn_skele_dir/tags $svn_skele_dir/trunk $svn_skele_dir/docs
echo ""


if [ ${create_repo} = y ] || [ ${create_repo} = Y ]
then
	echo "Using svnadmin to create the repo"
	${svn_bin}/svnadmin create ${svn_url}/${app_name} ${svn_admin_opts}
fi


echo "Using svn to do the import ... "
echo "executing: ${svn_bin}/svn import --auto-props -q -m "Initial import" "$svn_skele_dir" file://${svn_url}/${app_name}"
${svn_bin}/svn import --auto-props -q -m "Initial import" "$svn_skele_dir" file://${svn_url}/${app_name}
echo "Finished with svn import...adjusting UNIX permissions for Apache"

rm -rf $svn_skele_dir

# We need to set UNIX file permissions correctly if we're using Apache
# Usually this means make all dirs 775 and all files 664 so the www/apache user
# can "do work."
chmod 775 ${svn_url}/${app_name}
find ${svn_url}/${app_name} -type d -exec chmod 775 {} \;
find ${svn_url}/${app_name} -type f -exec chmod 664 {} \;
echo "DONE"
