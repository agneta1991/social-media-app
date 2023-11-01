class UpdateUserimages < ActiveRecord::Migration[7.1]
  def change
    user_to_update_tom = User.find_by(name: 'Tom')
    user_to_update_lilly = User.find_by(name: 'Lilly')

    if user_to_update_tom
      user_to_update_tom.update(photo: 'https://whyy.org/wp-content/uploads/2021/03/bigstock-Young-African-American-Black-M-391197923-768x432.jpg')
    end

    if user_to_update_lily
      user_to_update_lilly.update(photo: 'https://d207ibygpg2z1x.cloudfront.net/image/upload/articles_upload/main/ym0bgms0ftuszlkn7jse.jpg')
    end
  end
end
