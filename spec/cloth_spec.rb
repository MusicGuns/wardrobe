require "rspec"
require_relative "../lib/cloth"
require_relative "../lib/wardrobe"

describe Cloth do
  let(:cloth) {described_class.new(type: "головной убор", name: "шапка", temperature: "(-20,5)")}

  describe "::new" do

    it "assigns instanse varriable" do
      expect(cloth).to have_attributes(type: "головной убор", name: "шапка", temperature: -20..5)
    end
  end

  describe "::to_s" do
    it "translating to string" do
      expect(cloth.to_s).to eq "#{cloth.name} (#{cloth.type}), #{cloth.temperature.to_s}"
    end
  end
end