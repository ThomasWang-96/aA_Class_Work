require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...

  return @columns if @columns  

  result =  DBConnection.execute2(<<-SQL).first
  SELECT
    *
  FROM
    "#{self.table_name}"
  LIMIT 0
  SQL

  result.map! {|ele| ele.to_sym}
  @columns = result
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do 
       self.attributes[column]
      end
      define_method("#{column}=") do |val|
        self.attributes[column] = val
      end
    end

  end

  def self.table_name=(table_name)
    # ...
   @table_name = table_name
  end

  def self.table_name
    # ...
   @table_name ||= "#{self}".tableize
  end

  def self.all
    # ...
    result = DBConnection.execute(<<-SQL)
      SELECT 
        "#{table_name}".*
      FROM
         "#{table_name}"
    SQL

    parse_all(result)

  end

  def self.parse_all(results)
    # ...
    new_arr = []
    results.each do |result|
      new_arr << self.new(result)
    end
    new_arr
  end

  def self.find(id)
    # ...
     result = DBConnection.execute(<<-SQL, id)
        SELECT
           #{table_name}.*
        FROM
           #{table_name}
        WHERE 
           #{table_name}.id = ?
     SQL
      parse_all(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |k, v|
      k = k.to_sym
      if self.class.columns.include?(k)
        self.send("#{k}=", v)
      else
        raise "unknown attribute '#{k}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    # ...
    self.class.columns.map {|ele| self.send(ele)}
  end

  def insert
    # ...
    # col_names = self.class.columns.join(',')
    # question_marks = Array.new(self.attribute_values.length, "?")

    #  result = DBConnection.execute(<<-SQL, self.attribute_values)
    #     INSERT INTO
    #       col_names
    #     VALUES
    #       question_marks

    #  SQL
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_sym).join(",")
    question_marks = (["?"] * columns.count).join(",")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
   
  
  end

  def update
    # ...

    set_line = self.class.columns.map {|ele| "#{ele} = ?"}.join(",")

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE 
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?

    SQL
    
  end

  def save
    # ...
    if self.id 
      self.update
    else
      self.insert
    end
  end
end
