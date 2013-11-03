class UpdateSkillsWithProficiency < ActiveRecord::Migration
  def change
    add_column :skillsets, :proficiency, :integer, default: 0
  end
end
