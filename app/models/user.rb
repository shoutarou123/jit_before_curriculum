class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :name, presence: true, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable  
end

# database_authenticatable
# サインイン時にユーザーの正当性を検証するためにパスワードを暗号化してDBに登録します。
# 認証方法としてはPOSTリクエストかHTTP Basic認証が使えます。

# registerable
# 登録処理を通してユーザーをサインアップします。また、ユーザーに自身のアカウントを編集したり削除することを許可します。

# recoverable
# パスワードをリセットし、それを通知します。

# rememberable
# 保存されたcookieから、ユーザーを記憶するためのトークンを生成・削除します。

# validatable
# Emailやパスワードのバリデーションを提供します。独自に定義したバリデーションを追加することもできます。

# confirmable
# メールに記載されているURLをクリックして本登録を完了する、といったよくある登録方式を提供します。
# また、サインイン中にアカウントが認証済みかどうかを検証します。

# lockable
# 一定回数サインインを失敗するとアカウントをロックします。
# ロック解除にはメールによる解除か、一定時間経つと解除するといった方法があります。

# timeoutable
# 一定時間活動していないアカウントのセッションを破棄します。

# trackable
# サインイン回数や、サインイン時間、IPアドレスを記録します。

# omniauthable
# intridea/omniauthをサポートします。TwitterやFacebookなどの認証を追加したい場合はこれを使用します。