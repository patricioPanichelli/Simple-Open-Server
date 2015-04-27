class DownloadMailer < ApplicationMailer
	default from: 'notifications@simpleopenserver.com'
	def download_email(download)
		@download = download
		mail(to:@download.email, subject: 'Your SimpleOpenServer download is ready')
	end
end
