class PrivacyLevel < ActiveRecord::Base
  belongs_to :galaxy

  def display_privacy_levels
    "#{display} - #{description}"
  end
end
