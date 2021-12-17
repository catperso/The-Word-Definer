class Definition
  attr_accessor :definition, :word_id, :id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @definition = attributes[:definition]
    @word_id = attributes[:word_id]
    @id = attributes[:id] || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.definition == def_to_compare.definition) && (self.word_id == def_to_compare.word_id)
  end

end