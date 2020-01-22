class JsonController < ApplicationController
  def new
  end

  def create
    @filename = params[:file]

    if @filename.respond_to?(:read)
      @content = JSON.parse @filename.read
      ImportJsonService.import(@content)
    end
  end
end
