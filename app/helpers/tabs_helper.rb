module TabsHelper
  def add_active_class(path)
    'active' if currenr_page?(path)
  end
end