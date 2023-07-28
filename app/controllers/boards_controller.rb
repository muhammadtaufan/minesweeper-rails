class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      flash[:error] = @board.errors.full_messages
      redirect_to new_board_path
    end
  end

  def show
    @board = Board.find(params[:id])
    if request.headers['Turbo-Frame']
      render :show
    else
      render :show_without_frame
    end
  end

  def index
    @boards = if params[:search]
                Board.order(created_at: :desc).where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(5)
              else
                Board.order(created_at: :desc).page(params[:page]).per(5)
              end
  end

  def all
    @boards = Board.order(created_at: :desc)
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end
end
