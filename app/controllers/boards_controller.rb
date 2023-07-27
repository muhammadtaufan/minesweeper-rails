class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.order(created_at: :desc).page(params[:page]).per(5)
  end

  def all
    @boards = Board.order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end
end
