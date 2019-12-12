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

  validates :applicant_id, :opening_id, presence: true

  belongs_to :applicant,
    class_name: 'User',
    foreign_key: :applicant_id

  belongs_to :opening,
    class_name: 'Opening',
    foreign_key: :opening_id

  has_one :company, through: :opening
 
end
