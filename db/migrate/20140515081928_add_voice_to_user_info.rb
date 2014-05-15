class AddVoiceToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :voice, :string
  end
end
