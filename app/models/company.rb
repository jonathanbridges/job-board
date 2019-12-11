# == Schema Information
#
# Table name: companies
#
#  id           :bigint           not null, primary key
#  company_name :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Company < ApplicationRecord

  validates :company_name, presence: true

end
