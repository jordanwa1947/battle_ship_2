class BoardSetup
attr_reader :one, :two, :three
attr_accessor :a, :b, :c, :d
  def initialize
    @one = "=" * 11
    @two = ". 1 2 3 4"
    @a =   "A        "
    @b =   "B        "
    @c =   "C        "
    @d =   "D        "
    @three = "=" * 11
  end

  def update_board(cord, fill)
    num = cord[1].to_i * 2
    let = cord[0].to_s.upcase
    if let == "A"
      @a[num] = fill
    elsif let == "B"
      @b[num] = fill 
    elsif let == "C"
      @c[num] = fill
    else let == "D"
      @d[num] = fill
    end
  end

  def display_board
    @one
    @two
    @a
    @b
    @c
    @d
    @three
  end
end
