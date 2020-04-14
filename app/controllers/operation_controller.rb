class OperationController < ApplicationController
  
  def top
    @user=User.find_by(id: params[:id])
  end

  def service
    @user=User.find_by(id: params[:id])
  end

  def company
    @user=User.find_by(id: params[:id])
  end

  def system
    @user=User.find_by(id: params[:id])
  end

  def contact
    @user=User.find_by(id: params[:id])
  end
end
