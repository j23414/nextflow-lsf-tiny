params.infiles = "*.txt"
params.outdir = "results"

process ADD_GREETING {
    publishDir "${params.outdir}/debug", mode: "copy"
    input: path(infile)
    output: path("${infile}_greeting.txt")

    script:
    """
    echo "Hello," > "${infile}_greeting.txt"
    sleep 100
    cat ${infile} >> "${infile}_greeting.txt"
    """
}

process ADD_FAREWELL {
    publishDir "${params.outdir}/", mode: "copy"
    input: path(infile)
    output: path("${infile}_letter.txt")

    script:
    """
    cat ${infile} >> "${infile}_letter.txt"
    sleep 50
    echo "Goodbye!" > "${infile}_letter.txt"
    """
}

workflow {
    main:
    ch_infiles = channel.fromPath(params.infiles)

    ch_infiles
    | ADD_GREETING
    | ADD_FAREWELL
    | view
}