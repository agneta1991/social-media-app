class UpdateUserAttributes < ActiveRecord::Migration[7.1]
  def change
    user_to_update_tom = User.find_by(name: 'Tom')
    user_to_update_lilly = User.find_by(name: 'Lilly')
    user_to_update_agneta = User.find_by(name: 'Agneta')

    if user_to_update_tom
      user_to_update_tom.update(photo: 'https://www.capitalfm.co.ke/lifestyle/files/2015/01/proud.jpg', bio: 'Hey, I am Tom, a 27-year-old teacher from the heart of Paris, France. My mission is to ignite young minds with knowledge and passion. When I am not in the classroom, I am savoring the rich culture and romantic charm of this beautiful city. 📚🗼💖')
    end

    if user_to_update_lilly
      user_to_update_lilly.update(photo: 'https://images.unsplash.com/photo-1683605390774-6b0c89efab21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHx8&w=1000&q=80', bio: 'Hey, I am Lilly, an adventurous spirit who recently journeyed from Asia in pursuit of a career in the vibrant world of fashion. With a heart full of dreams and a flair for style, I am ready to make my mark. 💃🌟')
    end

    if user_to_update_agneta
    user_to_update_agneta.update(photo: 'https://lietuva.lt/wp-content/uploads/2022/05/Paveikslelis5.jpg', bio: 'Hi there, I am Agneta, a Lithuanian mama who is been juggling the world of marketing communications and advertising while grooving to the rhythm of motherhood. My heart belongs to my toddler and the dance floor. 💃👶📚')
    end
  end
end