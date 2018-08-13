class Funannotate < Formula
  desc "Scripts to functionally annotate fungal genomes"
  homepage "https://github.com/nextgenusfs/funannotate"
  url "https://github.com/nextgenusfs/funannotate/archive/1.5.0.tar.gz"
  sha256 "f035cca74cbd053dd871c35e51e546ee026ef004322bba3d8255e1044fb7018a"
  # tag "bioinformatics"

  depends_on "blast" => :recommended if OS.mac?
  depends_on "blast" => [:build, "--without-check"] if OS.linux?
  depends_on "gmap-gsnap" => :optional
  depends_on "minimap2" => :recommended
  depends_on "blat" => :recommended
  depends_on "kent-tools" => :optional
  depends_on "mummer" => :optional
  depends_on "bamtools" => :recommended
  depends_on "augustus" => :recommended if OS.linux?
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
  depends_on "evidencemodeler" => :recommended
  depends_on "proteinortho" => :recommended
  depends_on "paml" => :recommended
  depends_on "phyml" => :optional
  depends_on "diamond" => :recommended
  depends_on "hisat2" => :recommended
  depends_on "trinity" => :recommended
  depends_on "kallisto" => :recommended
  depends_on "stringtie" => :recommended
  # No formula: depends_on 'genemark-es' => :recommended

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"funannotate"
  end

  def caveats; <<~EOS
    Additional components of Funannotate:
      Troubleshooting, see detailed instructions:
        http://funannotate.readthedocs.io/en/latest/homebrew.html

      Download/install GeneMark-ES/ET: (gmes_petap.pl must be in PATH)
        http://exon.gatech.edu/GeneMark/license_download.cgi

      Install Perl Modules via cpan or cpanminus:
        http://funannotate.readthedocs.io/en/latest/homebrew.html
      Install python modules via PIP or conda:
        pip install -U biopython natsort psutil goatools fisher numpy pandas matplotlib seaborn scikit-learn ete3

      Be sure to install RepeatMasker Libraries if you have not done so already.
        wget --user name --password pass http://www.girinst.org/server/RepBase/protected/repeatmaskerlibraries/RepBaseRepeatMaskerEdition-20170127.tar.gz
        tar zxvf RepBaseRepeatMaskerEdition-20170127.tar.gz -C #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec

        cd #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec
        ./configure <config.txt

      Soft-link a repeatmasker utility script into the PATH:
        ln -s #{HOMEBREW_PREFIX}/opt/repeatmasker/libexec/util/rmOutToGFF3.pl #{HOMEBREW_PREFIX}/bin/rmOutToGFF3.pl

     Setup funannotate databases:
        funannotate setup -d /path/to/DB

      Export required ENV variables (your paths might differ slightly):
        export EVM_HOME=#{HOMEBREW_PREFIX}/opt/evidencemodeler
        export AUGUSTUS_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/augustus/libexec/config
        export BAMTOOLS_PATH=#{HOMEBREW_PREFIX}/opt/bamtools/bin
        export GENEMARK_PATH=/path/to/gmes_petap.pl
        export FUNANNOTATE_DB=/path/to/DB

    EOS
  end

  test do
    system "#{bin}/funannotate", "version"
  end
end
