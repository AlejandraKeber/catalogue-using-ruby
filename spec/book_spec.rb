require 'date'
require_relative '../classes/book'

describe Book do
  context 'When testing the Book Class' do
    it 'should create a book object with a item and their properties' do
      book = Book.new('1996-08-01', 'Bantam Spectra', 'A game of thrones')
      expect(book).to be_instance_of(Book)
      expect(book.publish_date).to eq Date.parse('1996-08-01')
      expect(book.publisher).to eq 'Bantam Spectra'
      expect(book.cover_state).to eq 'A game of thrones'
    end
  end
end
