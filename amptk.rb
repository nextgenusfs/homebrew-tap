class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/0.8.7.tar.gz"
  sha256 "ac797985e0aa8e282e76da9694b0b18f65e86d9b19081982c4d20b02806900d2"

  depends_on "bedtools" => :recommended
  depends_on "vsearch" => :recommended
  depends_on "R" => :recommended

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"amptk"
  end

  def caveats; <<-EOS.undent
    Additional Dependencies:
        AMPtk requires USEARCH9, get here: http://www.drive5.com/usearch/download.html

      Make executable:
         sudo chmod +x /path/usearch/binary

      Add to $PATH (UFITS uses usearch9 as default name):
         sudo ln -s /path/usearch/binary #{HOMEBREW_PREFIX}/opt/usearch9

      Python Dependencies:
        pip install -U biopython natsort numpy pandas matplotlib psutil h5py biom-format
      or
        conda install biopython natsort numpy pandas matplotlib psutil h5py biom-format
    EOS
  end

  test do
    system "#{bin}/amptk version"
  end
end
