#Para inicializar o correr el script se tiene que poner en el directorio que está y ingresar el comando sudo ./permisos.sh
#!/bin/bash
# Indica al sistema operativo que use Bash para ejecutar este script

menu() {
  # Se define la función menu para mostrar el menú
  echo -e "\nBienvenido al menú\n"
  echo "1. Cambiar los permisos del archivo con preguntas interactivas"
  echo "2. Cambiar los permisos del archivo ingresando permisos directamente"
  echo "3. Cambiar los permisos de forma recursiva"
  echo "4. Mostrar permisos actuales de un archivo"
  echo "5. Mostrar ayuda"
  echo -e "6. Salir del programa\n"
  # Con la función echo se imprime el menú en la terminal y se utiliza -e para habilitar \n (nueva línea)
}
# Cerramos la función menu

conversion_permisos() {

  propietario=0
  grupo=0
  otros=0
  # Declaramos las variables propietario, grupo y otros con un valor de 0

  echo "r: Es leer" 
  echo "w: Es escribir"  
  echo "x: Es ejecutar"

  echo -e "\nIngrese los permisos del propietario (el usuario que es propietario del archivo)"
  read -p "¿Quiere que el propietario pueda leer el archivo? (si/no): " propietario_leer
  read -p "¿Quiere que el propietario pueda escribir el archivo? (si/no): " propietario_escribir
  read -p "¿Quiere que el propietario pueda ejecutar el archivo? (si/no): " propietario_ejecutar
  # Se imprime para el propietario del archivo si desea poder leer, escribir y ejecutar. Además, el usuario ingresa sí o no para cada permiso   
  
  if [[ "$propietario_leer" == "si" ]]; then propietario=$((propietario + 4)); fi # Leer: 4
  if [[ "$propietario_escribir" == "si" ]]; then propietario=$((propietario + 2)); fi # Escribir: 2
  if [[ "$propietario_ejecutar" == "si" ]]; then propietario=$((propietario + 1)); fi # Ejecutar: 1
  # Verifica con los bucles del if si el usuario ingresó sí o no y suma los permisos para el propietario
  
  echo "numero del propietario: " $propietario
  if [[ $propietario == 0 ]]; then echo "No tiene ningún permiso (---)"; fi
  if [[ $propietario == 1 ]]; then echo "Solo tiene permiso de ejecutar (--x)"; fi
  if [[ $propietario == 2 ]]; then echo "Solo tiene permiso de escribir (-w-)"; fi
  if [[ $propietario == 3 ]]; then echo "Tiene permiso de escribir y ejecutar (-wx)"; fi
  if [[ $propietario == 4 ]]; then echo "Solo tiene permiso de leer (r--)"; fi
  if [[ $propietario == 5 ]]; then echo "Tiene permiso de leer y ejecutar (r-x)"; fi  
  if [[ $propietario == 6 ]]; then echo "Tiene permiso de leer y escribir (rw-)"; fi
  if [[ $propietario == 7 ]]; then echo "Tiene permiso de leer, escribir y ejecutar (rwx)"; fi
  echo -e "\n"
  #Se implementa los bucles if para mostrar que valor numerico del permiso calculado para el propietario y mostrar un mensaje de que permisos se habilito segun las repuestas del usario

  echo "Ingrese los permisos del grupo (usuarios que están en el mismo grupo del archivo)"
  read -p "¿Quiere que el grupo pueda leer el archivo? (si/no): " grupo_leer
  read -p "¿Quiere que el grupo pueda escribir el archivo? (si/no): " grupo_escribir
  read -p "¿Quiere que el grupo pueda ejecutar el archivo? (si/no): " grupo_ejecutar
  # Se imprime para el grupo de usuarios del archivo si desea poder leer, escribir y ejecutar. Además, el usuario ingresa sí o no para cada permiso 
  
  if [[ "$grupo_leer" == "si" ]]; then grupo=$((grupo + 4)); fi # Leer: 4
  if [[ "$grupo_escribir" == "si" ]]; then grupo=$((grupo + 2)); fi # Escribir: 2
  if [[ "$grupo_ejecutar" == "si" ]]; then grupo=$((grupo + 1)); fi # Ejecutar: 1
  # Verifica con los bucles del if si el usuario ingresó sí o no y suma los permisos para el grupo  
  
  echo "numero del grupo: " $grupo
  if [[ $grupo == 0 ]]; then echo "No tiene ningún permiso (---)"; fi
  if [[ $grupo == 1 ]]; then echo "Solo tiene permiso de ejecutar (--x)"; fi
  if [[ $grupo == 2 ]]; then echo "Solo tiene permiso de escribir (-w-)"; fi
  if [[ $grupo == 3 ]]; then echo "Tiene permiso de escribir y ejecutar (-wx)"; fi
  if [[ $grupo == 4 ]]; then echo "Solo tiene permiso de leer (r--)"; fi
  if [[ $grupo == 5 ]]; then echo "Tiene permiso de leer y ejecutar (r-x)"; fi  
  if [[ $grupo == 6 ]]; then echo "Tiene permiso de leer y escribir (rw-)"; fi
  if [[ $grupo == 7 ]]; then echo "Tiene permiso de leer, escribir y ejecutar (rwx)"; fi
  echo -e "\n"
  #Se implementa los bucles if para mostrar que valor numerico del permiso calculado para el grupo y mostrar un mensaje de que permisos se habilito segun las respuestas del usuario

  echo "Ingrese los permisos para otros (otros usuarios)"
  read -p "¿Quiere que otros puedan leer el archivo? (si/no): " otros_leer
  read -p "¿Quiere que otros puedan escribir el archivo? (si/no): " otros_escribir
  read -p "¿Quiere que otros puedan ejecutar el archivo? (si/no): " otros_ejecutar
  
  if [[ "$otros_leer" == "si" ]]; then otros=$((otros + 4)); fi # Leer: 4
  if [[ "$otros_escribir" == "si" ]]; then otros=$((otros + 2)); fi # Escribir: 2
  if [[ "$otros_ejecutar" == "si" ]]; then otros=$((otros + 1)); fi # Ejecutar: 1
  # Verifica con los bucles del if si el usuario ingresó sí o no y suma los permisos para los otros usuarios  
  
  echo "numero de otros: " $otros
  if [[ $otros == 0 ]]; then echo "No tiene ningún permiso (---)"; fi
  if [[ $otros == 1 ]]; then echo "Solo tiene permiso de ejecutar (--x)"; fi
  if [[ $otros == 2 ]]; then echo "Solo tiene permiso de escribir (-w-)"; fi
  if [[ $otros == 3 ]]; then echo "Tiene permiso de escribir y ejecutar (-wx)"; fi
  if [[ $otros == 4 ]]; then echo "Solo tiene permiso de leer (r--)"; fi
  if [[ $otros == 5 ]]; then echo "Tiene permiso de leer y ejecutar (r-x)"; fi  
  if [[ $otros == 6 ]]; then echo "Tiene permiso de leer y escribir (rw-)"; fi
  if [[ $otros == 7 ]]; then echo "Tiene permiso de leer, escribir y ejecutar (rwx)"; fi
  echo -e "\n"
  #Se implementa los bucles if para mostrar que valor numerico del permiso calculado para otros usuarios y mostrar un mensaje de que permisos se habilito segun las respuestas del usuario
  
  echo "Explicación de qué simboliza cada número de permiso: "
  echo "0: No tiene ningún permiso (---)"
  echo "1: Solo tiene permiso de ejecutar (--x)"
  echo "2: Solo tiene permiso de escribir (-w-)"
  echo "3: Tiene permiso de escribir y ejecutar (-wx)"
  echo "4: Solo tiene permiso de leer (r--)"
  echo "5: Tiene permiso de leer y ejecutar (r-x)"
  echo "6: Tiene permiso de leer y escribir (rw-)"
  echo -e "7: Tiene permiso de leer, escribir y ejecutar (rwx)\n"
  # Se imprime la explicación de la función de cada número
  
  permisos="$propietario$grupo$otros"
  # Se guardan los valores del propietario, grupo y otros en la variable permisos

}

