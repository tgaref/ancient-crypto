module Monoalphabetic

export alphabet, generatekeys, encrypt, decrypt, keys, message

using DataStructures

const alphabet = ['Α', 'Β', 'Γ',
                  'Δ', 'Ε', 'Ζ',
		  'Η', 'Θ', 'Ι',
                  'Κ', 'Λ', 'Μ',
		  'Ν', 'Ξ', 'Ο',
                  'Π', 'Ρ', 'Σ',
		  'Τ', 'Υ', 'Φ',
                  'Χ', 'Ψ', 'Ω', ' ']


function randompermutation(v)
    n = length(v)
    T = eltype(v)
    available = Set{Int}(1:n)
    result = T[]
    for i in 1:n
        j = rand(available)
        push!(result, v[j])
        delete!(available, j)
    end
    result    
end

function generatekeys(alpha)
    perm = randompermutation(alpha)
    key_enc = SortedDict(zip(alpha, perm))
    key_dec = SortedDict(zip(perm, alpha))
    (key_enc, key_dec)
end

const keys = generatekeys(alphabet)

const message = "Η ΚΡΥΠΤΟΓΡΑΦΙΑ ΕΧΕΙ ΠΛΑΚΑ ΘΕΟΔΟΥΛΟΣ ΓΑΡΕΦΑΛΑΚΗΣ"

function encrypt(key::SortedDict{Char, Char}, message::String)
    map(c -> key[c], message)
end

function decrypt(key::SortedDict{Char, Char}, ciphertext::String)
    map(c -> key[c], ciphertext)
end


end # module Monoalphabetic
