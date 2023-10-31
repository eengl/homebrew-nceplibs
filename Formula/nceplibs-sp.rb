class NceplibsSp < Formula
  desc "NCEP Spectral Transform library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-sp"
  url "https://github.com/NOAA-EMC/NCEPLIBS-sp/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "aec475ccb5ccf7c5a758dfb699626f2be78a22729a9d8d5e0a286db6a3213a51"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DOPENMP=ON", "."
    system "make"
    system "make", "install"
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "-DOPENMP=ON", "-DBUILD_SHARED_LIBS=ON", "."
    system "make"
    system "make", "install"
    
  end

  test do
    system "false"
  end
end
