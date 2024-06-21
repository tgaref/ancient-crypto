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

# ╔═╡ 793b9ce2-17f6-11ee-0fbd-e750bbd8b7b3
begin 
	import Pkg
	Pkg.activate("..")
	using PlutoUI
end

# ╔═╡ 31ef66ed-9d2d-4875-9013-76317c01bb4b
html"""<style>
main {
    max-width: 720px;
    align-self: flex-start;
    margin-left: 300px;
}
"""

# ╔═╡ b4d34f48-e5fb-41c6-89c4-2e83b8b6329b
html"""
<h1 style="font-size: 40px"> Κρυπτογραφία </h1>
"""

# ╔═╡ 5c002ae6-d4b6-4b21-b432-e10ae7c71551
@bind show_caesar CounterButton("Κρυπτοσύστημα του Καίσαρα")

# ╔═╡ e9d3ff37-9a7e-4709-83d7-5340c7faa920
begin
	if isodd(show_caesar)
		html"""
		<p style="font-size:25px">
		Όλα ξεκίνησαν όταν οι άνθρωποι χρειάστηκε να επικοινωνήσουν με ασφάλεια. 
		Ένας από αυτούς ήταν 
		</p> 	
		"""	
	end
end

# ╔═╡ 9597625c-4476-4e64-8646-41aa88382f58
begin
	if isodd(show_caesar) 
		LocalResource("../resources/caesar.jpg", :width => 300)
	end
end

# ╔═╡ d0e31526-7cd7-4c3e-9b7b-b8ab45aba9d1
begin
	if isodd(show_caesar)
		html"""
		<h3>Ας δούμε πώς δουλεύει</h3>
		<a style="color:blue; font-size:22px" href = ./open?path=src/notebook-caesar.jl>notebook</a>
		<br>
		<a style="color:blue; font-size:22px" href = notebook-caesar.html>html</a>
		"""
	end
end

# ╔═╡ e9e878f3-9c9e-4193-b79f-8c6603aeb18c
if isodd(show_caesar)
	@bind caesar_lessons CounterButton("Τι μάθαμε;")
end

# ╔═╡ 5bfaae43-8f08-4449-9c30-41d38f7a7dc0
begin
	if isodd(show_caesar) && isodd(caesar_lessons)
		html"""
		<div style="font-size:25px">
		    <details><summary>Είναι πρακτικό;</summary>Μπορούσαν να το χρησιμοποιούν ακόμη και στο πεδίο της μάχης!</details>
			<details><summary>Είναι ασφαλές;</summary>
		    <ul>
		      <li>Δεν υπάρχει κλειδί!</li>
			  <li>Αρχή του Kerckhoff (Auguste Kerckhoff 19ος αιώνας): ό,τι είναι μυστικό είναι μέρος του κλειδιού.</li>
			<li>Πόσα είναι τα δυνατά κλειδιά;</li></details>
		</div>
		"""	
	end
end

# ╔═╡ 09e8e507-19c3-4611-845b-3e713f7908e2
md"""
----
"""

# ╔═╡ 7e2fde60-6b99-460b-8d37-9dbf51789c26
@bind show_monoalphabetic CounterButton("Μονοαλφαβητική αντικατάσταση")

# ╔═╡ 287093b5-edf6-4916-a6bd-56c6ea5d67a6
begin
	if isodd(show_monoalphabetic)
		html"""
		<p style="font-size:25px">
		Γιατί να είναι το κλειδί μία κυκλική μετάθεση; Ας είναι μία τυχαία μετάθεση! Πόσα είναι τότε τα κλειδιά;
		</p> 	
		"""	
	end
end

# ╔═╡ 79d6f36c-efaa-4297-b22b-f4cb75ef2cde
begin
	if isodd(show_monoalphabetic)
		html"""
		<h3>Ας δούμε πώς δουλεύει</h3>
		<a style="color:blue; font-size:22px" href = ./open?path=src/notebook-monoalphabetic.jl>notebook</a>
		<br>
		<a style="color:blue; font-size:22px" href = notebook-monoalphabetic.html>html</a>
		"""
	end
end

# ╔═╡ d2d43bc2-6a60-4fae-be45-a011f783ca1a
if isodd(show_monoalphabetic)
	@bind monoalphabetic_lessons CounterButton("Τι μάθαμε;")
