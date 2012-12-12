class AdminsHaveAndBelongToManyRoles < ActiveRecord::Migration
  def up
  	create_table :admins_roles, :id => false do |t|
      t.references :admin, :role
  	end
  end

  def down
  	drop_table :admins_roles
  end
end
