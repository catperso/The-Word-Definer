require 'rspec'
require 'definition'
require 'word'

describe '#Definition' do
  before(:each) do
    Word.clear
    @word = Word.new({word: "bananas"})
    @word.save
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def2 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      expect(def1).to(eq(def2))
    end
  end


end