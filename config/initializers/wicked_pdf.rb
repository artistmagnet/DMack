# WickedPdf.config = {
#   #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
#   #:layout => "pdf.html",
#   :exe_path => '/usr/bin/wkhtmltopdf'
# }
WickedPdf.config do |config|  
  # if Rails.env == 'production' then
  #   config.exe_path = Rails.root.to_s + "/bin/wkhtmltopdf"
  # else
  #   # config.exe_path = '/usr/bin/wkhtmltopdf'
  #   config.exe_path = Rails.root.to_s + "/bin/wkhtmltopdf"
  # end
end
