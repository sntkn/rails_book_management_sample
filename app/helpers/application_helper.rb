module ApplicationHelper
  def paginate(collection)
    will_paginate collection, renderer: WillPaginate::ActionView::BootstrapLinkRenderer
  end
end
