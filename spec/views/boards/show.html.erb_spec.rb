require 'rails_helper'

RSpec.describe 'boards/show.html.erb', type: :view do
  before(:each) do
    @board = assign(:board, Board.create!(
                              name: 'Test Board',
                              email: 'test@example.com',
                              width: 5,
                              height: 5,
                              mines: 3,
                              cells: "00000\n00000\n00000\n00000\n00000"
                            ))
  end

  it 'renders board details' do
    render
    expect(rendered).to match(/Test Board/)
    expect(rendered).to match(/test@example.com/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/3/)
  end

  it 'renders the board cells' do
    render
    assert_select 'div.cells', count: 5
    assert_select 'div.mines', count: 3
    assert_select 'div.boards', count: 25
  end

  it 'renders back link' do
    render
    assert_select 'a[href=?]', boards_path, text: 'Back'
  end
end
