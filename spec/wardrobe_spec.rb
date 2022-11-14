require 'rspec'
require_relative '../lib/cloth'
require_relative '../lib/wardrobe'

describe Wardrobe do
  let(:clothes) do
    [
      Cloth.new(type: 'головной убор', name: 'шапка', temperature: '(-20,5)'),
      Cloth.new(type: 'головной убор', name: 'кепка', temperature: '(5,20)'),
      Cloth.new(type: 'штаны', name: 'шорты', temperature: '(10,15)')
    ]
  end

  let(:sorted_clothes) do
    {
      'головной убор' => [clothes[0], clothes[1]],
      'штаны' => [clothes[2]]
    }
  end

  let(:wardrobe) { Wardrobe.new(sorted_clothes) }

  describe '::from_file' do
    let(:clothes_from_path) { described_class.from_file(Dir["#{__dir__}/fixtures/*.txt"]) }

    it "returns the instance from #{described_class}" do
      expect(clothes_from_path).to be_a described_class
    end

    it 'returns the number of keys' do
      expect(clothes_from_path.clothes.keys.size).to eq 2
    end

    it 'returns the array of type cloth' do
      expect(clothes_from_path.clothes.keys.map).to match_array ['головной убор', 'штаны']
    end

    it 'should sort cloth is correctly' do
      expect(clothes_from_path.clothes.map do |_key, value|
               value.map do |value|
                 value.type
               end
             end).to match_array([['головной убор', 'головной убор'], ['штаны']])
    end

    it 'returns the number of cloth' do
      expect(clothes_from_path.clothes.map { |_key, value| value })
        .to match_array([
                          [have_attributes(type: 'головной убор', name: 'кепка', temperature: 5..20),
                           have_attributes(type: 'головной убор', name: 'шапка', temperature: -20..0)],
                          [have_attributes(type: 'штаны', name: 'шорты', temperature: 10..15)]
                        ])
    end
    it 'returns the number of cloth' do
      expect(clothes_from_path.clothes.keys.map { |key| clothes_from_path.clothes[key].sample }).to all be_a Cloth
    end
  end

  describe '::new' do
    it 'assigns instance variables of clothes in collection' do
      expect(wardrobe.clothes).to eq sorted_clothes
    end
  end

  describe '::sort_clothes' do
    it 'checking for correct sorting' do
      expect(described_class.sort_clothes(clothes)).to eq sorted_clothes
    end
  end

  describe '::suiting_for_weather' do
    it 'correct selection of clothes' do
      expect(wardrobe.suiting_for_weather(10)).to eq [clothes[1], clothes[2]]
    end

    it 'returns array of nil' do
      expect(wardrobe.suiting_for_weather(40)).to eq [nil, nil]
    end
  end
end
