class Dessert
  def initialize(name, calories)
    # your code here
    @name = name
    @calories = calories
  end
  def healthy?
    # your code here
    if @calories < 200
      return true
    else
      return false
    end
  end
  def delicious?
    # your code here
    return true
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def calories=(calories)
    @calories = calories
  end

  def calories
    @calories
  end

end

class JellyBean < Dessert
  def initialize(flavor)
    # your code here
    @flavor = flavor
    @name = flavor + ' jelly bean'
    @calories = 5
  end

  def flavor=(flavor)
    @flavor = name
  end

  def flavor
    @flavor
  end

  def delicious?
    if @flavor == 'licorice'
      return false
    end
    return true
  end

end
