class Board < ApplicationRecord
  before_create :generate_cells
  validates :name, :email, :width, :height, :mines, presence: true
  validates :width, :height, :mines, numericality: { only_integer: true, greater_than: 0 }
  validate :mines_cannot_be_greater_than_cells

  private

  def generate_cells
    cells = Array.new(height) { Array.new(width, 0) }

    # create cell positions
    all_positions = []
    for row in 0...height
      for col in 0...width
        all_positions << [row, col]
      end
    end

    # generate random mine positions for cells board
    mine_positions = all_positions.sample(mines)

    # put mines inside board
    mine_positions.each do |row, col|
      cells[row][col] = 1
    end

    self.cells = cells.map(&:join).join("\n")
  end

  def mines_cannot_be_greater_than_cells
    if width.present? && height.present? && mines.present? && (mines > width * height)
      errors.add(:mines, "can't be greater than total cells")
    end
  end
end
