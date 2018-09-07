class BoardSetup
attr_reader :one, :two, :three,
            :a, :b, :c, :d
  def initialize
    @a =   "A        "
    @b =   "B        "
    @c =   "C        "
    @d =   "D        "
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
  puts  "==========="
  puts  ". 1 2 3 4"
  puts  @a
  puts  @b
  puts  @c
  puts  @d
  puts  "==========="
  end
end
