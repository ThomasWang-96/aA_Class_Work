# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  end_date   :date             not null
#  start_date :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cat_id     :bigint
#
# Indexes
#
#  index_cat_rental_requests_on_cat_id  (cat_id)
#
# Foreign Keys
#
#  fk_rails_...  (cat_id => cats.id)


class CatRentalRequest < ApplicationRecord
  STATUS = ['APPROVED','PENDING','DENIED']
  validates :status, inclusion: {in: STATUS }
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
      CatRentalRequest
        .where('start_date > ? OR end_date < ?', end_date, start_date )
  end
  
  def overlapping_approved_request 
      overlapping_requests.where('status = APPROVED')
  end

  def does_not_overlap_approved_request
      errors[:status] << 'Ooops! Can not rent!' if overlapping_approved_request
  end
  
  

end
