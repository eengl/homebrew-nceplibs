class NceplibsSp < Formula
  desc "NCEP Spectral Transform library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-sp"
  url "https://github.com/NOAA-EMC/NCEPLIBS-sp/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "dbb4280e622d2683b68a28f8e3837744adf9bbbb1e7940856e8f4597f481c708"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DOPENMP=ON", "-DBUILD_8=ON", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DOPENMP=ON", "-DBUILD_SHARED_LIBS=ON", "-DBUILD_8=ON", "."
    system "make"
    system "make", "install"
    
  end

  test do
    system "false"
  end
end
