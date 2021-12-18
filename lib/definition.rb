class Definition
  attr_accessor :definition, :word_id, :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes[:definition]
    @word_id = attributes[:word_id]
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@definitions.values
  end

  def self.clear
    @@definitions = {}
    @@total_rows = 0  
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_word(word_id)
    defs = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        defs.push(definition)
      end
    end
    defs
  end

  def save
    @@definitions[self.id] = Definition.new({definition: self.definition, id: self.id, word_id: self.word_id})
  end

  def ==(def_to_compare)
    (self.definition == def_to_compare.definition) && (self.word_id == def_to_compare.word_id)
  end

  def update(attributes)
    if attributes[:definition]
      self.definition = attributes[:definition]
    end
    if attributes[:word_id]
      self.word_id = attributes[:word_id]
    end
  end

  def delete
    @@definitions.delete(self.id)
  end

  def word
    Word.find(self.word_id)
  end
end