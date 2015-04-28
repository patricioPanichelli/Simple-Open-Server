class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :provideFile]

  # GET /download/:link
  def show
  end

  # GET /downloads/new
  def new
    @download = Download.new
  end

  # POST /downloads
  # POST /downloads.json
  def create
    @download = Download.new(download_params).buildLink
    respond_to do |format|
      if @download.save
        DownloadMailer.download_email(@download).deliver_later
        format.html { redirect_to root_path, notice: 'In the following 5 minutes, you should receive the download link in your inbox. Also, remember to check the Spam folder!' }
      else
        format.html { render :new }
      end
    end
  end

  def provideFile
    send_file Rails.root.join('private', "#{params[:file_name]}.#{params[:file_extension]}"), :type=>'application/jpg', :x_sendfile=>true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find_by(link: params[:link])
      unless @download
        redirect_to root_path, notice: 'Incorrect download link'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def download_params
      params.require(:download).permit(:firstName, :lastName, :email, :link, :file_name)
    end
end
