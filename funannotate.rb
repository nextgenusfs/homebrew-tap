class Funannotate < Formula
  desc "Scripts to functionally annotate fungal genomes"
  homepage "https://github.com/nextgenusfs/funannotate"
  url "https://github.com/nextgenusfs/funannotate/archive/0.3.3.tar.gz"
  sha256 "f37cc673fe8b6fb3ddff367bc5ff9756d7f836c5679645e19d5e07617484108e"
  # tag "bioinformatics"

  depends_on "blast" => :recommended if OS.mac?
  depends_on "blast" => [:build, '--without-check'] if OS.linux?
  depends_on "gmap-gsnap" => :recommended
  depends_on "blat" => :recommended
  depends_on "kent-tools" => :recommended
  depends_on "mummer" => :recommended
  depends_on "bamtools" => :recommended
  depends_on "augustus" => :optional
  depends_on "hmmer" => :recommended
  depends_on "exonerate" => :recommended
  depends_on "repeatscout" => :recommended
  depends_on "repeatmasker" => :recommended
  depends_on "repeatmodeler" => :recommended
  depends_on "trnascan" => :recommended
  depends_on "bedtools" => :recommended
  depends_on "tbl2asn" => :recommended
  depends_on "raxml" => :recommended
  depends_on "trimal" => :recommended
  depends_on "mafft" => :recommended
  depends_on "cpanminus" => :optional
  depends_on "braker" => :recommended
  depends_on "evidencemodeler" => :recommended
  depends_on "gag" => :recommended
  depends_on "proteinortho" => :recommended
  # No formula: depends_on 'genemark-es' => :recommended

  depends_on "Bio::Perl" => :perl
  depends_on "Getopt::Long" => :perl
  depends_on "Pod::Usage" => :perl
  depends_on "File::Basename" => :perl
  depends_on "threads" => :perl
  depends_on "threads::shared" => :perl
  depends_on "Thread::Queue" => :perl
  depends_on "Carp" => :perl
  depends_on "Data::Dumper" => :perl
  depends_on "YAML" => :perl
  depends_on "Hash::Merge" => :perl
  depends_on "Logger::Simple" => :perl
  depends_on "Parallel::ForkManager" => :perl
  depends_on "Scalar::Util::Numeric" => :perl
  depends_on "DBI" => :perl
  depends_on "Text::Soundex" => :perl

  depends_on :python if MacOS.version <= :snow_leopard

  # No formula: depends_on "biopython" => :python
  # No formula: depends_on "natsort" => :python
  # No formula: depends_on "psutil" => :python
  # No formula: depends_on "goatools" => :python
  # No formula: depends_on "numpy" => :python
  # No formula: depends_on "pandas" => :python
  # No formula: depends_on "matplotlib" => :python
  # No formula: depends_on "seaborn" => :python
  # No formula: depends_on "scikit-learn" => :python

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"funannotate"
  end
  
  def caveats; <<-EOS.undent
    Additional components of Funannotate:
      Troubleshooting, see detailed instructions:
        https://github.com/nextgenusfs/funannotate

      Download/install GeneMark-ES/ET: (gmes_petap.pl must be in PATH)
        http://exon.gatech.edu/GeneMark/license_download.cgi

      Install python modules via PIP:
        pip install -U biopython natsort psutil goatools numpy pandas matplotlib seaborn scikit-learn

      Be sure to install RepeatMasker Libraries if you have not done so already.
        wget --user name --password pass http://www.girinst.org/server/RepBase/protected/repeatmaskerlibraries/repeatmaskerlibraries-20150807.tar.gz
        tar zxvf repeatmaskerlibraries-20150807.tar.gz -C #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec

        cd #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec
        ./configure <config.txt

      Soft-link a repeatmasker utility script into the PATH:
        ln -s #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec/util/rmOutToGFF3.pl #{HOMEBREW_PREFIX}/bin/rmOutToGFF3.pl

      Export required ENV variables (your paths might differ slightly):
        export EVM_HOME=#{HOMEBREW_PREFIX}/opt/evidencemodeler
        export AUGUSTUS_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/augustus/libexec/config
        export BAMTOOLS_PATH=#{HOMEBREW_PREFIX}/opt/bamtools/bin
        export GENEMARK_PATH=/path/to/gmes_petap.pl

      Install Databases for funannotate:
        cd #{HOMEBREW_PREFIX}/opt/funannotate/libexec
        ./setup.sh

    EOS
  end

  test do
    system "#{bin}/funannotate version"
  end
end
