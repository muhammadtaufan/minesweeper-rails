require 'rails_helper'

RSpec.describe 'boards/index.html.erb', type: :view do
  let(:board) { create(:board) }

  before do
    assign(:boards, Kaminari.paginate_array([board]).page(1))
    render
  end

  it 'displays the board name' do
    expect(rendered).to include(board.name)
  end

  it "displays the board creator's email" do
    expect(rendered).to include(board.email)
  end

  it 'displays the board creation date' do
    expect(rendered).to include(board.created_at.strftime('%d %b %Y %H:%M'))
  end
end
