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

# ╔═╡ 0bffe5d8-e2b9-11ed-2139-ff79c61ca303
begin
	import Pkg
	Pkg.activate("..")
	using PlutoUI
	include("caesar.jl")
	using .Caesar
end

# ╔═╡ 43c349d0-922f-46ea-80d8-abc4c0eb2b54
html"""<style>
main {
    max-width: 720px;
    align-self: flex-start;
    margin-left: 300px;
}
"""

# ╔═╡ a0114221-a89a-4dc1-8743-8324fbb9e793
html"""
<h1 style="font-size:30px">Κρυπτοσύστημα του Καίσαρα</h1>
"""

# ╔═╡ f9fd3631-a9dc-4973-9a86-362abbd5de9d
begin
	alphabet = [' ', 'Α', 'Β', 'Γ', 'Δ', 'Ε', 'Ζ', 'Η', 'Θ', 'Ι', 'Κ', 'Λ', 'Μ', 'Ν', 'Ξ', 'Ο', 'Π', 'Ρ', 'Σ', 'Τ', 'Υ', 'Φ', 'Χ', 'Ψ', 'Ω']
end

# ╔═╡ 75b51f60-e650-4c83-9691-482a49860e84
md"""
### Κρυπτογράφηση
"""

# ╔═╡ 5dcb8c97-9b66-43fb-8c5a-094cdd35f0f1
md"""
#### Κλειδί
$(@bind key1 NumberField(0:100, default = 0))
"""

# ╔═╡ 97453f16-fd2d-42f7-ae68-86e7cf020578
begin
	using DataStructures
	alphabet_shifted_right = circshift(alphabet,-key1)
	encmap = SortedDict(zip(alphabet,alphabet_shifted_right))
	encmap
end

# ╔═╡ c05c00c6-5718-47be-9de5-c224f833d9eb
md"""
#### Μήνυμα
$(@bind message1 TextField((64,2)))
"""

# ╔═╡ 78c6d5f3-6b89-43c1-bc62-461bdcb56d24
md"""
#### Κρυπτογράφημα
"""

# ╔═╡ b7311065-6f3e-4262-8d26-9b83bf2799fc
print(Caesar.encrypt(key1, message1))

# ╔═╡ 3e2f9a77-4984-4321-ad16-f68e501088a9
md"""
### Αποκρυπτογράφηση
"""

# ╔═╡ d5988756-4713-4d32-8df9-19ee4c4e1356
md"""
#### Κλειδί
$(@bind key2 NumberField(0:100, default = 0))
"""

# ╔═╡ 25f00d6d-e464-4381-af55-bf351e16ed3e
begin
	alphabet_shifted_left = circshift(alphabet,key2)
	decmap = SortedDict(zip(alphabet,alphabet_shifted_left))
	decmap
end

# ╔═╡ 6c816c21-26d1-4074-980f-2f55613e8ef4
md"""
#### Κρυπτογράφημα
$(@bind ciphertext TextField((64,2), default="ΚΑΛΗΜΕΡΑ"))
"""

# ╔═╡ 37d1c11f-0deb-4838-96d5-db899f8ad3d8
md"""
#### Μήνυμα
"""

# ╔═╡ 83c04957-bb56-4da8-a3fc-7b92770b8654
print(Caesar.decrypt(key2, ciphertext))

# ╔═╡ 154b839f-c053-4732-be1c-5da3b08d4311
md"""
### Παραβίαση!
"""

# ╔═╡ 1ce63466-6ca2-4bdd-82e0-1484523e2cbf
md"""
#### Κλειδί
$(@bind txtkey PasswordField(default="0"))
"""

# ╔═╡ 6f336b52-897d-4456-8433-ac15836e8416
key3 = parse(Int, txtkey);

# ╔═╡ 3b68e103-125b-4ac9-8eec-164a0b1d6d80
md"""
#### Μήνυμα
$(@bind hiddenmessage PasswordField(default="Α"))
"""

# ╔═╡ d63c0801-b29f-4512-a874-69fd006690b9
md"""
#### Κρυπτογράφημα
"""

# ╔═╡ 1dbb9f65-e17a-4d9c-ad85-316d850e1742
print(Caesar.encrypt(key3, hiddenmessage))

# ╔═╡ Cell order:
# ╟─43c349d0-922f-46ea-80d8-abc4c0eb2b54
# ╟─0bffe5d8-e2b9-11ed-2139-ff79c61ca303
# ╟─a0114221-a89a-4dc1-8743-8324fbb9e793
# ╟─f9fd3631-a9dc-4973-9a86-362abbd5de9d
# ╟─75b51f60-e650-4c83-9691-482a49860e84
# ╟─5dcb8c97-9b66-43fb-8c5a-094cdd35f0f1
# ╟─97453f16-fd2d-42f7-ae68-86e7cf020578
# ╟─c05c00c6-5718-47be-9de5-c224f833d9eb
# ╟─78c6d5f3-6b89-43c1-bc62-461bdcb56d24
# ╟─b7311065-6f3e-4262-8d26-9b83bf2799fc
# ╟─3e2f9a77-4984-4321-ad16-f68e501088a9
# ╟─d5988756-4713-4d32-8df9-19ee4c4e1356
# ╟─25f00d6d-e464-4381-af55-bf351e16ed3e
# ╟─6c816c21-26d1-4074-980f-2f55613e8ef4
# ╟─37d1c11f-0deb-4838-96d5-db899f8ad3d8
# ╟─83c04957-bb56-4da8-a3fc-7b92770b8654
# ╟─154b839f-c053-4732-be1c-5da3b08d4311
# ╟─1ce63466-6ca2-4bdd-82e0-1484523e2cbf
# ╟─6f336b52-897d-4456-8433-ac15836e8416
# ╟─3b68e103-125b-4ac9-8eec-164a0b1d6d80
# ╟─d63c0801-b29f-4512-a874-69fd006690b9
# ╟─1dbb9f65-e17a-4d9c-ad85-316d850e1742
