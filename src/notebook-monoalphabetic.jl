### A Pluto.jl notebook ###
# v0.19.42

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 8ca90fb4-4243-4bdc-98dd-eff371ab2218
begin 
	import Pkg
	Pkg.activate("..")
	include("monoalphabetic.jl")
	using PlutoUI
	using DataStructures
	using .Monoalphabetic
end

# ╔═╡ 7e0768b6-dd0c-4b35-a668-408fbc7d5e7a
html"""<style>
main {
    max-width: 720px;
    align-self: flex-start;
    margin-left: 300px;
}
"""

# ╔═╡ b9c160ad-8f97-40df-8b78-c590ab9789ef
md"""
# Μονοαλφαβητική Αντικατάσταση
"""

# ╔═╡ 9bec017e-c438-4a44-9cbd-f58c542d9dfa
md"""
### Κλειδί
"""

# ╔═╡ baf89552-e34b-11ed-29fd-d78f548a0271
(key_enc, key_dec) = Monoalphabetic.generatekeys(Monoalphabetic.alphabet)

# ╔═╡ c8761252-3a88-4c0a-bda8-c6b8ef35d4af
md"""
### Κρυπτογράφηση
"""

# ╔═╡ 8b1b37d3-01a8-4604-b110-f19a181c6432
md"""
#### Μήνυμα
$(@bind message TextField((64,3)))
"""

# ╔═╡ c3ac5b8d-45d6-42d4-b252-1c2f6216f365
md"""
#### Κρυπτογράφημα
"""

# ╔═╡ 4d58ded0-6204-41e1-af42-a2a8e3501985
print(Monoalphabetic.encrypt(key_enc, message))

# ╔═╡ b7c3899f-f8a1-4288-ab17-c913183f6753
md"""
### Αποκρυπτογράφηση
"""

# ╔═╡ 9d7276cf-3847-41a4-8c03-a2659bfb058f
md"""
#### Κρυπτογράφημα
$(@bind ciphertext TextField((64,3)))
"""

# ╔═╡ f2429981-56f3-4959-8efc-03780423e16b
md"""
#### Μήνυμα
"""

# ╔═╡ 8937479a-9061-4f20-be0c-251bfa6e379b
print(Monoalphabetic.decrypt(key_dec, ciphertext))

# ╔═╡ 7db8fa5c-0749-43c6-b1e1-bb93dce533d6
md"""
### Παραβίαση!
"""

# ╔═╡ 1987c689-9a7e-48ab-9b5e-ae022ac13864
begin
	keys = Monoalphabetic.keys
	ctext = Monoalphabetic.encrypt(keys[1], Monoalphabetic.message)
	nothing
end

# ╔═╡ b1015f8f-fb5d-40d2-8f61-9cd337e438de
md"""
#### Κρυπτογράφημα
"""

# ╔═╡ bb50338e-ddcc-43ff-9649-e6125168fe35
print(ctext)

# ╔═╡ 83e696bf-aaac-4261-a26a-7515c0ea66b5
html"""
<h3 style="color:orange">Γνωρίζετε ότι έχω "υπογράψει" το μήνυμα με το όνοματεπώνυμο μου!</h3>
"""

# ╔═╡ 89b00328-27de-4e93-ad9d-3bd58497eaa7
testkey = SortedDict(
	'Α' => '*', 'Β' => '*', 'Γ' => '*', 'Δ' => '*', 'Ε' => '*', 'Ζ' => '*',
	'Η' => '*', 'Θ' => '*', 'Ι' => '*', 'Κ' => '*', 'Λ' => '*', 'Μ' => '*',
	'Ν' => '*', 'Ξ' => '*',	'Ο' => '*',	'Π' => '*', 'Ρ' => '*',	'Σ' => '*',
	'Τ' => '*',	'Υ' => '*',	'Φ' => '*',	'Χ' => '*',	'Ψ' => '*',	'Ω' => '*',	
	' ' => '*');

# ╔═╡ 7d7d0fbd-928b-44d6-82ab-930f1760933a
print(Monoalphabetic.decrypt(testkey, ctext))

# ╔═╡ Cell order:
# ╟─7e0768b6-dd0c-4b35-a668-408fbc7d5e7a
# ╟─8ca90fb4-4243-4bdc-98dd-eff371ab2218
# ╟─b9c160ad-8f97-40df-8b78-c590ab9789ef
# ╟─9bec017e-c438-4a44-9cbd-f58c542d9dfa
# ╟─baf89552-e34b-11ed-29fd-d78f548a0271
# ╟─c8761252-3a88-4c0a-bda8-c6b8ef35d4af
# ╟─8b1b37d3-01a8-4604-b110-f19a181c6432
# ╟─c3ac5b8d-45d6-42d4-b252-1c2f6216f365
# ╟─4d58ded0-6204-41e1-af42-a2a8e3501985
# ╟─b7c3899f-f8a1-4288-ab17-c913183f6753
# ╟─9d7276cf-3847-41a4-8c03-a2659bfb058f
# ╟─f2429981-56f3-4959-8efc-03780423e16b
# ╟─8937479a-9061-4f20-be0c-251bfa6e379b
# ╟─7db8fa5c-0749-43c6-b1e1-bb93dce533d6
# ╟─1987c689-9a7e-48ab-9b5e-ae022ac13864
# ╟─b1015f8f-fb5d-40d2-8f61-9cd337e438de
# ╟─bb50338e-ddcc-43ff-9649-e6125168fe35
# ╟─83e696bf-aaac-4261-a26a-7515c0ea66b5
# ╠═89b00328-27de-4e93-ad9d-3bd58497eaa7
# ╟─7d7d0fbd-928b-44d6-82ab-930f1760933a
