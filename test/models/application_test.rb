# == Schema Information
#
# Table name: applications
#
#  id           :bigint           not null, primary key
#  applicant_id :integer          not null
#  opening_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
