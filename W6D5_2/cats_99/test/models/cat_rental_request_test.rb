# == Schema Information
#
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
#
require 'test_helper'

class CatRentalRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
