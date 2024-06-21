include("caesar.jl")
include("/home/tgaref/programming/cryptohack/discrete_log_ff.jl")

using .Caesar

function DH(p, g, a, b)
    A = powermod(g, a, p)
    B = powermod(g, b, p)
    (A, B, powermod(A, b, p))
end

struct DHKey{T}
    a::T
    b::T
    K::T
end

function genkeys(p, g)
    keys = DHKey{Int}[]
    while length(keys) < 3
        a = rand(0:p-1)
        b = rand(0:p-1)
        K = powermod(g, a*b, p)
        push!(keys, DHKey(a, b, K))
    end
    keys
end

function pad(v, n)
    vcat(v, repeat(['*'], n - length(v)))
end

function main()
    
    keys = [DHKey{Int}(4, 13, 5), DHKey{Int}(7, 14, 9), DHKey{Int}(11, 15, 8)]
    message = collect("ΚΑΛΟ ΚΑΛΟΚΑΙΡΙ")
    ctxts = Vector{Char}[]
    n = if mod(length(message), 3) == 0
        div(length(message), 3)
    else
        div(length(message), 3) + 1
    end
    for i in 1:3
        msg = message[i:3:end] |> join
        ctxt = encrypt(keys[i].K, msg)
        push!(ctxts, pad(collect(ctxt), n))
    end
    reshape(permutedims(hcat(ctxts...)), 3*n)[1:length(message)] |> join
end

# message:    "ΚΑΛΟ ΚΑΛΟΚΑΙΡΙ"
# ciphertext: "ΟΚΤΥΙΣΖΥΨΟΚΡΧΣ"

