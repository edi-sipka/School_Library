require_relative "spec_helper"

describe Book do 
  before :each do 
    @book = Book.new("Game of Thrones", "JJ Martin")
  end
  
 it "Should have a title" do
  title = @book.title
  expect(title).to eql "Game of Thrones"
 end

 it "Should have a author" do
  author = @book.author
  expect(author).to eql "JJ Martin"
 end
end
