# removes the full path to gem so rvm can take care of which gem binary to use

define :rvm_gem, :source => nil, :version => nil, :options => nil do
  include_recipe "rvm"
  gem_package params[:name] do
    gem_binary "gem"
    source params[:source] if params[:source]
    version params[:version] if params[:version]
    options params[:options] if params[:options]
  end
end
