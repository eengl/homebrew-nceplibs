class NceplibsG2c < Formula
  desc "This library contains C decoder/encoder routines for GRIB edition 2."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2c"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "cf0ac8f75aed662ccc64f4c44fbe46a70307bc27cbe95417fdfb6caf75245457"
  license :public_domain
  
  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "openjpeg"
  depends_on "libaec"
  depends_on "libpng"
  depends_on "zlib"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DUSE_AEC=ON", "-DUSE_PNG=ON", "-DUSE_Jasper=OFF", "-DUSE_OpenJPEG=ON", "-DBUILD_SHARED_LIBS=OFF", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", ".", "-DUSE_AEC=ON", "-DUSE_PNG=ON", "-DUSE_Jasper=OFF", "-DUSE_OpenJPEG=ON", "-DBUILD_SHARED_LIBS=ON", "-DCMAKE_PREFIX_PATH=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
