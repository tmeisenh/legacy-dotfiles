# $Id$
#
# Z shell configuration file
#
# Author: Travis Meisenheimer <travis@indexoutofbounds.com>
#
#********************************************************************

export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-amd64
export M2_HOME=/usr/share/maven
#export ANT_HOME=/usr/local/share/java/apache-ant
export GRADLE_HOME=/usr/local/gradle-1.2

export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$ANT_HOME/bin:$GRADLE_HOME/bin:$PATH

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# FreeBSD uses a javawrapper.sh in /usr/local/bin to execute java type commands.
# We manually set java and JAVA_HOME in case someone else needs it (maven/ant/gradle)
