class Ufits < Formula
  desc "USEARCH Fungal ITS Clustering scripts"
  homepage "https://github.com/nextgenusfs/ufits"
  url "https://github.com/nextgenusfs/ufits/archive/0.5.4.tar.gz"
  sha256 "d0b8d36b89f59f24f849a9135cf2507c7fe9ad28fa2144c9815635765ba1fe6e"

  depends_on "bedtools" => :recommended
  depends_on "vsearch" => :recommended
  depends_on "R" => :recommended

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
        pip install -U biopython natsort numpy pandas matplotlib psutil h5py biom-format 
    EOS
  end

  test do
    system "#{bin}/ufits version"
  end
end
