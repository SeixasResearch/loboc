# Alguns comandos do PBS

Verificar fila de jobs submetidos:

```bash
$ qstat
```


Verificar fila de jobs submetidos do usuario yourusername:

```bash
$ qstat -u yourusername
```


Submeter job.sh:

```bash
$ qsub job.sh
```


Deletar job da fila:

```bash
$ qdel 12345.service1
```
Incluir o jobid. Por exemplo, 12345.service1
