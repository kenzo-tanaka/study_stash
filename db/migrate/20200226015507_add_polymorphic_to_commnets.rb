class AddPolymorphicToCommnets < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :commentable, polymorphic: true
  end
end
