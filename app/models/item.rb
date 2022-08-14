class Item < ApplicationRecord
  has_many :myitems, dependent: :destroy
  has_many :myitem_users, through: :myitems, source: :user
  has_many :checklist_items, dependent: :destroy
  has_many :checklists, through: :checklist_items, source: :checklist

  validates :name, presence: true, uniqueness: { scope: :url }
  

  has_one_attached :image

  enum category: { tent: 'テント・タープ', bedding: 'アウトドア用寝具', furniture: 'チェア・テーブル・レジャーシート',
                   light: 'ライト・ランタン', coolerbox: 'クーラーボックス', jug: 'ウォータージャグ', wagon: 'アウトドアワゴン',
                   stove: 'ストーブ・ヒーター・ウォーマー', cooker: 'バーべキュー・クッキング用品', fuel: '燃料',
                   tableware: 'キャンプ用食器', knife: 'ナイフ・マルチツール', other: 'その他', ware: 'ウェア' }
  
end
