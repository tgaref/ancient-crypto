module onetimepad

export encrypt, decrypt

function encrypt(key::Vector{UInt8}, plaintxt::Vector{UInt8})
  map(⊻, key, plaintxt)
end

decrypt(key::Vector{UInt8}, ciphertxt::Vector{UInt8}) = encrypt(key, ciphertxt)

end # module onetimepad
