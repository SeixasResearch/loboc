# Alguns comandos do PBS

Verificar fila de jobs submetidos:

`qstat`


Verificar fila de jobs submetidos do usuario yourusername:

`qstat -u yourusername` 


Submeter job.sh:

`qsub job.sh`


Deletar job da fila. Incluir jobid

`qdel 12345.service1`
