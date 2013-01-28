# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
#********************************************************************

export JAVA_HOME=/usr/local/openjdk7
export M2_HOME=/usr/local/share/java/maven3
export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/share/java/gradle-1.3

export PATH=$PATH:$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin

# FreeBSD uses a javawrapper.sh in /usr/local/bin to execute java type commands.
# We manually set java and JAVA_HOME in case someone else needs it (maven/ant/gradle)
