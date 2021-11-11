class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v3.3.3.tar.gz"
  sha256 "d5a569ca7c8225a3ade64ef5cd68f3319bcd11f6f86eb3dba901d93842eb3633"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
