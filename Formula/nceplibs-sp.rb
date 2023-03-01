class NceplibsSp < Formula
  desc "NCEP Spectral Transform library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-sp"
  url "https://github.com/NOAA-EMC/NCEPLIBS-sp/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "5528eba5759e538a146c9cf801bbe7f5d34fd283fca91b63197119a128a638f5"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build

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
