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

# ╔═╡ e57a8056-71c5-4452-a2d9-fa9d68c71440
begin 
	import Pkg
	Pkg.activate("..")
	include("one-time-pad.jl")
	using PlutoUI
	using .onetimepad
end

# ╔═╡ 98f50080-eb20-11ed-08ff-a9b657645fd3
html"""<style>
main {
    max-width: 720px;
    align-self: flex-start;
    margin-left: 300px;
}
"""

# ╔═╡ 1184a08c-fe02-485e-a802-d62a58265b96
html"""
<h1 style="font-size:30px">Σημειωματάριο μίας χρήσης (One Time Pad)</h1>
"""

# ╔═╡ 335781b3-cf83-4218-90e9-0378dcde9338
html"""
<h3><a href = "https://en.wikipedia.org/wiki/ASCII" style="color:blue">Αλφάβητο</a></h3>
"""

# ╔═╡ 944c22c6-57c0-402e-bcbe-0f970c2fe868
md"""
### Kρυπτογράφηση
"""

# ╔═╡ 235bd72f-dcbd-42ca-97c5-c51ceee03ab1
md"""
#### Κλειδί
$(@bind key1hex TextField((64,2), default="0000000000000000000000000000000000000000"))
"""

# ╔═╡ 1814831c-184d-4c52-8b72-fb38a228f035
md"""
#### Μήνυμα
$(@bind msg TextField((64,2), default="Can you see this?"))
"""

# ╔═╡ 450845e5-a82a-469d-8f4f-754c98d73019
begin 
	key1bytes = hex2bytes(key1hex)
	msgbytes = map(x -> UInt8(x), collect(msg))
	nothing
end

# ╔═╡ eb98b99b-2995-42c3-9416-63b10c02c19f
md"""
#### Μήνυμα σε δεκαεξαδικό
"""

# ╔═╡ 18069b12-5093-4844-b89a-8321c2d70857
print(bytes2hex(msgbytes))

# ╔═╡ a286bcdc-21a6-4a24-8039-bc65396d9a81
ciphertextbytes = onetimepad.encrypt(key1bytes, msgbytes);

# ╔═╡ 02e21a78-46cd-4160-9d5a-675621dbbf51
md"""
#### Κρυπτογράφημα
"""

# ╔═╡ 8f31f954-65c5-41c4-84ef-14f3712cbd2c
print(bytes2hex(ciphertextbytes))

# ╔═╡ 9e873441-0d8c-4764-87cd-c92d594c2eed
md"""
### Αποκρυπτογράφηση
"""

# ╔═╡ 49e95029-fa74-40fe-9fd8-b4d9b61f3f34
md"""
#### Κλειδί
$(@bind key2hex TextField((64,2), default="000000"))
"""

# ╔═╡ e91a2ca2-5bfc-4ae8-9ea9-64320fc2e0ca
key2bytes = hex2bytes(key2hex);

# ╔═╡ 072b281d-0a6a-4156-89a9-24161ed13d0e
md"""
#### Κρυπτογράφημα
$(@bind ctext TextField((64,2), default="616263"))
"""

# ╔═╡ 86b7a8d5-82ed-4f20-b2d4-4c141fe1dc27
begin
	ctextbytes = hex2bytes(ctext)
	plaintext = onetimepad.decrypt(ctextbytes, key2bytes)
	nothing
end

# ╔═╡ 15114379-eab0-4811-9f70-cea7fd7318a0
md"""
#### Μήνυμα σε δεκαεξαδικό
"""

# ╔═╡ 1f764e83-2836-44c7-9ca5-649d3407b578
print(bytes2hex(plaintext))

# ╔═╡ 11de8d1c-b7ac-49e8-b694-14d435a2fd37
md"""
#### Μήνυμα
"""

# ╔═╡ 913a5e08-c67b-4db1-b9ef-b8425a36fcc8
print(String(plaintext))

# ╔═╡ b8c46075-dabd-4070-b8a8-9f0b3c6230b6
md"""
### Παρατηρήσεις
"""

# ╔═╡ a0b10906-e6de-43c2-b83c-a5546afa851a
md"""
#### 1ο Μήνυμα 
$(@bind txt1 TextField((64,1), default="a"))
"""

# ╔═╡ 32e1f0b5-9cbd-475d-9227-502af5e24b93
txt1bytes = map(x -> UInt8(x), collect(txt1));

# ╔═╡ 20bc624b-0959-4547-ba0f-dbaeee740203
md"""
#### 2ο Μήνυμα
$(@bind txt2 TextField((64,1), default="b"))
"""

# ╔═╡ 3f3822f1-2862-458a-a037-9c2bc7f95fb2
txt2bytes = map(x -> UInt8(x), collect(txt2));

# ╔═╡ 36aa31af-4be5-405a-986c-45b68f86fede
md"""
#### Κλειδί
$(@bind key3hex TextField((64,2), default="000000"))
"""

# ╔═╡ 580bd2cb-144e-45b3-8a97-7a7f25d9ab56
key3bytes = hex2bytes(key3hex);

