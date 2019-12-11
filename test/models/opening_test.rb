# == Schema Information
#
# Table name: openings
#
#  id          :bigint           not null, primary key
#  company_id  :integer          not null
#  title       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class OpeningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
