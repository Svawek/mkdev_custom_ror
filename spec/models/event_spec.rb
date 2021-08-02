require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :location }
  it { should validate_presence_of :starttime }
  it { should validate_presence_of :organizeremail }
  it { should validate_presence_of :organizertelegram }
end

# == Schema Information
#
# Table name: events
#
#  id                :bigint           not null, primary key
#  description       :text
#  endtime           :datetime
#  link              :string
#  location          :string           not null
#  organizeremail    :string           not null
#  organizertelegram :string           not null
#  starttime         :datetime         not null
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
