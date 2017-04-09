class CreateOffersContents < ActiveRecord::Migration
  def change
    create_table :offers_contents do |t|
      t.text :content
      t.references :job_offer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
