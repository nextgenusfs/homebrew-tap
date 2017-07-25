class Amptk < Formula
  desc "AMPlicon ToolKit for NGS data"
  homepage "https://github.com/nextgenusfs/amptk"
  url "https://github.com/nextgenusfs/amptk/archive/0.10.0.tar.gz"
  sha256 "3fcae7ceea110816b497feb279d48ede1888a681fad56ef34ce7987e95eb2fa5"

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
        pip install -U edlib biopython natsort numpy pandas matplotlib psutil h5py biom-format
      or
        conda install edlib biopython natsort numpy pandas matplotlib psutil h5py biom-format
    EOS
  end

  test do
    system "#{bin}/amptk version"
  end
end
