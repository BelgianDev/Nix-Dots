read -p "This will remove all generation older than 7 days, are you sure you want to proceed ? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
echo
then
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d
    sudo nix-collect-garbage -d
    echo "Its recommended to rebuild your system after this."
fi
