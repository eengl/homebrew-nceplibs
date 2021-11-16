class NceplibsWgrib2 < Formula
  desc "Utility to Read/Write GRIB2 files."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-wgrib2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-wgrib2/archive/refs/tags/v2.0.8-cmake-v6.tar.gz"
  sha256 "745cd008b4ce0245ea44247733e57e2b9ec6c5205d171d457e18d0ff8f87172d"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "netcdf"
  depends_on "jasper"
  depends_on "libpng"
  depends_on "nceplibs-sp"
  depends_on "nceplibs-ip"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DCMAKE_PREFIX_PATH=#{prefix}", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