end

# ╔═╡ f491d191-fa46-4802-aa8c-fc73572583ec
begin
	if isodd(show_monoalphabetic) && isodd(monoalphabetic_lessons)
		html"""
		<div style="font-size:25px">
		    <details><summary>Είναι πρακτικό;</summary>Μπορείς να το χρησιμοποιήσει κάποιος μόνο με "χαρτί και μολύβι"!</details>
			<details><summary>Είναι ασφαλές;</summary>
		    <ul>
		      <li>Διαρρέει η συχνότητα εμφάνισης των γραμμάτων...</li>
		      <li>Αν γνωρίζουμε μέρος του αρχικού μηνύματος...</li>
		    </ul>
		    </details>
			<details><summary>Ποιά ιδιότητα πρέπει να έχει ένα καλό σύστημα κρυπτογράφησης;</summary>Κάθε γράμμα πρέπει να αντιστοιχίζεται σε πολλά διαφορετικά γράμματα (πώς;)</details>
		</div>
		"""	
	end
end

# ╔═╡ 0ed2fc2e-382d-459f-90db-7d54f946648a
md"""
----
"""

# ╔═╡ d2bad615-402d-420a-b12c-b7ad00cd66a9
@bind show_onetimepad CounterButton("Σημειωματάριο μίας χρήσης")

# ╔═╡ 796d7c0f-03f2-44b9-855e-ed5438c59cfd
begin
	if isodd(show_onetimepad)
		html"""
		<p style="font-size:25px">
		Πολυαλφαβητική αντικατάσταση. Ακόμη καλύτερα: μία διαφορετική μετάθεση για την κρυπτογράφηση κάθε γράμματος! Το σημειωματάριο μίας χρήσης (one-time-pad) περιγράφηκε αρχικά από τον  Frank Miller (1882). Ο Gilbert Vernam το εφηύρε ξανά (ΑΤ&Τ 1919) και ο Claude Shannon απέδειξε ότι είναι ασφαλές (1940).  
		</p>
		"""	
	end
end

# ╔═╡ 6ac8e70b-c6ad-4e2b-9b26-760e00873ed5
begin
	if isodd(show_onetimepad) 
		LocalResource("../resources/Claude-Shannon.jpg", :width => 300)
	end
end

# ╔═╡ 09f821b8-953f-4224-8c6e-41c4d05ca4a9
begin
	if isodd(show_onetimepad)
		html"""
		<h3>Ας δούμε πώς δουλεύει</h3>
		<a style="color:blue; font-size:22px" href = ./open?path=src/notebook-onetimepad.jl>notebook</a>
		<br>
		<a style="color:blue; font-size:22px" href = notebook-onetimepad.html>html</a>
		"""
	end
end

# ╔═╡ 5042a976-fa46-454e-9399-e1a2792db0ae
if isodd(show_onetimepad)
	@bind onetimepad_lessons CounterButton("Τι μάθαμε;")
end

# ╔═╡ 0831e748-b7f2-423d-b8bc-c1628de86f1d
begin
	if isodd(show_onetimepad) && isodd(onetimepad_lessons)
		html"""
		<div style="font-size:25px">
			<details><summary>Είναι ασφαλές;</summary>Το σημειωματάριο μίας χρήσης είναι ουσιαστικά το μόνο σύστημα κρυπτογράφης που έχει αποδειχτεί ότι είναι ασφαλές.</details>
		    <details><summary>Είναι πρακτικό;</summary>
			<ul>
		       <li>Για κάθε μήνυμα χρειάζεται νέο κλειδί ίδιο μεγέθους με το μήνυμα!</li>
		       <li>Αν το κλειδί είναι τόσο όσο και το μήνυμα, γιατί δεν ανταλλάσουμε/στέλνουμε το μήνυμα αντί για το κλειδί;</li>
		    </ul>
		    </details>
			<details><summary>Το χρησιμοποιεί κανένας;</summary>Χρησιμοποιείται σε περιπτώσεις που απαιτείται η μέγιστη δυνατή ασφάλεια.</details>	
		</div>
		"""	
	end
end

# ╔═╡ ee3cb0c2-dc00-47ff-825f-178101691770
md"""
----
"""

