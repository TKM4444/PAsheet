class ViewController < ApplicationController
  before_action :authenticate_user!
  def top
    @bands = Band.order(bandid: :asc)
  end

  def index
    @band = Band.find_by(bandid: params[:id])
    @beforechange = Request.where(bandid: params[:id]) #並べ替え前
    @beforechange.each do |change| #バンドメンバーに対して繰り返し
      i = 0
      change.part.each do |number| #パート配列から数字を取得
        i += number.to_i
      end
      change.partnumber = i #各メンバーのpartnumberカラムにパートに割り振った数字の合計を入れる
      change.save #保存
    end

    @requests = @beforechange.order(partnumber: :desc) #パートナンバーが大きい方から表示
  end
end
