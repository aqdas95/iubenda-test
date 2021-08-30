require 'rspec/autorun'
require_relative './tandcgenerator.rb'

describe TAndCGenerator do
    TCG = TAndCGenerator.new

    it "should not raise any error if the template and datasets are valid" do
       expect{TCG.generate("dataset.json","template.txt")}.not_to raise_error
    end

    it "should transform the template as required" do
        expect(TCG.generate("dataset.json","template.txt")).to eq("A T&C Document\n\nThis document is made of plaintext.\nIs made of And dies.\nIs made of The white horse is white.\nIs made of The quick brown fox;jumps over the lazy dog.\n\nYour legals.")
    end

    it "should raise file not found error if the template or dataset file are not present" do
        expect{TCG.generate("dataset.json","template10.txt")}.to raise_error(Errno::ENOENT)
    end

    it "should raise Clause not found error if the dataset doesnot contain the clause in template" do
        expect{TCG.generate("dataset.json","template2.txt")}.to raise_error("Clause/Section not Found in Dataset")
    end

    it "should raise Clause_ids not found in Datasets error if the Clause_ids in Section doesnot exists in dataset" do
        expect{TCG.generate("dataset2.json","template.txt")}.to raise_error("Clauses_ids in Section not Found in Dataset")
    end

end
