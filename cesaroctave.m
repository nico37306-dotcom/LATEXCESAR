% --- Entrada de datos por teclado ---
mensaje = input('Introduce el mensaje a cifrar: ', 's'); 
clave = input('Introduce la clave numErica (ej. 3): ');

% Configuración de límites ASCII
alfabeto_inicio = 65; % 'A'
alfabeto_fin = 90;    % 'Z'
tamano_alfabeto = 26;

% Convertimos a mayúsculas para estandarizar
mensaje_preparado = upper(mensaje);
mensaje_numerico = double(mensaje_preparado);
cifrado_numerico = mensaje_numerico;

% --- Proceso de Cifrado ---
for i = 1:length(mensaje_numerico)
    % Solo procesamos si es una letra de la A a la Z
    if mensaje_numerico(i) >= alfabeto_inicio && mensaje_numerico(i) <= alfabeto_fin
        % Operación: (Posición actual - 65 + clave) mod 26 + 65
        posicion = mensaje_numerico(i) - alfabeto_inicio;
        nueva_posicion = mod(posicion + clave, tamano_alfabeto);
        cifrado_numerico(i) = nueva_posicion + alfabeto_inicio;
    end
end

mensaje_cifrado = char(cifrado_numerico);

% --- Proceso de Descifrado ---
% (Usando el mensaje cifrado para volver al original)
descifrado_numerico = cifrado_numerico;

for i = 1:length(cifrado_numerico)
    if cifrado_numerico(i) >= alfabeto_inicio && cifrado_numerico(i) <= alfabeto_fin
        posicion = cifrado_numerico(i) - alfabeto_inicio;
        % Restamos la clave
        nueva_posicion = mod(posicion - clave, tamano_alfabeto);
        descifrado_numerico(i) = nueva_posicion + alfabeto_inicio;
    end
end

mensaje_descifrado = char(descifrado_numerico);

% --- Salida de resultados ---
fprintf('\n--- RESULTADOS ---\n');
fprintf('Mensaje Original:  %s\n', mensaje_preparado);
fprintf('Mensaje Cifrado:   %s\n', mensaje_cifrado);
fprintf('Mensaje Descifrado: %s\n', mensaje_descifrado);