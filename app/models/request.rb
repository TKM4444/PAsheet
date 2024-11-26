class Request < ApplicationRecord
  has_one_attached :file

  before_destroy :purge_attached_file

  def acceptable_file
    return unless file.attached?

    if file.byte_size > 50.megabytes
      errors.add(:file, "のサイズは50MB以下にしてください。")
    end
  end


  private

  def purge_attached_file
    file.purge_later if file.attached? # ファイルが存在する場合のみ削除を実行
  end
end
