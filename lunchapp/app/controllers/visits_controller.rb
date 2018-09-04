def import
  Visit.import(params[:file])
  redirect_to root_url, notice: "Products imported."
end
