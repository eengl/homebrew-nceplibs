class NceplibsG2cAT19 < Formula
  desc "This library contains C decoder/encoder routines for GRIB edition 2."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2c"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "5554276e18bdcddf387a08c2dd23f9da310c6598905df6a2a244516c22ded9aa"
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
