require_relative '../classes/author'

describe 'Test Author class' do
  author = Author.new('Alejandra', 'Keber')

  it 'takes parameters and returns an author object' do
    expect(author).to be_instance_of(Author)
  end

  it "author first name should be 'Alejandra'" do
    expect(author.first_name).to eql 'Alejandra'
  end

  it "author last name should be 'Keber'" do
    expect(author.last_name).to eql 'Keber'
  end

  it '#add_item adds self to item as well' do
    item = Item.new(publish_date: '2020-10-10')
    author.add_item(item)
    expect(autor.items.include?(item)).to be true
  end
end
