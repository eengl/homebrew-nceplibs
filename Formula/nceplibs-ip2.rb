class NceplibsIp2 < Formula
  desc "NCEP General Interpolation Library 2"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip2"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip2/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "73c6beec8fd463ec7ccba3633d8c5d53d385c43d507367efde918c2db0af42ab"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "nceplibs-sp"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
