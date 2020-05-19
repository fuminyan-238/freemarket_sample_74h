class Item < ApplicationRecord
  # belongs_to :user
  # 未実装テーブルのアソシエーションはコメントアウト
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  # belongs_to :category
  belongs_to :brand

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand

  validates_associated :images
  validates :name, :images, :explanation, :item_status_id, :postage_type_id,
  :postage_burden_id, :shipping_area_id, :shipping_date_id, :trading_status_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 100000000}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_status
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :postage_burden
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :trading_status
end
