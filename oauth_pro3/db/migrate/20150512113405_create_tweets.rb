class CreateTweets < ActiveRecord::Migration
    def change
        create_table :tweets do |t|
            t.text :content
            t.string :name
            t.string :userid, :limit => 20
            t.text :userimage
            
            t.timestamps null: false
        end
    end
end