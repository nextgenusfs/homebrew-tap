class Evidencemodeler < Formula
  desc "EVidenceModeler combines gene prediction/evidence into weighted gene predictions"
  homepage "http://evidencemodeler.github.io"
  url "https://github.com/EVidenceModeler/EVidenceModeler/archive/v1.1.1.tar.gz"
  version "1.1.1"
  sha256 "9ef89095fe37326d44eb95cc5b7dacae301aafa1dedfc13c17fcaec1c9388757"
  # tag "bioinformatics"
  
  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"evidence_modeler.pl"
  end

  def caveats; <<-EOS.undent
    Set ENV Variable for EVidence Modeler by adding to your ~/.bash_profile
      
      export EVM_HOME=#{prefix}/libexec
        
    EOS
  end

  test do
    system "#{bin}/evidence_modeler.pl --version"
  end
end
