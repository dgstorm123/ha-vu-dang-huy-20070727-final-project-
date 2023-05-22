class ErrorsController < ApplicationController
    layout 'error'
    def not_found
      render :status => 404
    end
  end
  