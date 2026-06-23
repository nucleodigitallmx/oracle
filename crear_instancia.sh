#!/bin/bash

echo "Iniciando bucle de peticiones para Oracle Cloud..."

while true; do
  echo "Intentando crear instancia..."
  
  # Comando OCI CLI en una sola línea para evitar errores por espacios fantasmas o saltos de línea
  LAUNCH_OP=$(oci compute instance launch --availability-domain "pXbI:MX-MONTERREY-1-AD-1" --compartment-id "${COMPARTMENT_ID}" --shape "VM.Standard.A1.Flex" --shape-config '{"ocpus":4,"memoryInGBs":24}' --display-name "n8n-servidor-nuevo" --image-id "ocid1.image.oc1.mx-monterrey-1.aaaaaaaa..." --subnet-id "ocid1.subnet.oc1.mx-monterrey-1.aaaaaaaa..." --user-data-file "./cloud-init.sh" 2>&1)
  EXIT_CODE=$?

  # Verificar el resultado usando el código de salida del sistema
  if [ $EXIT_CODE -eq 0 ]; then
    echo "✅ ¡Instancia creada con éxito!"
    exit 0
  elif [[ "$LAUNCH_OP" == *"Out of capacity"* || "$LAUNCH_OP" == *"LimitExceeded"* ]]; then
    echo "⚠️ Sin capacidad en Monterrey. Reintentando en 10 segundos..."
    sleep 10
  else
    echo "❌ Error inesperado: $LAUNCH_OP"
    echo "Reintentando por si acaso..."
    sleep 15
  fi
done
