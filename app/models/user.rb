class User < ActiveRecord::Base
  has_many :skillsets
  has_many :skills, through: :skillsets

  def make_connection(skill)
    Skillset.where(user_id: self.id, skill_id: skill.id).first
  end

  def proficiency_for(skill)
    make_connection(skill)[:proficiency]
  end

  def set_proficiency_for(skill, rating)
    make_connection(skill).update_attributes(proficiency: rating)
  end

  def over_9000(skill)
    if proficiency_for(skill) >= 9000
      "#{skill[:name]} is over 9000!!!!!!!!!!!!!!!!"
    else
      "Haha, your skill sucks!"
    end
  end
end
