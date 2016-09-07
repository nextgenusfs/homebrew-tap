class Ufits < Formula
  desc "USEARCH Fungal ITS Clustering scripts"
  homepage "https://github.com/nextgenusfs/ufits"
  url "https://github.com/nextgenusfs/ufits/archive/0.4.4.tar.gz"
  sha256 "0ffc378c7f74b1811b6804f1de26fcbae00fefbe51b875954908a28cc56203f7"

  depends_on "bedtools" => :recommended
  depends_on "vsearch" => :recommended

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"ufits"
  end

  def caveats; <<-EOS.undent
    Additional Dependencies:
        UFITS requires USEARCH8, get here: http://www.drive5.com/usearch/download.html

      Make executable:
         sudo chmod +x /path/usearch/binary

      Add to $PATH (UFITS uses usearch8 as default name):
         sudo ln -s /path/usearch/binary #{HOMEBREW_PREFIX}/opt/usearch8

      Python Dependencies:
        pip install -U biopython natsort numpy pandas matplotlib
    EOS
  end

  test do
    system "#{bin}/ufits version"
  end
end
