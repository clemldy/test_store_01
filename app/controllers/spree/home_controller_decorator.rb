Spree::HomeController.class_eval do
  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products.sample(8)
    @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
    @taxons = Spree::Taxon.all
  end
end
