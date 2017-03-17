PKGURL=https://www.libsdl.org/release/SDL2-2.0.5.tar.gz
PKGHASH=c4f87580630387796df4ac87c362b4f9a721457e

package_download $PKGURL $PKGHASH

package_patch

EXTRACONF=
if [ ! $SYS_PLATFORM = $SYS_HOSTPLATFORM ]; then
  EXTRACONF=--host=$SYS_ARCH
fi

package_configure 

package_make
asserterror $? "compilation failed"
package_make install
asserterror $? "compilation failed"

package_cleanup

#eof
