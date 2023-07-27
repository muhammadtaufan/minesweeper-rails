require 'rails_helper'

RSpec.describe 'boards/new.html.erb', type: :view do
  before do
    assign(:board, Board.new)
    render
  end

  it 'displays the form to create a new board' do
    assert_select 'form' do
      assert_select 'input[name=?]', 'board[name]'
      assert_select 'input[name=?]', 'board[email]'
      assert_select 'input[name=?]', 'board[width]'
      assert_select 'input[name=?]', 'board[height]'
      assert_select 'input[name=?]', 'board[mines]'
      assert_select 'input[type=?]', 'submit'
    end
  end
end
