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

    # Copy files into prefix/include/include_* so Homebrew creates actual merged directories
    # in /opt/homebrew/include/ rather than exclusive top-level directory symlinks.
    if (prefix/"include_4").exist?
      (include/"include_4").install Dir[prefix/"include_4/*"]
      rm_r prefix/"include_4"
      (prefix/"include_4").make_symlink include/"include_4"
    end

    if (prefix/"include_d").exist?
      (include/"include_d").install Dir[prefix/"include_d/*"]
      rm_r prefix/"include_d"
      (prefix/"include_d").make_symlink include/"include_d"
    end
  end

  test do
    system "false"
  end
end