# ╔═╡ 3ab7d13b-0f03-418e-a5fe-ddf4b9b6399b
ciphertextbytes1 = onetimepad.encrypt(key3bytes, txt1bytes);

# ╔═╡ 3a60fe4f-a3ae-4cc5-8709-0023685b3eca
md"""
#### 1ο κρυπτογράφημα
"""

# ╔═╡ 73892bec-f7d9-42cb-9460-5acd2f93f935
print(bytes2hex(ciphertextbytes1))

# ╔═╡ 8e0f66c3-e93d-496f-a2bc-34574872ac19
ciphertextbytes2 = onetimepad.encrypt(key3bytes, txt2bytes);

# ╔═╡ 597b0937-a991-46c8-9b81-69d762e20dc3
md"""
#### 2ο κρυπτογράφημα
"""

# ╔═╡ c49a3ab5-9007-4b51-ab05-40a9d3159b16
print(bytes2hex(ciphertextbytes2))

# ╔═╡ 4e1d8668-a97a-4bee-bf81-c596574533d5
sumbytesplain = map(⊻, txt1bytes, txt2bytes);

# ╔═╡ a5f998ce-af17-42f7-aef8-2283faa77d1c
md"""
#### Άθροισμα μηνυμάτων
"""

# ╔═╡ eaf0b74d-5c21-48e1-ba19-7bafb8893af3
print(bytes2hex(sumbytesplain))

# ╔═╡ 44ebbc80-b3e9-4f8b-a929-f23e1a169048
sumbytescipher = map(⊻, ciphertextbytes1, ciphertextbytes2);

# ╔═╡ fe27f7f4-0931-49f0-a18a-a862d3f68c9b
md"""
#### Άθροισμα κρυπτογραφημάτων
"""

# ╔═╡ 8d51fbe2-afc2-4650-a7ad-41054f02bc51
print(bytes2hex(sumbytescipher))

# ╔═╡ Cell order:
# ╟─98f50080-eb20-11ed-08ff-a9b657645fd3
# ╟─e57a8056-71c5-4452-a2d9-fa9d68c71440
# ╟─1184a08c-fe02-485e-a802-d62a58265b96
# ╟─335781b3-cf83-4218-90e9-0378dcde9338
# ╟─944c22c6-57c0-402e-bcbe-0f970c2fe868
# ╟─235bd72f-dcbd-42ca-97c5-c51ceee03ab1
# ╟─1814831c-184d-4c52-8b72-fb38a228f035
# ╟─450845e5-a82a-469d-8f4f-754c98d73019
# ╟─eb98b99b-2995-42c3-9416-63b10c02c19f
# ╟─18069b12-5093-4844-b89a-8321c2d70857
# ╟─a286bcdc-21a6-4a24-8039-bc65396d9a81
# ╟─02e21a78-46cd-4160-9d5a-675621dbbf51
# ╟─8f31f954-65c5-41c4-84ef-14f3712cbd2c
# ╟─9e873441-0d8c-4764-87cd-c92d594c2eed
# ╟─49e95029-fa74-40fe-9fd8-b4d9b61f3f34
# ╟─e91a2ca2-5bfc-4ae8-9ea9-64320fc2e0ca
# ╟─072b281d-0a6a-4156-89a9-24161ed13d0e
# ╟─86b7a8d5-82ed-4f20-b2d4-4c141fe1dc27
# ╟─15114379-eab0-4811-9f70-cea7fd7318a0
# ╟─1f764e83-2836-44c7-9ca5-649d3407b578
# ╟─11de8d1c-b7ac-49e8-b694-14d435a2fd37
# ╟─913a5e08-c67b-4db1-b9ef-b8425a36fcc8
# ╟─b8c46075-dabd-4070-b8a8-9f0b3c6230b6
# ╟─a0b10906-e6de-43c2-b83c-a5546afa851a
# ╟─32e1f0b5-9cbd-475d-9227-502af5e24b93
# ╟─20bc624b-0959-4547-ba0f-dbaeee740203
# ╟─3f3822f1-2862-458a-a037-9c2bc7f95fb2
# ╟─36aa31af-4be5-405a-986c-45b68f86fede
# ╟─580bd2cb-144e-45b3-8a97-7a7f25d9ab56
# ╟─3ab7d13b-0f03-418e-a5fe-ddf4b9b6399b
# ╟─3a60fe4f-a3ae-4cc5-8709-0023685b3eca
# ╟─73892bec-f7d9-42cb-9460-5acd2f93f935
# ╟─8e0f66c3-e93d-496f-a2bc-34574872ac19
# ╟─597b0937-a991-46c8-9b81-69d762e20dc3
# ╟─c49a3ab5-9007-4b51-ab05-40a9d3159b16
# ╟─4e1d8668-a97a-4bee-bf81-c596574533d5
# ╟─a5f998ce-af17-42f7-aef8-2283faa77d1c
# ╟─eaf0b74d-5c21-48e1-ba19-7bafb8893af3
# ╟─44ebbc80-b3e9-4f8b-a929-f23e1a169048
# ╟─fe27f7f4-0931-49f0-a18a-a862d3f68c9b
# ╟─8d51fbe2-afc2-4650-a7ad-41054f02bc51
