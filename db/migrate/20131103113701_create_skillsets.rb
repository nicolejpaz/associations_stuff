class CreateSkillsets < ActiveRecord::Migration
  def change
    create_table :skillsets do |t|
      t.belongs_to :user
      t.belongs_to :skill
    end
  end
end
