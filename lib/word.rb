class Word
  attr_accessor :id, :word

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @word = attributes[:word]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@words.values
  end

  def save
    @@words[self.id] = Word.new({word: self.word, id: self.id})
  end

  def ==(other_word)
    self.word.eql?(other_word.word)
  end

end