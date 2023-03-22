require './classes/label'

module LabelModule
  module_function

  @list_of_labels = []

  def add_label_ui
    puts '*- Labels -*'
    list_all_labels
    print "\nSelect a label [number on the list] or create a new label [0]: "
    label = gets.chomp
    select_create_label(label)
  end

  def list_all_labels
    puts 'Label list is empty, please create a new one' if @list_of_labels.empty?
    @list_of_labels.each_with_index do |label, index|
      puts "#{index + 1} - Title: #{label.title} Color: #{label.color}"
    end
  end

  def create_label
    puts "\n*- New Label -*"
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def filter_label(index)
    @list_of_labels.each_with_index do |label, i|
      return label if i == index
    end
  end

  def select_create_label(index)
    index = index.to_i
    return 'Invalid number' unless index <= @list_of_labels.length && index >= 0

    if index.zero?
      new_label = create_label
      @list_of_labels << new_label unless @list_of_labels.include?(new_label)
      new_label
    else
      filter_label(index - 1)
    end
  end
end
