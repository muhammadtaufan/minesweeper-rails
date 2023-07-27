require 'rails_helper'

RSpec.describe 'Boards', type: :request do
  describe 'GET #new' do
    it 'assigns a new Board to @board' do
      get new_board_path
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe 'POST #create' do
    context 'with valid parameter' do
      it 'generate a new board' do
        expect do
          post boards_path, params: { board: attributes_for(:board) }
        end.to change(Board, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new board' do
        expect do
          post boards_path, params: { board: attributes_for(:board, name: nil) }
        end.not_to change(Board, :count)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested board to @board' do
      board = create(:board)
      get board_path(board)
      expect(assigns(:board)).to eq board
    end
  end

  describe 'GET #index' do
    it 'populates an array of boards' do
      board = create(:board)
      get boards_path
      expect(assigns(:boards)).to eq([board])
    end
  end
end
