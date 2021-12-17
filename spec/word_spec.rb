require 'rspec'
require 'word'
require 'definition'

describe '#Word' do
  before(:each) do
    Word.clear
    Definition.clear
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word1 = Word.new({word: "bananas"})
      word1.save
      word2 = Word.new({word: "hammocks"})
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('#==') do
    it("is the same word if the 'word' attribute is the same as another word") do
      word1 = Word.new({word: "bananas"})
      word2 = Word.new({word: "bananas"})
      expect(word1).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all saved words") do
      word1 = Word.new({word: "bananas"})
      word1.save
      word2 = Word.new({word: "hammocks"})
      word2.save
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word1 = Word.new({word: "bananas"})
      word1.save
      word2 = Word.new({word: "hammocks"})
      word2.save
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end

  describe('#update') do
    it("updates any of a word's attributes") do
      word = Word.new({word: "bananas"})
      word.save
      word.update({word: "hammocks"})
      expect(word.word).to(eq("hammocks"))
    end
  end

  describe('#delete') do
    it("removes a word from the pseudo database") do
      word1 = Word.new({word: "bananas"})
      word1.save
      word2 = Word.new({word: "hammocks"})
      word2.save
      word1.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#definitions') do
    it("returns a word's definitions") do
      word1 = Word.new({word: "bananas"})
      word1.save
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: word1.id})
      def1.save
      def2 = Definition.new({definition: 'delicious monkey treat', word_id: word1.id})
      def2.save
      expect(word1.definitions).to(eq([def1, def2]))
    end
  end

end