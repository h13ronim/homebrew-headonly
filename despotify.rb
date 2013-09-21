require 'formula'

class Despotify < Formula
  head 'https://svn.code.sf.net/p/despotify/code/src'
  homepage 'http://despotify.se/'

  depends_on 'pkg-config' => :build
  depends_on 'libao'
  depends_on 'libvorbis'
  depends_on 'mpg123'
  depends_on 'libtool'

  def install
    system "make Makefile.local.mk"
    inreplace "Makefile.local.mk", "# INSTALL_PREFIX = /usr", "INSTALL_PREFIX = #{prefix}"
    system "make"
    system "make install"
  end
end
