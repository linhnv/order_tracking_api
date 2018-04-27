class Customer < ApplicationRecord
  validates_format_of :external_urls, :with => /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/
end
