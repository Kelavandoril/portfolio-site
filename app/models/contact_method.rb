class ContactMethod < ApplicationRecord
  has_one_attached :logo
  def scrub_the_link!
    if link_url != nil
      uri = URI.parse(link_url)
      return link_url if %w[http https].include?(uri.scheme)
      nil
    end
  rescue URI::InvalidURIError
    nil
  end

  validates :logo, presence: true
end
