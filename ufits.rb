class Ufits < Formula
  desc "USEARCH Fungal ITS Clustering scripts"
  homepage "https://github.com/nextgenusfs/ufits"
  url "https://github.com/nextgenusfs/ufits/archive/0.3.9.tar.gz"
  sha256 "e746ccedff938124a0bbdbf856b73a54a78ab446d90299e8a714653e7f0eb74b"

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
