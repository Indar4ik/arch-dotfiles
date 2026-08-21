paru -Scc --noconfirm
go clean -cache -testcache -modcache
rm -r $XDG_CACHE_HOME/go-build
cargo cache -a
npm cache clean --force
