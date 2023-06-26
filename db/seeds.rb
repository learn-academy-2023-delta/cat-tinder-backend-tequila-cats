cats = [
  {
    name: 'Coffee',
    age: 11,
    enjoys: 'Long naps on the couch, and a warm fire.',
    image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
  },
  {
    name: 'Tiger',
    age: 2,
    enjoys: 'Food mostly, really just food.',
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Omelette',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  },
  {
    name: 'Pikachu',
    age: 9,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Cool_Cat_part_5.jpg'
  },
  {
    name: 'Mr.Johnson',
    age: 6,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end
