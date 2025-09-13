cask "vmware-fusion@13.5.2" do
  version "13.5.2,23775688"
  sha256 "4d470e2160acb5da7d52d478f6ef12829c5ebe3c04e3154652466ba0bfeed3f6"

  # EOL due to Broadcom's enshittification
  # Reference: https://github.com/Homebrew/homebrew-cask/pull/217370
  # url "https://softwareupdate-prod.broadcom.com/cds/vmw-desktop/fusion/#{version.csv.first}/#{version.csv.second}/universal/core/com.vmware.fusion.zip.tar",
  #     verified: "softwareupdate-prod.broadcom.com/"
  url "https://web.archive.org/web/20240530065157/https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/#{version.csv.first}/#{version.csv.second}/universal/core/com.vmware.fusion.zip.tar",
      verified: "web.archive.org/"
  name "VMware Fusion"
  desc "Create, manage, and run virtual machines"
  homepage "https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion"

  livecheck do
    skip "Version-pinned to #{version}"
  end

  auto_updates true
  conflicts_with cask: ["vmware-fusion@preview", "vmware-fusion"]
  depends_on macos: ">= :monterey"
  container nested: "com.vmware.fusion.zip"

  app "#{staged_path}/payload/VMware Fusion.app"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vkd/bin/vctl"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-bridge"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cfgcli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-dhcpd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-natd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-netifup"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-sniffer"
  # Does not exist in 13.5.2:  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmcli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrest"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrun"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmss2core"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmw_esd2iso"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-aewp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-authd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-cloneBootCamp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-id"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-ntfs"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskAuthTool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskCreator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-remotemks"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-usbarbitrator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vdiskmanager"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmdkserver"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-debug"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-stats"
  # Bundled Filesystem Tools
  binary "#{appdir}/VMware Fusion.app/Contents/Library/mkisofs"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/mkntfs"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/ntfscat"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/ntfscp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/ntfsls"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/ntfsresize"

  postflight do
    system_command "#{appdir}/VMware Fusion.app/Contents/Library/Initialize VMware Fusion.tool",
                   args:         ["set"],
                   sudo:         true,
                   sudo_as_root: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/VMware Fusion.app"
  end

  uninstall delete: "/etc/paths.d/com.vmware.fusion.public"

  zap trash: [
    "/Library/Application Support/VMware",
    "/Library/Logs/VMware Fusion Services.log",
    "/Library/Logs/VMware USB Arbitrator Service.log",
    "/Library/Logs/VMware",
    "/Library/Preferences/VMware Fusion",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.vmware.fusion.sfl*",
    "~/Library/Application Support/VMware Fusion Applications Menu",
    "~/Library/Application Support/VMware Fusion",
    "~/Library/Caches/com.vmware.fusion",
    "~/Library/Logs/VMware Fusion Applications Menu",
    "~/Library/Logs/VMware Fusion",
    "~/Library/Logs/VMware Graphics Service.log",
    "~/Library/Logs/VMware",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusion.plist",
    "~/Library/Preferences/com.vmware.fusion.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionApplicationsMenu.helper.plist",
    "~/Library/Preferences/com.vmware.fusionApplicationsMenu.plist",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile",
    "~/Library/Preferences/VMware Fusion",
    "~/Library/Saved Application State/com.vmware.fusion.savedState",
    "~/Library/WebKit/com.vmware.fusion",
  ]
end
