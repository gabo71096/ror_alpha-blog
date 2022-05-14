# frozen_string_literal: true

# add admin boolean column to users
class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
