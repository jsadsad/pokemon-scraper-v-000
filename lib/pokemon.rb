class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: , name: ,type: , db:, hp:nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_information = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_information[0], name: pokemon_information[1], type: pokemon_information[2], db: db)
  end
end
