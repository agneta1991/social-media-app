class UpdatePostAttributes < ActiveRecord::Migration[7.1]
  def change
    post_to_update_by_tom_one = Post.find_by(id: 1)
    post_to_update_by_tom_two = Post.find_by(id: 2)
    post_to_update_by_tom_three = Post.find_by(id: 3)
    post_to_update_by_tom_four = Post.find_by(id: 4)
    post_to_update_by_tom_five = Post.find_by(id: 5)
    post_to_update_by_lilly = Post.find_by(id: 6)
    post_to_update_by_agneta_seven = Post.find_by(id: 7)
    post_to_update_by_agneta_eight = Post.find_by(id: 8)

    if post_to_update_by_tom_one
      post_to_update_by_tom_one.update(title: 'Bonjour, world! 🌍 Exploring the City of Love with Fresh Eyes', text: 'Salut everyone! Today, I am taking a break from the classroom to rediscover the enchanting streets of Paris. It is always a thrill to wander through these historic alleys and soak up the citys romantic vibes. From hidden bookshops to cozy cafés, there is always something new to explore. If you have any secret spots you would like to share, I am all ears! 🗺️💕 #ParisianAdventures #ExploringTheCityOfLove')
    end

    if post_to_update_by_tom_two
      post_to_update_by_tom_two.update(title: 'A Teachers Toolbox: Books, Passion, and Inspiration 📚✨', text: 'Teaching is not just a job; it is my calling. I love inspiring my students to chase their dreams and embrace knowledge. Today, I want to know what inspires you! Whether it is a book, a movie, or a life-changing moment, share your sources of motivation with me. Lets keep the inspiration flowing! 📖💫 #PassionForTeaching #IgniteYoungMinds')
    end

    if post_to_update_by_tom_three
      post_to_update_by_tom_three.update(title: 'Lazy Sunday Afternoons in Montmartre 🎨☕', text: 'Nothing beats a leisurely Sunday in Montmartre, sipping on coffee while gazing at the local artists work. The art, the atmosphere, and the history of this neighborhood are a true Parisian treasure. What is your favorite way to unwind on a lazy weekend? Share your relaxation rituals with me! ☕🖼️ #MontmartreMagic #WeekendVibes')
    end

    if post_to_update_by_tom_four
      post_to_update_by_tom_four.update(title: 'Cultural Immersion: The Louvres Endless Wonders 🏛️🤯', text: 'The Louvre is more than just a museum; it is a world of wonder. Today, I immersed myself in its vast collection, and it is impossible to see it all in one go. From the Mona Lisas smile to the captivating Egyptian artifacts, it is a journey through time and art. Have you explored any incredible museums lately? Share your favorite art experiences! 🖼️🌟 #ArtisticAdventures #LouvreLove')
    end

    if post_to_update_by_tom_five
      post_to_update_by_tom_five.update(title: 'Eiffel Tower Sunsets: A Love Affair Continues 🌇❤️', text: 'Paris sunsets are like no other, and there is no better place to watch them than from the Eiffel Tower. This iconic landmark never ceases to amaze me. It is a testament to human creativity and a symbol of love. What is your favorite view in your hometown? Share the beauty that inspires you every day! 🗼🌆 #EiffelSunsets #CityOfLove')
    end

    if post_to_update_by_lilly
      post_to_update_by_lilly.update(title: 'Embarking on a Fashion Odyssey 💃🌎', text: 'My journey in the world of fashion has been an incredible adventure! From the vibrant streets of Asia to fashion meccas around the globe, I have explored diverse styles and witnessed the universal language of fashion. 🌏✨ Every city I have visited has its unique charm and style inspiration. Whether it is the traditional elegance of my hometown or the cutting-edge trends in fashion capitals, I have found beauty and creativity everywhere.')
    end

    if post_to_update_by_agneta_seven
      post_to_update_by_agneta_seven.update(title:  "Dancing Through Life with My Little Star 🌟", text: 'Hey everyone! Life as a working mama is a real juggling act, but I wouldnt have it any other way. My heart belongs to my adorable toddler, whose giggles and little adventures make every day brighter. From marketing to bedtime stories, my days are a whirlwind of fun and creativity. We have been grooving on the dance floor lately, and it is pure joy. Here is to the working mamas who embrace the balancing act – keep grooving to your unique tune! 💃👶❤️ #MomLife #WorkingMama #DanceTogether')
    end

    if post_to_update_by_agneta_eight
      post_to_update_by_agneta_eight.update(title: "Weekend Adventure Vibes with My Little Explorer 🌄👣", text: 'Hey there, lovely friends! 🌼 We have got our adventure hats on this weekend. 🧢 My toddler and I are off on a nature expedition. 🌳🔍 From muddy boots to curious giggles, every moment spent exploring with my little one is pure magic. 🌟 The world is their playground, and I am just here to witness the wonder in their eyes. Here is to embracing the great outdoors and the joy of simple moments! 🌞👶❤️ #WeekendAdventure #NatureExploration #ParentingBliss')
    end

  end
end