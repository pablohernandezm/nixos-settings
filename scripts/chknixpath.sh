if [ "$#" -ne 2 ]; then
    echo "Usage: chknixpath <package> <tree level>"
    exit 1
fi

PACKAGE=$1
TREE_LEVEL=$2

# Ejecuta el comando
OUTPUT_PATH=$(nix build nixpkgs#"$PACKAGE" --print-out-paths --no-link)

# Si el comando anterior falla, muestra un mensaje de error
if [ $? -ne 0 ]; then
    echo "$OUTPUT_PATH"
    echo "Error: Failed to build or retrieve the package path."
    exit 1
fi

# Usa eza para listar el contenido en forma de árbol
eza --tree --level "$TREE_LEVEL" "$OUTPUT_PATH"

