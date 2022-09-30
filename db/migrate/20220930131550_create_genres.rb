class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      #追加カラム
      t.string :name

      t.timestamps
    end
  end
end
