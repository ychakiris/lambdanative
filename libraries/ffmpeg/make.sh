PKGURL=https://ffmpeg.org/releases/ffmpeg-3.2.4.tar.gz
PKGHASH=3021eb10f465a567a4d4c4d0fae60c508a0285ef

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
package_make_fake_static_lib "ffmpeg"
asserterror $? "could not create fake static library"
package_cleanup

#eof
