require_relative('../db/sql_runner')


class House

  attr_accessor :id,:house_name,:url

  def initialize (options)
    @id=options['id'].to_i if options['id']
    @house_name=options['house_name']
    @url=options['url']
  end


  def save()
    sql = "INSERT INTO houses(house_name,url)
    VALUES($1,$2) RETURNING id"
    values = [@house_name,@url]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map { |house| House.new(house) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end





















end
