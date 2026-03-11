params.infiles = "*.txt"
params.outdir = "results"

process ADD_GREETING {
    publishDir "${params.outdir}", mode: "copy"
    input: path(infile)
    output: path("${infile}_greeting.txt")

    script:
    """
    echo "Hello," > "${infile}_greeting.txt"
    sleep 100
    cat ${infile} >> "${infile}_greeting.txt"
    """
}

workflow {
    main:
    ch_infiles = channel.fromPath(params.infiles)

    ch_infiles
    | ADD_GREETING
    | view
}