class Admin::PagesController < Admin::ResourceController
  update.after :expire_cache
  
  def index
    @search = Page.metasearch(params[:search])
    @pages = @search.paginate(:per_page => Spree::Config[:admin_products_per_page], :page => params[:page])
  end
  
  def new
    @page = @object
  end
  
  def edit
    @page = @object
  end
    
  private
  def expire_cache
    expire_page :controller => '/static_content', :action => 'show', :path => @object.slug
  end
end
