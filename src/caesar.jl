module Caesar

export letter2int, int2letter, encrypt, decrypt

const letter2int = Dict('Α' => 0, 'Β' => 1, 'Γ' => 2, 'Δ' => 3,
                        'Ε' => 4, 'Ζ' => 5, 'Η' => 6, 'Θ' => 7,
                        'Ι' => 8, 'Κ' => 9, 'Λ' => 10, 'Μ' => 11,
                        'Ν' => 12, 'Ξ' => 13, 'Ο' => 14, 'Π' => 15,
                        'Ρ' => 16, 'Σ' => 17, 'Τ' => 18, 'Υ' => 19,
                        'Φ' => 20, 'Χ' => 21, 'Ψ' => 22, 'Ω' => 23, ' ' => 24)
                      
const int2letter = Dict( 0 => 'Α', 1 => 'Β', 2 => 'Γ', 3 => 'Δ',
                         4 => 'Ε', 5 => 'Ζ', 6 => 'Η', 7 => 'Θ',
                         8 => 'Ι', 9 => 'Κ', 10 => 'Λ', 11 => 'Μ',
                         12 => 'Ν', 13 => 'Ξ', 14 => 'Ο', 15 => 'Π',
                         16 => 'Ρ', 17 => 'Σ', 18 => 'Τ', 19 => 'Υ',
                         20 => 'Φ', 21 => 'Χ', 22 => 'Ψ', 23 => 'Ω', 24 => ' ')

function encrypt(key::Int, message::String)
    map(c -> int2letter[(letter2int[c] + key) % 25], message)
end

function decrypt(key::Int, ciphertext::String)
    map(c -> int2letter[mod(letter2int[c] - key, 25)], ciphertext)
end

end # module Caesar
