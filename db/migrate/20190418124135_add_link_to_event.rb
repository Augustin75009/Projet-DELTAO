class AddLinkToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :link, :string, defaut: "https://www.facebook.com/pg/delaterrealobjet/events/"
  end
end
