class Ufits < Formula
  desc "USEARCH Fungal ITS Clustering scripts"
  homepage "https://github.com/nextgenusfs/ufits"
  url "https://github.com/nextgenusfs/ufits/archive/0.3.3.tar.gz"
  sha256 "52325cd36cfa077432479a1f386f08878361952c989ba2e28c13d38cbd5952fd"

  depends_on "bedtools" => :recommended
  depends_on "vsearch" => :optional

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
         sudo ln -s /path/usearch/binary /usr/local/bin/usearch8

      Python Dependencies:
        pip install -U biopython natsort numpy pandas matplotlib
    EOS
  end

  test do
    system "#{bin}/ufits version"
  end
end
