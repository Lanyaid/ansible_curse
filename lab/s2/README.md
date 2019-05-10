Dìa 1 de playbooks.
-------------------


Antes de nada vamos a librarnos de los parametros -k -K. 
Para eso estableceremos una llave pùblica y haremos que nuestro usuario tenga
permisos de SUDO sin contraseña.

Revisamos el inventario:

----------------------
[masters]
master

[targets]
target[1:2]

[vigo:children]
masters
targets

[all:vars]
ansible_become=True

---------------------


Generamos llave pùblica/privada con
ssh-keygen

Ahora instalamos la llave pùblica con
ansible -i inventario -k -m authorized_key -a 'user=psa state=present key="{{ lookup("file","/home/psa/.ssh/id_rsa.pub") }}"' targets 

Por ùltimo, añadimos al usuario "psa" al grupo "sudo":
ansible -i inventario -m lineinfile -a 'path=/etc/sudoers state=present regexp="^%sudo\s" line="%sudo  ALL=(ALL) NOPASSWD: ALL" validate="visudo -cf %s"' targets -K

