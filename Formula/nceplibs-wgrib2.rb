class NceplibsWgrib2 < Formula
  desc "wgrib2 is a NCEP utility for interacting with, reading, writing, and manipulating GRIB2 files (wgrib is also provided)."
  homepage "https://github.com/NOAA-EMC/wgrib2"
  url "https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v3.7.0.tar.gz"
  sha256 "b741a07710a8195c99a7d50de05bde90182ab4334f5c4a0d6d057c4e20cc6a75"
  license :public_domain

  depends_on "cmake" => :build
  depends_on "gcc" # Accepts any Homebrew GCC version
  depends_on "nceplibs-ip"
  depends_on "openblas"
  depends_on "libaec"
  depends_on "netcdf"

  # Inline patch (edit the content for your actual needs)
  patch :DATA

  def install
    # Dynamically find the Homebrew GCC (gfortran)
    gcc_formula = Formula["gcc"]

    # Find the highest versioned gcc-X and gfortran-X, not gcc-ranlib-X etc.
    gcc_bin = Dir["#{gcc_formula.opt_bin}/gcc-[0-9]*"]
                .select { |f| File.basename(f) =~ /\Agcc-\d+\z/ }
                .sort
                .last
    gfortran_bin = Dir["#{gcc_formula.opt_bin}/gfortran-[0-9]*"]
                     .select { |f| File.basename(f) =~ /\Agfortran-\d+\z/ }
                     .sort
                     .last

    ENV["CC"] = gcc_bin
    ENV["FC"] = gfortran_bin

    # Use Homebrew's opt_prefixes for dependencies
    args = std_cmake_args + [
      "-DCMAKE_INSTALL_PREFIX=#{prefix}",
      "-DCMAKE_PREFIX_PATH=#{Formula["nceplibs-ip"].opt_prefix};#{Formula["openblas"].opt_prefix}",
      "-DUSE_AEC=ON",
      "-DUSE_IPOLATES=ON",
      "-DUSE_NETCDF=ON",
      "-DUSE_OPENMP=ON",
      "-DBUILD_LIB=OFF",
      "-DBUILD_SHARED_LIB=OFF",
      "-DBUILD_WGRIB=ON"
    ]

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/wgrib2", "--help"
    system "#{bin}/wgrib", "--help"
  end
end

# The following patch data is for the top-level CMakeLists.txt for wgrib2 v3.7.0.
# Since the include directory for nceplibs-ip is non-standard, using CONFIG in
# the find_package() will fail. This patch removes that.

__END__
--- CMakeLists.txt.ORIG	2025-06-06 11:34:34
+++ CMakeLists.txt	2025-06-06 11:35:08
@@ -83,7 +83,7 @@
 # If user wants to use NCEPLIBS-ip, find it and the sp library.
 message(STATUS "Checking if the user want to use NCEPLIBS-ip...")
 if(USE_IPOLATES)
-  find_package(ip 5.2.0 CONFIG REQUIRED)
+  find_package(ip 5.2.0 REQUIRED)
   list(APPEND definitions_list -DIPOLATES_LIB="ipolates_lib_d")
 endif()
