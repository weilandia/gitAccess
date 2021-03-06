module GithubViews
  def view_dir(repo)
    get("/repos/#{@user.nickname}/#{repo}/contents/app/views?ref=master")
  end

  def views(view_sub_dir, repo)
    get("/repos/weilandia/#{repo}/contents/app/views/#{view_sub_dir}?ref=master")
  end
end
