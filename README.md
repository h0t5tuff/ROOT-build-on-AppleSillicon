

1. install homebrew for amd architicture:

   I found that putting <arch -x86_64 > before the official homebrew install command gets the job done ;)
2. move the two scripts in this repo (build_root_with_x11.sh and uninstall_root_x11.sh) to your home directory.
3. open .zshrc file in your home directory and comment out any Root (and any arm architicture Homebrew) related lines.
4. now excute the build/uninstall script:

   >chmod +x file_name.sh
5. finally run the build/uninstall script:

   >./file_name.sh

6. Discard of this README.md



# my pitfalls (FYI, all included in the scripts):
 
   * Forgetting to set DISPLAY=:0

   * Missing zstd or improper detection

   * Attempting to set environment variables inside the arch command (which does not work)
 
   * Always verify: grep the cache or inspect logs if ROOT components silently fail or skip features.
