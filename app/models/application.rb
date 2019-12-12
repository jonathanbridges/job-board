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

class Application < ApplicationRecord
end
