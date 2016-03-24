class Evidencemodeler < Formula
  desc "EVidenceModeler combines gene prediction/evidence into weighted gene predictions"
  homepage "http://evidencemodeler.github.io"
  url "https://github.com/nextgenusfs/EVidenceModeler/archive/1.1.2.tar.gz"
  sha256 "443d03728d31f3aa47bb39f956e577ad04086c7e47ccfc3369871d8ef39e2555"
  # tag "bioinformatics"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    Set ENV Variable for EVidence Modeler by adding to your ~/.bash_profile

      export EVM_HOME=#{prefix}
 
    EOS
  end

  test do
    system "#{bin}/evidence_modeler.pl --version"
  end
end
