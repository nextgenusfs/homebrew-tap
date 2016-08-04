class Ufits < Formula
  desc "USEARCH Fungal ITS Clustering scripts"
  homepage "https://github.com/nextgenusfs/ufits"
  url "https://github.com/nextgenusfs/ufits/archive/0.4.1.tar.gz"
  sha256 "8cb264d1545cc48826bf9495a6490ca2c1e1f6d65cbba1b2b9fa98bd008fcf9d"

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
