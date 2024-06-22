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

# ╔═╡ 45139f7a-e37a-424d-ab80-cf865656b234
begin 
	import Pkg
	Pkg.activate("..")
	include("many-times-pad.jl")
	using PlutoUI
	using .manytimespad
end

# ╔═╡ 25eab15e-eca9-11ed-1d3b-a7d031040f68
html"""<style>
main {
    max-width: 720px;
    align-self: flex-start;
    margin-left: 100px;
}
"""

# ╔═╡ d29a5ced-5e30-4501-8e4e-181384e05158
md"""
# Σημειωματάριο μίας χρήσης - κατάχρηση
"""

# ╔═╡ 71969d6d-40ea-471c-9c72-14212f3e99d5
(cthex, ctshex, plaintexts) = manytimespad.setup();

# ╔═╡ 11d9e07d-4ba8-4343-9734-ae5098c53caa
@bind showmessages CounterButton("Show!")

# ╔═╡ 6a41ad05-72f3-46ae-81f9-a7c6d4cf1f44
begin
	if isodd(showmessages)
		md"""#### Μηνύματα"""
	end
end

# ╔═╡ 3087302b-bafc-40ac-a5d5-cf8e4d5b5b82
begin
	if isodd(showmessages)
		for (i,t) in enumerate(plaintexts)
			println("Μήνυμα $(i-1): $(map(Char, t) |> join)\n")
		end
	end
end

# ╔═╡ d4fc1e7b-18c8-4889-a019-abddf8514118
md"""
#### Κρυπτογραφήματα
"""

# ╔═╡ e7843323-75be-41fe-9108-bc78a796fd15
begin
	println("Κρυπτογράφημα 0: $cthex\n");
	for (i,t) in enumerate(ctshex)
		println("Κρυπτογράφημα $i: $t\n")
	end
end

# ╔═╡ 8c86b794-b48f-4e92-af05-cd14a8481bce
@bind decryptbutton CounterButton("Magic!")

# ╔═╡ e095e3a1-7017-4617-bc35-c9f487180641
(txt, txts) = manytimespad.solve(cthex, ctshex);

# ╔═╡ 0b5f253c-c27e-4a82-85e6-9643dcea4fbc
begin
	if isodd(decryptbutton)
		println("Μήνυμα 0: $(map(Char, txt) |> join)")
	end
end

# ╔═╡ 2e6dc301-cd82-499e-9823-a73ce7b52ecd
begin
	if isodd(decryptbutton)
		for (i,t) in enumerate(txts)
			println("Μήνυμα $i: $(map(Char, t) |> join)\n")
		end
	end
end

# ╔═╡ Cell order:
# ╟─25eab15e-eca9-11ed-1d3b-a7d031040f68
# ╟─45139f7a-e37a-424d-ab80-cf865656b234
# ╟─d29a5ced-5e30-4501-8e4e-181384e05158
# ╟─71969d6d-40ea-471c-9c72-14212f3e99d5
# ╟─11d9e07d-4ba8-4343-9734-ae5098c53caa
# ╟─6a41ad05-72f3-46ae-81f9-a7c6d4cf1f44
# ╟─3087302b-bafc-40ac-a5d5-cf8e4d5b5b82
# ╟─d4fc1e7b-18c8-4889-a019-abddf8514118
# ╟─e7843323-75be-41fe-9108-bc78a796fd15
# ╟─8c86b794-b48f-4e92-af05-cd14a8481bce
# ╟─e095e3a1-7017-4617-bc35-c9f487180641
# ╟─0b5f253c-c27e-4a82-85e6-9643dcea4fbc
# ╟─2e6dc301-cd82-499e-9823-a73ce7b52ecd
