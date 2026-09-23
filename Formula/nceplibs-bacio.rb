class NceplibsBacio < Formula
  desc "Perform binary I/O for NCEP models"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-bacio"
  url "https://github.com/NOAA-EMC/NCEPLIBS-bacio/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "03fef581e1bd3710fb8d2f2659a6c3e01a0437c1350ba53958d2ff1ffef47bcb"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build

  def install
    args = std_cmake_args + %W[
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