# ╔═╡ 6bf1f91f-ebf6-4c43-bff0-79550ab05e5c
@bind show_manytimespad CounterButton("Σημειωματάριο μίας χρήσης - κατάχρηση")

# ╔═╡ 9c67cca1-b7c0-4119-858d-a728b57a6f2b
begin
	if isodd(show_manytimespad)
		html"""
		<p style="font-size:25px">
		 Ας ξεπαράσουμε τα πρακτικά προβλήματα με απλές πρακτικές λύσεις: θα χρησιμοποιήσουμε ένα "μεγάλο" κλειδί πολλές φορές...  
		</p>
		"""	
	end
end

# ╔═╡ 743fa84a-7128-46b2-8f21-a0a94275955c
begin
	if isodd(show_manytimespad) 
		LocalResource("../resources/Wile-Coyote-Thinking.png", :width => 200)
	end
end

# ╔═╡ 106e2d4d-7687-41b2-a617-6ef0477857c8
begin
	if isodd(show_manytimespad)
		html"""
		<h3>Ας δούμε πώς δουλεύει</h3>
		<a style="color:blue; font-size:22px" href = ./open?path=src/notebook-manytimespad.jl>notebook</a>
		<br>
		<a style="color:blue; font-size:22px" href = notebook-manytimespad.html>html</a>
		"""
	end
end

# ╔═╡ 286df0a3-22c8-4fdd-88e0-08708b76828c
if isodd(show_manytimespad)
	@bind manytimespad_lessons CounterButton("Τι μάθαμε;")
end

# ╔═╡ 18d0c1b8-9bbc-4c41-afd1-79afe0ec8a04
begin
	if isodd(show_manytimespad) && isodd(manytimespad_lessons)
		html"""
		<div style="font-size:25px">
			<details><summary>Δούλεψε τη ιδέα μας;</summary>Project Venona</details>
			<details><summary>Τι απέδείξε ο Claude Shannon σχετικά με την ασφάλεια του σημειωματάριου μίας χρήσης;</summary>
			<ul>
			<li>Το κλειδί έχει μήκος όσο και το μήνυμα και είναι τυχαίο.</li>
			<li>Για κάθε μήνυμα χρησιμοποιούμε νέο κλειδί.</li>
			<li> <i>Κάθε</i> κρυπτοσύστημα που είναι τόσο ασφαλές όσο το σημειωματάριο μίας χρήσης έχει απαραίτητα αυτές τις δύο ιδιότητες.</li></ul></details>		
		</div>
		"""	
	end
end

# ╔═╡ bf03d6c0-36f5-477e-b17f-bc44121eb567
md"""
----
"""

# ╔═╡ 23be23a1-eedc-43c9-8e96-fd7efd396cce
@bind show_diffie_hellman CounterButton("Το πρωτόκολλο Diffie-Hellman")

# ╔═╡ f7f922fa-ae51-4ae1-855b-87d9ca51d46d
begin
	if isodd(show_diffie_hellman)
		html"""
		 <p style="font-size:25px">
		 Πώς μπορούμε να φτιάχνουμε κοινά κρυφά κλειδιά;
		 Αν έχουμε ένα μυστικό μπορούμε να ανταλλάξουμε νέα μυστικά. 
		 Πώς φτιάχνουμε το πρώτο μυστικό; Όλοι σχεδόν πίστευαν ότι είναι αδύνατο. Οι Whitfield Diffie και Martin Hellman πίστεψαν ότι γίνεται και πρότειναν το πρωτόκολλο τους το 1976.
		</p>
		"""	
	end
end

# ╔═╡ d2c86a51-2e5b-486a-b9db-0a9b49745e05
begin
	if isodd(show_diffie_hellman) 
		md"""
		$(LocalResource("../resources/whitfield_diffie.jpg", :width => 300)) 
		   
		$(LocalResource("../resources/Martin-Hellman.jpg", :width => 300))
		"""
	end
end

# ╔═╡ ad8036ef-45b3-4642-bfdd-2b1bc9c9cf7c
begin
	if isodd(show_diffie_hellman)
		html"""
		<h3>Ας δούμε πώς δουλεύει</h3>
		<a style="color:blue; font-size:22px" href = ./open?path=src/notebook-diffiehellman.jl>notebook</a>
		<br>
		<a style="color:blue; font-size:22px" href = notebook-diffiehellman.html>html</a>
		"""
	end
