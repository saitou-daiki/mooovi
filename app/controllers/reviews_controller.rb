class ReviewsController < RankingController
 before_action :authenticate_user!, only: :new

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create #データの作成や保存をするときはcreate メソッドを使う。引数難しい。
    Review.create(create_params)
    # トップページにリダイレクトする
    redirect_to controller: :products, action: :index
    #actionを使えば後半のインデックスだけで飛ばすことができる？
    # 前半でコントローラーを指定することで、アクションの指定を省くことがおそらくできる。
  end

  private
  def create_params #requireでreviewバリューを取得。premitで三つをキーとする安全面で保証されたハッシュを取得。mergaメソッドで分けられたハッシュを統合。requireでメソッドで取得したハッシュと結合
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
  #ストロングパラメータにnicknameパラメーターの必要なくなった。
  #保存したいからむ: 保存する値, 保存したいからむ: 保存する値。
end