cambiar_permisos() {
  # Se define la función cambiar_permisos para cambiar los permisos de un archivo
  read -p "Ingrese el nombre del archivo con su extensión: " archivo
  # Se solicita al usuario que ingrese el nombre de su archivo con su extensión y se guarda en la variable archivo.
  if [ -e "$archivo" ]; then
    # Se valida que el archivo exista
    echo -e "\n"
    echo -e "\nPropiedades del archivo antes de cambiar los permisos:\n"
    ls -l $archivo | awk '{print "Permisos:", $1, "\nEnlaces:", $2, "\nPropietario:", $3, "\nGrupo:", $4, "\nTamaño:", $5, "\nFecha de modificación:", $6, $7, $8, "\nNombre:", $9}'
    # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo antes de modificar los permisos. Usamos print con $ para asignar cada propiedad del archivo con su respectivo nombre y se su utiliza awk para imprimir los datos por columnas 
    echo -e "\n"
    conversion_permisos
    # Si el archivo existe, llamamos a la función de conversion_permisos
    echo "Los permisos de manera numérica son: $permisos"
    # Se imprime el permiso del archivo de manera numérica
    chmod "$permisos" "$archivo"
    # Se utiliza el comando chmod para cambiar los permisos del archivo con las variables permisos y archivo
    echo -e "Los permisos fueron cambiados exitosamente a $permisos para el archivo con la extensión $archivo\n"
    # Se imprime el mensaje para mostrar que los permisos fueron cambiados de manera exitosa
    echo -e "\nPropiedades del archivo despues de cambiar los permisos:\n"
    ls -l $archivo | awk '{print "Permisos:", $1, "\nEnlaces:", $2, "\nPropietario:", $3, "\nGrupo:", $4, "\nTamaño:", $5, "\nFecha de modificación:", $6, $7, $8, "\nNombre:", $9}'
    # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo después de modificar los permisos. Usamos print con $ para asignar cada propiedad del archivo con su respectivo nombre y se su utiliza awk para imprimir los datos por columnas 
  else
    echo "El archivo no existe"
    # En el caso de que no exista el archivo, se imprime un mensaje de error
  fi
  # Cerramos el bucle if
}
# Cerramos la función cambiar_permisos

