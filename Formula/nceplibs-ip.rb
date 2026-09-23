class NceplibsIp < Formula
  desc "NCEP General Interpolation Fortran Library"
  homepage "https://github.com/NOAA-EMC/NCEPLIBS-ip"
  url "https://github.com/NOAA-EMC/NCEPLIBS-ip/archive/refs/tags/v5.4.0.tar.gz"
  sha256 "918b2cc425d5f1fa7378346cad2d16ad68b03b575adeb40b8b37a7dc3e876041"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" => :build
  depends_on "pkg-config" => :build
  depends_on "openblas"

  def install
    args = std_cmake_args + %W[
      -DBUILD_4=ON
      -DBUILD_D=ON
      -DBUILD_TESTING=OFF
      -DOPENMP=ON
      -DBLA_VENDOR=OpenBLAS
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
