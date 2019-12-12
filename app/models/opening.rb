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

class Opening < ApplicationRecord

  validates :company_id, :title, :description, presence: true

  belongs_to :company,
    class_name: 'Company',
    foreign_key: :company_id

  has_many :applications

end