cambiar_permisos_directo() {
  # Se define la función cambiar_permisos_directo para cambiar los permisos de un archivo ingresando permisos directamente con formato octal
  read -p "Ingrese el nombre del archivo con su extensión: " archivo
  # Se solicita al usuario que ingrese el nombre del archivo con su extensión
  echo -e "\nPropiedades del archivo antes de cambiar los permisos:\n"
  ls -l $archivo | awk '{print "Permisos:", $1, "\nEnlaces:", $2, "\nPropietario:", $3, "\nGrupo:", $4, "\nTamaño:", $5, "\nFecha de modificación:", $6, $7, $8, "\nNombre:", $9}'
  # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo antes de modificar los permisos. Usamos print con $ para asignar cada propiedad del archivo con su respectivo nombre y se su utiliza awk para imprimir los datos por columnas 
  echo -e "\n"
  echo "r: Es leer" 
  echo "w: Es escribir"  
  echo "x: Es ejecutar"
  echo -e "\n"
  echo "Explicación de qué simboliza cada número de permiso: "
  echo "0: No tiene ningún permiso (---)"
  echo "1: Solo tiene permiso de ejecutar (--x)"
  echo "2: Solo tiene permiso de escribir (-w-)"
  echo "3: Tiene permiso de escribir y ejecutar (-wx)"
  echo "4: Solo tiene permiso de leer (r--)"
  echo "5: Tiene permiso de leer y ejecutar (r-x)"
  echo "6: Tiene permiso de leer y escribir (rw-)"
  echo -e "7: Tiene permiso de leer, escribir y ejecutar (rwx)\n"
  # Se imprime la explicación de la función de cada número octal. Ademas, explicamos que es r, w y x
  read -p "Ingrese los permisos en formato octal (tres dígitos entre 0-7): " permisos
  # Se solicita al usuario que ingrese el nombre de su archivo con su extensión y los permisos en formato octal
  if [ -e "$archivo" ]; then
    # Se valida que el archivo exista
    chmod "$permisos" "$archivo"
    # Se utiliza el comando chmod para cambiar los permisos del archivo con las variables permisos y archivo
    echo -e "Los permisos fueron cambiados exitosamente a $permisos para el archivo con la extensión $archivo\n"
    # Se imprime el mensaje para mostrar que los permisos fueron cambiados de manera exitosa
    echo -e "\nPropiedades del archivo después de cambiar los permisos:\n"
    ls -l $archivo | awk '{print "Permisos:", $1, "\nEnlaces:", $2, "\nPropietario:", $3, "\nGrupo:", $4, "\nTamaño:", $5, "\nFecha de modificación:", $6, $7, $8, "\nNombre:", $9}'
    # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo después de modificar los permisos. Usamos print con $ para asignar cada propiedad del archivo con su respectivo nombre y se su utiliza awk para imprimir los datos por columnas 
  else
    echo "El archivo no existe"
    # En el caso de que no exista el archivo, se imprime un mensaje de error
  fi
  # Cerramos el bucle if
}
# Cerramos la función cambiar_permisos_directo

