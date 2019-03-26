library(udpipe)


txt = c("Cells were crosslinked with 1% formaldehyde for 10 min at room temperature, 
        quenched with 0.125 M glycine and washed at 4C with three buffers: 
        (i) PBS, (ii) buffer of composition 0.25% Triton X-100, 10 mM EDTA, 
        0.5 mM EGTA, 20 mM HEPES pH 7.6 and (iii) 0.15 M NaCl in HEG buffer 
        (1 mM EDTA, 0.5 mM EGTA, 50 mM HEPES pH 7.6). Cells were then suspended 
        in ChIP incubation buffer (0.15% SDS, 1% Triton X-100, 150 mM NaCl, HEG) a
        nd sonicated using a Bioruptor Sonicator.")

ud_model <- udpipe_download_model(language = "english")
ud_model <- udpipe_load_model(ud_model$file_model)

x <- udpipe_annotate(ud_model, x = txt)
x <- as.data.frame(x)


stats <- subset(x, upos %in% c("VERB")) 
txt_freq(stats$token)
