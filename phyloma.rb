class Phyloma < Formula
  desc "Phyloma: Phylogenetic Marker-gene Analysis"
  homepage "https://github.com/nextgenusfs/phyloma"
  url "https://github.com/nextgenusfs/phyloma/archive/0.0.3.tar.gz"
  sha256 "8987a0dd89a6e402719990e7c20d5269015ff5576ea3d605bcb88e894aee95af"

  depends_on "bedtools" => :recommended
  depends_on "homebrew/science/freebayes" => :recommended
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
