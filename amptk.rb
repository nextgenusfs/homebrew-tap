class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/0.9.2.tar.gz"
  sha256 "868091ab7824bf71f8fd920746f3eda300eef07445caf75d95c54b2117c32c18"

  depends_on "bedtools" => :recommended
  depends_on "vsearch" => :recommended
  depends_on "R" => :optional

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
