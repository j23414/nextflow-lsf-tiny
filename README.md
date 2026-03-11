# nextflow-lsf-tiny
Tiny test of nextflow + LSF

Reuse St Jude executor config: https://nf-co.re/configs/stjude/

**Local Run**

```bash
nextflow run main.nf --infiles "data/*.txt" -with-timeline timeline.html
```

**LSF HPC Run**

```bash
nextflow run main.nf --infiles "data/*.txt" -with-timeline timeline.html -profile stjude
```