class Board < ApplicationRecord
  before_create :generate_cells
  validates :name, :email, :width, :height, :mines, presence: true
  validates :width, :height, :mines, numericality: { only_integer: true, greater_than: 0 }
  validate :mines_cannot_be_greater_than_cells

  private

  def generate_cells
    cells = Array.new(height) { Array.new(width, 0) }

    mines.times do
      while true
        row = rand(height)
        col = rand(width)
        if cells[row][col] == 0
          cells[row][col] = 1
          break
        end
      end
    end

    self.cells = cells.map(&:join).join("\n")
  end

  def mines_cannot_be_greater_than_cells
    errors.add(:mines, "can't be greater than total cells") if mines > width * height
  end
end