end

# ╔═╡ 1804a808-77da-4d77-8363-a707a130ceec
if isodd(show_diffie_hellman)
	@bind diffiehellman_lessons CounterButton("Τι μάθαμε;")
end

# ╔═╡ fcdb936f-f08c-47e8-9bd0-40f290f7f472
begin
	if isodd(show_diffie_hellman) && isodd(diffiehellman_lessons)
		html"""
		<div style="font-size:25px">
			<details><summary>Ποιό υπολογιστικό πρόβλημα αντιμετωπίζει όποιος παρακολουθεί την ανταλλαγή μηνυμάτων;</summary>Πρόβλημα Διακριτού Λογαρίθμου (DLP): Με δεδομένα τα g, p, (g^a mod p) βρες το a</details>
			<details><summary>Είναι το πρωτόκολλο πρακτικό;</summary>Το πρωτόκολλο Diffie-Hellman είναι ασφαλές και χρησιμοποιείται ευρέως.</details>
		    <details><summary>Θα είναι πάντα ασφαλές;</summary>
		<ul>
		<li>Πιστεύουμε ότι οι "συμβατικοί" υπολογιστές δε θα μπρορέσουν ποτέ να λύσουν το DLP γρήγορα.</li>
		<li>Οι κβαντικοί υπολογιστές μπορούν να υπολογίζουν το κλειδί Diffie-Hellman γρήγορα...</li>
		<li>Τι κάνουμε τώρα;</li>
		</ul>
		</div>
		"""	
	end
end

# ╔═╡ c98628f4-0679-472d-9bd5-813b5d2758f9
md"""
---
"""

# ╔═╡ 04d15139-8758-4d50-97e0-53be8fd70587
@bind show_homework CounterButton("Δουλειά για την παραλία")

# ╔═╡ 759a251d-6051-4807-9c76-7a8368c77b40
begin
	if isodd(show_homework)
		html"""
		 <p style="font-size:25px">
		Θέλω να στείλω στον κ. Κουβιδάκη ένα μήνυμα και το κρυπτογραφώ ως εξής: Χρησιμοποιώ ένα σύστημα πολυαλφαβητικής αντικατάστασης με 3 αλφάβητα αντικατάστασης. Κάθε αλφάβητο αντικατάστασης είναι μία κυκλική μετάθεση (αυτό το σύστημα ονομάζεται σύστημα Vigenere). Το μήκος της κάθε μίας κυκλικής μετάθεσης το "συμφωνώ" με τον κ. Κουβιδάκη χρησιμοποιώντας το πρωτόκολλο Diffie-Hellman με p = 19, g = 2. Εσείς "βλέπετε" τα ζευγάρια (A, B) = (16, 3), (14, 6), (15, 12). Το κρυπτογράφημα είναι το
        <br> <br>
		ΟΚΤΥΙΣΖΥΨΟΚΡΧΣ
		<br> <br>
		Ποιά είναι τα κλειδιά Diffie-Hellman; Ποιό είναι το μήνυμα; 
		</p>
		"""	
	end
end

# ╔═╡ 2e813226-1fed-4c4f-8b64-28c9b5d882d7
md"""
---
"""

# ╔═╡ 20ba960d-6862-408b-97db-b512bebe44be
@bind show_whatelse CounterButton("Τι άλλο μπορούμε να κάνουμε;")

# ╔═╡ cff6ae9a-9688-4ef2-9db2-241d38593b14
begin
	if isodd(show_whatelse) 
	    md"""	
		$(LocalResource("../resources/charlie_rackoff.jpeg", :width => 300)) 
		$(LocalResource("../resources/avi_wigderson.jpeg", :width => 300)) 
		\ 
		$(PlutoUI.LocalResource("../resources/Russell_Impagliazzo.jpg", :width => 300))
		$(LocalResource("../resources/johan_hastad.jpeg", :width => 300))
		"""
	end
end

