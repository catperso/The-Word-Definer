require 'rspec'
require 'definition'
require 'word'

describe '#Definition' do
  before(:each) do
    Definition.clear
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

  describe('.all') do
    it("returns an array of all definitions") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def2 = Definition.new({definition: 'delicious monkey treat', word_id: @word.id})
      def2.save
      expect(Definition.all).to(eq([def1, def2]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      expect(Definition.all).to(eq([def1]))
    end
  end

  describe('.clear') do
    it("removes all definitions") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def2 = Definition.new({definition: 'delicious monkey treat', word_id: @word.id})
      def2.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def2 = Definition.new({definition: 'delicious monkey treat', word_id: @word.id})
      def2.save
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end

  describe('#update') do
    it("updates a definition's attributes") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def1.update({definition: 'delicious monkey treat'})
      expect(def1.definition).to(eq('delicious monkey treat'))
    end
  end

  describe('#delete') do
    it("removes a definition from the pseudo database") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def2 = Definition.new({definition: 'delicious monkey treat', word_id: @word.id})
      def2.save
      def1.delete
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word from the word's id") do
      word2 = Word.new({word: "hammocks"})
      word2.save
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      def2 = Definition.new({definition: 'island lounge furniture', word_id: word2.id})
      def2.save
      expect(Definition.find_by_word(word2.id)).to(eq([def2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      def1 = Definition.new({definition: 'freudian yellow fruit', word_id: @word.id})
      def1.save
      expect(def1.word).to(eq(@word))
    end
  end
end