cambiar_permisos_recursivo() {
  # Se define la función cambiar_permisos_recursivo para cambiar los permisos de un directorio de manera recursiva
  read -p "Ingrese el nombre del directorio: " directorio
  echo -e "\nPropiedades del directorio antes de cambiar los permisos:\n"
  ls -l $directorio | awk '{ printf "Permisos: %s\nEnlaces: %s\nPropietario: %s\nGrupo: %s\nTamaño: %s\nFecha de modificación: %s %s %s\nNombre: %s\n\n", $1, $2, $3, $4, $5, $6, $7, $8, $9 }'
  # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo antes de modificar los permisos. Usamos printf con %s como un marcador de los valores de $ de esta forma se imprime correctamente al tener varios archivos y se utiliza awk para imprimir las propiedades por columnas
  echo -e "\n"
  echo "r: Es leer" 
  echo "w: Es escribir"  
  echo "x: Es ejecutar"
  echo -e "\n"
  echo "Explicación de qué simboliza cada número de permiso: "
  echo "0: No tiene ningún permiso (---)"
  echo "1: Solo tiene permiso de ejecutar (--x)"
  echo "2: Solo tiene permiso de escribir (-w-)"
  echo "3: Tiene permiso de escribir y ejecutar (-wx)"
  echo "4: Solo tiene permiso de leer (r--)"
  echo "5: Tiene permiso de leer y ejecutar (r-x)"
  echo "6: Tiene permiso de leer y escribir (rw-)"
  echo -e "7: Tiene permiso de leer, escribir y ejecutar (rwx)\n"
  # Se imprime la explicación de la función de cada número octal. Ademas, explicamos que es r, w y x
  read -p "Ingrese los permisos en formato octal (tres dígitos entre 0-7): " permisos
  # Se solicita al usuario que ingrese el nombre del directorio y los permisos en formato octal.
  if [ -d "$directorio" ]; then
    # Se valida que el directorio exista
    chmod -R "$permisos" "$directorio"
    # Se utiliza el comando chmod y -R para cambiar los permisos del directorio de modo que sea recursiva
    echo -e "Los permisos fueron cambiados exitosamente a $permisos para el directorio $directorio y sus contenidos\n"
    # Se imprime el mensaje para mostrar que los permisos fueron cambiados de manera exitosa
    echo -e "\nPropiedades del directorio después de cambiar los permisos:\n"
    ls -l $directorio | awk '{ printf "Permisos: %s\nEnlaces: %s\nPropietario: %s\nGrupo: %s\nTamaño: %s\nFecha de modificación: %s %s %s\nNombre: %s\n\n", $1, $2, $3, $4, $5, $6, $7, $8, $9 }'
    # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo después de modificar los permisos. Usamos printf con %s como un marcador de los valores de $ de esta forma se imprime correctamente al tener varios archivos y se utiliza awk para imprimir las propiedades por columnas
  else
    echo "El directorio no existe"
    # En el caso de que no exista el directorio, se imprime un mensaje de error
  fi
  # Cerramos el bucle if
}
# Cerramos la función cambiar_permisos_recursivo

