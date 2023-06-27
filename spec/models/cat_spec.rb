require 'rails_helper'

# {
#     name: 'Omelette',
#     age: 5,
#     enjoys: 'Furrrrociously hunting bugs.',
#     image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
#   }

RSpec.describe Cat, type: :model do

  it "checking if it has a name" do
   cat = Cat.create(
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  )
  
  expect(cat.errors[:name]).to_not be_empty
  end


  it "checking if it has a age" do
    cat = Cat.create(
     name: 'Omelette',
     enjoys: 'Furrrrociously hunting bugs.',
     image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
   )
   
   expect(cat.errors[:age]).to_not be_empty
   end
   
   
   it "checking if it has an enjoys" do
    cat = Cat.create(
     age: 5,
     name: 'Omelette',
     image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
   )
   
   expect(cat.errors[:enjoys]).to_not be_empty
   end
  

   it "checking if it has an image" do
    cat = Cat.create(
     age: 5,
     name: 'Omelette',
     enjoys: 'Furrrrociously hunting bugs.',
    )
    
    expect(cat.errors[:image]).to_not be_empty
   end
 
   it "checking if enjoys has at least 10 characters" do
    cat = Cat.create(
     age: 5,
     name: 'Omelette',
     enjoys: 'bugs.',
     image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
    )
    
    expect(cat.errors[:enjoys]).to_not be_empty
   end

end
