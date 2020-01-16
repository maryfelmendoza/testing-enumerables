#frozen_string_literal: true

require_relative '../enumerable'

RSpec.describe Enumerable do

  let(:array) { [1, 2, 3, 4] }
  let(:array_new) { [] }


  context '#my_each' do
  
    it 'iterates through an iterable object' do
      array.my_each { |x| array_new.push(x) }
      expect(array_new).to eql([1, 2, 3, 4])
    end

    it 'accepts blocks and apply it to all the elements' do
      array.my_each { |x| array_new.push(x * 5) }
      expect(array_new).to eql([5, 10, 15, 20])
    end
  end

  context '#my_each_with_index' do

    it 'iterates through an iterable object and return current index' do
      array.my_each_with_index { |x, i| array_new.push(i) }
      expect(array_new).to eql([0, 1, 2, 3])
    end

    it 'accepts blocks and apply it to all the elements using the index' do
      array.my_each_with_index { |x, i| array_new.push(x) if i.even? }
      expect(array_new).to eql([1, 3])
    end
  end

  context '#my_select' do

    it 'select a specific values' do
      array.my_select { |x| array_new.push(x) if x.is_a? Integer }  
      expect(array_new).to eql([1, 2, 3, 4])
    end

    it 'return all the even values' do
      array.my_select { |x| array_new.push x if x.even? }  
      expect(array_new).to eql([2, 4])
    end
  end
end
