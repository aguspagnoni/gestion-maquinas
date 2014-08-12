class AddClientRefToFailures < ActiveRecord::Migration
  def change
    add_reference :failures, :client, index: true
  end
end
