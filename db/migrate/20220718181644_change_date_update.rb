class ChangeDateUpdate < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :date_update, :timestamp, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
