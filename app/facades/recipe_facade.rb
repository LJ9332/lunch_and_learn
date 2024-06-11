class RecipeFacade 
  def self.recipes
    response = RecipeService.call_db('recipes')
    response[:results].map { |r| RecipeClass.new(r) }
  end
end