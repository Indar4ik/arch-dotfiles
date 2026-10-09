paru -Scc --noconfirm
go clean -cache -testcache -modcache
rm -r ${XDG_CACHE_HOME:-$HOME/.cache}/go-build ${XDG_CACHE_HOME:-$HOME/.cache}/pnpm
cargo cache -a
npm cache clean --force
