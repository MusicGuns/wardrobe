require "rspec"
require_relative "../lib/cloth"
require_relative "../lib/wardrobe"

describe Wardrobe do
  describe ".from_file" do
    let(:clothes_from_path) { described_class.from_file(Dir["#{__dir__}/fixtures/*.txt"]) }

    it "should return the instance from #{described_class}" do
      expect(clothes_from_path).to be_a described_class
    end

    context "sorts the clothes by type" do
      it "should contain all keys as income has types" do
        expect(clothes_from_path.clothes.keys).to match_array ["головной убор","штаны"]
      end

      it "should return the array by cloth type" do
        expect(clothes_from_path.clothes.values).to all(be_a Array)
      end

      it "should return the array where each element is an instance of Cloth" do
        clothes_from_path.clothes.values.each { |typed_arrays| expect(typed_arrays).to all(be_a Cloth) }
      end
    end

    context "and should sort clothes correctly" do
      it "should contain the correct clothes in 'головной убор'" do
        expect(clothes_from_path.clothes["головной убор"])
          .to match_array(
            [
              have_attributes(type: "головной убор", name: "кепка", temperature: 5..20),
              have_attributes(type: "головной убор", name: "шапка", temperature: -20..0)
            ]
          )
      end

      it "should contain the correct clothes in 'штаны'" do
        expect(clothes_from_path.clothes["штаны"])
          .to match_array(
            [have_attributes(type: "штаны", name: "шорты", temperature: 10..15)]
          )
      end
    end
  end

  describe ".new" do
    let(:clothes) do [
      Cloth.new(type: "головной убор", name: "шапка", temperature: "(-20,5)"),
      Cloth.new(type: "головной убор", name: "кепка", temperature: "(5,20)"),
      Cloth.new(type: "штаны", name: "шорты", temperature: "(10,15)")
      ]
    end

    let(:wardrobe) { described_class.new(clothes) }

    it "should sort incoming clothes" do
      expect(wardrobe.clothes)
        .to match(
              { "головной убор" => [
                                    have_attributes(class: Cloth, type: "головной убор",name: "шапка", temperature: -20..5),
                                    have_attributes(class: Cloth, type: "головной убор",name: "кепка", temperature: 5..20)
                                   ],
                "штаны" => [have_attributes(class: Cloth, type: "штаны", name: "шорты", temperature: 10..15)]
              }
            )
    end
  end

  describe "#suiting_for_weather" do
    let(:clothes) do [
      Cloth.new(type: "головной убор", name: "шапка", temperature: "(-20,5)"),
      Cloth.new(type: "головной убор", name: "кепка", temperature: "(5,20)"),
      Cloth.new(type: "штаны", name: "шорты", temperature: "(10,15)")
      ]
    end

    let(:wardrobe) { Wardrobe.new(clothes) }

    it "should return clothes suiting for weather" do
      expect(wardrobe.suiting_for_weather(10))
      .to match_array [
              have_attributes(class: Cloth, type: "головной убор",name: "кепка", temperature: 5..20),
              have_attributes(class: Cloth, type: "штаны", name: "шорты", temperature: 10..15)
             ]
    end

    it "should return array of nils if there is no appropriate clothes" do
      expect(wardrobe.suiting_for_weather(40)).to eq [nil,nil]
    end
  end
end
