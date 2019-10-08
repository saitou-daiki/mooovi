# class RankingController < ApplicationController
#   layout 'review_site'
#   before_action :ranking
#   def ranking
      
#     # @ranking = Product.group(product_id :review).order('review DESK').limit(5)
#     # @product = @rankin.map(|review| review * review)
#     product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
#     @ranking = product_ids.map{ |id| Product.find(id) }
#     #グループメソッドで一つのからむごとにレコードをまとめる。
#     #DESCによって多い順にソートする
#     #リミットで上位５つのまとまりを取得する。
#     #countで上位五件のIDが順番に並んだ配列を取得。

#     #mapメソッドは配列の中身一つ一つに対して一定の処理を行い、配列のものとの場所に戻したものを返り血する。
#     #要は配列としてくっつけたものを元の形に戻して＠ランキングに戻す
#     #そして、上位五件が並んだ配列がランキングに代入される。
    
#   end
# end

class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking
  def ranking
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
  end
end