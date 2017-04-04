class Listing < ApplicationRecord
  has_many :reservations
  belongs_to :user
  mount_uploaders :photos, PhotosUploader

  searchkick match: :word_start, searchable: [:name, :location]
end

