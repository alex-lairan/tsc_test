# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  date       :datetime
#  status     :integer
#  service_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
