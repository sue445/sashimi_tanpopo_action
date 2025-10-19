update_file "test/test.txt" do |content|
  content.gsub!("name", params[:name])
  content.gsub!("lang", params[:lang])
end
