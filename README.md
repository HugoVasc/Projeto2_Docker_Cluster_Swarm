# Projeto2_Docker_Cluster_Swarm

- O projeto tem como objetivo criar um cluster swarm local utilizando o Vagrant e tem as seguintes premissas:

1. Deverão subir 4 máquinas virtuais sendo uma com nome master e as demais com nomes node01, node 02 e node 03
2. Cada máquina virtual deverá ter um ip fixo
3. Todas as máquinas virtuais deverão ter o Docker pré instalado
4. A máquina com nome master deverá ser o nó manager do cluseter
5. As demais máquinas deverãos ser incluidas no cluster swarm como workers

## Extra

1. Foi criado um banco de dados no nó master
2. O nó master foi "drenado" para não receber cópias do serviço a ser entregue
3. Foi iniciado um serviço php como no exemplo das aulas, com a aplicação disponível neste [repositório](https://github.com/denilsonbonatti/docker-app-cluster)
4. O volume do serviço web foi sincronizado entre os nós utilizando o protocolo NFS

## Problemas a solucionar

1. O serviço da aplicação web está inicializando todas as réplicas em apenas um container.
   1.1. Buscar forma de auto-balancear, ou subir o serviço somente após o término do provisionamento das VMs