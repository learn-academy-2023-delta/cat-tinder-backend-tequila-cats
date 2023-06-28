require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
   it "will show all cats" do
    Cat.create(
      {
    name: 'Omelette',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
  }
    )
    get '/cats'

    cat = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(cat.length).to eq 1
   end
  end
  describe "POST /create" do
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
    cat: {
    name: 'Mr.Johnson',
    age: 6,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
}
  }
  
    post '/cats', params: cat_params

    expect(response).to have_http_status(200)
    cat = Cat.first
    expect(cat.name).to eq 'Mr.Johnson'
    end
  end
  
  describe "PATCH /update" do
    it "updates a cat" do
      Cat.create(
      {
    name: 'Mr.Johnson',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
  }
    )
      
  updated_cat_params = {
    cat: {
    name: 'Mr.Johnson',
    age: 7,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
}
}
      
    cat = Cat.first
    patch "/cats/#{cat.id}", params: updated_cat_params
        
    expect(response).to have_http_status(200)
    updated_cat = Cat.find(cat.id)
    expect(updated_cat.age).to eq 7
    end
  end

  describe "DELETE / destroy" do
   it "deletes a cat" do
        Cat.create(
    {
    name: 'Mr.Johnson',
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
}
        )
    cat = Cat.first
    delete "/cats/#{cat.id}"
    
    expect(response).to have_http_status(200)
      end
      end
           
   describe "can not create cat without valid attributes" do
    it "does not creat cat without name" do
      cat_params = {
    cat: {
    age: 5,
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
      }
    }
    post "/cats", params: cat_params

    expect(response.status).to eq 422
    cat = JSON. parse(response.body)
    expect(cat['name']).to include "can't be blank"
    end


    it "does not create cat without age" do
    cat_params = {
    cat: {
    name: 'Mr.Johnson',
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
    }
        }
  post "/cats", params: cat_params

  expect(response.status).to eq 422
  cat = JSON. parse(response.body)
  expect(cat['age']).to include "can't be blank"
    end

    it "does not create cat without enjoys" do
    cat_params = {
    cat: {
    age: 5,
    name: 'Mr.Johnson',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
        }
         }
   post "/cats", params: cat_params

   expect(response.status).to eq 422
   cat = JSON. parse(response.body)
   expect(cat['enjoys']).to include "can't be blank"
     end

   it "does not create cat without image" do
    cat_params = {
      cat: {
      age: 5,
      name: 'Mr.Johnson',
      enjoys: 'Furrrrociously hunting bugs.',
      }
    }
    post "/cats", params: cat_params

    expect(response.status).to eq 422
    cat = JSON. parse(response.body)
    expect(cat['image']).to include "can't be blank"
      end
     end
        
   describe "can not update cat without valid attributes" do
    it "does not update cat without name" do
    cat_params = {
      cat: {
      age: 5,
      name: 'Mr.Johnson',
      enjoys: 'Furrrrociously hunting bugs.',
      image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
      }
    }
    post "/cats", params: cat_params
    cat = Cat.first
    updated_cat_params = {
      cat: {
      age: 5,
      name:'',
      enjoys: 'Furrrrociously hunting bugs.',
      image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
      }
    }
        
    patch "/cats/#{cat.id}", params: updated_cat_params 
    cat = JSON.parse(response.body)
    expect(response).to have_http_status 422 
    expect(cat['name']).to include "can't be blank"
      end

  it "does not update cat without age" do
    cat_params = {
      cat: {
      age: 5,
      name: 'Mr.Johnson',
      enjoys: 'Furrrrociously hunting bugs.',
      image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
    }
    }
         
              
    post "/cats", params: cat_params
    cat = Cat.first
        
    updated_cat_params = {
      cat: {
      age: '',
      name:'Mr.Johnson',
      enjoys: 'Furrrrociously hunting bugs.',
      image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
      }
    }
          
      patch "/cats/#{cat.id}", params: updated_cat_params 
      cat = JSON.parse(response.body)
      expect(response).to have_http_status 422 
      expect(cat['age']).to include "can't be blank"
        end

  it "does not update cat without enjoys" do
    cat_params = {
      cat: {
      age: 5,
      name: 'Mr.Johnson',
      enjoys: 'Furrrrociously hunting bugs.',
      image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
      }
    }
           
                
    post "/cats", params: cat_params
    cat = Cat.first
      
  updated_cat_params = {
    cat: {
    age: '5',
    name:'Mr.Johnson',
    enjoys: '',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
    }
    }
      
    patch "/cats/#{cat.id}", params: updated_cat_params 
    cat = JSON.parse(response.body)
    expect(response).to have_http_status 422 
    expect(cat['enjoys']).to include "can't be blank"
      end

  it "does not update cat without image" do
   cat_params = {
    cat: {
    age: 5,
    name: 'Mr.Johnson',
    enjoys: 'Furrrrociously hunting bugs.',
    image: 'https://c0.wallpaperflare.com/preview/135/654/456/italy-epic-cat-cats.jpg'
    }
    }
             
                    
    post "/cats", params: cat_params
    cat = Cat.first
    
  updated_cat_params = {
    cat: {
    age: '5',
    name:'Mr.Johnson',
    enjoys: 'Furrrrociously hunting bugs.',
    image: ''
      }
    }

    patch "/cats/#{cat.id}", params: updated_cat_params 
    cat = JSON.parse(response.body)
    expect(response).to have_http_status 422 
    expect(cat['image']).to include "can't be blank"
    end   
  end
        
end
