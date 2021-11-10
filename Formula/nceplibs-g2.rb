class NceplibsG2 < Formula
  desc "Fortran library for encoding/decoding GRIB2 messages."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2/archive/refs/tags/v3.4.5.tar.gz"
  sha256 "c18e991c56964953d778632e2d74da13c4e78da35e8d04cb742a2ca4f52737b6"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "jasper"
  depends_on "libpng"
  depends_on "nceplibs-bacio"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
