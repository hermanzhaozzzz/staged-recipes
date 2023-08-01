#!/bin/sh -x

mkdir -p "$PREFIX/bin"

mvn package -Dshade

mv -fv "target/watset.jar" "$PREFIX/lib/watset.jar"

cat > "$PREFIX/bin/watset" << WATSET
#!/bin/sh
# shellcheck disable=SC2068
exec java -jar "$PREFIX/watset.jar" \$@
WATSET

chmod +x "$PREFIX/bin/watset"
