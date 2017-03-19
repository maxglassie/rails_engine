class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.most_revenue(quantity)
    query = "SELECT m.id, m.name, sum(it.quantity * unit_price) as revenue
      FROM merchants m
      INNER JOIN invoices i on m.id = i.merchant_id
      INNER JOIN invoice_items it on i.id = it.invoice_id
      GROUP BY m.id, m.name
      ORDER BY revenue DESC
      LIMIT #{quantity}"

    ActiveRecord::Base.connection.execute(query)
  end

  def self.most_items(quantity)
    number = quantity.to_i
      query = "SELECT m.id, m.name, count(it.item_id) as total_sales
        FROM merchants m
        INNER JOIN invoices i on m.id = i.merchant_id
        INNER JOIN invoice_items it on i.id = it.invoice_id
        GROUP BY m.id, m.name
        ORDER BY total_sales DESC
        LIMIT #{number}"

      ActiveRecord::Base.connection.execute(query)
  end

  def self.date(date)
     query = "
        SELECT m.name, i.created_at, sum(it.quantity * unit_price) as revenue
        FROM merchants m
        INNER JOIN invoices i on m.id = i.merchant_id
        INNER JOIN payments p on p.invoice_id = i.id
        INNER JOIN invoice_items it on i.id = it.invoice_id
        where i.created_at = #{date}
          and p.result = 'success'
        GROUP BY m.name, i.created_at"

      ActiveRecord::Base.connection.execute(query)
  end
end
