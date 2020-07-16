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
    include ActionView::Helpers::DateHelper

    COLORS = ['white', 'black', 'yellow', 'blue', 'gray']

    validates :name, :gender, :birth_date, :description, presence:true
    validates :color, inclusion: { in: COLORS }

    has_many :rental_requests, dependent: :destroy,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest

    def age
        now = DateTime.now
        now.year - birth_date.year
    end

    


end
