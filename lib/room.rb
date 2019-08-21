class Room 
  
  attr_accessor :title, :date_created, :price, :url
  
  def self.create_from_hash(hash)
    new_from_hash(hash).save
  end
  
  def self.new_from_hash(hash)
    room = self.new_from_hash
    room.title = hash[:title]
  
end