class ApplicationController < ActionController::Base
  # devise利用の機能(ユーザー登録やログイン認証等)を使う前に、configure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # サインアップの際に「name」のデータ操作を許可する ストロングパラメータと同様の機能
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
