class Phyloma < Formula
  desc "Phyloma: Phylogenetic Marker-gene Analysis"
  homepage "https://github.com/nextgenusfs/phyloma"
  url "https://github.com/nextgenusfs/phyloma/archive/0.0.1.tar.gz"
  sha256 "0307c24654c26832a8d7113b6ba22b1137cb88f9bc9b724ad67313174a71eaa9"

  depends_on "bedtools" => :recommended
  depends_on "freebayes" => :recommended
  depends_on "samtools" => :recommended
  depends_on "bcftools" => :recommended
  depends_on "bgzip" => :recommended
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
