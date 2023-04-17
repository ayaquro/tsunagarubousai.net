class GeneralUser::InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  #お問い合わせ確認画面
  #def confirm
    #@inquiry = Inquiry.new(inquiry_params)
    #入力内容が無効の場合
    #if @inquiry.invalid?
      #render :new
    #end
  #end

  #backアクションにより入力内容に誤りがあった場合は、入力内容を保持したまま前のページに戻る
  def back
    @inquiry = Inquiry.new(inquiry_params)
    render :new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  #送信完了画面
  def done
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :subject, :message)
  end
end
