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
  depends_on 'braker' => :recommended
  depends_on 'evidencemodeler' => :recommended
  depends_on 'gag' => :recommended
  depends_on 'matplotlib' => :recommended
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

  depends_on :python if MacOS.version <= :snow_leopard
  
  resource "pandas" do
    url "https://pypi.python.org/packages/source/p/pandas/pandas-0.17.1.tar.gz"
    sha256 "cfd7214a7223703fe6999fbe34837749540efee1c985e6aee9933f30e3f72837"
  end

  resource "biopython" do
    url "https://pypi.python.org/packages/source/b/biopython/biopython-1.66.tar.gz"
    sha256 "171ad726f50528b514f9777e6ea54138f6e35792c5b128c4ab91ce918a48bbbd"
  end

  resource "psutil" do
    url "https://pypi.python.org/packages/source/p/psutil/psutil-4.0.0.tar.gz"
    sha256 "1a7c672f9ee79c84ff16b8de6f6040080f0e25002ac47f115f4a54aa88e5cfcd"
  end

  resource "fisher" do
    url "https://pypi.python.org/packages/source/f/fisher/fisher-0.1.4.tar.gz"
    sha256 "bba9e4ece8dda18f7e67fee487947a5ac28ed2bb138600da8b214ac051f87ebf"
  end

  resource "goatools" do
    url "https://pypi.python.org/packages/source/g/goatools/goatools-0.5.9.tar.gz"
    sha256 "bf7617ba0314d34f1b50ebb7b17071e3013a2fcaf8197fbfb4c62fe292075ee8"
  end

  resource "seaborn" do
    url "https://pypi.python.org/packages/source/s/seaborn/seaborn-0.7.0.tar.gz"
    sha256 "15a8b2747becfdb86cfa60b5fcfa9bb934e42ef0ced660e0d57e8aea741f7145"
  end

  resource "natsort" do
    url "https://pypi.python.org/packages/source/n/natsort/natsort-4.0.4.tar.gz"
    sha256 "c76ba3e85fba78f276ac06e4d47f2230d1070f9c19413b2a0bfe7de6af311839"
  end

  resource "scikit-learn" do
    url "https://pypi.python.org/packages/source/s/scikit-learn/scikit-learn-0.17.1.tar.gz"
    sha256 "9f4cf58e57d81783289fc503caaed1f210bab49b7a6f680bf3c04b1e0a96e5f0"
  end
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
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[pandas biopython psutil fisher goatools seaborn natsort scikit-learn].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)
    
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    
    libexec.install Dir["*"]
    bin.install_symlink libexec/"funannotate"
  end

  def caveats; <<-EOS.undent
    Additional components of Funannotate:
      Troubleshooting, see detailed instructions at https://github.com/nextgenusfs/funannotate
      GeneMark-ES/ET. Download from http://exon.gatech.edu/GeneMark/license_download.cgi
       
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

