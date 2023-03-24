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
end
