paru -Scc --noconfirm
go clean -cache -testcache -modcache
rm -r ${XDG_CACHE_HOME:-$HOME/.cache}/go-build
cargo cache -a
npm cache clean --force
