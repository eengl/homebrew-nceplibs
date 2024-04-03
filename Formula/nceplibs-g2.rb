class NceplibsG2 < Formula
  desc "Fortran library for encoding/decoding GRIB2 messages."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2/archive/refs/tags/v3.4.9.tar.gz"
  sha256 "6edc33091f6bd2acb191182831499c226a1c3992c3acc104d6363528b12dfbae"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
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
