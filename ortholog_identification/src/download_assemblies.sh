# Michael Matschiner, 2015-03-26

# Make the subjects directory if it doesn't exist yet.
mkdir -p ../data/subjects

# Download assemblies from GenBank.
# Amphilophus citrinellus
if [ ! -f ../data/subjects/Ampcit.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/751/415/GCA_000751415.1_Midas_v5//GCA_000751415.1_Midas_v5_genomic.fna.gz -O Ampcit.fasta.gz
	gunzip Ampcit.fasta.gz
	mv Ampcit.fasta ../data/subjects
fi
# Anguilla anguilla
if [ ! -f ../data/subjects/Angang.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/695/075/GCA_000695075.1_Anguilla_anguilla_v1_09_nov_10/GCA_000695075.1_Anguilla_anguilla_v1_09_nov_10_genomic.fna.gz -O Angang.fasta.gz
	gunzip Angang.fasta.gz
	mv Angang.fasta ../data/subjects
fi
# Anguilla japonica
if [ ! -f ../data/subjects/Angjap.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/470/695/GCA_000470695.1_japanese_eel_genome_v1_25_oct_2011_japonica_c401b400k25m200_sspacepremiumk3a02n24_extra.final.scaffolds/GCA_000470695.1_japanese_eel_genome_v1_25_oct_2011_japonica_c401b400k25m200_sspacepremiumk3a02n24_extra.final.scaffolds_genomic.fna.gz -O Angjap.fasta.gz
	gunzip Angjap.fasta.gz
	mv Angjap.fasta ../data/subjects
fi
# Astatotilapia burtoni
if [ ! -f ../data/subjects/Astbur.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/239/415/GCA_000239415.1_AstBur1.0//GCA_000239415.1_AstBur1.0_genomic.fna.gz -O Astbur.fasta.gz
	gunzip Astbur.fasta.gz
	mv Astbur.fasta ../data/subjects
fi
# Boleophthalmus pectinirostris
if [ ! -f ../data/subjects/Bolpec.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/788/275/GCA_000788275.1_BP.fa//GCA_000788275.1_BP.fa_genomic.fna.gz -O Bolpec.fasta.gz
	gunzip Bolpec.fasta.gz
	mv Bolpec.fasta ../data/subjects
fi
# Cynoglossus semilaevis
if [ ! -f ../data/subjects/Cynsem.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/523/025/GCA_000523025.1_Cse_v1.0//GCA_000523025.1_Cse_v1.0_genomic.fna.gz -O Cynsem.fasta.gz
	gunzip Cynsem.fasta.gz
	mv Cynsem.fasta ../data/subjects
fi
# Cyprinodon variegatus
if [ ! -f ../data/subjects/Cypvar.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/732/505/GCA_000732505.1_C_variegatus-1.0//GCA_000732505.1_C_variegatus-1.0_genomic.fna.gz -O Cypvar.fasta.gz
	gunzip Cypvar.fasta.gz
	mv Cypvar.fasta ../data/subjects
fi
# Cyprinodon nevadensis
if [ ! -f ../data/subjects/Cypnev.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/776/015/GCA_000776015.1_ASM77601v1//GCA_000776015.1_ASM77601v1_genomic.fna.gz -O Cypnev.fasta.gz
	gunzip Cypnev.fasta.gz
	mv Cypnev.fasta ../data/subjects
fi
# Dicentrarchus labrax
if [ ! -f ../data/subjects/Diclab.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/689/215/GCA_000689215.1_seabass_V1.0//GCA_000689215.1_seabass_V1.0_genomic.fna.gz -O Diclab.fasta.gz
	gunzip Diclab.fasta.gz
	mv Diclab.fasta ../data/subjects
fi
# Esox lucius
if [ ! -f ../data/subjects/Esoluc.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/721/915/GCA_000721915.1_EsoLuc1.0//GCA_000721915.1_EsoLuc1.0_genomic.fna.gz -O Esoluc.fasta.gz
	gunzip Esoluc.fasta.gz
	mv Esoluc.fasta ../data/subjects
fi
# Larimichthys crocea
if [ ! -f ../data/subjects/Larcro.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/742/935/GCA_000742935.1_ASM74293v1//GCA_000742935.1_ASM74293v1_genomic.fna.gz -O Larcro.fasta.gz
	gunzip Larcro.fasta.gz
	mv Larcro.fasta ../data/subjects
fi
# Lepisosteus oculatus
if [ ! -f ../data/subjects/Lepocu.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/242/695/GCA_000242695.1_LepOcu1//GCA_000242695.1_LepOcu1_genomic.fna.gz -O Lepocu.fasta.gz
	gunzip Lepocu.fasta.gz
	mv Lepocu.fasta ../data/subjects
fi
# Metriaclima zebra
if [ ! -f ../data/subjects/Metzeb.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/238/955/GCA_000238955.2_MetZeb1.1//GCA_000238955.2_MetZeb1.1_genomic.fna.gz -O Metzeb.fasta.gz
	gunzip Metzeb.fasta.gz
	mv Metzeb.fasta ../data/subjects
fi
# Neolamprologus brichardi
if [ ! -f ../data/subjects/Neobri.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/239/395/GCA_000239395.1_NeoBri1.0//GCA_000239395.1_NeoBri1.0_genomic.fna.gz -O Neobri.fasta.gz
	gunzip Neobri.fasta.gz
	mv Neobri.fasta ../data/subjects
fi
# Notothenia coriiceps
if [ ! -f ../data/subjects/Notcor.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/735/185/GCA_000735185.1_NC01//GCA_000735185.1_NC01_genomic.fna.gz -O Notcor.fasta.gz
	gunzip Notcor.fasta.gz
	mv Notcor.fasta ../data/subjects
fi
# Periophthalmodon schlosseri
if [ ! -f ../data/subjects/Persch.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/787/095/GCA_000787095.1_PS.fa//GCA_000787095.1_PS.fa_genomic.fna.gz -O Persch.fasta.gz
	gunzip Persch.fasta.gz
	mv Persch.fasta ../data/subjects
fi
# Periophthalmus magnuspinnatus
if [ ! -f ../data/subjects/Permag.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/787/105/GCA_000787105.1_PM.fa//GCA_000787105.1_PM.fa_genomic.fna.gz -O Permag.fasta.gz
	gunzip Permag.fasta.gz
	mv Permag.fasta ../data/subjects
fi
# Poecilia reticulata
if [ ! -f ../data/subjects/Poeret.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/633/615/GCA_000633615.2_Guppy_female_1.0_MT/GCA_000633615.2_Guppy_female_1.0_MT_genomic.fna.gz -O Poeret.fasta.gz
	gunzip Poeret.fasta.gz
	mv Poeret.fasta ../data/subjects
fi
# Pseudopleuronectes yokohamae
if [ ! -f ../data/subjects/Pseyok.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/787/555/GCA_000787555.1_Pyoko_1.0//GCA_000787555.1_Pyoko_1.0_genomic.fna.gz -O Pseyok.fasta.gz
	gunzip Pseyok.fasta.gz
	mv Pseyok.fasta ../data/subjects
fi
# Pundamilia nyererei
if [ ! -f ../data/subjects/Punnye.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/239/375/GCA_000239375.1_PunNye1.0//GCA_000239375.1_PunNye1.0_genomic.fna.gz -O Punnye.fasta.gz
	gunzip Punnye.fasta.gz
	mv Punnye.fasta ../data/subjects
fi
# Salmo salar
if [ ! -f ../data/subjects/Salsal.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/233/375/GCA_000233375.4_ICSASG_v2//GCA_000233375.4_ICSASG_v2_genomic.fna.gz -O Salsal.fasta.gz
	gunzip Salsal.fasta.gz
	mv Salsal.fasta ../data/subjects
fi
# Scartelaos histophorus
if [ ! -f ../data/subjects/Scahis.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/787/155/GCA_000787155.1_SH.fa//GCA_000787155.1_SH.fa_genomic.fna.gz -O Scahis.fasta.gz
	gunzip Scahis.fasta.gz
	mv Scahis.fasta ../data/subjects
fi
# Sebastes nigrocinctus
if [ ! -f ../data/subjects/Sebnig.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/475/235/GCA_000475235.1_Snig1.0//GCA_000475235.1_Snig1.0_genomic.fna.gz -O Sebnig.fasta.gz
	gunzip Sebnig.fasta.gz
	mv Sebnig.fasta ../data/subjects
fi
# Stegastes partitus
if [ ! -f ../data/subjects/Stepar.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/690/725/GCA_000690725.1_Stegastes_partitus-1.0.2//GCA_000690725.1_Stegastes_partitus-1.0.2_genomic.fna.gz -O Stepar.fasta.gz
	gunzip Stepar.fasta.gz
	mv Stepar.fasta ../data/subjects
fi
# Takifugu flavidus
if [ ! -f ../data/subjects/Takfla.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/400/755/GCA_000400755.1_version_1_of_Takifugu_flavidus_genome//GCA_000400755.1_version_1_of_Takifugu_flavidus_genome_genomic.fna.gz -O Takfla.fasta.gz
	gunzip Takfla.fasta.gz
	mv Takfla.fasta ../data/subjects
fi
# Thunnus orientalis
if [ ! -f ../data/subjects/Thuori.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/418/415/GCA_000418415.1_Thunnus_orientalis_ver_Ba_1.0/GCA_000418415.1_Thunnus_orientalis_ver_Ba_1.0_genomic.fna.gz -O Thuori.fasta.gz
	gunzip Thuori.fasta.gz
	mv Thuori.fasta ../data/subjects
fi
# Scleropages formosus
if [ ! -f ../data/subjects/Sclfor.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/001/005/745/GCA_001005745.1_aro_v1//GCA_001005745.1_aro_v1_genomic.fna.gz -O Sclfor.fasta.gz
	gunzip Sclfor.fasta.gz
	mv Sclfor.fasta ../data/subjects
fi
# Fundulus heteroclitus
if [ ! -f ../data/subjects/Funhet.fasta ]
	then
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/826/765/GCA_000826765.1_Fundulus_heteroclitus-3.0.2//GCA_000826765.1_Fundulus_heteroclitus-3.0.2_genomic.fna.gz -O Funhet.fasta.gz
	gunzip Funhet.fasta.gz
	mv Funhet.fasta ../data/subjects
fi

# Download assemblies from ENSEMBL.
# Astyanax mexicanus
if [ ! -f ../data/subjects/Astmex.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/astyanax_mexicanus/dna/Astyanax_mexicanus.AstMex102.dna.toplevel.fa.gz -O Astmex.fasta.gz
	gunzip Astmex.fasta.gz
	mv Astmex.fasta ../data/subjects
fi
# Danio rerio
if [ ! -f ../data/subjects/Danrer.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/danio_rerio/dna/Danio_rerio.GRCz10.dna.toplevel.fa.gz -O Danrer.fasta.gz
	gunzip Danrer.fasta.gz
	mv Danrer.fasta ../data/subjects
fi
# Gasterosteus aculeatus
if [ ! -f ../data/subjects/Gasacu.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/gasterosteus_aculeatus/dna/Gasterosteus_aculeatus.BROADS1.dna.toplevel.fa.gz -O Gasacu.fasta.gz
	gunzip Gasacu.fasta.gz
	mv Gasacu.fasta ../data/subjects
fi
# Oreochromis niloticus
if [ ! -f ../data/subjects/Orenil.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/oreochromis_niloticus/dna//Oreochromis_niloticus.Orenil1.0.dna_rm.toplevel.fa.gz -O Orenil.fasta.gz
	gunzip Orenil.fasta.gz
	mv Orenil.fasta ../data/subjects
fi
# Oryzias latipes
if [ ! -f ../data/subjects/Orylat.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/oryzias_latipes/dna/Oryzias_latipes.MEDAKA1.dna.toplevel.fa.gz -O Orylat.fasta.gz
	gunzip Orylat.fasta.gz
	mv Orylat.fasta ../data/subjects
fi
# Poecilia formosa
if [ ! -f ../data/subjects/Poefor.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/poecilia_formosa/dna/Poecilia_formosa.PoeFor_5.1.2.dna.toplevel.fa.gz -O Poefor.fasta.gz
	gunzip Poefor.fasta.gz
	mv Poefor.fasta ../data/subjects
fi
# Takifugu rubripes
if [ ! -f ../data/subjects/Takrub.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/takifugu_rubripes/dna/Takifugu_rubripes.FUGU4.dna.toplevel.fa.gz -O Takrub.fasta.gz
	gunzip Takrub.fasta.gz
	mv Takrub.fasta ../data/subjects
fi
# Tetraodon nigroviridis
if [ ! -f ../data/subjects/Tetnig.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-81/fasta/tetraodon_nigroviridis/dna/Tetraodon_nigroviridis.TETRAODON8.dna.toplevel.fa.gz -O Tetnig.fasta.gz
	gunzip Tetnig.fasta.gz
	mv Tetnig.fasta ../data/subjects
fi
# Xiphophorus maculatus
if [ ! -f ../data/subjects/Xipmac.fasta ]
	then
	wget ftp://ftp.ensembl.org/pub/release-87/fasta/xiphophorus_maculatus/dna/Xiphophorus_maculatus.Xipmac4.4.2.dna.toplevel.fa.gz -O Xipmac.fasta.gz
	gunzip Xipmac.fasta.gz
	mv Xipmac.fasta ../data/subjects
fi

# Download from other locations.
# Gadus morhua
if [ ! -f ../data/subjects/Gadmor.fasta ]
	then
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845748&display=fasta" > LN845748.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845749&display=fasta" > LN845749.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845750&display=fasta" > LN845750.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845751&display=fasta" > LN845751.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845752&display=fasta" > LN845752.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845753&display=fasta" > LN845753.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845754&display=fasta" > LN845754.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845755&display=fasta" > LN845755.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845756&display=fasta" > LN845756.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845757&display=fasta" > LN845757.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845758&display=fasta" > LN845758.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845759&display=fasta" > LN845759.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845760&display=fasta" > LN845760.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845761&display=fasta" > LN845761.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845762&display=fasta" > LN845762.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845763&display=fasta" > LN845763.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845764&display=fasta" > LN845764.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845765&display=fasta" > LN845765.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845766&display=fasta" > LN845766.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845767&display=fasta" > LN845767.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845768&display=fasta" > LN845768.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845769&display=fasta" > LN845769.fasta
	wget -O - "http://www.ebi.ac.uk/ena/data/view/LN845770&display=fasta" > LN845770.fasta
	cat LN8457??.fasta > ../data/subjects/Gadmor.fasta
	rm LN8457??.fasta
fi
# Brosme_brosme
if [ ! -f ../data/subjects/fish_12.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120545/fish_12.scf.fasta.gz
	gunzip fish_12.scf.fasta.gz
	mv fish_12.scf.fasta ../data/subjects
fi
# Merluccius polli
if [ ! -f ../data/subjects/fish_15.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120551/fish_15.scf.fasta.gz
	gunzip fish_15.scf.fasta.gz
	mv fish_15.scf.fasta ../data/subjects
fi
# Macrourus berglax
if [ ! -f ../data/subjects/fish_17.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120555/fish_17.scf.fasta.gz
	gunzip fish_17.scf.fasta.gz
	mv fish_17.scf.fasta ../data/subjects
fi
# Bathygadus melanobranchus
if [ ! -f ../data/subjects/fish_19.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120559/fish_19.scf.fasta.gz
	gunzip fish_19.scf.fasta.gz
	mv fish_19.scf.fasta ../data/subjects
fi
# Mora moro
if [ ! -f ../data/subjects/fish_22.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120572/fish_22.scf.fasta.gz
	gunzip fish_22.scf.fasta.gz
	mv fish_22.scf.fasta ../data/subjects
fi
# Polymixia japonica
if [ ! -f ../data/subjects/fish_24.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120620/fish_24.scf.fasta.gz
	gunzip fish_24.scf.fasta.gz
	mv fish_24.scf.fasta ../data/subjects
fi
# Percopsis transmontana
if [ ! -f ../data/subjects/fish_26.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120622/fish_26.scf.fasta.gz
	gunzip fish_26.scf.fasta.gz
	mv fish_26.scf.fasta ../data/subjects
fi
# Typhlichthys subterraneus
if [ ! -f ../data/subjects/fish_27.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120624/fish_27.scf.fasta.gz
	gunzip fish_27.scf.fasta.gz
	mv fish_27.scf.fasta ../data/subjects
fi
# Zeus faber
if [ ! -f ../data/subjects/fish_28.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120626/fish_28.scf.fasta.gz
	gunzip fish_28.scf.fasta.gz
	mv fish_28.scf.fasta ../data/subjects
fi
# Cyttopsis rosea
if [ ! -f ../data/subjects/fish_30.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120628/fish_30.scf.fasta.gz
	gunzip fish_30.scf.fasta.gz
	mv fish_30.scf.fasta ../data/subjects
fi
# Lamprogrammus exutus
if [ ! -f ../data/subjects/fish_31.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120630/fish_31.scf.fasta.gz
	gunzip fish_31.scf.fasta.gz
	mv fish_31.scf.fasta ../data/subjects
fi
# Brotula barbata
if [ ! -f ../data/subjects/fish_32.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120632/fish_32.scf.fasta.gz
	gunzip fish_32.scf.fasta.gz
	mv fish_32.scf.fasta ../data/subjects
fi
# Carapus acus
if [ ! -f ../data/subjects/fish_33.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120634/fish_33.scf.fasta.gz
	gunzip fish_33.scf.fasta.gz
	mv fish_33.scf.fasta ../data/subjects
fi
# Myripristis jacobus
if [ ! -f ../data/subjects/fish_34.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120636/fish_34.scf.fasta.gz
	gunzip fish_34.scf.fasta.gz
	mv fish_34.scf.fasta ../data/subjects
fi
# Holocentrus rufus
if [ ! -f ../data/subjects/fish_35.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120638/fish_35.scf.fasta.gz
	gunzip fish_35.scf.fasta.gz
	mv fish_35.scf.fasta ../data/subjects
fi
# Trisopterus minutus
if [ ! -f ../data/subjects/fish_3.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120525/fish_3.scf.fasta.gz
	gunzip fish_3.scf.fasta.gz
	mv fish_3.scf.fasta ../data/subjects
fi
# Chatrabus melanurus
if [ ! -f ../data/subjects/fish_40.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120642/fish_40.scf.fasta.gz
	gunzip fish_40.scf.fasta.gz
	mv fish_40.scf.fasta ../data/subjects
fi
# Parasudis fraserbrunneri
if [ ! -f ../data/subjects/fish_42.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.120644/fish_42.scf.fasta.gz
	gunzip fish_42.scf.fasta.gz
	mv fish_42.scf.fasta ../data/subjects
fi
# Regalecus glesne
if [ ! -f ../data/subjects/fish_47.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121073/fish_47.scf.fasta.gz
	gunzip fish_47.scf.fasta.gz
	mv fish_47.scf.fasta ../data/subjects
fi
# Lampris guttatus
if [ ! -f ../data/subjects/fish_48.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121075/fish_48.scf.fasta.gz
	gunzip fish_48.scf.fasta.gz
	mv fish_48.scf.fasta ../data/subjects
fi
# Guentherus altivela
if [ ! -f ../data/subjects/fish_50.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121077/fish_50.scf.fasta.gz
	gunzip fish_50.scf.fasta.gz
	mv fish_50.scf.fasta ../data/subjects
fi
# Antennarius striatus
if [ ! -f ../data/subjects/fish_52.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121080/fish_52.scf.fasta.gz
	gunzip fish_52.scf.fasta.gz
	mv fish_52.scf.fasta ../data/subjects
fi
# Osmerus eperlanus
if [ ! -f ../data/subjects/fish_54.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121082/fish_54.scf.fasta.gz
	gunzip fish_54.scf.fasta.gz
	mv fish_54.scf.fasta ../data/subjects
fi
# Perca fluviatilis
if [ ! -f ../data/subjects/fish_55.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121084/fish_55.scf.fasta.gz
	gunzip fish_55.scf.fasta.gz
	mv fish_55.scf.fasta ../data/subjects
fi
# Sebastes norvegicus
if [ ! -f ../data/subjects/fish_56.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121087/fish_56.scf.fasta.gz
	gunzip fish_56.scf.fasta.gz
	mv fish_56.scf.fasta ../data/subjects
fi
# Chaenocephalus aceratus
if [ ! -f ../data/subjects/fish_61.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121091/fish_61.scf.fasta.gz
	gunzip fish_61.scf.fasta.gz
	mv fish_61.scf.fasta ../data/subjects
fi
# Borostomias antarcticus
if [ ! -f ../data/subjects/fish_65.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121095/fish_65.scf.fasta.gz
	gunzip fish_65.scf.fasta.gz
	mv fish_65.scf.fasta ../data/subjects
fi
# Benthosema glaciale
if [ ! -f ../data/subjects/fish_66.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121097/fish_66.scf.fasta.gz
	gunzip fish_66.scf.fasta.gz
	mv fish_66.scf.fasta ../data/subjects
fi
# Rondeletia loricata
if [ ! -f ../data/subjects/fish_68.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121103/fish_68.scf.fasta.gz
	gunzip fish_68.scf.fasta.gz
	mv fish_68.scf.fasta ../data/subjects
fi
# Beryx splendens
if [ ! -f ../data/subjects/fish_69.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121105/fish_69.scf.fasta.gz
	gunzip fish_69.scf.fasta.gz
	mv fish_69.scf.fasta ../data/subjects
fi
# Neoniphon sammara
if [ ! -f ../data/subjects/fish_70.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121109/fish_70.scf.fasta.gz
	gunzip fish_70.scf.fasta.gz
	mv fish_70.scf.fasta ../data/subjects
fi
# Monocentris japonica
if [ ! -f ../data/subjects/fish_74.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121113/fish_74.scf.fasta.gz
	gunzip fish_74.scf.fasta.gz
	mv fish_74.scf.fasta ../data/subjects
fi
# Acanthochaenus luetkenii
if [ ! -f ../data/subjects/fish_79.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121115/fish_79.scf.fasta.gz
	gunzip fish_79.scf.fasta.gz
	mv fish_79.scf.fasta ../data/subjects
fi
# Stylephorus chordatus
if [ ! -f ../data/subjects/fish_80.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121122/fish_80.scf.fasta.gz
	gunzip fish_80.scf.fasta.gz
	mv fish_80.scf.fasta ../data/subjects
fi
# Spondyliosoma cantharus
if [ ! -f ../data/subjects/fish_81.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121124/fish_81.scf.fasta.gz
	gunzip fish_81.scf.fasta.gz
	mv fish_81.scf.fasta ../data/subjects
fi
# Thunnus albacares
if [ ! -f ../data/subjects/fish_83.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121132/fish_83.scf.fasta.gz
	gunzip fish_83.scf.fasta.gz
	mv fish_83.scf.fasta ../data/subjects
fi
# Helostoma temminicki
if [ ! -f ../data/subjects/fish_84.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121137/fish_84.scf.fasta.gz
	gunzip fish_84.scf.fasta.gz
	mv fish_84.scf.fasta ../data/subjects
fi
# Anabas testudineus
if [ ! -f ../data/subjects/fish_85.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121139/fish_85.scf.fasta.gz
	gunzip fish_85.scf.fasta.gz
	mv fish_85.scf.fasta ../data/subjects
fi
# Selene dorsalis
if [ ! -f ../data/subjects/fish_86.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121141/fish_86.scf.fasta.gz
	gunzip fish_86.scf.fasta.gz
	mv fish_86.scf.fasta ../data/subjects
fi
# Chromis chromis
if [ ! -f ../data/subjects/fish_87.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121143/fish_87.scf.fasta.gz
	gunzip fish_87.scf.fasta.gz
	mv fish_87.scf.fasta ../data/subjects
fi
# Parablennius parvicornis
if [ ! -f ../data/subjects/fish_88.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121146/fish_88.scf.fasta.gz
	gunzip fish_88.scf.fasta.gz
	mv fish_88.scf.fasta ../data/subjects
fi
# Symphodus melops
if [ ! -f ../data/subjects/fish_89.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121148/fish_89.scf.fasta.gz
	gunzip fish_89.scf.fasta.gz
	mv fish_89.scf.fasta ../data/subjects
fi
# Pseudochromis fuscus
if [ ! -f ../data/subjects/fish_90.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121154/fish_90.scf.fasta.gz
	gunzip fish_90.scf.fasta.gz
	mv fish_90.scf.fasta ../data/subjects
fi
# Myoxocephalus scorpius
if [ ! -f ../data/subjects/fish_91.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121161/fish_91.scf.fasta.gz
	gunzip fish_91.scf.fasta.gz
	mv fish_91.scf.fasta ../data/subjects
fi
# Lesueurigobius sanzi
if [ ! -f ../data/subjects/fish_96.scf.fasta ]
	then
	wget http://datadryad.org/bitstream/handle/10255/dryad.121171/fish_96.scf.fasta.gz
	gunzip fish_96.scf.fasta.gz
	mv fish_96.scf.fasta ../data/subjects
fi

# Newly sequenced genomes.
# Opsanus beta
echo "Manually download file fish_41.scf.fasta (Opsanus beta) and place it in ../data/subjects"
# Cetomimus sp.
echo "Manually download file fish_67.scf.fasta (Cetomimus sp.) and place it in ../data/subjects"
# Anoplogaster cornuta
echo "Manually download file fish_71.scf.fasta (Anoplogaster cornuta) and place it in ../data/subjects"
# Diretmus argenteus
echo "Manually download file fish_72.scf.fasta (Diretmus argenteus) and place it in ../data/subjects"
# Diretmoides pauciradiatus
echo "Manually download file fish_73.scf.fasta (Diretmoides pauciradiatus) and place it in ../data/subjects"
# Gephyroberyx darwinii
echo "Manually download file fish_75.scf.fasta (Gephyroberyx darwinii) and place it in ../data/subjects"
# Hoplostethus atlanticus
echo "Manually download file fish_76.scf.fasta (Hoplostethus atlanticus) and place it in ../data/subjects"

# New assemblies from previously available read data.
# Caranx ignobilis
echo "Manually download file Caig.scf.fasta (Caranx ignobilis) and place it in ../data/subjects"
# Caranx melampygus
echo "Manually download file Came.scf.fasta (Caranx melampygus) and place it in ../data/subjects"
# Clupea harengus
echo "Manually download file Clha.scf.fasta (Clupea harengus) and place it in ../data/subjects"
# Cyprinus carpio
echo "Manually download file Cyca.scf.fasta (Cyprinus carpio) and place it in ../data/subjects"
# Electrophorus electricus
echo "Manually download file Elel.scf.fasta (Electrophorus electricus) and place it in ../data/subjects"
# Epinephelus aeneus
echo "Manually download file Epae.scf.fasta (Epinephelus aeneus) and place it in ../data/subjects"
# Monopterus albus
echo "Manually download file Moal.scf.fasta (Monopterus albus) and place it in ../data/subjects"
# Pimephales promelas
echo "Manually download file Pipr.scf.fasta (Pimephales promelas) and place it in ../data/subjects"
