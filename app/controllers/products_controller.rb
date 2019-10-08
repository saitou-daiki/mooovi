class ProductsController < RankingController
     before_action :authenticate_user!, only: :search
     #

  def index
    # productsテーブルから最新順に作品を２０件取得する
    ##ordeの中は''で囲む。newとsaveは必要ない。initializeを使わないため。
    @products = Product.order('id ASC').limit(20)
     
  
    
  end

  def show
    # productsテーブルから該当するidの作品情報を取得し@productの変数へ代入する処理を書いて下さい
    @product = Product.find(params[:id])
  end

  def search
    # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
    @product = Product.where('titile LIKE(?)',"%#{params[:keyword]}%").limit(20)
    #タイトルを入れる。
    #LIKEの使い方の基本。 moderuclassname.where('検索するカラム名 LIKE(?)',"検索するキーワード")
  end
end
