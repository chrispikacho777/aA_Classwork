require 'rspec'
require 'tdd'



describe '#my_uniq' do
    it 'removes duplicates' do 
        expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
end

describe '#two_sum' do
    it 'finds all pairs of positions where elements at those positions sum to zero' do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end

describe '#my_transpose' do 
    it 'transposes 2D array' do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

end

describe '#stock_picker' do 
    it 'returns the pair of days where you would see most profit' do 
        expect(stock_picker([5,7,4,10,15])).to eq([4, 15])
    end
end


    
