#!/bin/bash

# 1. Asegurar que exista el directorio SSH para el usuario ubuntu
mkdir -p /home/ubuntu/.ssh
chmod 700 /home/ubuntu/.ssh

# 2. Inyectar tu llave pública limpia
# (Reemplaza TODO lo que está dentro de las comillas por tu texto 'ssh-rsa ...')
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzHt9vIlcvSJrinUV6wh/jVLg8wpHshScejlGHYnVTPLVkKlHonTqFExJWiU2iIJnVfbdqVKpBpTpAuggBNc35DitKFk2trP408u1LuxX+bsB89zUetY4OlOYnsVGuLFG1UIKHI/ShamDM0t1fXkMDaWNVfNpuYq+LCplGaDKp2fjY41WhmqTRjMptO6ZeAogzaNw1z7F5L8bxEnZxpEChlFTGk+E1U0SAuwe+LG6K3Yp7FyZ933a8VJyu68hoCE14xoLNYtjuMDhEZ6J/9UmkLuV8b6lk7ckQ93b2cpMEFu3HeZcZv43AKJYoz55LzyENu8pd/ZGKyRRe5T3XWoqoBe0/G8tx8DEwU+aaVfR6z9c0hhNGj4Z4QSHYv5/CEcJd+RTXkYIIy9z7GZLdvfw5T7o5mr2CBsRQ0OSzaxi1hKCyK2bZAN6ZI+UbexFLok5X/tBXAP2Zibmbx76V9y3aT31gHlvNHm6ubT5DxkqHINKt8claNUX6gwykaOT2ENM+um+RWsiMnRxwk9AhoPOFyYDLsgIaV1KxPa2n0OMBCWlFrYHrtJQ5/5Q4moKBdsIsOzZoWar/THg/+jFPIIVTMurY0gPVdVv8NudcX8ktw0NhMSSEtPHRQhddEFswM/9XYGCXn2g9Wu8gVI2VRtcsyyGUb0v46c5hTDOLeYSxMw== hola@Hola" > /home/ubuntu/.ssh/authorized_keys

# 3. Aplicar los permisos de seguridad exigidos por OpenSSH
chown -R ubuntu:ubuntu /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys

# 4. Establecer una contraseña para la consola serie por si acaso
echo "ubuntu:Nucleo2026*" | chpasswd
