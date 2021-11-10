class NceplibsBacio < Formula
  desc "This library performs binary I/O for the NCEP models."
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bacio"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bacio/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "540a0ed73941d70dbf5d7b21d5d0a441e76fad2bfe37dfdfea0db3e98fc0fbfb"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
