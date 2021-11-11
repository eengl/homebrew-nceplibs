class NceplibsG2c < Formula
  desc "This library contains C decoder/encoder routines for GRIB edition 2."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2c"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/refs/tags/v1.6.4.tar.gz"
  sha256 "5129a772572a358296b05fbe846bd390c6a501254588c6a223623649aefacb9d"
  license :public_domain
  
  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "jasper"
  depends_on "libpng"
  depends_on "zlib"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
