class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/1.1.2.tar.gz"
  sha256 "db9cc4d4754d462cea85b8d050bd25c535038b6bb5bdab562e0a0294c195e034"

  depends_on "vsearch" => :recommended
  depends_on "R" => :optional

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/bin/"amptk"
  end

  def caveats; <<-EOS.undent
    Additional Dependencies:
        AMPtk requires USEARCH9, get here: http://www.drive5.com/usearch/download.html

      Make executable:
         sudo chmod +x /path/usearch/binary

      Add to $PATH (UFITS uses usearch9 as default name):
         sudo ln -s /path/usearch/binary #{HOMEBREW_PREFIX}/opt/usearch9

      Python Dependencies:
        pip install -U edlib biopython natsort numpy pandas matplotlib seaborn psutil h5py biom-format
    EOS
  end

  test do
    system "#{bin}/amptk version"
  end
end
