class NceplibsBufr < Formula
  desc "Fortran library, programs, and utilities for working with the BUFR format"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bufr"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bufr/archive/refs/tags/v12.3.0.tar.gz"
  sha256 "6c55923d6b6db251f4e8b16513395a1874ba8c0b3b14d7730e807780f3156ff4"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "python3"

  def install
    args = std_cmake_args + %W[
      -DMASTER_TABLE_DIR=#{pkgshare}/bufr
      -DENABLE_PYTHON=ON
      -DPython3_EXECUTABLE=#{Formula["python3"].opt_bin}/python3
      -DBUILD_TESTING=OFF
    ]

    # Build static libraries
    system "cmake", "-S", ".", "-B", "build_static", *args, "-DBUILD_SHARED_LIBS=OFF"
    system "cmake", "--build", "build_static"
    system "cmake", "--install", "build_static"

    # Build shared libraries
    system "cmake", "-S", ".", "-B", "build_shared", *args, "-DBUILD_SHARED_LIBS=ON"
    system "cmake", "--build", "build_shared"
    system "cmake", "--install", "build_shared"
  end

  test do
    system "false"
  end
end
