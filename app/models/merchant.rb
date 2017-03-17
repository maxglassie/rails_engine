class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :payments, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true

  def self.most_revenue(quantity)
    # joins(invoices: [:invoice_items, :payment])
    # .where("payments.result = 'success'")
    # .group(:id)
    # .order("sum(quantity * unit_price) DESC")
    # .limit(quantity)

    # find_by_sql([
    #   "SELECT m.id, m.name, sum(it.quantity * unit_price) as revenue
    #   FROM merchants m
    #   INNER JOIN invoices i on m.id = i.merchant_id
    #   INNER JOIN invoice_items it on i.id = it.invoice_id
    #   GROUP BY m.id, m.name
    #   ORDER BY revenue DESC
    #   LIMIT ?", quantity.to_i])

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
      query = "SELECT m.id, m.name, count(it.item_id) as total_sales
                    FROM merchants m
                    INNER JOIN invoices i on m.id = i.merchant_id
                    INNER JOIN invoice_items it on i.id = it.invoice_id
                    GROUP BY m.id, m.name
                    ORDER BY total_sales DESC
                    LIMIT #{quantity}"

      ActiveRecord::Base.connection.execute(query)
  end

  def self.date(date)
    closing_date = date.
     query = "
     SELECT m.name, p.created_at, sum(it.quantity * unit_price) as revenue
     FROM merchants m
     INNER JOIN invoices i on m.id = i.merchant_id
    INNER JOIN payments p on p.invoice_id = i.id
    INNER JOIN invoice_items it on i.id = it.invoice_id
    where p.created_at between to_date('#{date}', 'YYYY-MM-DD')
      and to_date('2012-03-28','YYYY-MM-DD')
    GROUP BY m.name, p.created_at;"

      ActiveRecord::Base.connection.execute(query)
  end
end
