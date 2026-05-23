check `~/.cache/` en vooral `~/.cache/paru/`:
```bash
sudo du -sh ~/.cache/* | sort -h
```

Paru
```bash
paru -Scc
sudo paccache -r
```


sytemd journal logs
```bash
journalctl --disk-usage
sudo journalctl --vacuum-time=7d
```

Nix
```bash
nix-store --gc
nix-collect-garbage -d
```
