class User < ActiveRecord::Base
  has_many :skillsets
  has_many :skills, through: :skillsets

  def proficiency_for(skill)
    user_id = self.id
    skill_id = skill.id
    connection = Skillset.where(user_id: user_id, skill_id: skill_id)[0]
    connection[:proficiency]
  end

  def set_proficiency_for(skill, rating)
    user_id = self.id
    skill_id = skill.id
    connection = Skillset.where(user_id: user_id, skill_id: skill_id)[0]
    connection.update_attributes(proficiency: rating)
  end
end
