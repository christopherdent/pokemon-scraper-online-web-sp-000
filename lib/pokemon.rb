require 'pry'


class Pokemon
  attr_accessor :id, :name, :type, :db 

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name 
    @type = type 
    @db = db 

  end 

  def self.save(name, type, db)
    sql = <<-SQL 
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
     
  end 
  
  
  def self.find(id, db)   #find by ID number and return an Object 
    sql = <<-SQL 
      SELECT * FROM pokemon
        WHERE id = ?
        LIMIT 1 
      SQL
      
      db.execute(sql, id).map {|row| self.new_from_db(row[0], row[1], row[2], db)}.first  
  end 
    
  

end
