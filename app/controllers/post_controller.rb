class PostController < ApplicationController
  before_action :authenticate_user!
  def index
    @band = Band.find_by(bandid: params[:id])
  end

  def submit
    @request = Request.new(params_contents)#ここから
    @already = Request.where(bandid: params[:id])
    i = 0
    @already.each do |alreadyeach|
      if alreadyeach.part == @request.part
        alreadyeach.update(params_contents)
        alreadyeach.update(bandid: params[:id])
        alreadyeach.update(another: params[:another])
        alreadyeach.update(ownpart: params[:ownpart])
        alreadyeach.update(monitor: params[:monitor])
        alreadyeach.update(whole: params[:whole])
        @request.destroy
        i +=1
      end
    end
    if i == 0
      @request.bandid = params[:id]
      @request.another = params[:another]
      @request.ownpart = params[:ownpart]
      @request.monitor = params[:monitor]
      @request.whole = params[:whole]
      @request.save#ここまでが新規保存メソッド
    end
    redirect_to("/post/thankyou")
  end

  def thankyou
  end

  def addband
    @band = Band.new(bandname: params[:bandname],bandid: params[:bandid].to_i)
    @band.save
    redirect_to("/OK")
  end

  def deleteband
    @band = Band.find_by(bandid: params[:bandid].to_i)
    @band.destroy
    redirect_to("/OK")
  end

  def deletepost
    @request = Request.new(params_contents)
    @candidate = Request.where(bandid: params[:bandid].to_i)
    @candidate.each do |alreadyeach|
      if alreadyeach.part == @request.part
        alreadyeach.destroy
      end
    end
    @request.destroy
    redirect_to("/OK")
  end

  private

    # ストロングパラメータを使って安全なデータ受け取りを行う
  def params_contents
    # チェックボックスのデータを配列として許可するために、interest: [] とする
    # 修正後のコード
    params.require(:request).permit({part: []},{lowtam: []}, {pad: []}, {key: []})

  end
end
