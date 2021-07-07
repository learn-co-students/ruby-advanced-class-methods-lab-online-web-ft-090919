class Person
  attr_accessor :name, :age, :company
 
  def self.new_from_csv(csv_data)
    # Split the CSV data into an array of individual rows.
    rows = csv_data.split("\n")
    # For each row, let's collect a Person instance based on the data
    people = rows.collect do |row|
      # Split the row into 3 parts, name, age, company, at the ", "
      data = row.split(", ")
      name = data[0]
      age = data[1]
      company = data[2]
 
      # Make a new instance
      person = self.new # self refers to the Person class. This is Person.new
      # Set the properties on the person.
      person.name = name
      person.age = age
      person.company = company
      # Return the person to collect
      person
    end
    # Return the array of newly created people.
    people
  end
end