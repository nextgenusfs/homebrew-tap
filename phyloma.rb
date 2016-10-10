class Phyloma < Formula
  desc "Phyloma: Phylogenetic Marker-gene Analysis"
  homepage "https://github.com/nextgenusfs/phyloma"
  url "https://github.com/nextgenusfs/phyloma/archive/0.0.7.tar.gz"
  sha256 "081e6972f37c5b478284a3c53ea5d5b4a51f01a9c03c234d007bb7c717f834f0"

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
