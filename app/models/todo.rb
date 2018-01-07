class Todo < ApplicationRecord
  validates_presence_of :title, :due_date, :description
  # 用 validates_presence_of 這個指令讓表單中的所有區塊都成為必填項目。當使用者送出沒有滿足必填項目的表單時，在存進資料庫前就會被擋下來。
end
