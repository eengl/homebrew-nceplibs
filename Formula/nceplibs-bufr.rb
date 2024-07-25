class NceplibsBufr < Formula
  desc "Fortran library, programs, and command line utilites for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/v12.1.0.tar.gz"
  sha256 "b5eae61b50d4132b2933b6e6dfc607e5392727cdc4f46ec7a94a19109d91dcf3"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
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
