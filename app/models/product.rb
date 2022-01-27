class Product < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  validates :title, :description, :image_url, presence: true
  validates :title, length: { minimum: 10, message: 'product title is waaaay too short.' }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  # here the `allow_blank` is added so that it doens't return multiple errors, as it is required on the `presence` validation
  validates :image_url, allow_blank: true, format: {
    with: /.+\.((gif)|(jpe?g)|(png))\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validate :image_has_to_exist

  private

  def image_has_to_exist
    return if image_url.blank?

    errors.add(:image_url, "image doesn't exist: #{image_url}") unless asset_exists?(image_url)
  end

  def asset_exists?(path)
    if Rails.env.production?
      all_assets = Rails.application.assets_manifest.find_sources(path)
      if all_assets
        keys = Rails.application.assets_manifest.assets.keys
        if keys.include?(path)
          true
        else
          false
        end
      else
        false
      end
    else
      !Rails.application.assets.find_asset(path).nil?
    end
  end
end
