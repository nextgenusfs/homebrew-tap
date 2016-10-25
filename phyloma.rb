class Phyloma < Formula
  desc "Phyloma: Phylogenetic Marker-gene Analysis"
  homepage "https://github.com/nextgenusfs/phyloma"
  url "https://github.com/nextgenusfs/phyloma/archive/0.0.9.tar.gz"
  sha256 "e3fa6cd6d0c5ef54dd94e05de291f0f624b25eeba01a79af204bd85d34d90e86"

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
