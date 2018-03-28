class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/1.1.1.tar.gz"
  sha256 "fbc04cf1e67695f5fa9f9058049df5659d83282bf91b8ac1cf82de2423032ce7"

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
        pip install -U edlib biopython natsort numpy pandas matplotlib seaborn psutil h5py biom-format
    EOS
  end

  test do
    system "#{bin}/amptk version"
  end
end
