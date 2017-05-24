class ChangeDataTypeForCareType < ActiveRecord::Migration
  def change
     change_column :sick_leave_forms, :care_type, 'integer USING CAST(care_type AS integer)'
  end
end
