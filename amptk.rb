class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/0.10.3.tar.gz"
  sha256 "e5442dae7cac94e77e39288d6214ac32c7e86d074e666d87ccde9672141c72d6"

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
