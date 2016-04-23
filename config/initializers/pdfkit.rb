PDFKit.configure do |config|  
  if Rails.env == 'production' then
    config.wkhtmltopdf = "app/bin/wkhtmltopdf"
  else
    # config.exe_path = '/usr/bin/wkhtmltopdf'
    config.wkhtmltopdf = Rails.root.to_s + "/bin/wkhtmltopdf"
  end

  config.default_options = {
    # :page_size=>"Letter",
    # :margin_top=>"0.25in",
    # :margin_right=>"0.1in",
    # :margin_bottom=>"0.25in",
    # :margin_left=>"0.1in",
    # :disable_smart_shrinking=> false
  }
end
