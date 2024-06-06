class ApplicationController < ActionController::Base
  # devise利用の機能(ユーザー登録やログイン認証等)を使う前に、configure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ログインできていなければログイン画面にリダイレクトする。dash_boards画面時もﾒｯｾｰｼﾞ表示するためalert記述。
  def sign_in_required
    redirect_to new_user_session_url, alert: "ログインもしくはアカウント登録してください。" unless user_signed_in?
  end

  # サインアップの際に「name」のデータ操作を許可する ストロングパラメータと同様の機能
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
