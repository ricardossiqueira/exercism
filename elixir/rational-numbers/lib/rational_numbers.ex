defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, b1}, {a2, b2}) when a1 * b2 + a2 * b1 == 0, do: {0, 1}
  def add({a1, b1}, {a2, b2}), do: {a1 * b2 + a2 * b1, b1 * b2}

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, b1}, {a2, b2}) when a1 * b2 - a2 * b1 == 0, do: {0, 1}
  def subtract({a1, b1}, {a2, b2}), do: {a1 * b2 - a2 * b1, b1 * b2}

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) when b1 == a2, do: {a1, b2}
  def multiply({a1, b1}, {a2, b2}) when -b1 == a2, do: {-a1, b2}
  def multiply({a1, _}, {a2, _}) when a1 * a2 == 0, do: {0, 1}
  def multiply({a1, b1}, {a2, b2}), do: {a1 * a2, b1 * b2}

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) when a2 < 0, do: {-a1 * b2, b1 * -a2}
  def divide_by({a1, b1}, {a2, b2}), do: {a1 * b2, b1 * a2}

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, a2}), do: {:math.sqrt(:math.pow(a1, 2)), :math.sqrt(:math.pow(a2, 2))}

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({a1, a2}, n), do: {:math.pow(a1, n), :math.pow(a2, n)}

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a1, a2}), do: :math.pow(x, a1 / a2)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a, i \\ 2)
  def reduce({a1, a2}, _) when rem(a1, a2) == 0, do: reduce({a1 / a2, a2 / a2})
  def reduce({a1, a2}, _) when rem(a2, a1) == 0, do: reduce({a1 / a1, a2 / a1})

  def reduce({a1, a2}, i) when rem(a1, i) != 0 and i <= a1 / 2,
    do: reduce({a1, a2}, i + 1)

  def reduce({a1, a2}, i) when rem(a1, i) == 0 and rem(a2, i) == 0,
    do: {a1 / i, a2 / i}

  def reduce({a1, a2}, _) when a2 < 0, do: {-a1, -a2}
  def reduce(a, _), do: a
end
