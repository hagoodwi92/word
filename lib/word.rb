class Word
  attr_reader :id, :word, :picture
  attr_accessor :word, :picture
  @@words = {}
  @@total_rows = 0

  def initialize(word, id, picture)
    @word = word
    @id = id || @@total_rows += 1
    @picture = picture
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id, self.picture)
  end

  def ==(word_to_compare)
    self.word() == word_to_compare.word()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def update(word)
    self.word = word
    @@words[self.id] = Word.new(self.word, self.id, self.picture)
  end

  def delete()
    @@words.delete(self.id)
  end
  def definitions
    Definition.find_by_word(self.id)
  end
end
