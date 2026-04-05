if status is-interactive
  if type -q keychain
    # Default options: quiet suppresses verbose output
    if not set -q keychain_options
      set -U keychain_options --quiet
    end

    if set -q keychain_keys; and test (count $keychain_keys) -gt 0
      keychain --eval $keychain_options $keychain_keys | source
    else
      echo "keychain.fish: No keys configured."
      echo "  Set the keys to load with: set -U keychain_keys ~/.ssh/id_ed25519"
      echo "  Optionally configure options: set -U keychain_options --quiet"
    end
  end
end
