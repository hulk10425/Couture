class MenuService
  def list
    #title,url,action_name
    menu = [['Women','/public/woman','woman'],
    ['Men','/public/man','men'],['Watch','/public/watch','watch'],
    ['Jewelry','/public/jewelry','jewelry'],['beauty','/public/beauty','beauty'],['lifestyle','/public/lifestyle','lifestyle'],
    ['Retailer','/public/retailer','retailer'],['Others','/public/others','others']]
  end

  def listII
  	menu = [['About Couture','/public/about','about'],
    ['Solutions','/public/solutions','solutions'],['Contact Us','/public/contact','contact'],]

  end
end