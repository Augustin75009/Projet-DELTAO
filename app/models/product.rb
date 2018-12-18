class Product < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    monetize :amount_cents
end
