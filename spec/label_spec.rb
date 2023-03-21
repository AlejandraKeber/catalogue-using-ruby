require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  label = Label.new('Gift', 'blue')

  context 'When testing the Label Class' do
    it 'should create a Label instance with its properties' do
      expect(label).to be_instance_of(Label)
      expect(label.title).to eq 'Gift'
      expect(label.color).to eq 'blue'
    end
  end

  context 'When testing Label methods' do
    it 'add_item should add the item to the items array and set self to item.label property' do
      item = Item.new('Action', 'G. Martin', 'Song of ice and fire', 'label', '1996-08-01')
      label.add_item(item)
      expect(label.items).to eq [item]
      expect(item.label).to eq label
    end
  end
end
