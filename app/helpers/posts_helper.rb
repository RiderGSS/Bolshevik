module PostsHelper
  def post_category
    Post.categories.keys.map.with_index do |ch,idx|
      [ch, idx]
    end
  end
end
