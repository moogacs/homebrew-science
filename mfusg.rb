class Mfusg < Formula
  homepage "http://water.usgs.gov/ogw/mfusg"
  url "http://water.usgs.gov/ogw/mfusg/mfusg.1_2_00.zip"
  sha256 "41feb2d595a9b87feca301cfcf00dd142cd67fc466c101548f35bc09c57fadbc"
  revision 1

  depends_on :fortran

  def install
    prefix.install "mfusg.txt", "readme.txt", "release.txt", "problems.txt"
    share.install "test"
    doc.install Dir["doc/*"]

    cd "pymake" do
      system "python", "makebin.py"
      bin.install "mfusg"
    end
  end

  test do
    system "#{bin}/mfusg", "#{share}/test/03_conduit_confined/ex3.nam"
  end
end
