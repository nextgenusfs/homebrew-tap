class Evidencemodeler < Formula
  desc "EVidenceModeler combines gene prediction/evidence into weighted gene predictions"
  homepage "http://evidencemodeler.github.io"
  url "https://github.com/nextgenusfs/EVidenceModeler/archive/1.1.2.tar.gz"
  version "1.1.2"
  sha256 "443d03728d31f3aa47bb39f956e577ad04086c7e47ccfc3369871d8ef39e2555"
  # tag "bioinformatics"
  
  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"evidence_modeler.pl"
    bin.install_symlink libexec/"EvmUtil"/"partition_EVM_inputs.pl"
    bin.install_symlink libexec/"EvmUtil"/"write_EVM_commands.pl"
    bin.install_symlink libexec/"EvmUtil"/"execute_EVM_commands.pl"
    bin.install_symlink libexec/"EvmUtil"/"recombine_EVM_partial_outputs.pl"
    bin.install_symlink libexec/"EvmUtil"/"convert_EVM_outputs_to_GFF3.pl"
    bin.install_symlink libexec/"EvmUtil"/"misc"/"augustus_GFF3_to_EVM_GFF3.pl"
    bin.install_symlink libexec/"EvmUtil"/"misc"/"exonerate_gff_to_alignment_gff3.pl"
    bin.install_symlink libexec/"EvmUtil"/"gff3_gene_prediction_file_validator.pl"
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
