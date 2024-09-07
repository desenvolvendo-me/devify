# == Schema Information
#
# Table name: contents
#
#  id          :bigint           not null, primary key
#  description :text
#  level       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Content < ApplicationRecord
end
