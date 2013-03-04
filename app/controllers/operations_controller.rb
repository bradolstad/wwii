class OperationsController < ApplicationController
  def index
    @operations = Operation.all
  end

  def show
  end
end
