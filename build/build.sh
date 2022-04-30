function importEnv {
  BUILDPATH="$(dirname $(realpath $0))/output"
  MANIFEST="https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git"
  MANIFEST_BRANCH="twrp-11"
  DEVICE="X692"
  DT_LINK="https://github.com/ryenyuku/twrp_device_infinix_x692.git"
  DT_PATH="device/infinix/X692"
  TARGET="recoveryimage"
  export ALLOW_MISSING_DEPENDENCIES=true
}

function beginBuild {
  echo -e "\n\033[0;32mSetting up environment..\033[0m"
  importEnv

  echo -e "\033[0;36mBUILDPATH: \033[0;37m$BUILDPATH\033[0m"
  echo -e "\033[0;36mMANIFEST: \033[0;37m$MANIFEST\033[0m"
  echo -e "\033[0;36mMANIFEST_BRANCH: \033[0;37m$MANIFEST_BRANCH\033[0m"
  echo -e "\033[0;36mDEVICE: \033[0;37m$DEVICE\033[0m"
  echo -e "\033[0;36mDT_LINK: \033[0;37m$DT_LINK\033[0m"
  echo -e "\033[0;36mDT_PATH: \033[0;37m$DT_PATH\033[0m"
  echo -e "\033[0;36mALLOW_MISSING_DEPENDENCIES: \033[0;37m$ALLOW_MISSING_DEPENDENCIES\033[0m"

  mkdir -p $BUILDPATH
  cd $BUILDPATH
  
  echo -e "\n\033[0;32mSyncing recovery source and device tree..\033[0m"
  repo init -u $MANIFEST -b $MANIFEST_BRANCH --depth=1
  repo sync -j$(nproc)
  git clone $DT_LINK --depth=1 --single-branch $DT_PATH

  echo -e "\n\033[0;32mBuilding..\033[0m"
  source build/envsetup.sh
  lunch twrp_$DEVICE-eng
  mka $TARGET

  echo -e "\n\033[0;32mCopying generated recovery image..\033[0m"
  cp -v out/target/product/$DEVICE/recovery.img .

  echo -e "\n\033[0;32mGenerating checksums..\033[0m"
  sha1sum --tag recovery.img >> ../checksums
  sha256sum --tag recovery.img >> ../checksums
  md5sum --tag recovery.img >> ../checksums
}

echo -e "\033[1;33mWARNING:\033[0m Building TWRP is network expensive and you must have at least 60GiB of free storage space"
read -p ":: Proceed with building? [Y/N] "
case "${REPLY,,}" in
  y | yes)
    beginBuild;;
  *)
    echo "Cancelled by user"
    exit 1;;
esac
