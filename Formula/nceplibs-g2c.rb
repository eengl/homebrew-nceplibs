class NceplibsG2c < Formula
  desc "C decoder/encoder routines for GRIB edition 2"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-g2c"
  url "https://github.com/NOAA-EMC/NCEPLIBS-g2c/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "8520a24c066500cfd0d07a05c6b7b0cb92383d1a4737cf6e79d9f4919c8e79ab"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "libaec"
  depends_on "libpng"
  depends_on "openjpeg"
  depends_on "zlib"

  def install
    args = std_cmake_args + %W[
      -DUSE_AEC=ON
      -DUSE_PNG=ON
      -DUSE_Jasper=OFF
      -DUSE_OpenJPEG=ON
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
