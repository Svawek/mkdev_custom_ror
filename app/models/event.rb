class Event < ApplicationRecord
  validates :title, :location, :starttime, :organizeremail, :organizertelegram, presence: true
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
