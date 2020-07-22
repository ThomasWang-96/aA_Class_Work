# == Schema Information
#
# Table name: cats
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  breed       :string
#
# Table name: toys
#
#  id          :integer      not null, primary key
#  name        :string
#  color       :string
#  price       :integer
#
# Table name: cat_toys
#
#  id          :integer      not null, primary key
#  cat_id      :integer      not null, foriegn key
#  toy_id      :integer      not null, foreign key

require_relative '../data/pg_helper.rb'

def gold_cat_toys
  # Find all the toys that are `Gold` in color and have more than one word in
  # the name.

  # Sort the toys by name alphabetically.

  execute(<<-SQL)
    SELECT toys.name
    FROM toys 
    WHERE toys.color = 'Gold' AND toys.name like '% %'
    ORDER BY toys.name

  SQL
end

def extra_jet_toys
  # `Jet` the cat has a ton of toys! 
  # Find the toys `Jet` has at least two copies of, and the number of copies.
  # Sort the toys by name alphabetically.

  execute(<<-SQL)

    SELECT t.name, COUNT(t.name)
    FROM toys AS t
    JOIN cat_toys AS ct 
         ON t.id = ct.toy_id
    JOIN cats AS c
         ON ct.cat_id = c.id
    WHERE c.name = 'Jet'
    GROUP BY t.name
      HAVING COUNT(t.name) > 1

    ORDER BY t.name

  SQL
end


def cats_with_a_lot
  # Find the names of all cats with more than 7 toys.
  # Sort the cats by cat name alphabetically.

  execute(<<-SQL)
    SELECT c.name
    FROM cats AS c
    JOIN cat_toys AS ct 
         ON c.id = ct.cat_id
    GROUP BY c.id
      HAVING COUNT(ct.toy_id) > 7
    ORDER BY c.name
    
  SQL
end

def just_like_orange
  # Find the breed of the cat named `Orange`.
  # Then list the cats names and the breed of all the cats of Orange's breed.
  # Exclude the cat named `Orange` from your results.
  # Order by cats name alphabetically.

  execute(<<-SQL)

  SELECT c.name, c.breed
  FROM cats AS c
  WHERE c.breed = (
      SELECT c.breed
      FROM  cats AS c
      WHERE c.name = 'Orange'
  ) AND c.name != 'Orange'
   ORDER BY c.name

  SQL
end

def expensive_tastes
  # Find the most expensive `Tiger` toy.
  # Find all the cats that own that specific toy.
  # List the name of the cat, name of the toy, and color of the toy.
  # Sort by cat name alphabetically.
 
  execute(<<-SQL)
    SELECT c.name, t.name, t.color
    FROM cats AS c
    JOIN cat_toys AS ct 
         ON c.id = ct.toy_id
    JOIN toys AS t
         ON ct.toy_id = t.id

    WHERE t.name = 'Tiger' AND t.price = 
    
    ( SELECT t.price
    FROM toys AS t
    WHERE t.name = 'Tiger'
     ORDER BY t.price DESC
    LIMIT 1)

    ORDER BY c.name
    
  SQL
end