class Evidencemodeler < Formula
  desc "EVidenceModeler combines gene prediction/evidence into weighted gene predictions"
  homepage "http://evidencemodeler.github.io"
  url "https://github.com/nextgenusfs/EVidenceModeler/archive/0.1.3.tar.gz"
  sha256 "87bd6ac6bc22793096100bf837a391b13f71495b8d34875397c667dad5b41876"
  # tag "bioinformatics"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<~EOS
    Set ENV Variable for EVidence Modeler by adding to your ~/.bash_profile

      export EVM_HOME=#{prefix}

    EOS
  end

  test do
    system "#{bin}/evidence_modeler.pl --version"
  end
end