mostrar_permisos() {
  # Se define la función mostrar_permisos para mostrar los permisos actuales de un archivo o directorio
  read -p "Ingrese el nombre del archivo o directorio: " archivo
  # Se solicita al usuario que ingrese el nombre del archivo o directorio.
  if [ -e "$archivo" ]; then
    # Se valida que el archivo o directorio exista
    echo -e "\nPropiedades del archivo/directorio:\n"
    ls -l $archivo | awk '{ printf "Permisos: %s\nEnlaces: %s\nPropietario: %s\nGrupo: %s\nTamaño: %s\nFecha de modificación: %s %s %s\nNombre: %s\n\n", $1, $2, $3, $4, $5, $6, $7, $8, $9 }'
    echo "r: Es leer" 
    echo "w: Es escribir"  
    echo "x: Es ejecutar"
    # Se imprime las propiedades del archivo, tal como, permisos, enlaces, propietario, grupo, tamaño del archivo, última fecha de modificación y nombre del archivo después de modificar los permisos. Usamos print con $ para asignar cada propiedad del archivo con su respectivo nombre y se su utiliza awk para imprimir los datos por columnas 
  else
    echo "El archivo o directorio no existe"
    # En el caso de que no exista el archivo o directorio, se imprime un mensaje de error
  fi
  # Cerramos el bucle if
}
# Cerramos la función mostrar_permisos

mostrar_ayuda() {
  # Se define la función mostrar_ayuda para mostrar la ayuda del script
  echo -e "\nAyuda del script:\n"
  echo "1. Cambiar los permisos del archivo con preguntas interactivas: Esta opción permite al usuario cambiar los permisos con preguntas interactivas de si o no"
  echo "2. Cambiar los permisos del archivo ingresando permisos directamente: Esta opción permite al usuario cambiar los permisos de un archivo directamente al ingresarlo en formato octal"
  echo "3. Cambiar los permisos de forma recursiva: Esta opción permite al usuario cmabiar los permisos de un directorio directamente al ingrearlo en formato octal"
  echo "4. Mostrar permisos actuales de un archivo: Esta opción permite al usuario ver los permisos actuales de un archivo o directorio"
  echo "5. Mostrar ayuda: Esta opción permite ver al usuario ayuda sobre las opciones"
  echo -e "6. Salir del programa: Esta opción sirve para salir del script o programa\n"
}
# Cerramos la función mostrar_ayuda

while true; do
  # Se utiliza el bucle while para que el usuario ingrese correctamente las opciones, en el caso de que no sea así, se repetirá infinitamente 
  menu
  # Llamamos a nuestra función menu
  read -p "Seleccione una opción: " opcion
  # Se imprime el mensaje y solicitamos al usuario que ingrese una opción y se guarda en la variable opcion
  case $opcion in
    # Se utiliza el case para manejar los diferentes valores de la variable opcion
    1)
      cambiar_permisos
      ;;
    # Si el usuario ingresa el número 1 llamamos a la función cambiar_permisos y se utiliza el ;; para cerrar el case
    2)
      cambiar_permisos_directo
      ;;
    # Si el usuario ingresa el número 2 llamamos a la función cambiar_permisos_directo y se utiliza el ;; para cerrar el case
    3)
      cambiar_permisos_recursivo
      ;;
    # Si el usuario ingresa el número 3 llamamos a la función cambiar_permisos_recursivo y se utiliza el ;; para cerrar el case
    4)
      mostrar_permisos
      ;;
    # Si el usuario ingresa el número 4 llamamos a la función mostrar_permisos y se utiliza el ;; para cerrar el case
    5)
      mostrar_ayuda
      ;;
    # Si el usuario ingresa el número 5 llamamos a la función mostrar_ayuda y se utiliza el ;; para cerrar el case
    6)
      echo -e "\nFin del programa"
      break
      ;;
    # Si el usuario ingresa el número 2 se imprime el mensaje y se utiliza el break para salir del bucle while y del script
    *)
      echo -e "\nLa opción ingresada es inválida, intente nuevamente\n"
      ;;
    # Si el usuario ingresa otro tipo de entrada, se utiliza el * para imprimir un mensaje de error
  esac
  # Cerramos el case
done
# Cerramos el bucle while