# ╔═╡ 79b6b094-b7a8-41b0-947c-1f65c72ddb87
begin
	if isodd(show_whatelse)
		html"""
		 <h3>Τι άλλο μπορούμε να κάνουμε με την κρυπτογραφία;</h3>
		 <ul style="font-size:25px">
		   <li>Μπορούμε να επικοινωνούμε με ασφάλεια χωρίς κοινά
    κρυφά κλειδιά!</li>
           <li>Πιστοποίηση ταυτότητας (αποδείξεις μηδενικής γνώσης).</li>
           <li>Ψηφιακές υπογραφές.</li>
           <li>Συστήματα δέσμευσης.</li>
           <li>Συστήματα ηλεκτρονικής ψηφοφορίας.</li>
           <li>Bitcoin...</li>
		</ul>
		"""	
	end
end

# ╔═╡ Cell order:
# ╟─31ef66ed-9d2d-4875-9013-76317c01bb4b
# ╟─793b9ce2-17f6-11ee-0fbd-e750bbd8b7b3
# ╟─b4d34f48-e5fb-41c6-89c4-2e83b8b6329b
# ╟─5c002ae6-d4b6-4b21-b432-e10ae7c71551
# ╟─e9d3ff37-9a7e-4709-83d7-5340c7faa920
# ╟─9597625c-4476-4e64-8646-41aa88382f58
# ╟─d0e31526-7cd7-4c3e-9b7b-b8ab45aba9d1
# ╟─e9e878f3-9c9e-4193-b79f-8c6603aeb18c
# ╟─5bfaae43-8f08-4449-9c30-41d38f7a7dc0
# ╟─09e8e507-19c3-4611-845b-3e713f7908e2
# ╟─7e2fde60-6b99-460b-8d37-9dbf51789c26
# ╟─287093b5-edf6-4916-a6bd-56c6ea5d67a6
# ╟─79d6f36c-efaa-4297-b22b-f4cb75ef2cde
# ╟─d2d43bc2-6a60-4fae-be45-a011f783ca1a
# ╟─f491d191-fa46-4802-aa8c-fc73572583ec
# ╟─0ed2fc2e-382d-459f-90db-7d54f946648a
# ╟─d2bad615-402d-420a-b12c-b7ad00cd66a9
# ╟─796d7c0f-03f2-44b9-855e-ed5438c59cfd
# ╟─6ac8e70b-c6ad-4e2b-9b26-760e00873ed5
# ╟─09f821b8-953f-4224-8c6e-41c4d05ca4a9
# ╟─5042a976-fa46-454e-9399-e1a2792db0ae
# ╟─0831e748-b7f2-423d-b8bc-c1628de86f1d
# ╟─ee3cb0c2-dc00-47ff-825f-178101691770
# ╟─6bf1f91f-ebf6-4c43-bff0-79550ab05e5c
# ╟─9c67cca1-b7c0-4119-858d-a728b57a6f2b
# ╟─743fa84a-7128-46b2-8f21-a0a94275955c
# ╟─106e2d4d-7687-41b2-a617-6ef0477857c8
# ╟─286df0a3-22c8-4fdd-88e0-08708b76828c
# ╟─18d0c1b8-9bbc-4c41-afd1-79afe0ec8a04
# ╟─bf03d6c0-36f5-477e-b17f-bc44121eb567
# ╟─23be23a1-eedc-43c9-8e96-fd7efd396cce
# ╟─f7f922fa-ae51-4ae1-855b-87d9ca51d46d
# ╟─d2c86a51-2e5b-486a-b9db-0a9b49745e05
# ╟─ad8036ef-45b3-4642-bfdd-2b1bc9c9cf7c
# ╟─1804a808-77da-4d77-8363-a707a130ceec
# ╟─fcdb936f-f08c-47e8-9bd0-40f290f7f472
# ╟─c98628f4-0679-472d-9bd5-813b5d2758f9
# ╟─04d15139-8758-4d50-97e0-53be8fd70587
# ╟─759a251d-6051-4807-9c76-7a8368c77b40
# ╟─2e813226-1fed-4c4f-8b64-28c9b5d882d7
# ╟─20ba960d-6862-408b-97db-b512bebe44be
# ╟─cff6ae9a-9688-4ef2-9db2-241d38593b14
# ╟─79b6b094-b7a8-41b0-947c-1f65c72ddb87
