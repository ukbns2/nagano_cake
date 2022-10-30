# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
   def after_sign_in_path_for(resource)
     about_path
   end

   def after_sign_out_path_for(resource)
     about_path
   end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
   end


  before_action :reject_customer, only: [:create]

  protected

  #会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:name])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end


  ##退会しているかを判断するメソッド
  #def customer_state

    ###[処理内容1]入力されたemailからアカウントを1件取得
    #@customer = Customer.find_by(email: params[:customer][:email])

    ###アカウントを取得できなかた場合、このメソッドを終了する
    #return if!@customer

    ###[処理内容2]取得したアカウントのパスワードと入力されたパスワードが一致いているかを判断
    #if @customer.valid_password?(params[:customer][:password])
      #if @customer.valid_password?(params[:customer][:password]) && !@customer.is_valid
       #redirect_to new_customer_session_path
      #end
    #end
  #end

end
