class Phyloma < Formula
  desc "Phyloma: Phylogenetic Marker-gene Analysis"
  homepage "https://github.com/nextgenusfs/phyloma"
  url "https://github.com/nextgenusfs/phyloma/archive/0.0.8.tar.gz"
  sha256 "5c0720874a99b26f0ba7cfb2490c45431eb7306e7dc13eebf70f6f611c03aaf4"

  depends_on "bedtools" => :recommended
  depends_on "freebayes" => :recommended
  depends_on "samtools" => :recommended
  depends_on "bcftools" => :recommended
  depends_on "htslib" => :recommended
  depends_on "bwa" => :recommended
  depends_on "raxml" => :recommended
  depends_on "trimal" => :recommended
  depends_on "mafft" => :recommended

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"phyloma"
  end

  test do
    system "phyloma version"
  end
end
