class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.string :news_url
      t.string :news_img_url

      t.timestamps
    end
  end
end
