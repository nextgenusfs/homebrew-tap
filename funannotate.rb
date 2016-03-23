class Funannotate < Formula
  desc "Scripts to functionally annotate fungal genomes"
  homepage "https://github.com/nextgenusfs/funannotate"
  url "https://github.com/nextgenusfs/funannotate/archive/0.1.1.tar.gz"
  version "0.1.1"
  sha256 "6443ca63811ea9aeb33655365751868fd9afb59dc476620811df7e20f567b897"
  # tag "bioinformatics"

  depends_on "gmap-gsnap" => :recommended
  depends_on "blat" => :recommended
  depends_on "kent-tools" => :recommended
  depends_on "mummer" => :recommended
  depends_on "bamtools" => :recommended
  depends_on "augustus" => :recommended
  depends_on "blast" => :recommended
  depends_on "hmmer" => :recommended
  depends_on "exonerate" => :recommended
  depends_on "repeatmasker" => :recommended
  depends_on "repeatmodeler" => :recommended
  depends_on "trnascan" => :recommended
  depends_on "bedtools" => :recommended
  depends_on "tbl2asn" => :recommended
  depends_on "raxml" => :recommended
  depends_on "trimal" => :recommended
  depends_on "mafft" => :recommended
  depends_on "cpanm" => :optional
  # No formula: depends_on 'genemark-es' => :recommended
  # No formula: depends_on 'braker1' => :optional
  # No formula: depends_on 'evidence_modeler' => :recommended
  # No formula: depends_on 'GAG' => :recommended
  
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

  depends_on :python if MacOS.version <= :snow_leopard
  #depends_on "biopython" => :python
  #depends_on "natsort" => :python  
  #depends_on "psutil" => :python  
  #depends_on "goatools" => :python
  #depends_on "numpy" => :python
  #depends_on "pandas" => :python
  #depends_on "matplotlib" => :python  
  #depends_on "seaborn" => :python
  #depends_on "scikit-learn" => :python

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"funannotate"
  end

  def caveats; <<-EOS.undent
    Additional components of Funannotate:
      see detailed instructions at https://github.com/nextgenusfs/funannotate
      GeneMark-ES/ET. Download from http://exon.gatech.edu/GeneMark/license_download.cgi
      BRAKER1 download from http://exon.gatech.edu/GeneMark/Braker/BRAKER1.tar.gz
      EVidence Modeler from https://github.com/EVidenceModeler
      Genome Annotation Generator from https://github.com/genomeannotation
      
      Install python modules via PIP:
        pip install -U biopython natsort psutil goatools numpy pandas matplotlib seaborn scikit-learn
    
      Be sure to install RepeatMasker Libraries if you have not done so already.
          
      Install Databases for funannotate:
        cd #{prefix}/libexec
        ./setup.sh
        
    EOS
  end

  test do
    system "#{bin}/funannotate version"
  end
end
