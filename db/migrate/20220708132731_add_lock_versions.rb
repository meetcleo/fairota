class AddLockVersions < ActiveRecord::Migration[7.0]
  def change
    add_column :rotas, :lock_version, :bigint
    add_column :members, :lock_version, :bigint
  end
end
