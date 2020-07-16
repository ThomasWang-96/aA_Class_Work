# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text             not null
#  gender      :string(1)        not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::DateHelpers

    COLORS = ['white', 'black', 'yellow', 'blue', 'gray']

    validates :name, :gender, :birth_date, :description, presence:ture
    validates :color, inclusion: { in: COLORS }

    def age
        now = DateTime.now
        now.year - birth_date.year
    end


end
