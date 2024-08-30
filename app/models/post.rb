class Post < ApplicationRecord
  validates :title,:category,:post,:author,  presence: true
  enum :category, { Обьявления: 0, Новость: 1, Сообшение: 2 , default: 3}, suffix: true
end
