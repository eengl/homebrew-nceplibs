class NceplibsBufr < Formula
  desc "Fortran library, programs, and command line utilites for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/bufr_v11.6.0.tar.gz"
  sha256 "af4c04e0b394aa9b5f411ec5c8055888619c724768b3094727e8bb7d3ea34a54"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "python3"

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", 
                    "-DMASTER_TABLE_DIR=#{prefix}/share/bufr",
                    "-DENABLE_PYTHON=ON", "."
    system "make"
    system "make", "install"
  end

  test do
    system "false"
  end
end
