Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA97A5108
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 10:16:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57CAA3C20EF
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Sep 2019 10:16:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 94AA13C2019
 for <ltp@lists.linux.it>; Sat, 31 Aug 2019 09:55:37 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0897A6023D2
 for <ltp@lists.linux.it>; Sat, 31 Aug 2019 09:55:21 +0200 (CEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Aug 2019 00:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,449,1559545200"; 
 d="xz'?scan'208";a="382295050"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.135])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2019 00:55:12 -0700
Date: Sat, 31 Aug 2019 16:01:31 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20190831080131.GA7519@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:16:09 +0200
Subject: [LTP] [vfs]  2ad9ab0f74: ltp.fsync01.fail
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Reply-To: kernel test robot <oliver.sang@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, lkp@01.org,
 Al Viro <viro@zeniv.linux.org.uk>, ltp@lists.linux.it,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FYI, we noticed the following commit (built with gcc-7):

commit: 2ad9ab0f742971127f84a592802916b68855986a ("vfs: Convert fuse to use the new mount API")
https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git master

in testcase: ltp
with following parameters:

	test: quickhit

test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
test-url: http://linux-test-project.github.io/


on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 8G

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>

2019-08-30 14:31:19 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2019-08-30 14:31:19 ./runltp -f quickhit
INFO: creating /lkp/benchmarks/ltp/output directory
INFO: creating /lkp/benchmarks/ltp/results directory
Checking for required user/group ids

'nobody' user id and group found.
'bin' user id and group found.
'daemon' user id and group found.
Users group found.
Sys group found.
Required users/groups exist.
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

/etc/os-release
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

uname:
Linux vm-snb-8G-0fc168167576 5.3.0-rc5-00015-g2ad9ab0f74297 #1 SMP Fri Aug 30 14:08:41 CST 2019 x86_64 GNU/Linux

/proc/cmdline
ip=::::vm-snb-8G-0fc168167576::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/vm-snb-8G-0fc168167576/ltp-quickhit-debian-x86_64-2018-04-03.cgz-2ad9ab0f742971127f84a5928-20190830-18897-1nsji0w-1.yaml ARCH=x86_64 kconfig=x86_64-rhel-7.6 branch=linux-devel/devel-hourly-2019083001 commit=2ad9ab0f742971127f84a592802916b68855986a BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/vmlinuz-5.3.0-rc5-00015-g2ad9ab0f74297 max_uptime=3600 RESULT_ROOT=/result/ltp/quickhit/vm-snb-8G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/3 LKP_SERVER=inn debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_loglevel console=tty0 earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw rcuperf.shutdown=0

Gnu C                  gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Clang                 
Gnu make               4.1
util-linux             2.29.2
mount                  linux 2.29.2 (libmount 2.29.2: selinux, btrfs, assert, debug)
modutils               23
e2fsprogs              1.43.4
Linux C Library        > libc.2.24
Dynamic linker (ldd)   2.24
Procps                 3.3.12
Net-tools              2.10-alpha
iproute2               iproute2-ss161212
iputils                iputils-s20161105
Kbd                    116:
Sh-utils               8.26
Modules Loaded         intel_rapl_msr intel_rapl_common sr_mod cdrom crct10dif_pclmul sg crc32_pclmul ata_generic pata_acpi crc32c_intel ghash_clmulni_intel bochs_drm drm_vram_helper ttm ppdev drm_kms_helper syscopyarea sysfillrect snd_pcm sysimgblt fb_sys_fops snd_timer drm snd ata_piix aesni_intel crypto_simd libata cryptd glue_helper soundcore joydev pcspkr serio_raw i2c_piix4 floppy parport_pc parport ip_tables

free reports:
              total        used        free      shared  buff/cache   available
Mem:        8149476      257572     5755836       11592     2136068     5644340
Swap:             0           0           0

cpuinfo:
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             2
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 42
Model name:            Intel Xeon E312xx (Sandy Bridge)
Stepping:              1
CPU MHz:               2693.508
BogoMIPS:              5387.01
Hypervisor vendor:     KVM
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              4096K
L3 cache:              16384K
NUMA node0 CPU(s):     0,1
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx hypervisor lahf_lm cpuid_fault pti xsaveopt arat

AppArmor disabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2168     -n 2168 -p -f /tmp/ltp-uOs3AiQxjS/alltests -l /lkp/benchmarks/ltp/results/LTP_RUN_ON-2019_08_30-14h_31m_19s.log  -C /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2019_08_30-14h_31m_19s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.tconf
Running tests.......
<<<test_start>>>
tag=access01 stime=1567146680
cmdline="access01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
access01.c:243: PASS: access(accessfile_rwx, F_OK) as root
access01.c:243: PASS: access(accessfile_rwx, F_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, W_OK) as root
access01.c:243: PASS: access(accessfile_rwx, W_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, W_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, W_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessfile_r, R_OK) as nobody
access01.c:263: PASS: access(accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:243: PASS: access(accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessfile_r, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessfile_w, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessfile_x, R_OK|W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessdir_rw/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, X_OK) as nobody
access01.c:263: PASS: access(accessdir_r/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_x, W_OK) as nobody: EACCES

Summary:
passed   199
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=access03 stime=1567146680
cmdline="access03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
access03.c:47: PASS: access(0xffffffffffffffff, F_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, F_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, R_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, R_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, W_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, W_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, X_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, X_OK) as nobody: EFAULT

Summary:
passed   8
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=alarm02 stime=1567146680
cmdline="alarm02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
alarm02.c:62: PASS: alarm(2147483647) returned 2147483647 as expected for value INT_MAX
alarm02.c:62: PASS: alarm(2147483647) returned 2147483647 as expected for value UINT_MAX/2
alarm02.c:62: PASS: alarm(1073741823) returned 1073741823 as expected for value UINT_MAX/4

Summary:
passed   3
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=alarm03 stime=1567146680
cmdline="alarm03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
alarm03.c:50: PASS: alarm(100), fork, alarm(0) parent's alarm returned 100
alarm03.c:37: PASS: alarm(100), fork, alarm(0) child's alarm returned 0

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=brk01 stime=1567146680
cmdline="brk01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
brk01.c:55: PASS: brk() works fine

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chdir02 stime=1567146680
cmdline="chdir02"
contacts=""
analysis=exit
<<<test_output>>>
chdir02     1  TPASS  :  chdir(/) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chmod02 stime=1567146680
cmdline="chmod02"
contacts=""
analysis=exit
<<<test_output>>>
chmod02     1  TPASS  :  chmod(test_file, 0) returned 0
chmod02     2  TPASS  :  chmod(test_file, 07) returned 0
chmod02     3  TPASS  :  chmod(test_file, 070) returned 0
chmod02     4  TPASS  :  chmod(test_file, 0700) returned 0
chmod02     5  TPASS  :  chmod(test_file, 0777) returned 0
chmod02     6  TPASS  :  chmod(test_file, 02777) returned 0
chmod02     7  TPASS  :  chmod(test_file, 04777) returned 0
chmod02     8  TPASS  :  chmod(test_file, 06777) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chown01 stime=1567146680
cmdline="chown01"
contacts=""
analysis=exit
<<<test_output>>>
chown01     1  TPASS  :  chown(t_2434, 0,0) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=close08 stime=1567146680
cmdline="close08"
contacts=""
analysis=exit
<<<test_output>>>
close08     1  TPASS  :  close(tfile_2435) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup01 stime=1567146680
cmdline="dup01"
contacts=""
analysis=exit
<<<test_output>>>
dup01       1  TPASS  :  dup(dupfile) returned 8
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup02 stime=1567146680
cmdline="dup02"
contacts=""
analysis=exit
<<<test_output>>>
dup02       1  TPASS  :  dup failed as expected with EBADF
dup02       2  TPASS  :  dup failed as expected with EBADF
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup03 stime=1567146680
cmdline="dup03"
contacts=""
analysis=exit
<<<test_output>>>
dup03       1  TPASS  :  dup failed as expected with EMFILE
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup04 stime=1567146680
cmdline="dup04"
contacts=""
analysis=exit
<<<test_output>>>
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup05 stime=1567146680
cmdline="dup05"
contacts=""
analysis=exit
<<<test_output>>>
dup05       1  TPASS  :  dup returned 8
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execl01 stime=1567146680
cmdline="execl01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execl01_child.c:20: PASS: execl01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execle01 stime=1567146680
cmdline="execle01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execle01_child.c:34: PASS: execle01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execlp01 stime=1567146680
cmdline="execlp01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execlp01_child.c:20: PASS: execlp01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execv01 stime=1567146680
cmdline="execv01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execv01_child.c:23: PASS: execv01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=execve01 stime=1567146680
cmdline="execve01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execve01_child.c:34: PASS: execve01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execvp01 stime=1567146680
cmdline="execvp01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execvp01_child.c:20: PASS: execvp01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=f00f stime=1567146680
cmdline="f00f"
contacts=""
analysis=exit
<<<test_output>>>
f00f        1  TCONF  :  f00f.c:78: f00f bug test only for i386
f00f        2  TCONF  :  f00f.c:78: Remaining cases not appropriate for configuration
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fchmod01 stime=1567146680
cmdline="fchmod01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fchmod01.c:42: PASS: Functionality of fchmod(7, 0) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 07) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 070) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 0700) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 0777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 02777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 04777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 06777) successful

Summary:
passed   8
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fchown01 stime=1567146680
cmdline="fchown01"
contacts=""
analysis=exit
<<<test_output>>>
fchown01    1  TPASS  :  fchown(fd, geteuid(), getegid()) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl02 stime=1567146680
cmdline="fcntl02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 0) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 1) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 2) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 3) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 10) returned 10
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 100) returned 100

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl03 stime=1567146680
cmdline="fcntl03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl03.c:33: PASS: fcntl(fcntl03_2466, F_GETFD, 0) returned 0

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl04 stime=1567146680
cmdline="fcntl04"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl04.c:39: PASS: fcntl(fcntl04_2468, F_GETFL, 0) returned 8002

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl05 stime=1567146680
cmdline="fcntl05"
contacts=""
analysis=exit
<<<test_output>>>
fcntl05     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl07 stime=1567146680
cmdline="fcntl07"
contacts=""
analysis=exit
<<<test_output>>>
fcntl07     1  TPASS  :  regular file CLOEXEC fd was closed after exec()
fcntl07     2  TPASS  :  pipe (write end) CLOEXEC fd was closed after exec()
fcntl07     3  TPASS  :  pipe (read end) CLOEXEC fd was closed after exec()
fcntl07     4  TPASS  :  fifo CLOEXEC fd was closed after exec()
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl08 stime=1567146680
cmdline="fcntl08"
contacts=""
analysis=exit
<<<test_output>>>
fcntl08     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl09 stime=1567146680
cmdline="fcntl09"
contacts=""
analysis=exit
<<<test_output>>>
fcntl09     1  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_WRLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_UNLCK returned 0
fcntl09     1  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_RDLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_UNLCK returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl10 stime=1567146680
cmdline="fcntl10"
contacts=""
analysis=exit
<<<test_output>>>
fcntl10     1  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_WRLCK returned 0
fcntl10     2  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_UNLCK returned 0
fcntl10     1  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_RDLCK returned 0
fcntl10     2  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_UNLCK returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork01 stime=1567146680
cmdline="fork01"
contacts=""
analysis=exit
<<<test_output>>>
fork01      1  TPASS  :  fork() returned 2480
fork01      2  TPASS  :  child pid and fork() return agree: 2480
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork04 stime=1567146680
cmdline="fork04"
contacts=""
analysis=exit
<<<test_output>>>
fork04      1  TPASS  :  Env var TERM unchanged after fork(): vt220
fork04      2  TPASS  :  Env var NoTSetzWq unchanged after fork(): getenv() does not find variable set
fork04      3  TPASS  :  Env var TESTPROG unchanged after fork(): FRKTCS04
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork05 stime=1567146680
cmdline="fork05"
contacts=""
analysis=exit
<<<test_output>>>
fork05      0  TINFO  :  %fs test only for ix86
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fpathconf01 stime=1567146680
cmdline="fpathconf01"
contacts=""
analysis=exit
<<<test_output>>>
fpathconf01    1  TPASS  :  fpathconf(fd, _PC_MAX_CANON) returned 255
fpathconf01    2  TPASS  :  fpathconf(fd, _PC_MAX_INPUT) returned 255
fpathconf01    3  TPASS  :  fpathconf(fd, _PC_VDISABLE) returned 0
fpathconf01    4  TPASS  :  fpathconf(fd, _PC_LINK_MAX) returned 127
fpathconf01    5  TPASS  :  fpathconf(fd, _PC_NAME_MAX) returned 255
fpathconf01    6  TPASS  :  fpathconf(fd, _PC_PATH_MAX) returned 4096
fpathconf01    7  TPASS  :  fpathconf(fd, _PC_PIPE_BUF) returned 4096
fpathconf01    8  TPASS  :  fpathconf(fd, _PC_CHOWN_RESTRICTED) returned 1
fpathconf01    9  TPASS  :  fpathconf(fd, _PC_NO_TRUNC) returned 1
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fstatfs01 stime=1567146680
cmdline="fstatfs01"
contacts=""
analysis=exit
<<<test_output>>>
fstatfs01    1  TPASS  :  fstatfs() on a file - f_type=1021994
fstatfs01    2  TPASS  :  fstatfs() on a pipe - f_type=50495045
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fsync01 stime=1567146680
cmdline="fsync01"
contacts=""
analysis=exit
<<<test_output>>>
tst_device.c:238: INFO: Using test device LTP_DEV='/dev/loop0'
tst_supported_fs_types.c:60: INFO: Kernel supports ext2
tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext3
tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext4
tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports xfs
tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports vfat
tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
tst_supported_fs_types.c:92: INFO: FUSE does support exfat
tst_supported_fs_types.c:44: INFO: mkfs.exfat does exist
tst_supported_fs_types.c:92: INFO: FUSE does support ntfs
tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
tst_test.c:1169: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on exfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with exfat opts='' extra opts=''
safe_macros.c:739: INFO: Trying FUSE...
fuse: mount failed: Invalid argument
FUSE exfat 1.3.0
safe_macros.c:748: BROK: mount.exfat failed with 256

Summary:
passed   60
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=2 corefile=no
cutime=7 cstime=13
<<<test_end>>>
<<<test_start>>>
tag=getegid01 stime=1567146681
cmdline="getegid01"
contacts=""
analysis=exit
<<<test_output>>>
getegid01    1  TPASS  :  getegid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=geteuid01 stime=1567146681
cmdline="geteuid01"
contacts=""
analysis=exit
<<<test_output>>>
geteuid01    1  TPASS  :  geteuid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getgid01 stime=1567146681
cmdline="getgid01"
contacts=""
analysis=exit
<<<test_output>>>
getgid01    1  TPASS  :  getgid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=getgroups01 stime=1567146681
cmdline="getgroups01"
contacts=""
analysis=exit
<<<test_output>>>
getgroups01    1  TPASS  :  getgroups failed as expected with EINVAL
getgroups01    2  TPASS  :  getgroups did not modify the gidset array
getgroups01    3  TPASS  :  getgroups failed as expected with EINVAL
getgroups01    4  TPASS  :  getgroups(NGROUPS,gidset) returned 3 contains gid 0 (from getgid)
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=gethostid01 stime=1567146681
cmdline="gethostid01"
contacts=""
analysis=exit
<<<test_output>>>
gethostid01    1  TPASS  :  Hostid command and gethostid both report hostid is 007f0100
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=gethostname01 stime=1567146681
cmdline="gethostname01"
contacts=""
analysis=exit
<<<test_output>>>
gethostname01    1  TPASS  :  gethostname returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getpgrp01 stime=1567146681
cmdline="getpgrp01"
contacts=""
analysis=exit
<<<test_output>>>
getpgrp01    1  TPASS  :  getpgrp returned 2635
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getpid01 stime=1567146681
cmdline="getpid01"
contacts=""
analysis=exit
<<<test_output>>>
getpid01    1  TPASS  :  getpid returned 2636
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getppid01 stime=1567146681
cmdline="getppid01"
contacts=""
analysis=exit
<<<test_output>>>
getppid01    1  TPASS  :  getppid returned 2315
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getuid01 stime=1567146681
cmdline="getuid01"
contacts=""
analysis=exit
<<<test_output>>>
getuid01    1  TPASS  :  getuid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=kill02 stime=1567146681
cmdline="kill02"
contacts=""
analysis=exit
<<<test_output>>>
kill02      1  TPASS  :  The signal was sent to all processes in the process group.
kill02      2  TPASS  :  The signal was not sent to selective processes that were not in the process group.
<<<execution_status>>>
initiation_status="ok"
duration=10 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=2
<<<test_end>>>
<<<test_start>>>
tag=kill09 stime=1567146691
cmdline="kill09"
contacts=""
analysis=exit
<<<test_output>>>
kill09      1  TPASS  :  kill(2678, SIGKILL) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link02 stime=1567146691
cmdline="link02"
contacts=""
analysis=exit
<<<test_output>>>
link02      1  TPASS  :  link(oldpath,newpath) returned 0 and link counts match
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link03 stime=1567146691
cmdline="link03"
contacts=""
analysis=exit
<<<test_output>>>
link03      1  TPASS  :  link() passed and linkcounts=10 match
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link04 stime=1567146691
cmdline="link04"
contacts=""
analysis=exit
<<<test_output>>>
link04      1  TPASS  :  link(<non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      2  TPASS  :  link(<path is empty string>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      3  TPASS  :  link(<path contains a non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      4  TPASS  :  link(<path contains a regular file>, <nefile>): TEST_ERRNO=ENOTDIR(20): Not a directory
link04      5  TPASS  :  link(<pathname too long>, <nefile>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
link04      6  TPASS  :  link(<invalid address>, <nefile>): TEST_ERRNO=EFAULT(14): Bad address
link04      7  TPASS  :  link(<regfile>, <empty string>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      8  TPASS  :  link(<regfile>, <path contains a non-existent file>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      9  TPASS  :  link(<regfile>, <path contains a regular file>): TEST_ERRNO=ENOENT(2): No such file or directory
link04     10  TPASS  :  link(<regfile>, <pathname too long>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
link04     11  TPASS  :  link(<regfile>, <invalid address>): TEST_ERRNO=EFAULT(14): Bad address
link04     12  TPASS  :  link(<regfile>, <regfile2>): TEST_ERRNO=EEXIST(17): File exists
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link05 stime=1567146691
cmdline="link05"
contacts=""
analysis=exit
<<<test_output>>>
link05      1  TPASS  :  link(lkfile_2682, lkfile_2682[1-1000]) ret 0 for 1000 files,stat linkcounts match 1000
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek01 stime=1567146691
cmdline="lseek01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek01.c:67: PASS: lseek(tfile, 4, SEEK_SET) read correct data
lseek01.c:67: PASS: lseek(tfile, -2, SEEK_CUR) read correct data
lseek01.c:67: PASS: lseek(tfile, -4, SEEK_END) read correct data
lseek01.c:67: PASS: lseek(tfile, 0, SEEK_END) read correct data

Summary:
passed   4
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek02 stime=1567146691
cmdline="lseek02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek02.c:65: PASS: lseek(-1, 1, 0) failed as expected: EBADF
lseek02.c:65: PASS: lseek(-1, 1, 1) failed as expected: EBADF
lseek02.c:65: PASS: lseek(-1, 1, 2) failed as expected: EBADF
lseek02.c:65: PASS: lseek(7, 1, 5) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(7, 1, -1) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(7, 1, 7) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(8, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(8, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(8, 1, 2) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 2) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 2) failed as expected: ESPIPE

Summary:
passed   15
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek07 stime=1567146691
cmdline="lseek07"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek07.c:70: PASS: lseek(tfile1, 7, SEEK_SET) wrote correct data abcdefgijk
lseek07.c:70: PASS: lseek(tfile2, 2, SEEK_SET) wrote correct data abijkfg

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek11 stime=1567146691
cmdline="lseek11"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek11.c:162: INFO: The block size is 4096
lseek11.c:212: PASS: The 0th test passed: SEEK_DATA from startblock 0 offset 0
lseek11.c:212: PASS: The 1th test passed: SEEK_DATA from startblock 0 offset 4
lseek11.c:212: PASS: The 2th test passed: SEEK_HOLE from startblock 0 offset 0
lseek11.c:212: PASS: The 3th test passed: SEEK_HOLE from startblock 0 offset 4
lseek11.c:212: PASS: The 4th test passed: SEEK_HOLE from startblock 1 offset 0
lseek11.c:212: PASS: The 5th test passed: SEEK_HOLE from startblock 1 offset 128
lseek11.c:212: PASS: The 6th test passed: SEEK_DATA from startblock 1 offset 0
lseek11.c:212: PASS: The 7th test passed: SEEK_DATA from startblock 10 offset -1
lseek11.c:212: PASS: The 8th test passed: SEEK_DATA from startblock 10 offset 0
lseek11.c:212: PASS: The 9th test passed: SEEK_DATA from startblock 10 offset 4
lseek11.c:212: PASS: The 10th test passed: SEEK_HOLE from startblock 10 offset 0
lseek11.c:212: PASS: The 11th test passed: SEEK_HOLE from startblock 10 offset 4
lseek11.c:212: PASS: The 12th test passed: SEEK_HOLE from startblock 11 offset 128
lseek11.c:212: PASS: The 13th test passed: SEEK_DATA from startblock 11 offset 128
lseek11.c:212: PASS: The 14th test passed: SEEK_HOLE from startblock 30 offset -128

Summary:
passed   15
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=lstat02 stime=1567146691
cmdline="lstat02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lstat02.c:72: PASS: lstat() failed as expected: EACCES
lstat02.c:72: PASS: lstat() failed as expected: ENOENT
lstat02.c:72: PASS: lstat() failed as expected: EFAULT
lstat02.c:72: PASS: lstat() failed as expected: ENAMETOOLONG
lstat02.c:72: PASS: lstat() failed as expected: ENOTDIR
lstat02.c:72: PASS: lstat() failed as expected: ELOOP

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=qmm01 stime=1567146691
cmdline="mmap001 -m 1"
contacts=""
analysis=exit
<<<test_output>>>
mmap001     0  TINFO  :  mmap()ing file of 1 pages or 4096 bytes
mmap001     1  TPASS  :  mmap() completed successfully.
mmap001     0  TINFO  :  touching mmaped memory
mmap001     2  TPASS  :  we're still here, mmaped area must be good
mmap001     3  TPASS  :  synchronizing mmapped page passed
mmap001     4  TPASS  :  munmapping testfile.2693 successful
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=open03 stime=1567146691
cmdline="open03"
contacts=""
analysis=exit
<<<test_output>>>
open03      1  TPASS  :  open(tfile_2694, O_RDWR|O_CREAT,0700) returned 7
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=pathconf01 stime=1567146691
cmdline="pathconf01"
contacts=""
analysis=exit
<<<test_output>>>
pathconf01    1  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_LINK_MAX) returned 127
pathconf01    2  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_NAME_MAX) returned 255
pathconf01    3  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_PATH_MAX) returned 4096
pathconf01    4  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_PIPE_BUF) returned 4096
pathconf01    5  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_CHOWN_RESTRICTED) returned 1
pathconf01    6  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_NO_TRUNC) returned 1
pathconf01    7  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, (null)) returned 127
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=pause01 stime=1567146691
cmdline="pause01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
pause01.c:24: PASS: pause() interrupted with EINTR

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=read01 stime=1567146691
cmdline="read01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
read01.c:24: PASS: read(2) returned 512

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readdir01 stime=1567146691
cmdline="readdir01"
contacts=""
analysis=exit
<<<test_output>>>
readdir01    1  TPASS  :  found all 10 that were created
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readlink01 stime=1567146691
cmdline="readlink01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
readlink01.c:64: INFO: Running test as root
readlink01.c:46: PASS: readlink() functionality on 'slink_file' was correct
readlink01.c:55: INFO: Running test as nobody
readlink01.c:46: PASS: readlink() functionality on 'slink_file' was correct

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rename02 stime=1567146691
cmdline="rename02"
contacts=""
analysis=exit
<<<test_output>>>
rename02    1  TPASS  :  rename(./tfile_2705, ./rnfile_2705) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sbrk01 stime=1567146691
cmdline="sbrk01"
contacts=""
analysis=exit
<<<test_output>>>
sbrk01      1  TPASS  :  sbrk - Increase by 8192 bytes returned 0x561c55ca9000
sbrk01      2  TPASS  :  sbrk - Increase by -8192 bytes returned 0x561c55cab000
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select01 stime=1567146691
cmdline="select01"
contacts=""
analysis=exit
<<<test_output>>>
select01    1  TPASS  :  select(4, &Readfds, 0, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select02 stime=1567146691
cmdline="select02"
contacts=""
analysis=exit
<<<test_output>>>
select02    1  TPASS  :  select(5, &Readfds, &Writefds, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select03 stime=1567146691
cmdline="select03"
contacts=""
analysis=exit
<<<test_output>>>
select03    1  TPASS  :  select(5, &Readfds, &Writefds, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select04 stime=1567146691
cmdline="select04"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:66: INFO: Testing libc select()
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1070us, max 1165us, median 1086us, trunc mean 1086.85us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2063us, max 2163us, median 2086us, trunc mean 2085.80us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5023us, max 6950us, median 5087us, trunc mean 5080.59us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10023us, max 13191us, median 10092us, trunc mean 10083.97us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25037us, max 25125us, median 25093us, trunc mean 25089.46us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100147us, max 100188us, median 100152us, trunc mean 100154.89us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1001053us, max 1001054us, median 1001053us, trunc mean 1001053.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:69: INFO: Testing SYS_select syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1032us, max 3463us, median 1088us, trunc mean 1085.77us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2066us, max 2909us, median 2090us, trunc mean 2088.88us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5027us, max 7132us, median 5091us, trunc mean 5083.71us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10020us, max 11097us, median 10065us, trunc mean 10069.60us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25019us, max 25875us, median 25077us, trunc mean 25075.98us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100050us, max 100140us, median 100129us, trunc mean 100121.56us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1000608us, max 1001979us, median 1000608us, trunc mean 1000608.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:72: INFO: Testing SYS_pselect6 syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1032us, max 7062us, median 1113us, trunc mean 1278.90us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2019us, max 9798us, median 2118us, trunc mean 2393.83us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5029us, max 10059us, median 5092us, trunc mean 5322.80us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10023us, max 11715us, median 10099us, trunc mean 10290.46us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25077us, max 27248us, median 25095us, trunc mean 25163.85us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100150us, max 100244us, median 100181us, trunc mean 100179.22us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1000666us, max 1001053us, median 1000666us, trunc mean 1000666.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:75: INFO: Testing SYS__newselect syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
select_var.h:54: CONF: __NR__newselect not implemented

Summary:
passed   21
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=26 termination_type=exited termination_id=0 corefile=no
cutime=4 cstime=6
<<<test_end>>>
<<<test_start>>>
tag=setgid01 stime=1567146717
cmdline="setgid01"
contacts=""
analysis=exit
<<<test_output>>>
setgid01    1  TPASS  :  setgid(0) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setpgid01 stime=1567146717
cmdline="setpgid01"
contacts=""
analysis=exit
<<<test_output>>>
setpgid01    1  TPASS  :  test setpgid(2797, 2797) success
setpgid01    2  TPASS  :  test setpgid(0, 0) success
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setpgrp01 stime=1567146717
cmdline="setpgrp01"
contacts=""
analysis=exit
<<<test_output>>>
setpgrp01    1  TPASS  :  setpgrp -  Call the setpgrp system call returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setregid01 stime=1567146717
cmdline="setregid01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
setregid01.c:49: PASS: Dont change either real or effective gid
setregid01.c:49: PASS: Change effective to effective gid
setregid01.c:49: PASS: Change real to real gid
setregid01.c:49: PASS: Change effective to real gid
setregid01.c:49: PASS: Try to change real to current real

Summary:
passed   5
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setreuid01 stime=1567146717
cmdline="setreuid01"
contacts=""
analysis=exit
<<<test_output>>>
setreuid01    1  TPASS  :  setreuid -  Don't change either real or effective uid returned 0
setreuid01    2  TPASS  :  setreuid -  change effective to effective uid returned 0
setreuid01    3  TPASS  :  setreuid -  change real to real uid returned 0
setreuid01    4  TPASS  :  setreuid -  change effective to real uid returned 0
setreuid01    5  TPASS  :  setreuid -  try to change real to current real returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setuid01 stime=1567146717
cmdline="setuid01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
setuid01.c:30: PASS: setuid(0) successfully

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sighold02 stime=1567146717
cmdline="sighold02"
contacts=""
analysis=exit
<<<test_output>>>
sighold02    1  TPASS  :  All signals were hold
sighold02    0  TINFO  :  Child process returned TPASS
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=signal03 stime=1567146717
cmdline="signal03"
contacts=""
analysis=exit
<<<test_output>>>
signal03    1  TPASS  :  signal03 call succeeded
signal03    2  TPASS  :  signal03 call succeeded
signal03    3  TPASS  :  signal03 call succeeded
signal03    4  TPASS  :  signal03 call succeeded
signal03    5  TPASS  :  signal03 call succeeded
signal03    6  TPASS  :  signal03 call succeeded
signal03    7  TPASS  :  signal03 call succeeded
signal03    8  TPASS  :  signal03 call succeeded
signal03    9  TPASS  :  signal03 call succeeded
signal03   10  TPASS  :  signal03 call succeeded
signal03   11  TPASS  :  signal03 call succeeded
signal03   12  TPASS  :  signal03 call succeeded
signal03   13  TPASS  :  signal03 call succeeded
signal03   14  TPASS  :  signal03 call succeeded
signal03   15  TPASS  :  signal03 call succeeded
signal03   16  TPASS  :  signal03 call succeeded
signal03   17  TPASS  :  signal03 call succeeded
signal03   18  TPASS  :  signal03 call succeeded
signal03   19  TPASS  :  signal03 call succeeded
signal03   20  TPASS  :  signal03 call succeeded
signal03   21  TPASS  :  signal03 call succeeded
signal03   22  TPASS  :  signal03 call succeeded
signal03   23  TPASS  :  signal03 call succeeded
signal03   24  TPASS  :  signal03 call succeeded
signal03   25  TPASS  :  signal03 call succeeded
signal03   26  TPASS  :  signal03 call succeeded
signal03   27  TPASS  :  signal03 call succeeded
signal03   28  TPASS  :  signal03 call succeeded
signal03   29  TPASS  :  signal03 call succeeded
signal03   30  TPASS  :  signal03 call succeeded
signal03   31  TPASS  :  signal03 call succeeded
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sigrelse01 stime=1567146717
cmdline="sigrelse01"
contacts=""
analysis=exit
<<<test_output>>>
sigrelse01    1  TPASS  :  sigrelse() released all 55 signals under test.
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=statfs01 stime=1567146717
cmdline="statfs01"
contacts=""
analysis=exit
<<<test_output>>>
statfs01    1  TPASS  :  statfs(tfile_2811, ..) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=statvfs01 stime=1567146717
cmdline="statvfs01"
contacts=""
analysis=exit
<<<test_output>>>
statvfs01    1  TPASS  :  statvfs(/, ...) passed
statvfs01    0  TINFO  :  This call is similar to statfs
statvfs01    0  TINFO  :  Extracting info about the '/' file system
statvfs01    0  TINFO  :  file system block size = 4096 bytes
statvfs01    0  TINFO  :  file system fragment size = 4096 bytes
statvfs01    0  TINFO  :  file system free blocks = 0
statvfs01    0  TINFO  :  file system total inodes = 0
statvfs01    0  TINFO  :  file system free inodes = 0
statvfs01    0  TINFO  :  file system id = 0
statvfs01    0  TINFO  :  file system max filename length = 255
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sync01 stime=1567146717
cmdline="sync01"
contacts=""
analysis=exit
<<<test_output>>>
sync01      1  TPASS  :  sync() returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=time01 stime=1567146717
cmdline="time01"
contacts=""
analysis=exit
<<<test_output>>>
time01      1  TPASS  :  time(0) returned 1567146717
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=times01 stime=1567146717
cmdline="times01"
contacts=""
analysis=exit
<<<test_output>>>
times01     1  TPASS  :  times(&mytimes) returned 429473644
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=ulimit01 stime=1567146717
cmdline="ulimit01"
contacts=""
analysis=exit
<<<test_output>>>
ulimit01    1  TPASS  :  ulimit(1, -1) returned 9223372036854775807
ulimit01    2  TPASS  :  ulimit(2, 9223372036854775807) returned 9223372036854775807
ulimit01    3  TPASS  :  ulimit(2, 9223372036854775806) returned 9223372036854775807
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=umask01 stime=1567146717
cmdline="umask01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
umask01.c:57: PASS: All files created with correct mode

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=uname01 stime=1567146717
cmdline="uname01"
contacts=""
analysis=exit
<<<test_output>>>
uname01     1  TPASS  :  uname(&un) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink05 stime=1567146717
cmdline="unlink05"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink05.c:61: PASS: unlink(file) succeeded
unlink05.c:61: PASS: unlink(fifo) succeeded

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink07 stime=1567146717
cmdline="unlink07"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink07.c:51: PASS: unlink(<non-existent file>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<path is empty string>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<path contains a non-existent file>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<invalid address>) failed as expected: EFAULT
unlink07.c:51: PASS: unlink(<path contains a regular file>) failed as expected: ENOTDIR
unlink07.c:51: PASS: unlink(<pathname too long>) failed as expected: ENAMETOOLONG

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink08 stime=1567146717
cmdline="unlink08"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink08.c:48: PASS: unlink(<unwritable directory>) failed as expected: EACCES
unlink08.c:48: PASS: unlink(<unsearchable directory>) failed as expected: EACCES
unlink08.c:48: PASS: unlink(<directory>) failed as expected: EISDIR
unlink08.c:48: PASS: unlink(<directory>) failed as expected: EISDIR

Summary:
passed   4
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=wait02 stime=1567146717
cmdline="wait02"
contacts=""
analysis=exit
<<<test_output>>>
wait02      1  TPASS  :  wait(&status) returned 2830
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=write01 stime=1567146718
cmdline="write01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
write01.c:40: PASS: write() passed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=4
<<<test_end>>>
<<<test_start>>>
tag=symlink01 stime=1567146718
cmdline="symlink01"
contacts=""
analysis=exit
<<<test_output>>>
symlink01    1  TPASS  :  Creation of symbolic link file to no object file is ok
symlink01    2  TPASS  :  Creation of symbolic link file to no object file is ok
symlink01    3  TPASS  :  Creation of symbolic link file and object file via symbolic link is ok
symlink01    4  TPASS  :  Creating an existing symbolic link file error is caught
symlink01    5  TPASS  :  Creating a symbolic link which exceeds maximum pathname error is caught
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=symlink02 stime=1567146718
cmdline="symlink02"
contacts=""
analysis=exit
<<<test_output>>>
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readlink01A stime=1567146718
cmdline="symlink01 -T readlink01"
contacts=""
analysis=exit
<<<test_output>>>
readlink01    1  TPASS  :  Reading of symbolic link file contents checks out ok
readlink01    2  TPASS  :  Reading of symbolic link file contents checks out ok
readlink01    3  TPASS  :  Reading a symbolic link which exceeds maximum pathname error is caught
readlink01    4  TPASS  :  Reading a nonsymbolic link file error condition is caught.  EINVAL is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=stat04 stime=1567146718
cmdline="symlink01 -T stat04"
contacts=""
analysis=exit
<<<test_output>>>
stat04      1  TPASS  :  Getting stat info about object file through symbolic link file is ok
stat04      2  TPASS  :  Stat(2) error when accessing non-existent object through symbolic link is caught
stat04      3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lstat01A stime=1567146718
cmdline="symlink01 -T lstat01"
contacts=""
analysis=exit
<<<test_output>>>
lstat01     1  TPASS  :  lstat(2) of symbolic link file which points to no object file is ok
lstat01     2  TPASS  :  lstat(2) of symbolic link file which points at an object file is ok
lstat01     3  TPASS  :  lstat(2) of object file returns object file inode information
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=mkdir05A stime=1567146718
cmdline="symlink01 -T mkdir05"
contacts=""
analysis=exit
<<<test_output>>>
mkdir05     1  TPASS  :  mkdir(2) of object file through symbolic link file failed as expected
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rmdir03A stime=1567146718
cmdline="symlink01 -T rmdir03"
contacts=""
analysis=exit
<<<test_output>>>
rmdir03     1  TPASS  :  rmdir(2) of object file through symbolic link file failed as expected
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chdir01A stime=1567146718
cmdline="symlink01 -T chdir01"
contacts=""
analysis=exit
<<<test_output>>>
chdir01     1  TPASS  :  chdir(2) to object file location through symbolic link file is ok
chdir01     2  TPASS  :  chdir(2) to non-existent object file location through symbolic link file failed as expected
chdir01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link01 stime=1567146718
cmdline="symlink01 -T link01"
contacts=""
analysis=exit
<<<test_output>>>
link01      1  TPASS  :  link(2) to a symbolic link, which is pointing to an existing object file worked - file created and link count adjusted
link01      2  TPASS  :  link(2) to a symbolic link, which is pointing to a non-existing object file worked ok - file created and link count adjusted.
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink01 stime=1567146718
cmdline="symlink01 -T unlink01"
contacts=""
analysis=exit
<<<test_output>>>
unlink01    1  TPASS  :  unlink(2) of symbolic link file with no object file removal is ok
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chmod01A stime=1567146718
cmdline="symlink01 -T chmod01"
contacts=""
analysis=exit
<<<test_output>>>
chmod01     1  TPASS  :  chmod(2) of object file permissions through symbolic link file is ok
chmod01     2  TPASS  :  chmod(2) error when accessing non-existent object through symbolic link is caught
chmod01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=utime01A stime=1567146718
cmdline="symlink01 -T utime01"
contacts=""
analysis=exit
<<<test_output>>>
utime01     1  TPASS  :  utime(2) change of object file access and modify times through symbolic link file is ok
utime01     2  TPASS  :  utime(2) error when accessing non-existent object through symbolic link is caught
utime01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rename01A stime=1567146718
cmdline="symlink01 -T rename01"
contacts=""
analysis=exit
<<<test_output>>>
rename01    1  TPASS  :  rename(3) of symbolic link file name which points at no object file is ok
rename01    2  TPASS  :  rename(3) of symbolic link file name which points at object file is ok
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=open01A stime=1567146718
cmdline="symlink01 -T open01"
contacts=""
analysis=exit
<<<test_output>>>
open01      1  TPASS  :  open(2) with (O_CREAT | O_RDWR) to create object file through symbolic link file and all writes, reads, and lseeks are ok
open01      2  TPASS  :  open(2) with O_RDWR of existing  object file through symbolic link file and all writes, reads, and lseeks are ok
open01      3  TPASS  :  open(2) with (O_CREAT | O_EXCL) error  is caught when creating object file through symbolic link file
open01      4  TPASS  :  open(2) error with O_RDWR is caught when processing symbolic link file which points at no object file
open01      5  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20190517-204-gc2049b5c8

       ###############################################################

            Done executing testcases.
            LTP Version:  20190517-204-gc2049b5c8
       ###############################################################




To reproduce:

        # build kernel
	cd linux
	cp config-5.3.0-rc5-00015-g2ad9ab0f74297 .config
	make HOSTCC=gcc-7 CC=gcc-7 ARCH=x86_64 olddefconfig prepare modules_prepare bzImage modules
	make HOSTCC=gcc-7 CC=gcc-7 ARCH=x86_64 INSTALL_MOD_PATH=<mod-install-dir> modules_install
	cd <mod-install-dir>
	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz


        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script is attached in this email



Thanks,
Oliver Sang


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.3.0-rc5-00015-g2ad9ab0f74297"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.3.0-rc5 Kernel Configuration
#

#
# Compiler: gcc-7 (Debian 7.4.0-11) 7.4.0
#
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=70400
CONFIG_CLANG_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_EXTABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_HEADER_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING=y
# CONFIG_CONTEXT_TRACKING_FORCE is not set
CONFIG_NO_HZ=y
CONFIG_HIGH_RES_TIMERS=y
# end of Timers subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_IRQ_TIME_ACCOUNTING is not set
CONFIG_HAVE_SCHED_AVG_IRQ=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_XACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_NOCB_CPU=y
# end of RCU Subsystem

CONFIG_BUILD_BIN2C=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_SWAP_ENABLED=y
CONFIG_MEMCG_KMEM=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_WRITEBACK=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
CONFIG_CGROUP_RDMA=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_BPF=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_PRINTK_NMI=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_RSEQ=y
# CONFIG_DEBUG_RSEQ is not set
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_MEMCG_SYSFS_ON is not set
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
# CONFIG_SLAB_FREELIST_RANDOM is not set
# CONFIG_SLAB_FREELIST_HARDENED is not set
# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_SLUB_CPU_PARTIAL=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_ARCH_DEFCONFIG="arch/x86/configs/x86_64_defconfig"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ZONE_DMA32=y
CONFIG_AUDIT_ARCH=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_ZONE_DMA=y
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
CONFIG_X86_CPU_RESCTRL=y
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
CONFIG_X86_AMD_PLATFORM_DEVICE=y
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_XXL=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
CONFIG_XEN_PV=y
CONFIG_XEN_PV_SMP=y
# CONFIG_XEN_DOM0 is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_512GB=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
# CONFIG_PVH is not set
# CONFIG_KVM_DEBUG_FS is not set
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
# CONFIG_PROCESSOR_SELECT is not set
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
CONFIG_GART_IOMMU=y
# CONFIG_CALGARY_IOMMU is not set
CONFIG_MAXSMP=y
CONFIG_NR_CPUS_RANGE_BEGIN=8192
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=8192
CONFIG_NR_CPUS=8192
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
CONFIG_X86_MCE=y
CONFIG_X86_MCELOG_LEGACY=y
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_AMD=y
CONFIG_X86_MCE_THRESHOLD=y
CONFIG_X86_MCE_INJECT=m
CONFIG_X86_THERMAL_VECTOR=y

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=y
CONFIG_PERF_EVENTS_INTEL_RAPL=y
CONFIG_PERF_EVENTS_INTEL_CSTATE=y
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_I8K=m
CONFIG_MICROCODE=y
CONFIG_MICROCODE_INTEL=y
CONFIG_MICROCODE_AMD=y
CONFIG_MICROCODE_OLD_INTERFACE=y
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NODES_SPAN_OTHER_NODES=y
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_X86_RESERVE_LOW=64
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_INTEL_UMIP=y
CONFIG_X86_INTEL_MPX=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
CONFIG_KEXEC_VERIFY_SIG=y
CONFIG_KEXEC_BZIMAGE_VERIFY_SIG=y
CONFIG_CRASH_DUMP=y
CONFIG_KEXEC_JUMP=y
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_X86_NEED_RELOCS=y
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_RANDOMIZE_MEMORY=y
CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=0xa
CONFIG_HOTPLUG_CPU=y
CONFIG_BOOTPARAM_HOTPLUG_CPU0=y
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
# CONFIG_COMPAT_VDSO is not set
CONFIG_LEGACY_VSYSCALL_EMULATE=y
# CONFIG_LEGACY_VSYSCALL_XONLY is not set
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
CONFIG_MODIFY_LDT_SYSCALL=y
CONFIG_HAVE_LIVEPATCH=y
CONFIG_LIVEPATCH=y
# end of Processor type and features

CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
# CONFIG_SUSPEND_SKIP_SYNC is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_DPM_WATCHDOG is not set
CONFIG_PM_TRACE=y
CONFIG_PM_TRACE_RTC=y
CONFIG_PM_CLK=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
# CONFIG_ENERGY_MODEL is not set
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
# CONFIG_ACPI_DEBUGGER is not set
CONFIG_ACPI_SPCR_TABLE=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS_POWER is not set
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
# CONFIG_ACPI_TAD is not set
CONFIG_ACPI_DOCK=y
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_IPMI=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
CONFIG_ACPI_THERMAL=y
CONFIG_ACPI_NUMA=y
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
CONFIG_ACPI_CUSTOM_METHOD=m
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
CONFIG_ACPI_APEI_ERST_DEBUG=y
# CONFIG_DPTF_POWER is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_PMIC_OPREGION is not set
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_X86_PM_TIMER=y
CONFIG_SFI=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
# CONFIG_CPU_FREQ_GOV_SCHEDUTIL is not set

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_AMD_FREQ_SENSITIVITY=m
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_SPEEDSTEP_LIB=m
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
# CONFIG_CPU_IDLE_GOV_LADDER is not set
CONFIG_CPU_IDLE_GOV_MENU=y
# CONFIG_CPU_IDLE_GOV_TEO is not set
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
CONFIG_ISA_DMA_API=y
CONFIG_AMD_NB=y
# CONFIG_X86_SYSFB is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
CONFIG_IA32_EMULATION=y
# CONFIG_X86_X32 is not set
CONFIG_COMPAT_32=y
CONFIG_COMPAT=y
CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
CONFIG_SYSVIPC_COMPAT=y
# end of Binary Emulations

CONFIG_X86_DEV_DMA_OPS=y

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
CONFIG_ISCSI_IBFT_FIND=y
CONFIG_ISCSI_IBFT=m
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_GOOGLE_FIRMWARE is not set

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_VARS=y
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_RUNTIME_MAP=y
# CONFIG_EFI_FAKE_MEMMAP is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_HAVE_KVM=y
CONFIG_HAVE_KVM_IRQCHIP=y
CONFIG_HAVE_KVM_IRQFD=y
CONFIG_HAVE_KVM_IRQ_ROUTING=y
CONFIG_HAVE_KVM_EVENTFD=y
CONFIG_KVM_MMIO=y
CONFIG_KVM_ASYNC_PF=y
CONFIG_HAVE_KVM_MSI=y
CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
CONFIG_KVM_VFIO=y
CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
CONFIG_KVM_COMPAT=y
CONFIG_HAVE_KVM_IRQ_BYPASS=y
CONFIG_HAVE_KVM_NO_POLL=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
CONFIG_KVM_AMD=m
CONFIG_KVM_AMD_SEV=y
CONFIG_KVM_MMU_AUDIT=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_OPROFILE=m
CONFIG_OPROFILE_EVENT_MULTIPLEX=y
CONFIG_HAVE_OPROFILE=y
CONFIG_OPROFILE_NMI_TIMER=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_HAVE_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP_FILTER=y
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_COPY_THREAD_TLS=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_64BIT_TIME=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_ARCH_HAS_REFCOUNT=y
# CONFIG_REFCOUNT_FULL is not set
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_PLUGIN_HOSTCC="g++"
CONFIG_HAVE_GCC_PLUGINS=y
CONFIG_GCC_PLUGINS=y

#
# GCC plugins
#
# CONFIG_GCC_PLUGIN_CYC_COMPLEXITY is not set
# CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
# CONFIG_GCC_PLUGIN_RANDSTRUCT is not set
# end of GCC plugins
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
CONFIG_MODULE_SIG_SHA256=y
# CONFIG_MODULE_SIG_SHA384 is not set
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha256"
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
CONFIG_OSF_PARTITION=y
CONFIG_AMIGA_PARTITION=y
# CONFIG_ATARI_PARTITION is not set
CONFIG_MAC_PARTITION=y
CONFIG_MSDOS_PARTITION=y
CONFIG_BSD_DISKLABEL=y
CONFIG_MINIX_SUBPARTITION=y
CONFIG_SOLARIS_X86_PARTITION=y
CONFIG_UNIXWARE_DISKLABEL=y
# CONFIG_LDM_PARTITION is not set
CONFIG_SGI_PARTITION=y
# CONFIG_ULTRIX_PARTITION is not set
CONFIG_SUN_PARTITION=y
CONFIG_KARMA_PARTITION=y
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_PREEMPT_NOTIFIERS=y
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_BINFMT_MISC=m
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_SPARSEMEM_MANUAL=y
CONFIG_SPARSEMEM=y
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_HAVE_MEMORY_PRESENT=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_BOUNCE=y
CONFIG_VIRT_TO_BUS=y
CONFIG_MMU_NOTIFIER=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
CONFIG_MEMORY_FAILURE=y
CONFIG_HWPOISON_INJECT=m
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_THP_SWAP=y
CONFIG_TRANSPARENT_HUGE_PAGECACHE=y
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=7
CONFIG_MEM_SOFT_DIRTY=y
CONFIG_ZSWAP=y
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
# CONFIG_PGTABLE_MAPPING is not set
# CONFIG_ZSMALLOC_STAT is not set
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_HMM_MIRROR=y
# CONFIG_DEVICE_PRIVATE is not set
CONFIG_FRAME_VECTOR=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_BENCHMARK is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# end of Memory Management options

CONFIG_NET=y
CONFIG_COMPAT_NETLINK_MESSAGES=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_DIAG=m
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_UNIX_DIAG=m
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_XDP_SOCKETS is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_FIB_TRIE_STATS=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=m
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=m
CONFIG_NET_IPGRE=m
CONFIG_NET_IPGRE_BROADCAST=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_NET_IPVTI=m
CONFIG_NET_UDP_TUNNEL=m
CONFIG_NET_FOU=m
CONFIG_NET_FOU_IP_TUNNELS=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
# CONFIG_INET_ESP_OFFLOAD is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
# CONFIG_INET_RAW_DIAG is not set
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
# CONFIG_TCP_CONG_BBR is not set
CONFIG_DEFAULT_CUBIC=y
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
CONFIG_IPV6_OPTIMISTIC_DAD=y
CONFIG_INET6_AH=m
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
# CONFIG_IPV6_ILA is not set
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
CONFIG_IPV6_SIT_6RD=y
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
CONFIG_IPV6_SEG6_LWTUNNEL=y
# CONFIG_IPV6_SEG6_HMAC is not set
CONFIG_IPV6_SEG6_BPF=y
CONFIG_NETLABEL=y
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_BRIDGE_NETFILTER=m

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
CONFIG_NETFILTER_NETLINK_ACCT=m
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
# CONFIG_NF_LOG_NETDEV is not set
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_TIMEOUT=y
CONFIG_NF_CONNTRACK_TIMESTAMP=y
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_GRE=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_TIMEOUT=m
# CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
CONFIG_NF_NAT=m
CONFIG_NF_NAT_AMANDA=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=m
# CONFIG_NF_TABLES_SET is not set
# CONFIG_NF_TABLES_INET is not set
# CONFIG_NF_TABLES_NETDEV is not set
# CONFIG_NFT_NUMGEN is not set
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
# CONFIG_NFT_TUNNEL is not set
# CONFIG_NFT_OBJREF is not set
CONFIG_NFT_QUEUE=m
# CONFIG_NFT_QUOTA is not set
CONFIG_NFT_REJECT=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
# CONFIG_NFT_XFRM is not set
# CONFIG_NFT_SOCKET is not set
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=m
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_AUDIT=m
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
CONFIG_NETFILTER_XT_TARGET_LED=m
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_NETMAP=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TPROXY=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_SECMARK=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_BPF=m
CONFIG_NETFILTER_XT_MATCH_CGROUP=m
CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_CPU=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=m
# CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NETFILTER_XT_MATCH_L2TP=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_NFACCT=m
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=m
CONFIG_NETFILTER_XT_MATCH_SCTP=m
CONFIG_NETFILTER_XT_MATCH_SOCKET=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_TIME=m
CONFIG_NETFILTER_XT_MATCH_U32=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
CONFIG_IP_SET_HASH_IP=m
CONFIG_IP_SET_HASH_IPMARK=m
CONFIG_IP_SET_HASH_IPPORT=m
CONFIG_IP_SET_HASH_IPPORTIP=m
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
CONFIG_IP_SET_HASH_MAC=m
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
CONFIG_IP_VS_PROTO_TCP=y
CONFIG_IP_VS_PROTO_UDP=y
CONFIG_IP_VS_PROTO_AH_ESP=y
CONFIG_IP_VS_PROTO_ESP=y
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
CONFIG_IP_VS_RR=m
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
# CONFIG_IP_VS_FO is not set
# CONFIG_IP_VS_OVF is not set
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_FTP=m
CONFIG_IP_VS_NFCT=y
CONFIG_IP_VS_PE_SIP=m

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_SOCKET_IPV4=m
CONFIG_NF_TPROXY_IPV4=m
# CONFIG_NF_TABLES_IPV4 is not set
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=m
# CONFIG_NF_LOG_ARP is not set
CONFIG_NF_LOG_IPV4=m
CONFIG_NF_REJECT_IPV4=m
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_PPTP=m
CONFIG_NF_NAT_H323=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_RPFILTER=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_SYNPROXY=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_NETMAP=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_SECURITY=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=m
# CONFIG_NF_TABLES_IPV6 is not set
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_AH=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_MH=m
CONFIG_IP6_NF_MATCH_RPFILTER=m
CONFIG_IP6_NF_MATCH_RT=m
# CONFIG_IP6_NF_MATCH_SRH is not set
CONFIG_IP6_NF_TARGET_HL=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_TARGET_SYNPROXY=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP6_NF_SECURITY=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=m
# CONFIG_NF_TABLES_BRIDGE is not set
# CONFIG_NF_CONNTRACK_BRIDGE is not set
CONFIG_BRIDGE_NF_EBTABLES=m
CONFIG_BRIDGE_EBT_BROUTE=m
CONFIG_BRIDGE_EBT_T_FILTER=m
CONFIG_BRIDGE_EBT_T_NAT=m
CONFIG_BRIDGE_EBT_802_3=m
CONFIG_BRIDGE_EBT_AMONG=m
CONFIG_BRIDGE_EBT_ARP=m
CONFIG_BRIDGE_EBT_IP=m
CONFIG_BRIDGE_EBT_IP6=m
CONFIG_BRIDGE_EBT_LIMIT=m
CONFIG_BRIDGE_EBT_MARK=m
CONFIG_BRIDGE_EBT_PKTTYPE=m
CONFIG_BRIDGE_EBT_STP=m
CONFIG_BRIDGE_EBT_VLAN=m
CONFIG_BRIDGE_EBT_ARPREPLY=m
CONFIG_BRIDGE_EBT_DNAT=m
CONFIG_BRIDGE_EBT_MARK_T=m
CONFIG_BRIDGE_EBT_REDIRECT=m
CONFIG_BRIDGE_EBT_SNAT=m
CONFIG_BRIDGE_EBT_LOG=m
CONFIG_BRIDGE_EBT_NFLOG=m
# CONFIG_BPFILTER is not set
CONFIG_IP_DCCP=m
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
# CONFIG_IP_DCCP_CCID3_DEBUG is not set
CONFIG_IP_DCCP_TFRC_LIB=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
# CONFIG_IP_DCCP_DEBUG is not set
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
CONFIG_ATM_LANE=m
# CONFIG_ATM_MPOA is not set
CONFIG_ATM_BR2684=m
# CONFIG_ATM_BR2684_IPFILTER is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
CONFIG_L2TP_IP=m
CONFIG_L2TP_ETH=m
CONFIG_STP=m
CONFIG_GARP=m
CONFIG_MRP=m
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
CONFIG_BRIDGE_VLAN_FILTERING=y
CONFIG_HAVE_NET_DSA=y
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=m
CONFIG_VLAN_8021Q_GVRP=y
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
# CONFIG_LLC2 is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
CONFIG_6LOWPAN=m
# CONFIG_6LOWPAN_DEBUGFS is not set
CONFIG_6LOWPAN_NHC=m
CONFIG_6LOWPAN_NHC_DEST=m
CONFIG_6LOWPAN_NHC_FRAGMENT=m
CONFIG_6LOWPAN_NHC_HOP=m
CONFIG_6LOWPAN_NHC_IPV6=m
CONFIG_6LOWPAN_NHC_MOBILITY=m
CONFIG_6LOWPAN_NHC_ROUTING=m
CONFIG_6LOWPAN_NHC_UDP=m
# CONFIG_6LOWPAN_GHC_EXT_HDR_HOP is not set
# CONFIG_6LOWPAN_GHC_UDP is not set
# CONFIG_6LOWPAN_GHC_ICMPV6 is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_DEST is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG is not set
# CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE is not set
CONFIG_IEEE802154=m
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=m
CONFIG_IEEE802154_6LOWPAN=m
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_ATM=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_MULTIQ=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
# CONFIG_NET_SCH_CBS is not set
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_DRR=m
CONFIG_NET_SCH_MQPRIO=m
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=m
CONFIG_NET_SCH_QFQ=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_FQ_CODEL=m
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
# CONFIG_NET_SCH_HHF is not set
# CONFIG_NET_SCH_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
CONFIG_NET_CLS_BASIC=m
CONFIG_NET_CLS_TCINDEX=m
CONFIG_NET_CLS_ROUTE4=m
CONFIG_NET_CLS_FW=m
CONFIG_NET_CLS_U32=m
CONFIG_CLS_U32_PERF=y
CONFIG_CLS_U32_MARK=y
CONFIG_NET_CLS_RSVP=m
CONFIG_NET_CLS_RSVP6=m
CONFIG_NET_CLS_FLOW=m
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=m
CONFIG_NET_EMATCH=y
CONFIG_NET_EMATCH_STACK=32
CONFIG_NET_EMATCH_CMP=m
CONFIG_NET_EMATCH_NBYTE=m
CONFIG_NET_EMATCH_U32=m
CONFIG_NET_EMATCH_META=m
CONFIG_NET_EMATCH_TEXT=m
# CONFIG_NET_EMATCH_CANID is not set
CONFIG_NET_EMATCH_IPSET=m
# CONFIG_NET_EMATCH_IPT is not set
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_POLICE=m
CONFIG_NET_ACT_GACT=m
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_ACT_SAMPLE=m
CONFIG_NET_ACT_IPT=m
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
# CONFIG_NET_ACT_BPF is not set
CONFIG_NET_ACT_CONNMARK=m
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_CT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_OPENVSWITCH_VXLAN=m
CONFIG_OPENVSWITCH_GENEVE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=m
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_NET_NCSI is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
CONFIG_NET_PKTGEN=m
CONFIG_NET_DROP_MONITOR=y
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_BCM=m
CONFIG_CAN_GW=m

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
CONFIG_CAN_C_CAN_PCI=m
CONFIG_CAN_CC770=m
# CONFIG_CAN_CC770_ISA is not set
CONFIG_CAN_CC770_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
# CONFIG_CAN_PEAK_PCIEFD is not set
CONFIG_CAN_SJA1000=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_EMS_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PLX_PCI=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
CONFIG_CAN_8DEV_USB=m
CONFIG_CAN_EMS_USB=m
CONFIG_CAN_ESD_USB2=m
# CONFIG_CAN_GS_USB is not set
CONFIG_CAN_KVASER_USB=m
# CONFIG_CAN_MCBA_USB is not set
CONFIG_CAN_PEAK_USB=m
# CONFIG_CAN_UCAN is not set
# end of CAN USB interfaces

# CONFIG_CAN_DEBUG_DEVICES is not set
# end of CAN Device Drivers

CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=m
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
CONFIG_BT_CMTP=m
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_SELFTEST is not set
CONFIG_BT_DEBUGFS=y

#
# Bluetooth device drivers
#
CONFIG_BT_INTEL=m
CONFIG_BT_BCM=m
CONFIG_BT_RTL=m
CONFIG_BT_HCIBTUSB=m
# CONFIG_BT_HCIBTUSB_AUTOSUSPEND is not set
CONFIG_BT_HCIBTUSB_BCM=y
# CONFIG_BT_HCIBTUSB_MTK is not set
CONFIG_BT_HCIBTUSB_RTL=y
CONFIG_BT_HCIBTSDIO=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIBCM203X=m
CONFIG_BT_HCIBPA10X=m
CONFIG_BT_HCIBFUSB=m
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MRVL_SDIO=m
CONFIG_BT_ATH3K=m
# CONFIG_BT_MTKSDIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
# CONFIG_CFG80211_CERTIFICATION_ONUS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
CONFIG_LIB80211=m
# CONFIG_LIB80211_DEBUG is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
CONFIG_MAC80211_MESH=y
CONFIG_MAC80211_LEDS=y
CONFIG_MAC80211_DEBUGFS=y
# CONFIG_MAC80211_MESSAGE_TRACING is not set
# CONFIG_MAC80211_DEBUG_MENU is not set
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_WIMAX is not set
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_DEBUG is not set
# CONFIG_CAIF is not set
CONFIG_CEPH_LIB=m
# CONFIG_CEPH_LIB_PRETTYDEBUG is not set
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_HAVE_EBPF_JIT=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
# CONFIG_EISA is not set
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCIEPORTBUS=y
CONFIG_HOTPLUG_PCI_PCIE=y
CONFIG_PCIEAER=y
CONFIG_PCIEAER_INJECT=m
CONFIG_PCIE_ECRC=y
CONFIG_PCIEASPM=y
# CONFIG_PCIEASPM_DEBUG is not set
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
# CONFIG_PCIE_DPC is not set
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_BW is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
# CONFIG_PCI_PF_STUB is not set
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_LOCKLESS_CONFIG=y
CONFIG_PCI_IOV=y
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
# CONFIG_PCI_P2PDMA is not set
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_HOTPLUG_PCI=y
CONFIG_HOTPLUG_PCI_ACPI=y
CONFIG_HOTPLUG_PCI_ACPI_IBM=m
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support

CONFIG_VMD=y

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

CONFIG_PCCARD=y
# CONFIG_PCMCIA is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
CONFIG_YENTA=m
CONFIG_YENTA_O2=y
CONFIG_YENTA_RICOH=y
CONFIG_YENTA_TI=y
CONFIG_YENTA_ENE_TUNE=y
CONFIG_YENTA_TOSHIBA=y
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPI=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
CONFIG_MTD=m
# CONFIG_MTD_TESTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
# CONFIG_MTD_AR7_PARTS is not set

#
# Partition parsers
#
# CONFIG_MTD_REDBOOT_PARTS is not set
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_BLKDEVS=m
CONFIG_MTD_BLOCK=m
# CONFIG_MTD_BLOCK_RO is not set
# CONFIG_FTL is not set
# CONFIG_NFTL is not set
# CONFIG_INFTL is not set
# CONFIG_RFD_FTL is not set
# CONFIG_SSFDC is not set
# CONFIG_SM_FTL is not set
# CONFIG_MTD_OOPS is not set
# CONFIG_MTD_SWAP is not set
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
# CONFIG_MTD_JEDECPROBE is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
# CONFIG_MTD_INTEL_VR_NOR is not set
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_DATAFLASH is not set
# CONFIG_MTD_MCHP23K256 is not set
# CONFIG_MTD_SST25L is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_PHRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLOCK2MTD is not set

#
# Disk-On-Chip Device Drivers
#
# CONFIG_MTD_DOCG3 is not set
# end of Self-contained MTD device drivers

# CONFIG_MTD_ONENAND is not set
# CONFIG_MTD_RAW_NAND is not set
# CONFIG_MTD_SPI_NAND is not set

#
# LPDDR & LPDDR2 PCM memory drivers
#
# CONFIG_MTD_LPDDR is not set
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_SPI_NOR is not set
CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
# CONFIG_MTD_UBI_FASTMAP is not set
# CONFIG_MTD_UBI_GLUEBI is not set
# CONFIG_MTD_UBI_BLOCK is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
CONFIG_BLK_DEV_FD=m
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
CONFIG_BLK_DEV_PCIESSD_MTIP32XX=m
# CONFIG_ZRAM is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SKD is not set
CONFIG_BLK_DEV_SX8=m
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
CONFIG_ATA_OVER_ETH=m
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=y
# CONFIG_VIRTIO_BLK_SCSI is not set
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
CONFIG_NVME_FABRICS=m
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
CONFIG_NVME_TARGET_LOOP=m
CONFIG_NVME_TARGET_FC=m
CONFIG_NVME_TARGET_FCLOOP=m
# CONFIG_NVME_TARGET_TCP is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_IBM_ASM is not set
# CONFIG_PHANTOM is not set
CONFIG_SGI_IOC4=m
CONFIG_TIFM_CORE=m
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SGI_XP=m
CONFIG_HP_ILO=m
CONFIG_SGI_GRU=m
# CONFIG_SGI_GRU_DEBUG is not set
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=m
CONFIG_SENSORS_APDS990X=m
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=m
# CONFIG_LATTICE_ECP3_CONFIG is not set
# CONFIG_SRAM is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_PVPANIC=y
# CONFIG_C2PORT is not set

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
# CONFIG_EEPROM_AT25 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_93XX46 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# CONFIG_TI_ST is not set
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=m
CONFIG_ALTERA_STAPL=m
CONFIG_INTEL_MEI=m
CONFIG_INTEL_MEI_ME=m
# CONFIG_INTEL_MEI_TXE is not set
# CONFIG_INTEL_MEI_HDCP is not set
CONFIG_VMWARE_VMCI=m

#
# Intel MIC & related support
#

#
# Intel MIC Bus Driver
#
# CONFIG_INTEL_MIC_BUS is not set

#
# SCIF Bus Driver
#
# CONFIG_SCIF_BUS is not set

#
# VOP Bus Driver
#
# CONFIG_VOP_BUS is not set

#
# Intel MIC Host Driver
#

#
# Intel MIC Card Driver
#

#
# SCIF Driver
#

#
# Intel MIC Coprocessor State Management (COSM) Drivers
#

#
# VOP Driver
#
# end of Intel MIC & related support

# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_MISC_ALCOR_PCI is not set
# CONFIG_MISC_RTSX_PCI is not set
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# end of Misc devices

CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=m
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_NETLINK=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=m
CONFIG_CHR_DEV_ST=m
CONFIG_BLK_DEV_SR=m
CONFIG_BLK_DEV_SR_VENDOR=y
CONFIG_CHR_DEV_SG=m
CONFIG_CHR_DEV_SCH=m
CONFIG_SCSI_ENCLOSURE=m
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=m
CONFIG_SCSI_FC_ATTRS=m
CONFIG_SCSI_ISCSI_ATTRS=m
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
CONFIG_SCSI_SRP_ATTRS=m
# end of SCSI Transports

CONFIG_SCSI_LOWLEVEL=y
CONFIG_ISCSI_TCP=m
CONFIG_ISCSI_BOOT_SYSFS=m
CONFIG_SCSI_CXGB3_ISCSI=m
CONFIG_SCSI_CXGB4_ISCSI=m
CONFIG_SCSI_BNX2_ISCSI=m
CONFIG_SCSI_BNX2X_FCOE=m
CONFIG_BE2ISCSI=m
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_HPSA=m
CONFIG_SCSI_3W_9XXX=m
CONFIG_SCSI_3W_SAS=m
# CONFIG_SCSI_ACARD is not set
CONFIG_SCSI_AACRAID=m
# CONFIG_SCSI_AIC7XXX is not set
CONFIG_SCSI_AIC79XX=m
CONFIG_AIC79XX_CMDS_PER_DEVICE=4
CONFIG_AIC79XX_RESET_DELAY_MS=15000
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
# CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
# CONFIG_SCSI_AIC94XX is not set
CONFIG_SCSI_MVSAS=m
# CONFIG_SCSI_MVSAS_DEBUG is not set
CONFIG_SCSI_MVSAS_TASKLET=y
CONFIG_SCSI_MVUMI=m
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
CONFIG_SCSI_ARCMSR=m
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
CONFIG_MEGARAID_SAS=m
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
CONFIG_SCSI_MPT2SAS=m
# CONFIG_SCSI_SMARTPQI is not set
CONFIG_SCSI_UFSHCD=m
CONFIG_SCSI_UFSHCD_PCI=m
# CONFIG_SCSI_UFS_DWC_TC_PCI is not set
# CONFIG_SCSI_UFSHCD_PLATFORM is not set
# CONFIG_SCSI_UFS_BSG is not set
CONFIG_SCSI_HPTIOP=m
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
CONFIG_VMWARE_PVSCSI=m
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
CONFIG_LIBFC=m
CONFIG_LIBFCOE=m
CONFIG_FCOE=m
CONFIG_FCOE_FNIC=m
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
# CONFIG_SCSI_GDTH is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
CONFIG_SCSI_INITIO=m
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
CONFIG_SCSI_STEX=m
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA_FC=m
CONFIG_TCM_QLA2XXX=m
# CONFIG_TCM_QLA2XXX_DEBUG is not set
CONFIG_SCSI_QLA_ISCSI=m
# CONFIG_QEDI is not set
# CONFIG_QEDF is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
CONFIG_SCSI_PMCRAID=m
CONFIG_SCSI_PM8001=m
# CONFIG_SCSI_BFA_FC is not set
CONFIG_SCSI_VIRTIO=m
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_ACPI=y
# CONFIG_SATA_ZPODD is not set
CONFIG_SATA_PMP=y

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
CONFIG_SATA_AHCI_PLATFORM=m
# CONFIG_SATA_INIC162X is not set
CONFIG_SATA_ACARD_AHCI=m
CONFIG_SATA_SIL24=m
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
CONFIG_PDC_ADMA=m
CONFIG_SATA_QSTOR=m
CONFIG_SATA_SX4=m
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
CONFIG_SATA_MV=m
CONFIG_SATA_NV=m
CONFIG_SATA_PROMISE=m
CONFIG_SATA_SIL=m
CONFIG_SATA_SIS=m
CONFIG_SATA_SVW=m
CONFIG_SATA_ULI=m
CONFIG_SATA_VIA=m
CONFIG_SATA_VITESSE=m

#
# PATA SFF controllers with BMDMA
#
CONFIG_PATA_ALI=m
CONFIG_PATA_AMD=m
CONFIG_PATA_ARTOP=m
CONFIG_PATA_ATIIXP=m
CONFIG_PATA_ATP867X=m
CONFIG_PATA_CMD64X=m
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
CONFIG_PATA_HPT366=m
CONFIG_PATA_HPT37X=m
CONFIG_PATA_HPT3X2N=m
CONFIG_PATA_HPT3X3=m
# CONFIG_PATA_HPT3X3_DMA is not set
CONFIG_PATA_IT8213=m
CONFIG_PATA_IT821X=m
CONFIG_PATA_JMICRON=m
CONFIG_PATA_MARVELL=m
CONFIG_PATA_NETCELL=m
CONFIG_PATA_NINJA32=m
# CONFIG_PATA_NS87415 is not set
CONFIG_PATA_OLDPIIX=m
# CONFIG_PATA_OPTIDMA is not set
CONFIG_PATA_PDC2027X=m
CONFIG_PATA_PDC_OLD=m
# CONFIG_PATA_RADISYS is not set
CONFIG_PATA_RDC=m
CONFIG_PATA_SCH=m
CONFIG_PATA_SERVERWORKS=m
CONFIG_PATA_SIL680=m
CONFIG_PATA_SIS=m
CONFIG_PATA_TOSHIBA=m
# CONFIG_PATA_TRIFLEX is not set
CONFIG_PATA_VIA=m
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_PLATFORM is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
CONFIG_PATA_ACPI=m
CONFIG_ATA_GENERIC=m
# CONFIG_PATA_LEGACY is not set
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_AUTODETECT=y
CONFIG_MD_LINEAR=m
CONFIG_MD_RAID0=m
CONFIG_MD_RAID1=m
CONFIG_MD_RAID10=m
CONFIG_MD_RAID456=m
CONFIG_MD_MULTIPATH=m
CONFIG_MD_FAULTY=m
# CONFIG_MD_CLUSTER is not set
# CONFIG_BCACHE is not set
CONFIG_BLK_DEV_DM_BUILTIN=y
CONFIG_BLK_DEV_DM=m
CONFIG_DM_DEBUG=y
CONFIG_DM_BUFIO=m
# CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
CONFIG_DM_BIO_PRISON=m
CONFIG_DM_PERSISTENT_DATA=m
# CONFIG_DM_UNSTRIPED is not set
CONFIG_DM_CRYPT=m
CONFIG_DM_SNAPSHOT=m
CONFIG_DM_THIN_PROVISIONING=m
CONFIG_DM_CACHE=m
CONFIG_DM_CACHE_SMQ=m
# CONFIG_DM_WRITECACHE is not set
CONFIG_DM_ERA=m
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
# CONFIG_DM_INTEGRITY is not set
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_TCM_FC=m
CONFIG_ISCSI_TARGET=m
CONFIG_ISCSI_TARGET_CXGB4=m
# CONFIG_SBP_TARGET is not set
CONFIG_FUSION=y
CONFIG_FUSION_SPI=m
# CONFIG_FUSION_FC is not set
CONFIG_FUSION_SAS=m
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=m
CONFIG_FUSION_LOGGING=y

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=m
CONFIG_FIREWIRE_NET=m
# CONFIG_FIREWIRE_NOSY is not set
# end of IEEE 1394 (FireWire) support

CONFIG_MACINTOSH_DRIVERS=y
CONFIG_MAC_EMUMOUSEBTN=y
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
# CONFIG_EQUALIZER is not set
CONFIG_NET_FC=y
CONFIG_IFB=m
CONFIG_NET_TEAM=m
CONFIG_NET_TEAM_MODE_BROADCAST=m
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=m
CONFIG_MACVTAP=m
# CONFIG_IPVLAN is not set
CONFIG_VXLAN=m
CONFIG_GENEVE=m
# CONFIG_GTP is not set
CONFIG_MACSEC=y
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_NTB_NETDEV=m
CONFIG_TUN=m
CONFIG_TAP=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
CONFIG_NET_VRF=y
CONFIG_VSOCKMON=m
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# end of Distributed Switch Architecture drivers

CONFIG_ETHERNET=y
CONFIG_MDIO=y
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
CONFIG_ENA_ETHERNET=m
CONFIG_NET_VENDOR_AMD=y
CONFIG_AMD8111_ETH=m
CONFIG_PCNET32=m
CONFIG_AMD_XGBE=m
# CONFIG_AMD_XGBE_DCB is not set
CONFIG_AMD_XGBE_HAVE_ECC=y
CONFIG_NET_VENDOR_AQUANTIA=y
CONFIG_AQTION=m
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
CONFIG_ATL2=m
CONFIG_ATL1=m
CONFIG_ATL1E=m
CONFIG_ATL1C=m
CONFIG_ALX=m
CONFIG_NET_VENDOR_AURORA=y
# CONFIG_AURORA_NB8800 is not set
CONFIG_NET_VENDOR_BROADCOM=y
CONFIG_B44=m
CONFIG_B44_PCI_AUTOSELECT=y
CONFIG_B44_PCICORE_AUTOSELECT=y
CONFIG_B44_PCI=y
# CONFIG_BCMGENET is not set
CONFIG_BNX2=m
CONFIG_CNIC=m
CONFIG_TIGON3=y
CONFIG_TIGON3_HWMON=y
CONFIG_BNX2X=m
CONFIG_BNX2X_SRIOV=y
# CONFIG_SYSTEMPORT is not set
CONFIG_BNXT=m
CONFIG_BNXT_SRIOV=y
CONFIG_BNXT_FLOWER_OFFLOAD=y
CONFIG_BNXT_DCB=y
CONFIG_BNXT_HWMON=y
CONFIG_NET_VENDOR_BROCADE=y
CONFIG_BNA=m
CONFIG_NET_VENDOR_CADENCE=y
CONFIG_MACB=m
CONFIG_MACB_USE_HWSTAMP=y
# CONFIG_MACB_PCI is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
CONFIG_LIQUIDIO=m
CONFIG_LIQUIDIO_VF=m
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
CONFIG_CHELSIO_T3=m
CONFIG_CHELSIO_T4=m
# CONFIG_CHELSIO_T4_DCB is not set
CONFIG_CHELSIO_T4VF=m
CONFIG_CHELSIO_LIB=m
CONFIG_NET_VENDOR_CISCO=y
CONFIG_ENIC=m
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
CONFIG_DNET=m
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
CONFIG_DE2104X=m
CONFIG_DE2104X_DSL=0
CONFIG_TULIP=y
# CONFIG_TULIP_MWI is not set
CONFIG_TULIP_MMIO=y
# CONFIG_TULIP_NAPI is not set
CONFIG_DE4X5=m
CONFIG_WINBOND_840=m
CONFIG_DM9102=m
CONFIG_ULI526X=m
CONFIG_PCMCIA_XIRCOM=m
# CONFIG_NET_VENDOR_DLINK is not set
CONFIG_NET_VENDOR_EMULEX=y
CONFIG_BE2NET=m
CONFIG_BE2NET_HWMON=y
CONFIG_BE2NET_BE2=y
CONFIG_BE2NET_BE3=y
CONFIG_BE2NET_LANCER=y
CONFIG_BE2NET_SKYHAWK=y
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
# CONFIG_NET_VENDOR_HP is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
# CONFIG_NET_VENDOR_I825XX is not set
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
CONFIG_IGBVF=m
CONFIG_IXGB=y
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
CONFIG_IXGBE_DCB=y
CONFIG_IXGBEVF=m
CONFIG_I40E=y
CONFIG_I40E_DCB=y
CONFIG_IAVF=m
CONFIG_I40EVF=m
# CONFIG_ICE is not set
CONFIG_FM10K=m
# CONFIG_IGC is not set
CONFIG_JME=m
CONFIG_NET_VENDOR_MARVELL=y
CONFIG_MVMDIO=m
CONFIG_SKGE=y
# CONFIG_SKGE_DEBUG is not set
CONFIG_SKGE_GENESIS=y
CONFIG_SKY2=m
# CONFIG_SKY2_DEBUG is not set
CONFIG_NET_VENDOR_MELLANOX=y
CONFIG_MLX4_EN=m
CONFIG_MLX4_EN_DCB=y
CONFIG_MLX4_CORE=m
CONFIG_MLX4_DEBUG=y
CONFIG_MLX4_CORE_GEN2=y
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MICROCHIP is not set
CONFIG_NET_VENDOR_MICROSEMI=y
# CONFIG_MSCC_OCELOT_SWITCH is not set
CONFIG_NET_VENDOR_MYRI=y
CONFIG_MYRI10GE=m
CONFIG_MYRI10GE_DCA=y
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
CONFIG_NFP=m
CONFIG_NFP_APP_FLOWER=y
CONFIG_NFP_APP_ABM_NIC=y
# CONFIG_NFP_DEBUG is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
CONFIG_NET_VENDOR_OKI=y
CONFIG_ETHOC=m
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
CONFIG_YELLOWFIN=m
CONFIG_NET_VENDOR_QLOGIC=y
CONFIG_QLA3XXX=m
CONFIG_QLCNIC=m
CONFIG_QLCNIC_SRIOV=y
CONFIG_QLCNIC_DCB=y
CONFIG_QLCNIC_HWMON=y
CONFIG_QLGE=m
CONFIG_NETXEN_NIC=m
CONFIG_QED=m
CONFIG_QED_SRIOV=y
CONFIG_QEDE=m
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
# CONFIG_NET_VENDOR_RDC is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
CONFIG_8139CP=y
CONFIG_8139TOO=y
# CONFIG_8139TOO_PIO is not set
# CONFIG_8139TOO_TUNE_TWISTER is not set
CONFIG_8139TOO_8129=y
# CONFIG_8139_OLD_RX_RESET is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_ROCKER=m
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
# CONFIG_NET_VENDOR_SEEQ is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
CONFIG_SFC=m
CONFIG_SFC_MTD=y
CONFIG_SFC_MCDI_MON=y
CONFIG_SFC_SRIOV=y
CONFIG_SFC_MCDI_LOGGING=y
CONFIG_SFC_FALCON=m
CONFIG_SFC_FALCON_MTD=y
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
CONFIG_NET_VENDOR_SMSC=y
CONFIG_EPIC100=m
# CONFIG_SMSC911X is not set
CONFIG_SMSC9420=m
CONFIG_NET_VENDOR_SOCIONEXT=y
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
CONFIG_TLAN=m
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
# CONFIG_MDIO_BCM_UNIMAC is not set
CONFIG_MDIO_BITBANG=m
# CONFIG_MDIO_GPIO is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=m
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
CONFIG_AT803X_PHY=m
# CONFIG_BCM7XXX_PHY is not set
CONFIG_BCM87XX_PHY=m
CONFIG_BCM_NET_PHYLIB=m
CONFIG_BROADCOM_PHY=m
CONFIG_CICADA_PHY=m
# CONFIG_CORTINA_PHY is not set
CONFIG_DAVICOM_PHY=m
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
CONFIG_FIXED_PHY=y
CONFIG_ICPLUS_PHY=m
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=m
CONFIG_LXT_PHY=m
CONFIG_MARVELL_PHY=m
# CONFIG_MARVELL_10G_PHY is not set
CONFIG_MICREL_PHY=m
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
CONFIG_NATIONAL_PHY=m
# CONFIG_NXP_TJA11XX_PHY is not set
CONFIG_QSEMI_PHY=m
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=m
# CONFIG_TERANETICS_PHY is not set
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
# CONFIG_PLIP is not set
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MPPE=m
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOATM=m
CONFIG_PPPOE=m
CONFIG_PPTP=m
CONFIG_PPPOL2TP=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLHC=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
# CONFIG_SLIP_MODE_SLIP6 is not set
CONFIG_USB_NET_DRIVERS=y
CONFIG_USB_CATC=y
CONFIG_USB_KAWETH=y
CONFIG_USB_PEGASUS=y
CONFIG_USB_RTL8150=y
CONFIG_USB_RTL8152=m
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=m
CONFIG_USB_NET_CDCETHER=y
CONFIG_USB_NET_CDC_EEM=y
CONFIG_USB_NET_CDC_NCM=m
CONFIG_USB_NET_HUAWEI_CDC_NCM=m
CONFIG_USB_NET_CDC_MBIM=m
CONFIG_USB_NET_DM9601=y
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
CONFIG_USB_NET_SMSC75XX=y
CONFIG_USB_NET_SMSC95XX=y
CONFIG_USB_NET_GL620A=y
CONFIG_USB_NET_NET1080=y
CONFIG_USB_NET_PLUSB=y
CONFIG_USB_NET_MCS7830=y
CONFIG_USB_NET_RNDIS_HOST=y
CONFIG_USB_NET_CDC_SUBSET_ENABLE=y
CONFIG_USB_NET_CDC_SUBSET=y
CONFIG_USB_ALI_M5632=y
CONFIG_USB_AN2720=y
CONFIG_USB_BELKIN=y
CONFIG_USB_ARMLINUX=y
CONFIG_USB_EPSON2888=y
CONFIG_USB_KC2190=y
CONFIG_USB_NET_ZAURUS=y
CONFIG_USB_NET_CX82310_ETH=m
CONFIG_USB_NET_KALMIA=m
CONFIG_USB_NET_QMI_WWAN=m
CONFIG_USB_HSO=m
CONFIG_USB_NET_INT51X1=y
CONFIG_USB_IPHETH=y
CONFIG_USB_SIERRA_NET=y
CONFIG_USB_VL600=m
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
# CONFIG_WIRELESS_WDS is not set
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_ATH_COMMON=m
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
# CONFIG_ATH9K is not set
CONFIG_ATH9K_HTC=m
# CONFIG_ATH9K_HTC_DEBUGFS is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
# CONFIG_AT76C50X_USB is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
# CONFIG_B43 is not set
# CONFIG_B43LEGACY is not set
# CONFIG_BRCMSMAC is not set
# CONFIG_BRCMFMAC is not set
CONFIG_WLAN_VENDOR_CISCO=y
# CONFIG_AIRO is not set
CONFIG_WLAN_VENDOR_INTEL=y
# CONFIG_IPW2100 is not set
# CONFIG_IPW2200 is not set
CONFIG_IWLEGACY=m
CONFIG_IWL4965=m
CONFIG_IWL3945=m

#
# iwl3945 / iwl4965 Debugging Options
#
CONFIG_IWLEGACY_DEBUG=y
CONFIG_IWLEGACY_DEBUGFS=y
# end of iwl3945 / iwl4965 Debugging Options

CONFIG_IWLWIFI=m
CONFIG_IWLWIFI_LEDS=y
CONFIG_IWLDVM=m
CONFIG_IWLMVM=m
CONFIG_IWLWIFI_OPMODE_MODULAR=y
# CONFIG_IWLWIFI_BCAST_FILTERING is not set
# CONFIG_IWLWIFI_PCIE_RTPM is not set

#
# Debugging Options
#
# CONFIG_IWLWIFI_DEBUG is not set
CONFIG_IWLWIFI_DEBUGFS=y
# CONFIG_IWLWIFI_DEVICE_TRACING is not set
# end of Debugging Options

CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
# CONFIG_HERMES is not set
# CONFIG_P54_COMMON is not set
# CONFIG_PRISM54 is not set
CONFIG_WLAN_VENDOR_MARVELL=y
# CONFIG_LIBERTAS is not set
# CONFIG_LIBERTAS_THINFIRM is not set
# CONFIG_MWIFIEX is not set
# CONFIG_MWL8K is not set
CONFIG_WLAN_VENDOR_MEDIATEK=y
# CONFIG_MT7601U is not set
# CONFIG_MT76x0U is not set
# CONFIG_MT76x0E is not set
# CONFIG_MT76x2E is not set
# CONFIG_MT76x2U is not set
# CONFIG_MT7603E is not set
# CONFIG_MT7615E is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
# CONFIG_RTL_CARDS is not set
# CONFIG_RTL8XXXU is not set
# CONFIG_RTW88 is not set
CONFIG_WLAN_VENDOR_RSI=y
# CONFIG_RSI_91X is not set
CONFIG_WLAN_VENDOR_ST=y
# CONFIG_CW1200 is not set
CONFIG_WLAN_VENDOR_TI=y
# CONFIG_WL1251 is not set
# CONFIG_WL12XX is not set
# CONFIG_WL18XX is not set
# CONFIG_WLCORE is not set
CONFIG_WLAN_VENDOR_ZYDAS=y
# CONFIG_USB_ZD1201 is not set
# CONFIG_ZD1211RW is not set
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_QTNFMAC_PCIE is not set
CONFIG_MAC80211_HWSIM=m
# CONFIG_USB_NET_RNDIS_WLAN is not set
# CONFIG_VIRT_WIFI is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
CONFIG_WAN=y
# CONFIG_LANMEDIA is not set
CONFIG_HDLC=m
CONFIG_HDLC_RAW=m
# CONFIG_HDLC_RAW_ETH is not set
CONFIG_HDLC_CISCO=m
CONFIG_HDLC_FR=m
CONFIG_HDLC_PPP=m

#
# X.25/LAPB support is disabled
#
# CONFIG_PCI200SYN is not set
# CONFIG_WANXL is not set
# CONFIG_PC300TOO is not set
# CONFIG_FARSYNC is not set
# CONFIG_DSCC4 is not set
CONFIG_DLCI=m
CONFIG_DLCI_MAX=8
# CONFIG_SBNI is not set
CONFIG_IEEE802154_DRIVERS=m
CONFIG_IEEE802154_FAKELB=m
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set
CONFIG_XEN_NETDEV_FRONTEND=m
CONFIG_VMXNET3=m
CONFIG_FUJITSU_ES=m
CONFIG_THUNDERBOLT_NET=m
CONFIG_HYPERV_NET=m
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=m
# CONFIG_CAPI_TRACE is not set
CONFIG_ISDN_CAPI_CAPI20=m
CONFIG_ISDN_CAPI_MIDDLEWARE=y
CONFIG_MISDN=m
CONFIG_MISDN_DSP=m
CONFIG_MISDN_L1OIP=m

#
# mISDN hardware drivers
#
CONFIG_MISDN_HFCPCI=m
CONFIG_MISDN_HFCMULTI=m
CONFIG_MISDN_HFCUSB=m
CONFIG_MISDN_AVMFRITZ=m
CONFIG_MISDN_SPEEDFAX=m
CONFIG_MISDN_INFINEON=m
CONFIG_MISDN_W6692=m
CONFIG_MISDN_NETJET=m
CONFIG_MISDN_HDLC=m
CONFIG_MISDN_IPAC=m
CONFIG_MISDN_ISAR=m
CONFIG_NVM=y
# CONFIG_NVM_PBLK is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_POLLDEV=m
CONFIG_INPUT_SPARSEKMAP=m
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ADC is not set
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
# CONFIG_KEYBOARD_APPLESPI is not set
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
# CONFIG_KEYBOARD_QT2160 is not set
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_GPIO is not set
# CONFIG_KEYBOARD_GPIO_POLLED is not set
# CONFIG_KEYBOARD_TCA6416 is not set
# CONFIG_KEYBOARD_TCA8418 is not set
# CONFIG_KEYBOARD_MATRIX is not set
# CONFIG_KEYBOARD_LM8323 is not set
# CONFIG_KEYBOARD_LM8333 is not set
# CONFIG_KEYBOARD_MAX7359 is not set
# CONFIG_KEYBOARD_MCS is not set
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_NEWTON is not set
# CONFIG_KEYBOARD_OPENCORES is not set
# CONFIG_KEYBOARD_SAMSUNG is not set
# CONFIG_KEYBOARD_STOWAWAY is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
CONFIG_MOUSE_PS2_CYPRESS=y
CONFIG_MOUSE_PS2_LIFEBOOK=y
CONFIG_MOUSE_PS2_TRACKPOINT=y
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=m
CONFIG_MOUSE_APPLETOUCH=m
CONFIG_MOUSE_BCM5974=m
CONFIG_MOUSE_CYAPA=m
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
CONFIG_MOUSE_SYNAPTICS_USB=m
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_USB_ACECAD=m
CONFIG_TABLET_USB_AIPTEK=m
CONFIG_TABLET_USB_GTCO=m
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=m
# CONFIG_TABLET_USB_PEGASUS is not set
# CONFIG_TABLET_SERIAL_WACOM4 is not set
CONFIG_INPUT_TOUCHSCREEN=y
CONFIG_TOUCHSCREEN_PROPERTIES=y
# CONFIG_TOUCHSCREEN_ADS7846 is not set
# CONFIG_TOUCHSCREEN_AD7877 is not set
# CONFIG_TOUCHSCREEN_AD7879 is not set
# CONFIG_TOUCHSCREEN_ADC is not set
# CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
# CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
# CONFIG_TOUCHSCREEN_BU21013 is not set
# CONFIG_TOUCHSCREEN_BU21029 is not set
# CONFIG_TOUCHSCREEN_CHIPONE_ICN8505 is not set
# CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
# CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
# CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
# CONFIG_TOUCHSCREEN_DYNAPRO is not set
# CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
# CONFIG_TOUCHSCREEN_EETI is not set
# CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
# CONFIG_TOUCHSCREEN_EXC3000 is not set
# CONFIG_TOUCHSCREEN_FUJITSU is not set
# CONFIG_TOUCHSCREEN_GOODIX is not set
# CONFIG_TOUCHSCREEN_HIDEEP is not set
# CONFIG_TOUCHSCREEN_ILI210X is not set
# CONFIG_TOUCHSCREEN_S6SY761 is not set
# CONFIG_TOUCHSCREEN_GUNZE is not set
# CONFIG_TOUCHSCREEN_EKTF2127 is not set
# CONFIG_TOUCHSCREEN_ELAN is not set
CONFIG_TOUCHSCREEN_ELO=m
CONFIG_TOUCHSCREEN_WACOM_W8001=m
CONFIG_TOUCHSCREEN_WACOM_I2C=m
# CONFIG_TOUCHSCREEN_MAX11801 is not set
# CONFIG_TOUCHSCREEN_MCS5000 is not set
# CONFIG_TOUCHSCREEN_MMS114 is not set
# CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
# CONFIG_TOUCHSCREEN_MTOUCH is not set
# CONFIG_TOUCHSCREEN_INEXIO is not set
# CONFIG_TOUCHSCREEN_MK712 is not set
# CONFIG_TOUCHSCREEN_PENMOUNT is not set
# CONFIG_TOUCHSCREEN_EDT_FT5X06 is not set
# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
# CONFIG_TOUCHSCREEN_PIXCIR is not set
# CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
# CONFIG_TOUCHSCREEN_WM97XX is not set
# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
# CONFIG_TOUCHSCREEN_TSC_SERIO is not set
# CONFIG_TOUCHSCREEN_TSC2004 is not set
# CONFIG_TOUCHSCREEN_TSC2005 is not set
# CONFIG_TOUCHSCREEN_TSC2007 is not set
# CONFIG_TOUCHSCREEN_RM_TS is not set
# CONFIG_TOUCHSCREEN_SILEAD is not set
# CONFIG_TOUCHSCREEN_SIS_I2C is not set
# CONFIG_TOUCHSCREEN_ST1232 is not set
# CONFIG_TOUCHSCREEN_STMFTS is not set
# CONFIG_TOUCHSCREEN_SUR40 is not set
# CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
# CONFIG_TOUCHSCREEN_SX8654 is not set
# CONFIG_TOUCHSCREEN_TPS6507X is not set
# CONFIG_TOUCHSCREEN_ZET6223 is not set
# CONFIG_TOUCHSCREEN_ZFORCE is not set
# CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
# CONFIG_TOUCHSCREEN_IQS5XX is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_AD714X is not set
# CONFIG_INPUT_BMA150 is not set
# CONFIG_INPUT_E3X0_BUTTON is not set
# CONFIG_INPUT_MSM_VIBRATOR is not set
CONFIG_INPUT_PCSPKR=m
# CONFIG_INPUT_MMA8450 is not set
CONFIG_INPUT_APANEL=m
CONFIG_INPUT_GP2A=m
# CONFIG_INPUT_GPIO_BEEPER is not set
# CONFIG_INPUT_GPIO_DECODER is not set
# CONFIG_INPUT_GPIO_VIBRA is not set
CONFIG_INPUT_ATLAS_BTNS=m
CONFIG_INPUT_ATI_REMOTE2=m
CONFIG_INPUT_KEYSPAN_REMOTE=m
# CONFIG_INPUT_KXTJ9 is not set
CONFIG_INPUT_POWERMATE=m
CONFIG_INPUT_YEALINK=m
CONFIG_INPUT_CM109=m
CONFIG_INPUT_UINPUT=m
# CONFIG_INPUT_PCF8574 is not set
# CONFIG_INPUT_PWM_BEEPER is not set
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
# CONFIG_INPUT_ADXL34X is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_CMA3000 is not set
CONFIG_INPUT_XEN_KBDDEV_FRONTEND=m
# CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
# CONFIG_INPUT_DRV260X_HAPTICS is not set
# CONFIG_INPUT_DRV2665_HAPTICS is not set
# CONFIG_INPUT_DRV2667_HAPTICS is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
# CONFIG_RMI4_SPI is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
# CONFIG_RMI4_F34 is not set
# CONFIG_RMI4_F54 is not set
# CONFIG_RMI4_F55 is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=m
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
CONFIG_HYPERV_KEYBOARD=m
# CONFIG_SERIO_GPIO_PS2 is not set
# CONFIG_USERIO is not set
# CONFIG_GAMEPORT is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_UNIX98_PTYS=y
# CONFIG_LEGACY_PTYS is not set
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK=m
CONFIG_SYNCLINKMP=m
CONFIG_SYNCLINK_GT=m
CONFIG_NOZOMI=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
# CONFIG_TRACE_SINK is not set
# CONFIG_NULL_TTY is not set
CONFIG_LDISC_AUTOLOAD=y
CONFIG_DEVMEM=y
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=32
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y
# CONFIG_SERIAL_8250_MOXA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_IFX6X60 is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_DEV_BUS is not set
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_NVRAM=y
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
CONFIG_HPET=y
CONFIG_HPET_MMAP=y
# CONFIG_HPET_MMAP_DEFAULT is not set
CONFIG_HANGCHECK_TIMER=m
CONFIG_UV_MMTIMER=m
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_SPI is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
CONFIG_TCG_ATMEL=m
CONFIG_TCG_INFINEON=m
# CONFIG_TCG_XEN is not set
CONFIG_TCG_CRB=y
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TCG_TIS_ST33ZP24_SPI is not set
CONFIG_TELCLOCK=m
CONFIG_DEVPORT=y
# CONFIG_XILLYBUS is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=m
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCA=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
CONFIG_I2C_ISCH=m
CONFIG_I2C_ISMT=m
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=m
CONFIG_I2C_PARPORT=m
CONFIG_I2C_PARPORT_LIGHT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
CONFIG_I2C_TINY_USB=m
CONFIG_I2C_VIPERBOARD=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPI=y
# CONFIG_SPI_DEBUG is not set
CONFIG_SPI_MASTER=y
# CONFIG_SPI_MEM is not set

#
# SPI Master Controller Drivers
#
# CONFIG_SPI_ALTERA is not set
# CONFIG_SPI_AXI_SPI_ENGINE is not set
# CONFIG_SPI_BITBANG is not set
# CONFIG_SPI_BUTTERFLY is not set
# CONFIG_SPI_CADENCE is not set
# CONFIG_SPI_DESIGNWARE is not set
# CONFIG_SPI_NXP_FLEXSPI is not set
# CONFIG_SPI_GPIO is not set
# CONFIG_SPI_LM70_LLP is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_PARPORT=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_DP83640_PHY=m
CONFIG_PTP_1588_CLOCK_KVM=m
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=m
# CONFIG_PINCTRL_MCP23S08 is not set
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_BAYTRAIL=y
# CONFIG_PINCTRL_CHERRYVIEW is not set
CONFIG_PINCTRL_INTEL=m
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=m
# CONFIG_PINCTRL_CEDARFORK is not set
CONFIG_PINCTRL_DENVERTON=m
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_LYNXPOINT is not set
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_AMD_FCH is not set
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
# CONFIG_GPIO_IT87 is not set
# CONFIG_GPIO_SCH is not set
# CONFIG_GPIO_SCH311X is not set
# CONFIG_GPIO_WINBOND is not set
# CONFIG_GPIO_WS16C48 is not set
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
# CONFIG_GPIO_MAX732X is not set
# CONFIG_GPIO_PCA953X is not set
# CONFIG_GPIO_PCF857X is not set
# CONFIG_GPIO_TPIC2810 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
# CONFIG_GPIO_ML_IOH is not set
# CONFIG_GPIO_PCI_IDIO_16 is not set
# CONFIG_GPIO_PCIE_IDIO_24 is not set
# CONFIG_GPIO_RDC321X is not set
# end of PCI GPIO expanders

#
# SPI GPIO expanders
#
# CONFIG_GPIO_MAX3191X is not set
# CONFIG_GPIO_MAX7301 is not set
# CONFIG_GPIO_MC33880 is not set
# CONFIG_GPIO_PISOSR is not set
# CONFIG_GPIO_XRA1403 is not set
# end of SPI GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=m
# end of USB GPIO expanders

CONFIG_GPIO_MOCKUP=y
# CONFIG_W1 is not set
# CONFIG_POWER_AVS is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
# CONFIG_BATTERY_BQ27XXX is not set
# CONFIG_BATTERY_MAX17040 is not set
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_CHARGER_MAX8903 is not set
# CONFIG_CHARGER_LP8727 is not set
# CONFIG_CHARGER_GPIO is not set
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_CHARGER_RT9455 is not set
CONFIG_HWMON=y
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_ABITUGURU=m
CONFIG_SENSORS_ABITUGURU3=m
# CONFIG_SENSORS_AD7314 is not set
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DELL_SMM=m
CONFIG_SENSORS_I5K_AMB=m
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
# CONFIG_SENSORS_FTSTEUTATES is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_ADCXX is not set
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM70 is not set
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
CONFIG_SENSORS_PC87427=m
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT7802 is not set
# CONFIG_SENSORS_NCT7904 is not set
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_SCH56XX_COMMON=m
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=m
# CONFIG_SENSORS_STTS751 is not set
# CONFIG_SENSORS_SMM665 is not set
# CONFIG_SENSORS_ADC128D818 is not set
CONFIG_SENSORS_ADS1015=m
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_ADS7871 is not set
CONFIG_SENSORS_AMC6821=m
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA3221 is not set
# CONFIG_SENSORS_TC74 is not set
CONFIG_SENSORS_THMC50=m
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_VT8231=m
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
CONFIG_SENSORS_ATK0110=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_CLOCK_THERMAL is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=y
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_WDAT_WDT=m
# CONFIG_XILINX_WATCHDOG is not set
# CONFIG_ZIIRAVE_WATCHDOG is not set
# CONFIG_CADENCE_WATCHDOG is not set
# CONFIG_DW_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=m
CONFIG_SP5100_TCO=m
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
CONFIG_IB700_WDT=m
CONFIG_IBMASR=m
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=y
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
CONFIG_IT87_WDT=m
CONFIG_HP_WATCHDOG=m
CONFIG_HPWDT_NMI_DECODING=y
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
# CONFIG_60XX_WDT is not set
# CONFIG_CPU5_WDT is not set
CONFIG_SMSC_SCH311X_WDT=m
# CONFIG_SMSC37B787_WDT is not set
# CONFIG_TQMX86_WDT is not set
CONFIG_VIA_WDT=m
CONFIG_W83627HF_WDT=m
CONFIG_W83877F_WDT=m
CONFIG_W83977F_WDT=m
CONFIG_MACHZ_WDT=m
# CONFIG_SBC_EPX_C3_WATCHDOG is not set
CONFIG_INTEL_MEI_WDT=m
# CONFIG_NI903X_WDT is not set
# CONFIG_NIC7018_WDT is not set
# CONFIG_MEN_A21_WDT is not set
CONFIG_XEN_WDT=m

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=m
CONFIG_WDTPCI=m

#
# USB-based Watchdog Cards
#
CONFIG_USBPCWATCHDOG=m
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
CONFIG_SSB_DRIVER_PCICORE=y
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
CONFIG_BCMA_HOST_PCI=y
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_PCI=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
CONFIG_BCMA_DRIVER_GPIO=y
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_BCM590XX is not set
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CROS_EC is not set
# CONFIG_MFD_MADERA is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_SPI is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
# CONFIG_MFD_DLN2 is not set
# CONFIG_MFD_MC13XXX_SPI is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
CONFIG_MFD_VIPERBOARD=m
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_UCB1400_CORE is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP3943 is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65086 is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS65912_SPI is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=m
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_ARIZONA_SPI is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM831X_SPI is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# end of Multifunction device drivers

# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
CONFIG_RC_DECODERS=y
CONFIG_IR_NEC_DECODER=m
CONFIG_IR_RC5_DECODER=m
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_SONY_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_ATI_REMOTE=m
CONFIG_IR_ENE=m
CONFIG_IR_IMON=m
# CONFIG_IR_IMON_RAW is not set
CONFIG_IR_MCEUSB=m
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
CONFIG_IR_REDRAT3=m
CONFIG_IR_STREAMZAP=m
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=m
CONFIG_IR_TTUSBIR=m
CONFIG_RC_LOOPBACK=m
# CONFIG_IR_SERIAL is not set
# CONFIG_IR_SIR is not set
# CONFIG_RC_XBOX_DVD is not set
CONFIG_MEDIA_SUPPORT=m

#
# Multimedia core support
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
# CONFIG_MEDIA_SDR_SUPPORT is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
CONFIG_MEDIA_CONTROLLER=y
CONFIG_MEDIA_CONTROLLER_DVB=y
CONFIG_VIDEO_DEV=m
# CONFIG_VIDEO_V4L2_SUBDEV_API is not set
CONFIG_VIDEO_V4L2=m
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
CONFIG_VIDEOBUF_VMALLOC=m
CONFIG_DVB_CORE=m
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_TTPCI_EEPROM=m
CONFIG_DVB_MAX_ADAPTERS=8
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set

#
# Media drivers
#
CONFIG_MEDIA_USB_SUPPORT=y

#
# Webcam devices
#
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
CONFIG_USB_GSPCA=m
CONFIG_USB_M5602=m
CONFIG_USB_STV06XX=m
CONFIG_USB_GL860=m
CONFIG_USB_GSPCA_BENQ=m
CONFIG_USB_GSPCA_CONEX=m
CONFIG_USB_GSPCA_CPIA1=m
# CONFIG_USB_GSPCA_DTCS033 is not set
CONFIG_USB_GSPCA_ETOMS=m
CONFIG_USB_GSPCA_FINEPIX=m
CONFIG_USB_GSPCA_JEILINJ=m
CONFIG_USB_GSPCA_JL2005BCD=m
# CONFIG_USB_GSPCA_KINECT is not set
CONFIG_USB_GSPCA_KONICA=m
CONFIG_USB_GSPCA_MARS=m
CONFIG_USB_GSPCA_MR97310A=m
CONFIG_USB_GSPCA_NW80X=m
CONFIG_USB_GSPCA_OV519=m
CONFIG_USB_GSPCA_OV534=m
CONFIG_USB_GSPCA_OV534_9=m
CONFIG_USB_GSPCA_PAC207=m
CONFIG_USB_GSPCA_PAC7302=m
CONFIG_USB_GSPCA_PAC7311=m
CONFIG_USB_GSPCA_SE401=m
CONFIG_USB_GSPCA_SN9C2028=m
CONFIG_USB_GSPCA_SN9C20X=m
CONFIG_USB_GSPCA_SONIXB=m
CONFIG_USB_GSPCA_SONIXJ=m
CONFIG_USB_GSPCA_SPCA500=m
CONFIG_USB_GSPCA_SPCA501=m
CONFIG_USB_GSPCA_SPCA505=m
CONFIG_USB_GSPCA_SPCA506=m
CONFIG_USB_GSPCA_SPCA508=m
CONFIG_USB_GSPCA_SPCA561=m
CONFIG_USB_GSPCA_SPCA1528=m
CONFIG_USB_GSPCA_SQ905=m
CONFIG_USB_GSPCA_SQ905C=m
CONFIG_USB_GSPCA_SQ930X=m
CONFIG_USB_GSPCA_STK014=m
# CONFIG_USB_GSPCA_STK1135 is not set
CONFIG_USB_GSPCA_STV0680=m
CONFIG_USB_GSPCA_SUNPLUS=m
CONFIG_USB_GSPCA_T613=m
CONFIG_USB_GSPCA_TOPRO=m
# CONFIG_USB_GSPCA_TOUPTEK is not set
CONFIG_USB_GSPCA_TV8532=m
CONFIG_USB_GSPCA_VC032X=m
CONFIG_USB_GSPCA_VICAM=m
CONFIG_USB_GSPCA_XIRLINK_CIT=m
CONFIG_USB_GSPCA_ZC3XX=m
CONFIG_USB_PWC=m
# CONFIG_USB_PWC_DEBUG is not set
CONFIG_USB_PWC_INPUT_EVDEV=y
# CONFIG_VIDEO_CPIA2 is not set
CONFIG_USB_ZR364XX=m
CONFIG_USB_STKWEBCAM=m
CONFIG_USB_S2255=m
# CONFIG_VIDEO_USBTV is not set

#
# Analog TV USB devices
#
CONFIG_VIDEO_PVRUSB2=m
CONFIG_VIDEO_PVRUSB2_SYSFS=y
CONFIG_VIDEO_PVRUSB2_DVB=y
# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
CONFIG_VIDEO_HDPVR=m
CONFIG_VIDEO_USBVISION=m
# CONFIG_VIDEO_STK1160_COMMON is not set
# CONFIG_VIDEO_GO7007 is not set

#
# Analog/digital TV USB devices
#
CONFIG_VIDEO_AU0828=m
CONFIG_VIDEO_AU0828_V4L2=y
# CONFIG_VIDEO_AU0828_RC is not set
CONFIG_VIDEO_CX231XX=m
CONFIG_VIDEO_CX231XX_RC=y
CONFIG_VIDEO_CX231XX_ALSA=m
CONFIG_VIDEO_CX231XX_DVB=m
CONFIG_VIDEO_TM6000=m
CONFIG_VIDEO_TM6000_ALSA=m
CONFIG_VIDEO_TM6000_DVB=m

#
# Digital TV USB devices
#
CONFIG_DVB_USB=m
# CONFIG_DVB_USB_DEBUG is not set
CONFIG_DVB_USB_DIB3000MC=m
CONFIG_DVB_USB_A800=m
CONFIG_DVB_USB_DIBUSB_MB=m
# CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
CONFIG_DVB_USB_DIBUSB_MC=m
CONFIG_DVB_USB_DIB0700=m
CONFIG_DVB_USB_UMT_010=m
CONFIG_DVB_USB_CXUSB=m
# CONFIG_DVB_USB_CXUSB_ANALOG is not set
CONFIG_DVB_USB_M920X=m
CONFIG_DVB_USB_DIGITV=m
CONFIG_DVB_USB_VP7045=m
CONFIG_DVB_USB_VP702X=m
CONFIG_DVB_USB_GP8PSK=m
CONFIG_DVB_USB_NOVA_T_USB2=m
CONFIG_DVB_USB_TTUSB2=m
CONFIG_DVB_USB_DTT200U=m
CONFIG_DVB_USB_OPERA1=m
CONFIG_DVB_USB_AF9005=m
CONFIG_DVB_USB_AF9005_REMOTE=m
CONFIG_DVB_USB_PCTV452E=m
CONFIG_DVB_USB_DW2102=m
CONFIG_DVB_USB_CINERGY_T2=m
CONFIG_DVB_USB_DTV5100=m
CONFIG_DVB_USB_AZ6027=m
CONFIG_DVB_USB_TECHNISAT_USB2=m
CONFIG_DVB_USB_V2=m
CONFIG_DVB_USB_AF9015=m
CONFIG_DVB_USB_AF9035=m
CONFIG_DVB_USB_ANYSEE=m
CONFIG_DVB_USB_AU6610=m
CONFIG_DVB_USB_AZ6007=m
CONFIG_DVB_USB_CE6230=m
CONFIG_DVB_USB_EC168=m
CONFIG_DVB_USB_GL861=m
CONFIG_DVB_USB_LME2510=m
CONFIG_DVB_USB_MXL111SF=m
CONFIG_DVB_USB_RTL28XXU=m
# CONFIG_DVB_USB_DVBSKY is not set
# CONFIG_DVB_USB_ZD1301 is not set
CONFIG_DVB_TTUSB_BUDGET=m
CONFIG_DVB_TTUSB_DEC=m
CONFIG_SMS_USB_DRV=m
CONFIG_DVB_B2C2_FLEXCOP_USB=m
# CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
# CONFIG_DVB_AS102 is not set

#
# Webcam, TV (analog/digital) USB devices
#
CONFIG_VIDEO_EM28XX=m
# CONFIG_VIDEO_EM28XX_V4L2 is not set
CONFIG_VIDEO_EM28XX_ALSA=m
CONFIG_VIDEO_EM28XX_DVB=m
CONFIG_VIDEO_EM28XX_RC=m
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture support
#
# CONFIG_VIDEO_MEYE is not set
# CONFIG_VIDEO_SOLO6X10 is not set
# CONFIG_VIDEO_TW5864 is not set
# CONFIG_VIDEO_TW68 is not set
# CONFIG_VIDEO_TW686X is not set

#
# Media capture/analog TV support
#
CONFIG_VIDEO_IVTV=m
# CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS is not set
# CONFIG_VIDEO_IVTV_ALSA is not set
CONFIG_VIDEO_FB_IVTV=m
# CONFIG_VIDEO_FB_IVTV_FORCE_PAT is not set
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
# CONFIG_VIDEO_HEXIUM_ORION is not set
# CONFIG_VIDEO_MXB is not set
# CONFIG_VIDEO_DT3155 is not set

#
# Media capture/analog/hybrid TV support
#
CONFIG_VIDEO_CX18=m
CONFIG_VIDEO_CX18_ALSA=m
CONFIG_VIDEO_CX23885=m
CONFIG_MEDIA_ALTERA_CI=m
# CONFIG_VIDEO_CX25821 is not set
CONFIG_VIDEO_CX88=m
CONFIG_VIDEO_CX88_ALSA=m
CONFIG_VIDEO_CX88_BLACKBIRD=m
CONFIG_VIDEO_CX88_DVB=m
CONFIG_VIDEO_CX88_ENABLE_VP3054=y
CONFIG_VIDEO_CX88_VP3054=m
CONFIG_VIDEO_CX88_MPEG=m
CONFIG_VIDEO_BT848=m
CONFIG_DVB_BT8XX=m
CONFIG_VIDEO_SAA7134=m
CONFIG_VIDEO_SAA7134_ALSA=m
CONFIG_VIDEO_SAA7134_RC=y
CONFIG_VIDEO_SAA7134_DVB=m
CONFIG_VIDEO_SAA7164=m

#
# Media digital TV PCI Adapters
#
CONFIG_DVB_AV7110_IR=y
CONFIG_DVB_AV7110=m
CONFIG_DVB_AV7110_OSD=y
CONFIG_DVB_BUDGET_CORE=m
CONFIG_DVB_BUDGET=m
CONFIG_DVB_BUDGET_CI=m
CONFIG_DVB_BUDGET_AV=m
CONFIG_DVB_BUDGET_PATCH=m
CONFIG_DVB_B2C2_FLEXCOP_PCI=m
# CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
CONFIG_DVB_PLUTO2=m
CONFIG_DVB_DM1105=m
CONFIG_DVB_PT1=m
# CONFIG_DVB_PT3 is not set
CONFIG_MANTIS_CORE=m
CONFIG_DVB_MANTIS=m
CONFIG_DVB_HOPPER=m
CONFIG_DVB_NGENE=m
CONFIG_DVB_DDBRIDGE=m
# CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
# CONFIG_DVB_SMIPCIE is not set
# CONFIG_DVB_NETUP_UNIDVB is not set
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_SMS_SDIO_DRV=m
CONFIG_RADIO_ADAPTERS=y
CONFIG_RADIO_TEA575X=m
# CONFIG_RADIO_SI470X is not set
# CONFIG_RADIO_SI4713 is not set
# CONFIG_USB_MR800 is not set
# CONFIG_USB_DSBR is not set
# CONFIG_RADIO_MAXIRADIO is not set
# CONFIG_RADIO_SHARK is not set
# CONFIG_RADIO_SHARK2 is not set
# CONFIG_USB_KEENE is not set
# CONFIG_USB_RAREMONO is not set
# CONFIG_USB_MA901 is not set
# CONFIG_RADIO_TEA5764 is not set
# CONFIG_RADIO_SAA7706H is not set
# CONFIG_RADIO_TEF6862 is not set
# CONFIG_RADIO_WL1273 is not set

#
# Texas Instruments WL128x FM driver (ST based)
#
# end of Texas Instruments WL128x FM driver (ST based)

#
# Supported FireWire (IEEE 1394) Adapters
#
CONFIG_DVB_FIREDTV=m
CONFIG_DVB_FIREDTV_INPUT=y
CONFIG_MEDIA_COMMON_OPTIONS=y

#
# common driver options
#
CONFIG_VIDEO_CX2341X=m
CONFIG_VIDEO_TVEEPROM=m
CONFIG_CYPRESS_FIRMWARE=m
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEOBUF2_DMA_SG=m
CONFIG_VIDEOBUF2_DVB=m
CONFIG_DVB_B2C2_FLEXCOP=m
CONFIG_VIDEO_SAA7146=m
CONFIG_VIDEO_SAA7146_VV=m
CONFIG_SMS_SIANO_MDTV=m
CONFIG_SMS_SIANO_RC=y
# CONFIG_SMS_SIANO_DEBUGFS is not set

#
# Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# I2C Encoders, decoders, sensors and other helper chips
#

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_TDA7432=m
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
CONFIG_VIDEO_MSP3400=m
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
CONFIG_VIDEO_CS53L32A=m
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
CONFIG_VIDEO_WM8775=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_VP27SMPX=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
CONFIG_VIDEO_SAA711X=m
# CONFIG_VIDEO_TVP514X is not set
# CONFIG_VIDEO_TVP5150 is not set
# CONFIG_VIDEO_TVP7002 is not set
# CONFIG_VIDEO_TW2804 is not set
# CONFIG_VIDEO_TW9903 is not set
# CONFIG_VIDEO_TW9906 is not set
# CONFIG_VIDEO_TW9910 is not set
# CONFIG_VIDEO_VPX3220 is not set

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m

#
# Video encoders
#
CONFIG_VIDEO_SAA7127=m
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set

#
# Camera sensor devices
#
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_RJ54N1 is not set

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set

#
# Video improvement chips
#
CONFIG_VIDEO_UPD64031A=m
CONFIG_VIDEO_UPD64083=m

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m

#
# SDR tuner chips
#

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
CONFIG_VIDEO_M52790=m
# CONFIG_VIDEO_I2C is not set
# end of I2C Encoders, decoders, sensors and other helper chips

#
# SPI helper chips
#
# end of SPI helper chips

#
# Media SPI Adapters
#
# CONFIG_CXD2880_SPI_DRV is not set
# end of Media SPI Adapters

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_SIMPLE=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
# CONFIG_MEDIA_TUNER_MSI001 is not set
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT2266=m
CONFIG_MEDIA_TUNER_MT2131=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_XC2028=m
CONFIG_MEDIA_TUNER_XC5000=m
CONFIG_MEDIA_TUNER_XC4000=m
CONFIG_MEDIA_TUNER_MXL5005S=m
CONFIG_MEDIA_TUNER_MXL5007T=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_FC0011=m
CONFIG_MEDIA_TUNER_FC0012=m
CONFIG_MEDIA_TUNER_FC0013=m
CONFIG_MEDIA_TUNER_TDA18212=m
CONFIG_MEDIA_TUNER_E4000=m
CONFIG_MEDIA_TUNER_FC2580=m
CONFIG_MEDIA_TUNER_M88RS6000T=m
CONFIG_MEDIA_TUNER_TUA9001=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_IT913X=m
CONFIG_MEDIA_TUNER_R820T=m
# CONFIG_MEDIA_TUNER_MXL301RF is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QM1D1B0004=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_STB0899=m
CONFIG_DVB_STB6100=m
CONFIG_DVB_STV090x=m
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
CONFIG_DVB_STV6111=m
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_M88DS3103=m

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
CONFIG_DVB_TDA18271C2DD=m
CONFIG_DVB_SI2165=m
CONFIG_DVB_MN88472=m
CONFIG_DVB_MN88473=m

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24123=m
CONFIG_DVB_MT312=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m
CONFIG_DVB_S5H1420=m
CONFIG_DVB_STV0288=m
CONFIG_DVB_STB6000=m
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_TDA8083=m
CONFIG_DVB_TDA10086=m
CONFIG_DVB_TDA8261=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TDA826X=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
CONFIG_DVB_SI21XX=m
CONFIG_DVB_TS2020=m
CONFIG_DVB_DS3000=m
CONFIG_DVB_MB86A16=m
CONFIG_DVB_TDA10071=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_SP8870=m
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
# CONFIG_DVB_S5H1432 is not set
CONFIG_DVB_DRXD=m
CONFIG_DVB_L64781=m
CONFIG_DVB_TDA1004X=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_MT352=m
CONFIG_DVB_ZL10353=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
# CONFIG_DVB_DIB9000 is not set
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_SI2168=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_GP8PSK_FE=m
# CONFIG_DVB_CXD2880 is not set

#
# DVB-C (cable) frontends
#
CONFIG_DVB_VES1820=m
CONFIG_DVB_TDA10021=m
CONFIG_DVB_TDA10023=m
CONFIG_DVB_STV0297=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_NXT200X=m
CONFIG_DVB_OR51211=m
CONFIG_DVB_OR51132=m
CONFIG_DVB_BCM3510=m
CONFIG_DVB_LGDT330X=m
CONFIG_DVB_LGDT3305=m
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LG2160=m
CONFIG_DVB_S5H1409=m
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_S5H1411=m

#
# ISDB-T (terrestrial) frontends
#
CONFIG_DVB_S921=m
CONFIG_DVB_DIB8000=m
CONFIG_DVB_MB86A20S=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_TC90522=m
# CONFIG_DVB_MN88443X is not set

#
# Digital terrestrial only tuners/PLL
#
CONFIG_DVB_PLL=m
CONFIG_DVB_TUNER_DIB0070=m
CONFIG_DVB_TUNER_DIB0090=m

#
# SEC control devices for DVB-S
#
CONFIG_DVB_DRX39XYJ=m
CONFIG_DVB_LNBH25=m
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
# CONFIG_DVB_LGS8GL5 is not set
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
# CONFIG_DVB_HORUS3A is not set
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_HELENE is not set

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
# CONFIG_DVB_SP2 is not set

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Customise DVB Frontends

#
# Graphics support
#
CONFIG_AGP=y
CONFIG_AGP_AMD64=y
CONFIG_AGP_INTEL=y
CONFIG_AGP_SIS=y
CONFIG_AGP_VIA=y
CONFIG_INTEL_GTT=y
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
CONFIG_DRM_DEBUG_SELFTEST=m
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_KMS_FB_HELPER=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set

#
# ACP (Audio CoProcessor) Configuration
#
# end of ACP (Audio CoProcessor) Configuration

# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
# CONFIG_DRM_I915_ALPHA_SUPPORT is not set
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m

#
# drm/i915 Debugging
#
# CONFIG_DRM_I915_WERROR is not set
# CONFIG_DRM_I915_DEBUG is not set
# CONFIG_DRM_I915_DEBUG_MMIO is not set
# CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS is not set
# CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
# CONFIG_DRM_I915_DEBUG_GUC is not set
# CONFIG_DRM_I915_SELFTEST is not set
# CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS is not set
# CONFIG_DRM_I915_DEBUG_VBLANK_EVADE is not set
# CONFIG_DRM_I915_DEBUG_RUNTIME_PM is not set
# end of drm/i915 Debugging

#
# drm/i915 Profile Guided Optimisation
#
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_SPIN_REQUEST=5
# end of drm/i915 Profile Guided Optimisation

CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
CONFIG_DRM_VMWGFX_FBCON=y
CONFIG_DRM_GMA500=m
CONFIG_DRM_GMA600=y
CONFIG_DRM_GMA3600=y
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_QXL=m
CONFIG_DRM_BOCHS=m
CONFIG_DRM_VIRTIO_GPU=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
# CONFIG_DRM_HISI_HIBMC is not set
# CONFIG_DRM_TINYDRM is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_BOOT_VESA_SUPPORT=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=m
CONFIG_FB_SYS_COPYAREA=m
CONFIG_FB_SYS_IMAGEBLIT=m
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=m
CONFIG_FB_DEFERRED_IO=y
# CONFIG_FB_MODE_HELPERS is not set
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_UVESA is not set
CONFIG_FB_VESA=y
CONFIG_FB_EFI=y
# CONFIG_FB_N411 is not set
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_I740 is not set
# CONFIG_FB_LE80578 is not set
# CONFIG_FB_INTEL is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_S3 is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_VT8623 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_ARK is not set
# CONFIG_FB_PM3 is not set
# CONFIG_FB_CARMINE is not set
# CONFIG_FB_SM501 is not set
# CONFIG_FB_SMSCUFX is not set
# CONFIG_FB_UDL is not set
# CONFIG_FB_IBM_GXT4500 is not set
# CONFIG_FB_VIRTUAL is not set
# CONFIG_XEN_FBDEV_FRONTEND is not set
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_MB862XX is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
# CONFIG_FB_SM712 is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=m
# CONFIG_LCD_L4F00242T03 is not set
# CONFIG_LCD_LMS283GF05 is not set
# CONFIG_LCD_LTV350QV is not set
# CONFIG_LCD_ILI922X is not set
# CONFIG_LCD_ILI9320 is not set
# CONFIG_LCD_TDO24M is not set
# CONFIG_LCD_VGG2432A4 is not set
CONFIG_LCD_PLATFORM=m
# CONFIG_LCD_AMS369FG06 is not set
# CONFIG_LCD_LMS501KF03 is not set
# CONFIG_LCD_HX8357 is not set
# CONFIG_LCD_OTM3225A is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_GENERIC is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_PM8941_WLED is not set
# CONFIG_BACKLIGHT_SAHARA is not set
# CONFIG_BACKLIGHT_ADP8860 is not set
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_LM3630A is not set
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_LP855X=m
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
# CONFIG_BACKLIGHT_ARCXCNN is not set
# end of Backlight & LCD device support

CONFIG_HDMI=y

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_VGACON_SOFT_SCROLLBACK=y
CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=64
# CONFIG_VGACON_SOFT_SCROLLBACK_PERSISTENT_ENABLE_BY_DEFAULT is not set
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=80
CONFIG_DUMMY_CONSOLE_ROWS=25
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
# CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
# end of Console display driver support

CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
CONFIG_LOGO_LINUX_CLUT224=y
# end of Graphics support

CONFIG_SOUND=m
CONFIG_SOUND_OSS_CORE=y
CONFIG_SOUND_OSS_CORE_PRECLAIM=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_HWDEP=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
CONFIG_SND_OSSEMUL=y
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_HRTIMER=m
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
# CONFIG_SND_SUPPORT_OLD_API is not set
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQUENCER_OSS=m
CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_MIDI_EMUL=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_OPL3_LIB=m
CONFIG_SND_OPL3_LIB_SEQ=m
CONFIG_SND_VX_LIB=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
CONFIG_SND_PCSP=m
CONFIG_SND_DUMMY=m
CONFIG_SND_ALOOP=m
CONFIG_SND_VIRMIDI=m
CONFIG_SND_MTPAV=m
# CONFIG_SND_MTS64 is not set
# CONFIG_SND_SERIAL_U16550 is not set
CONFIG_SND_MPU401=m
# CONFIG_SND_PORTMAN2X4 is not set
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=5
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=m
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALS4000 is not set
CONFIG_SND_ALI5451=m
CONFIG_SND_ASIHPI=m
CONFIG_SND_ATIIXP=m
CONFIG_SND_ATIIXP_MODEM=m
CONFIG_SND_AU8810=m
CONFIG_SND_AU8820=m
CONFIG_SND_AU8830=m
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
CONFIG_SND_BT87X=m
# CONFIG_SND_BT87X_OVERCLOCK is not set
CONFIG_SND_CA0106=m
CONFIG_SND_CMIPCI=m
CONFIG_SND_OXYGEN_LIB=m
CONFIG_SND_OXYGEN=m
# CONFIG_SND_CS4281 is not set
CONFIG_SND_CS46XX=m
CONFIG_SND_CS46XX_NEW_DSP=y
CONFIG_SND_CTXFI=m
CONFIG_SND_DARLA20=m
CONFIG_SND_GINA20=m
CONFIG_SND_LAYLA20=m
CONFIG_SND_DARLA24=m
CONFIG_SND_GINA24=m
CONFIG_SND_LAYLA24=m
CONFIG_SND_MONA=m
CONFIG_SND_MIA=m
CONFIG_SND_ECHO3G=m
CONFIG_SND_INDIGO=m
CONFIG_SND_INDIGOIO=m
CONFIG_SND_INDIGODJ=m
CONFIG_SND_INDIGOIOX=m
CONFIG_SND_INDIGODJX=m
CONFIG_SND_EMU10K1=m
CONFIG_SND_EMU10K1_SEQ=m
CONFIG_SND_EMU10K1X=m
CONFIG_SND_ENS1370=m
CONFIG_SND_ENS1371=m
# CONFIG_SND_ES1938 is not set
CONFIG_SND_ES1968=m
CONFIG_SND_ES1968_INPUT=y
CONFIG_SND_ES1968_RADIO=y
# CONFIG_SND_FM801 is not set
CONFIG_SND_HDSP=m
CONFIG_SND_HDSPM=m
CONFIG_SND_ICE1712=m
CONFIG_SND_ICE1724=m
CONFIG_SND_INTEL8X0=m
CONFIG_SND_INTEL8X0M=m
CONFIG_SND_KORG1212=m
CONFIG_SND_LOLA=m
CONFIG_SND_LX6464ES=m
CONFIG_SND_MAESTRO3=m
CONFIG_SND_MAESTRO3_INPUT=y
CONFIG_SND_MIXART=m
# CONFIG_SND_NM256 is not set
CONFIG_SND_PCXHR=m
# CONFIG_SND_RIPTIDE is not set
CONFIG_SND_RME32=m
CONFIG_SND_RME96=m
CONFIG_SND_RME9652=m
# CONFIG_SND_SONICVIBES is not set
CONFIG_SND_TRIDENT=m
CONFIG_SND_VIA82XX=m
CONFIG_SND_VIA82XX_MODEM=m
CONFIG_SND_VIRTUOSO=m
CONFIG_SND_VX222=m
# CONFIG_SND_YMFPCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_INTEL=m
CONFIG_SND_HDA_HWDEP=y
CONFIG_SND_HDA_RECONFIG=y
CONFIG_SND_HDA_INPUT_BEEP=y
CONFIG_SND_HDA_INPUT_BEEP_MODE=0
CONFIG_SND_HDA_PATCH_LOADER=y
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
CONFIG_SND_HDA_CODEC_CIRRUS=m
CONFIG_SND_HDA_CODEC_CONEXANT=m
CONFIG_SND_HDA_CODEC_CA0110=m
CONFIG_SND_HDA_CODEC_CA0132=m
CONFIG_SND_HDA_CODEC_CA0132_DSP=y
CONFIG_SND_HDA_CODEC_CMEDIA=m
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_COMPONENT=y
CONFIG_SND_HDA_I915=y
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=512
# CONFIG_SND_SPI is not set
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_UA101=m
CONFIG_SND_USB_USX2Y=m
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_SND_USB_US122L=m
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_USB_POD=m
CONFIG_SND_USB_PODHD=m
CONFIG_SND_USB_TONEPORT=m
CONFIG_SND_USB_VARIAX=m
CONFIG_SND_FIREWIRE=y
CONFIG_SND_FIREWIRE_LIB=m
# CONFIG_SND_DICE is not set
# CONFIG_SND_OXFW is not set
CONFIG_SND_ISIGHT=m
# CONFIG_SND_FIREWORKS is not set
# CONFIG_SND_BEBOB is not set
# CONFIG_SND_FIREWIRE_DIGI00X is not set
# CONFIG_SND_FIREWIRE_TASCAM is not set
# CONFIG_SND_FIREWIRE_MOTU is not set
# CONFIG_SND_FIREFACE is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
CONFIG_SND_SOC_ACPI=m
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_ATMEL_SOC is not set
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
# CONFIG_SND_SOC_FSL_SAI is not set
# CONFIG_SND_SOC_FSL_AUDMIX is not set
# CONFIG_SND_SOC_FSL_SSI is not set
# CONFIG_SND_SOC_FSL_SPDIF is not set
# CONFIG_SND_SOC_FSL_ESAI is not set
# CONFIG_SND_SOC_FSL_MICFIL is not set
# CONFIG_SND_SOC_IMX_AUDMUX is not set
# end of SoC Audio for Freescale CPUs

# CONFIG_SND_I2S_HI6210_I2S is not set
# CONFIG_SND_SOC_IMG is not set
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SST_IPC=m
CONFIG_SND_SST_IPC_ACPI=m
CONFIG_SND_SOC_INTEL_SST_ACPI=m
CONFIG_SND_SOC_INTEL_SST=m
CONFIG_SND_SOC_INTEL_SST_FIRMWARE=m
CONFIG_SND_SOC_INTEL_HASWELL=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=m
# CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI is not set
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=m
CONFIG_SND_SOC_INTEL_SKYLAKE=m
CONFIG_SND_SOC_INTEL_SKL=m
CONFIG_SND_SOC_INTEL_APL=m
CONFIG_SND_SOC_INTEL_KBL=m
CONFIG_SND_SOC_INTEL_GLK=m
CONFIG_SND_SOC_INTEL_CNL=m
CONFIG_SND_SOC_INTEL_CFL=m
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
# CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
CONFIG_SND_SOC_ACPI_INTEL_MATCH=m
CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_HASWELL_MACH=m
CONFIG_SND_SOC_INTEL_BDW_RT5677_MACH=m
CONFIG_SND_SOC_INTEL_BROADWELL_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=m
CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH=m
CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH=m
# CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH is not set
# CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH is not set
CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH=m
CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH=m
CONFIG_SND_SOC_INTEL_SKL_RT286_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH=m
CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH=m
CONFIG_SND_SOC_INTEL_BXT_RT298_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH=m
CONFIG_SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH=m
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH is not set
# CONFIG_SND_SOC_INTEL_KBL_RT5660_MACH is not set
# CONFIG_SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
# CONFIG_SND_SOC_SOF_TOPLEVEL is not set

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
# CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
# CONFIG_SND_SOC_XILINX_SPDIF is not set
# CONFIG_SND_SOC_XTFPGA_I2S is not set
# CONFIG_ZX_TDM is not set
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
# CONFIG_SND_SOC_AC97_CODEC is not set
# CONFIG_SND_SOC_ADAU1701 is not set
# CONFIG_SND_SOC_ADAU1761_I2C is not set
# CONFIG_SND_SOC_ADAU1761_SPI is not set
# CONFIG_SND_SOC_ADAU7002 is not set
# CONFIG_SND_SOC_AK4104 is not set
# CONFIG_SND_SOC_AK4118 is not set
# CONFIG_SND_SOC_AK4458 is not set
# CONFIG_SND_SOC_AK4554 is not set
# CONFIG_SND_SOC_AK4613 is not set
# CONFIG_SND_SOC_AK4642 is not set
# CONFIG_SND_SOC_AK5386 is not set
# CONFIG_SND_SOC_AK5558 is not set
# CONFIG_SND_SOC_ALC5623 is not set
# CONFIG_SND_SOC_BD28623 is not set
# CONFIG_SND_SOC_BT_SCO is not set
# CONFIG_SND_SOC_CS35L32 is not set
# CONFIG_SND_SOC_CS35L33 is not set
# CONFIG_SND_SOC_CS35L34 is not set
# CONFIG_SND_SOC_CS35L35 is not set
# CONFIG_SND_SOC_CS35L36 is not set
# CONFIG_SND_SOC_CS42L42 is not set
# CONFIG_SND_SOC_CS42L51_I2C is not set
# CONFIG_SND_SOC_CS42L52 is not set
# CONFIG_SND_SOC_CS42L56 is not set
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
# CONFIG_SND_SOC_CS4271_I2C is not set
# CONFIG_SND_SOC_CS4271_SPI is not set
# CONFIG_SND_SOC_CS42XX8_I2C is not set
# CONFIG_SND_SOC_CS43130 is not set
# CONFIG_SND_SOC_CS4341 is not set
# CONFIG_SND_SOC_CS4349 is not set
# CONFIG_SND_SOC_CS53L30 is not set
# CONFIG_SND_SOC_CX2072X is not set
CONFIG_SND_SOC_DA7213=m
CONFIG_SND_SOC_DA7219=m
CONFIG_SND_SOC_DMIC=m
# CONFIG_SND_SOC_ES7134 is not set
# CONFIG_SND_SOC_ES7241 is not set
CONFIG_SND_SOC_ES8316=m
# CONFIG_SND_SOC_ES8328_I2C is not set
# CONFIG_SND_SOC_ES8328_SPI is not set
# CONFIG_SND_SOC_GTM601 is not set
CONFIG_SND_SOC_HDAC_HDMI=m
# CONFIG_SND_SOC_INNO_RK3036 is not set
# CONFIG_SND_SOC_MAX98088 is not set
CONFIG_SND_SOC_MAX98090=m
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
# CONFIG_SND_SOC_MAX9867 is not set
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98373 is not set
# CONFIG_SND_SOC_MAX9860 is not set
# CONFIG_SND_SOC_MSM8916_WCD_DIGITAL is not set
# CONFIG_SND_SOC_PCM1681 is not set
# CONFIG_SND_SOC_PCM1789_I2C is not set
# CONFIG_SND_SOC_PCM179X_I2C is not set
# CONFIG_SND_SOC_PCM179X_SPI is not set
# CONFIG_SND_SOC_PCM186X_I2C is not set
# CONFIG_SND_SOC_PCM186X_SPI is not set
# CONFIG_SND_SOC_PCM3060_I2C is not set
# CONFIG_SND_SOC_PCM3060_SPI is not set
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM3168A_SPI is not set
# CONFIG_SND_SOC_PCM512x_I2C is not set
# CONFIG_SND_SOC_PCM512x_SPI is not set
# CONFIG_SND_SOC_RK3328 is not set
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RL6347A=m
CONFIG_SND_SOC_RT286=m
CONFIG_SND_SOC_RT298=m
CONFIG_SND_SOC_RT5514=m
CONFIG_SND_SOC_RT5514_SPI=m
# CONFIG_SND_SOC_RT5616 is not set
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5645=m
CONFIG_SND_SOC_RT5651=m
CONFIG_SND_SOC_RT5663=m
CONFIG_SND_SOC_RT5670=m
CONFIG_SND_SOC_RT5677=m
CONFIG_SND_SOC_RT5677_SPI=m
# CONFIG_SND_SOC_SGTL5000 is not set
# CONFIG_SND_SOC_SIMPLE_AMPLIFIER is not set
# CONFIG_SND_SOC_SIRF_AUDIO_CODEC is not set
# CONFIG_SND_SOC_SPDIF is not set
# CONFIG_SND_SOC_SSM2305 is not set
# CONFIG_SND_SOC_SSM2602_SPI is not set
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM4567=m
# CONFIG_SND_SOC_STA32X is not set
# CONFIG_SND_SOC_STA350 is not set
# CONFIG_SND_SOC_STI_SAS is not set
# CONFIG_SND_SOC_TAS2552 is not set
# CONFIG_SND_SOC_TAS5086 is not set
# CONFIG_SND_SOC_TAS571X is not set
# CONFIG_SND_SOC_TAS5720 is not set
# CONFIG_SND_SOC_TAS6424 is not set
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
# CONFIG_SND_SOC_TLV320AIC23_SPI is not set
# CONFIG_SND_SOC_TLV320AIC31XX is not set
# CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
# CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
# CONFIG_SND_SOC_TLV320AIC3X is not set
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
# CONFIG_SND_SOC_TSCS454 is not set
# CONFIG_SND_SOC_WM8510 is not set
# CONFIG_SND_SOC_WM8523 is not set
# CONFIG_SND_SOC_WM8524 is not set
# CONFIG_SND_SOC_WM8580 is not set
# CONFIG_SND_SOC_WM8711 is not set
# CONFIG_SND_SOC_WM8728 is not set
# CONFIG_SND_SOC_WM8731 is not set
# CONFIG_SND_SOC_WM8737 is not set
# CONFIG_SND_SOC_WM8741 is not set
# CONFIG_SND_SOC_WM8750 is not set
# CONFIG_SND_SOC_WM8753 is not set
# CONFIG_SND_SOC_WM8770 is not set
# CONFIG_SND_SOC_WM8776 is not set
# CONFIG_SND_SOC_WM8782 is not set
# CONFIG_SND_SOC_WM8804_I2C is not set
# CONFIG_SND_SOC_WM8804_SPI is not set
# CONFIG_SND_SOC_WM8903 is not set
# CONFIG_SND_SOC_WM8904 is not set
# CONFIG_SND_SOC_WM8960 is not set
# CONFIG_SND_SOC_WM8962 is not set
# CONFIG_SND_SOC_WM8974 is not set
# CONFIG_SND_SOC_WM8978 is not set
# CONFIG_SND_SOC_WM8985 is not set
# CONFIG_SND_SOC_ZX_AUD96P22 is not set
# CONFIG_SND_SOC_MAX9759 is not set
# CONFIG_SND_SOC_MT6351 is not set
# CONFIG_SND_SOC_MT6358 is not set
# CONFIG_SND_SOC_NAU8540 is not set
# CONFIG_SND_SOC_NAU8810 is not set
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
CONFIG_SND_SOC_NAU8825=m
# CONFIG_SND_SOC_TPA6130A2 is not set
# end of CODEC drivers

# CONFIG_SND_SIMPLE_CARD is not set
CONFIG_SND_X86=y
CONFIG_HDMI_LPE_AUDIO=m
CONFIG_SND_SYNTH_EMUX=m
# CONFIG_SND_XEN_FRONTEND is not set
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
CONFIG_HID_APPLEIR=m
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=y
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=y
CONFIG_HID_CHICONY=y
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_PRODIKEYS=m
# CONFIG_HID_CMEDIA is not set
# CONFIG_HID_CP2112 is not set
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
# CONFIG_HID_GFRM is not set
CONFIG_HID_HOLTEK=m
# CONFIG_HOLTEK_FF is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
CONFIG_HID_UCLOGIC=m
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=y
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
# CONFIG_HID_LENOVO is not set
CONFIG_HID_LOGITECH=y
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=y
CONFIG_HID_ORTEK=m
CONFIG_HID_PANTHERLORD=m
# CONFIG_PANTHERLORD_FF is not set
# CONFIG_HID_PENMOUNT is not set
CONFIG_HID_PETALYNX=m
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
CONFIG_HID_PICOLCD_BACKLIGHT=y
CONFIG_HID_PICOLCD_LCD=y
CONFIG_HID_PICOLCD_LEDS=y
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
CONFIG_HID_ROCCAT=m
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
CONFIG_HID_SONY=m
# CONFIG_SONY_FF is not set
CONFIG_HID_SPEEDLINK=m
# CONFIG_HID_STEAM is not set
CONFIG_HID_STEELSERIES=m
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
# CONFIG_THRUSTMASTER_FF is not set
# CONFIG_HID_UDRAW_PS3 is not set
# CONFIG_HID_U2FZERO is not set
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
# CONFIG_HID_XINMO is not set
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=m
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
CONFIG_HID_PID=y
CONFIG_USB_HIDDEV=y
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID=m
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_WHITELIST is not set
# CONFIG_USB_OTG_BLACKLIST_HUB is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y
CONFIG_USB_WUSB=m
CONFIG_USB_WUSB_CBAF=m
# CONFIG_USB_WUSB_CBAF_DEBUG is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PLATFORM is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
# CONFIG_USB_MAX3421_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_U132_HCD is not set
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_WHCI_HCD is not set
CONFIG_USB_HWA_HCD=m
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=m
CONFIG_USB_PRINTER=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_REALTEK_AUTOPM=y
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPSHOT=m
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_UAS=m

#
# USB Imaging devices
#
CONFIG_USB_MDC800=m
CONFIG_USB_MICROTEK=m
CONFIG_USBIP_CORE=m
# CONFIG_USBIP_VHCI_HCD is not set
# CONFIG_USBIP_HOST is not set
# CONFIG_USBIP_DEBUG is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=m
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
CONFIG_USB_SERIAL_AIRCABLE=m
CONFIG_USB_SERIAL_ARK3116=m
CONFIG_USB_SERIAL_BELKIN=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_WHITEHEAT=m
CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CYPRESS_M8=m
CONFIG_USB_SERIAL_EMPEG=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_SERIAL_VISOR=m
CONFIG_USB_SERIAL_IPAQ=m
CONFIG_USB_SERIAL_IR=m
CONFIG_USB_SERIAL_EDGEPORT=m
CONFIG_USB_SERIAL_EDGEPORT_TI=m
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
CONFIG_USB_SERIAL_GARMIN=m
CONFIG_USB_SERIAL_IPW=m
CONFIG_USB_SERIAL_IUU=m
CONFIG_USB_SERIAL_KEYSPAN_PDA=m
CONFIG_USB_SERIAL_KEYSPAN=m
CONFIG_USB_SERIAL_KLSI=m
CONFIG_USB_SERIAL_KOBIL_SCT=m
CONFIG_USB_SERIAL_MCT_U232=m
# CONFIG_USB_SERIAL_METRO is not set
CONFIG_USB_SERIAL_MOS7720=m
CONFIG_USB_SERIAL_MOS7715_PARPORT=y
CONFIG_USB_SERIAL_MOS7840=m
# CONFIG_USB_SERIAL_MXUPORT is not set
CONFIG_USB_SERIAL_NAVMAN=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_SERIAL_OTI6858=m
CONFIG_USB_SERIAL_QCAUX=m
CONFIG_USB_SERIAL_QUALCOMM=m
CONFIG_USB_SERIAL_SPCP8X5=m
CONFIG_USB_SERIAL_SAFE=m
CONFIG_USB_SERIAL_SAFE_PADDED=y
CONFIG_USB_SERIAL_SIERRAWIRELESS=m
CONFIG_USB_SERIAL_SYMBOL=m
# CONFIG_USB_SERIAL_TI is not set
CONFIG_USB_SERIAL_CYBERJACK=m
CONFIG_USB_SERIAL_XIRCOM=m
CONFIG_USB_SERIAL_WWAN=m
CONFIG_USB_SERIAL_OPTION=m
CONFIG_USB_SERIAL_OMNINET=m
CONFIG_USB_SERIAL_OPTICON=m
CONFIG_USB_SERIAL_XSENS_MT=m
# CONFIG_USB_SERIAL_WISHBONE is not set
CONFIG_USB_SERIAL_SSU100=m
CONFIG_USB_SERIAL_QT2=m
# CONFIG_USB_SERIAL_UPD78F0730 is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=m
CONFIG_USB_ADUTUX=m
CONFIG_USB_SEVSEG=m
# CONFIG_USB_RIO500 is not set
CONFIG_USB_LEGOTOWER=m
CONFIG_USB_LCD=m
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=m
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_SISUSBVGA=m
CONFIG_USB_SISUSBVGA_CON=y
CONFIG_USB_LD=m
# CONFIG_USB_TRANCEVIBRATOR is not set
CONFIG_USB_IOWARRIOR=m
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=m
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
CONFIG_USB_ATM=m
CONFIG_USB_SPEEDTOUCH=m
CONFIG_USB_CXACRU=m
CONFIG_USB_UEAGLEATM=m
CONFIG_USB_XUSBATM=m

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_USB_ISP1301 is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
CONFIG_TYPEC_UCSI=y
# CONFIG_UCSI_CCG is not set
CONFIG_UCSI_ACPI=y
# CONFIG_TYPEC_TPS6598X is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
# CONFIG_TYPEC_MUX_PI3USB30532 is not set
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
# CONFIG_TYPEC_DP_ALTMODE is not set
# end of USB Type-C Alternate Mode drivers

# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
CONFIG_UWB=m
CONFIG_UWB_HWA=m
CONFIG_UWB_WHCI=m
CONFIG_UWB_I1480U=m
CONFIG_MMC=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
CONFIG_SDIO_UART=m
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
CONFIG_MMC_TIFM_SD=m
# CONFIG_MMC_SPI is not set
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
CONFIG_MSPRO_BLOCK=m
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
CONFIG_MEMSTICK_TIFM_MS=m
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_APU is not set
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3642 is not set
# CONFIG_LEDS_PCA9532 is not set
# CONFIG_LEDS_GPIO is not set
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
# CONFIG_LEDS_LP8501 is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
# CONFIG_LEDS_MLXCPLD is not set
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
# CONFIG_LEDS_TRIGGER_MTD is not set
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
CONFIG_LEDS_TRIGGER_DEFAULT_ON=m

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=m
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_NETDEV is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=m
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
# CONFIG_EDAC_AMD64_ERROR_INJECTION is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
CONFIG_EDAC_I3200=m
CONFIG_EDAC_IE31200=m
CONFIG_EDAC_X38=m
CONFIG_EDAC_I5400=m
CONFIG_EDAC_I7CORE=m
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
CONFIG_EDAC_SBRIDGE=m
CONFIG_EDAC_SKX=m
# CONFIG_EDAC_I10NM is not set
CONFIG_EDAC_PND2=m
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_SYSTOHC is not set
# CONFIG_RTC_DEBUG is not set
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_ABB5ZES3 is not set
# CONFIG_RTC_DRV_ABEOZ9 is not set
# CONFIG_RTC_DRV_ABX80X is not set
CONFIG_RTC_DRV_DS1307=m
# CONFIG_RTC_DRV_DS1307_CENTURY is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1374_WDT is not set
CONFIG_RTC_DRV_DS1672=m
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_RS5C372=m
CONFIG_RTC_DRV_ISL1208=m
CONFIG_RTC_DRV_ISL12022=m
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
# CONFIG_RTC_DRV_PCF85063 is not set
# CONFIG_RTC_DRV_PCF85363 is not set
CONFIG_RTC_DRV_PCF8563=m
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=m
CONFIG_RTC_DRV_M41T80_WDT=y
# CONFIG_RTC_DRV_BD70528 is not set
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV8803 is not set
# CONFIG_RTC_DRV_SD3078 is not set

#
# SPI RTC drivers
#
# CONFIG_RTC_DRV_M41T93 is not set
# CONFIG_RTC_DRV_M41T94 is not set
# CONFIG_RTC_DRV_DS1302 is not set
# CONFIG_RTC_DRV_DS1305 is not set
# CONFIG_RTC_DRV_DS1343 is not set
# CONFIG_RTC_DRV_DS1347 is not set
# CONFIG_RTC_DRV_DS1390 is not set
# CONFIG_RTC_DRV_MAX6916 is not set
# CONFIG_RTC_DRV_R9701 is not set
CONFIG_RTC_DRV_RX4581=m
# CONFIG_RTC_DRV_RX6110 is not set
# CONFIG_RTC_DRV_RS5C348 is not set
# CONFIG_RTC_DRV_MAX6902 is not set
# CONFIG_RTC_DRV_PCF2123 is not set
# CONFIG_RTC_DRV_MCP795 is not set
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=m
CONFIG_RTC_DRV_DS3232_HWMON=y
# CONFIG_RTC_DRV_PCF2127 is not set
CONFIG_RTC_DRV_RV3029C2=m
CONFIG_RTC_DRV_RV3029_HWMON=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=m
CONFIG_RTC_DRV_DS1553=m
# CONFIG_RTC_DRV_DS1685_FAMILY is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_STK17TA8=m
# CONFIG_RTC_DRV_M48T86 is not set
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=m
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=m
CONFIG_RTC_DRV_RP5C01=m
CONFIG_RTC_DRV_V3020=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_FTRTC010 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
# CONFIG_INTEL_IDMA64 is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
# CONFIG_UDMABUF is not set
# end of DMABUF options

CONFIG_DCA=m
CONFIG_AUXDISPLAY=y
# CONFIG_HD44780 is not set
CONFIG_KS0108=m
CONFIG_KS0108_PORT=0x378
CONFIG_KS0108_DELAY=2
CONFIG_CFAG12864B=m
CONFIG_CFAG12864B_RATE=20
# CONFIG_IMG_ASCII_LCD is not set
# CONFIG_PARPORT_PANEL is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
# CONFIG_PANEL is not set
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
# CONFIG_UIO_MF624 is not set
CONFIG_UIO_HV_GENERIC=m
CONFIG_VFIO_IOMMU_TYPE1=m
CONFIG_VFIO_VIRQFD=m
CONFIG_VFIO=m
CONFIG_VFIO_NOIOMMU=y
CONFIG_VFIO_PCI=m
# CONFIG_VFIO_PCI_VGA is not set
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
# CONFIG_VFIO_PCI_IGD is not set
CONFIG_VFIO_MDEV=m
CONFIG_VFIO_MDEV_DEVICE=m
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_TSCPAGE=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
# CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=m
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
# CONFIG_XEN_GNTDEV is not set
# CONFIG_XEN_GRANT_DEV_ALLOC is not set
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
# CONFIG_XEN_PVCALLS_FRONTEND is not set
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_HAVE_PVMMU=y
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
CONFIG_XEN_HAVE_VPMU=y
# end of Xen driver support

CONFIG_STAGING=y
# CONFIG_PRISM2_USB is not set
# CONFIG_COMEDI is not set
# CONFIG_RTL8192U is not set
CONFIG_RTLLIB=m
CONFIG_RTLLIB_CRYPTO_CCMP=m
CONFIG_RTLLIB_CRYPTO_TKIP=m
CONFIG_RTLLIB_CRYPTO_WEP=m
CONFIG_RTL8192E=m
# CONFIG_RTL8723BS is not set
CONFIG_R8712U=m
# CONFIG_R8188EU is not set
# CONFIG_RTS5208 is not set
# CONFIG_VT6655 is not set
# CONFIG_VT6656 is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# CONFIG_ADIS16203 is not set
# CONFIG_ADIS16240 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7816 is not set
# CONFIG_AD7192 is not set
# CONFIG_AD7280 is not set
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
# CONFIG_ADT7316 is not set
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
# CONFIG_AD7746 is not set
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# CONFIG_AD9832 is not set
# CONFIG_AD9834 is not set
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# CONFIG_AD5933 is not set
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# CONFIG_ADE7854 is not set
# end of Active energy metering IC

#
# Resolver to digital converters
#
# CONFIG_AD2S1210 is not set
# end of Resolver to digital converters
# end of IIO staging drivers

# CONFIG_FB_SM750 is not set

#
# Speakup console speech
#
# CONFIG_SPEAKUP is not set
# end of Speakup console speech

# CONFIG_STAGING_MEDIA is not set

#
# Android
#
# CONFIG_ASHMEM is not set
# CONFIG_ANDROID_VSOC is not set
CONFIG_ION=y
CONFIG_ION_SYSTEM_HEAP=y
# CONFIG_ION_CMA_HEAP is not set
# end of Android

# CONFIG_LTE_GDM724X is not set
CONFIG_FIREWIRE_SERIAL=m
CONFIG_FWTTY_MAX_TOTAL_PORTS=64
CONFIG_FWTTY_MAX_CARD_PORTS=32
# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
# CONFIG_FB_TFT is not set
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
# CONFIG_MOST is not set
# CONFIG_KS7010 is not set
# CONFIG_GREYBUS is not set
# CONFIG_PI433 is not set

#
# Gasket devices
#
# CONFIG_STAGING_GASKET_FRAMEWORK is not set
# end of Gasket devices

# CONFIG_EROFS_FS is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_KPC2000 is not set

#
# ISDN CAPI drivers
#
CONFIG_CAPI_AVM=y
CONFIG_ISDN_DRV_AVMB1_B1PCI=m
CONFIG_ISDN_DRV_AVMB1_B1PCIV4=y
CONFIG_ISDN_DRV_AVMB1_T1PCI=m
CONFIG_ISDN_DRV_AVMB1_C4=m
CONFIG_ISDN_DRV_GIGASET=m
CONFIG_GIGASET_CAPI=y
CONFIG_GIGASET_BASE=m
CONFIG_GIGASET_M105=m
CONFIG_GIGASET_M101=m
# CONFIG_GIGASET_DEBUG is not set
CONFIG_HYSDN=m
CONFIG_HYSDN_CAPI=y
# end of ISDN CAPI drivers

CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACER_WMI=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACERHDF=m
# CONFIG_ALIENWARE_WMI is not set
CONFIG_ASUS_LAPTOP=m
CONFIG_DCDBAS=m
CONFIG_DELL_SMBIOS=m
CONFIG_DELL_SMBIOS_WMI=y
CONFIG_DELL_SMBIOS_SMM=y
CONFIG_DELL_LAPTOP=m
CONFIG_DELL_WMI=m
CONFIG_DELL_WMI_DESCRIPTOR=m
CONFIG_DELL_WMI_AIO=m
# CONFIG_DELL_WMI_LED is not set
CONFIG_DELL_SMO8800=m
CONFIG_DELL_RBTN=m
CONFIG_DELL_RBU=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
CONFIG_AMILO_RFKILL=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
CONFIG_HP_WIRELESS=m
CONFIG_HP_WMI=m
# CONFIG_LG_LAPTOP is not set
CONFIG_MSI_LAPTOP=m
CONFIG_PANASONIC_LAPTOP=m
CONFIG_COMPAL_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
CONFIG_IDEAPAD_LAPTOP=m
# CONFIG_SURFACE3_WMI is not set
CONFIG_THINKPAD_ACPI=m
CONFIG_THINKPAD_ACPI_ALSA_SUPPORT=y
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
CONFIG_SENSORS_HDAPS=m
# CONFIG_INTEL_MENLOW is not set
CONFIG_EEEPC_LAPTOP=m
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_WMI=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
CONFIG_INTEL_WMI_THUNDERBOLT=m
# CONFIG_XIAOMI_WMI is not set
CONFIG_MSI_WMI=m
# CONFIG_PEAQ_WMI is not set
CONFIG_TOPSTAR_LAPTOP=m
CONFIG_ACPI_TOSHIBA=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
# CONFIG_INTEL_INT0002_VGPIO is not set
CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_PMC_CORE=m
# CONFIG_IBM_RTL is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_MXM_WMI=m
CONFIG_INTEL_OAKTRAIL=m
CONFIG_SAMSUNG_Q10=m
CONFIG_APPLE_GMUX=m
# CONFIG_INTEL_RST is not set
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_PMC_IPC is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_MLX_PLATFORM is not set
# CONFIG_INTEL_TURBO_MAX_3 is not set
# CONFIG_I2C_MULTI_INSTANTIATE is not set
# CONFIG_INTEL_ATOMISP2_PM is not set
# CONFIG_HUAWEI_WMI is not set
# CONFIG_PCENGINES_APU2 is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_PMC_ATOM=y
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Common Clock Framework
#
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# end of Common Clock Framework

# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Aspeed SoC drivers
#
# end of Aspeed SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# CONFIG_XILINX_VCU is not set
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=m
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
# CONFIG_DEVFREQ_GOV_POWERSAVE is not set
# CONFIG_DEVFREQ_GOV_USERSPACE is not set
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_PM_DEVFREQ_EVENT is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
# CONFIG_IIO_BUFFER_HW_CONSUMER is not set
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=m
# CONFIG_IIO_CONFIGFS is not set
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
# CONFIG_IIO_SW_DEVICE is not set
# CONFIG_IIO_SW_TRIGGER is not set

#
# Accelerometers
#
# CONFIG_ADIS16201 is not set
# CONFIG_ADIS16209 is not set
# CONFIG_ADXL345_I2C is not set
# CONFIG_ADXL345_SPI is not set
# CONFIG_ADXL372_SPI is not set
# CONFIG_ADXL372_I2C is not set
# CONFIG_BMA180 is not set
# CONFIG_BMA220 is not set
# CONFIG_BMC150_ACCEL is not set
# CONFIG_DA280 is not set
# CONFIG_DA311 is not set
# CONFIG_DMARD09 is not set
# CONFIG_DMARD10 is not set
CONFIG_HID_SENSOR_ACCEL_3D=m
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
# CONFIG_IIO_ST_ACCEL_3AXIS is not set
# CONFIG_KXSD9 is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
# CONFIG_MMA7455_I2C is not set
# CONFIG_MMA7455_SPI is not set
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
# CONFIG_MMA9551 is not set
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
# CONFIG_SCA3000 is not set
# CONFIG_STK8312 is not set
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7124 is not set
# CONFIG_AD7266 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7298 is not set
# CONFIG_AD7476 is not set
# CONFIG_AD7606_IFACE_PARALLEL is not set
# CONFIG_AD7606_IFACE_SPI is not set
# CONFIG_AD7766 is not set
# CONFIG_AD7768_1 is not set
# CONFIG_AD7780 is not set
# CONFIG_AD7791 is not set
# CONFIG_AD7793 is not set
# CONFIG_AD7887 is not set
# CONFIG_AD7923 is not set
# CONFIG_AD7949 is not set
# CONFIG_AD799X is not set
# CONFIG_HI8435 is not set
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
# CONFIG_LTC2471 is not set
# CONFIG_LTC2485 is not set
# CONFIG_LTC2497 is not set
# CONFIG_MAX1027 is not set
# CONFIG_MAX11100 is not set
# CONFIG_MAX1118 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP320X is not set
# CONFIG_MCP3422 is not set
# CONFIG_MCP3911 is not set
# CONFIG_NAU7802 is not set
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADC0832 is not set
# CONFIG_TI_ADC084S021 is not set
# CONFIG_TI_ADC12138 is not set
# CONFIG_TI_ADC108S102 is not set
# CONFIG_TI_ADC128S052 is not set
# CONFIG_TI_ADC161S626 is not set
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_ADS7950 is not set
# CONFIG_TI_TLC4541 is not set
# CONFIG_VIPERBOARD_ADC is not set
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog Front Ends
#
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_AD8366 is not set
# end of Amplifiers

#
# Chemical Sensors
#
# CONFIG_ATLAS_PH_SENSOR is not set
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
# CONFIG_IAQCORE is not set
# CONFIG_SENSIRION_SGP30 is not set
# CONFIG_SPS30 is not set
# CONFIG_VZ89X is not set
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

#
# SSP Sensor Common
#
# CONFIG_IIO_SSP_SENSORHUB is not set
# end of SSP Sensor Common

#
# Digital to analog converters
#
# CONFIG_AD5064 is not set
# CONFIG_AD5360 is not set
# CONFIG_AD5380 is not set
# CONFIG_AD5421 is not set
# CONFIG_AD5446 is not set
# CONFIG_AD5449 is not set
# CONFIG_AD5592R is not set
# CONFIG_AD5593R is not set
# CONFIG_AD5504 is not set
# CONFIG_AD5624R_SPI is not set
# CONFIG_LTC1660 is not set
# CONFIG_LTC2632 is not set
# CONFIG_AD5686_SPI is not set
# CONFIG_AD5696_I2C is not set
# CONFIG_AD5755 is not set
# CONFIG_AD5758 is not set
# CONFIG_AD5761 is not set
# CONFIG_AD5764 is not set
# CONFIG_AD5791 is not set
# CONFIG_AD7303 is not set
# CONFIG_AD8801 is not set
# CONFIG_DS4424 is not set
# CONFIG_M62332 is not set
# CONFIG_MAX517 is not set
# CONFIG_MCP4725 is not set
# CONFIG_MCP4922 is not set
# CONFIG_TI_DAC082S085 is not set
# CONFIG_TI_DAC5571 is not set
# CONFIG_TI_DAC7311 is not set
# CONFIG_TI_DAC7612 is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# CONFIG_AD9523 is not set
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# CONFIG_ADF4350 is not set
# CONFIG_ADF4371 is not set
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_ADIS16080 is not set
# CONFIG_ADIS16130 is not set
# CONFIG_ADIS16136 is not set
# CONFIG_ADIS16260 is not set
# CONFIG_ADXRS450 is not set
# CONFIG_BMG160 is not set
# CONFIG_FXAS21002C is not set
CONFIG_HID_SENSOR_GYRO_3D=m
# CONFIG_MPU3050_I2C is not set
# CONFIG_IIO_ST_GYRO_3AXIS is not set
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# CONFIG_AFE4403 is not set
# CONFIG_AFE4404 is not set
# CONFIG_MAX30100 is not set
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_AM2315 is not set
# CONFIG_DHT11 is not set
# CONFIG_HDC100X is not set
# CONFIG_HID_SENSOR_HUMIDITY is not set
# CONFIG_HTS221 is not set
# CONFIG_HTU21 is not set
# CONFIG_SI7005 is not set
# CONFIG_SI7020 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_ADIS16400 is not set
# CONFIG_ADIS16480 is not set
# CONFIG_BMI160_I2C is not set
# CONFIG_BMI160_SPI is not set
# CONFIG_KMX61 is not set
# CONFIG_INV_MPU6050_I2C is not set
# CONFIG_INV_MPU6050_SPI is not set
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ACPI_ALS is not set
# CONFIG_ADJD_S311 is not set
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
# CONFIG_BH1750 is not set
# CONFIG_BH1780 is not set
# CONFIG_CM32181 is not set
# CONFIG_CM3232 is not set
# CONFIG_CM3323 is not set
# CONFIG_CM36651 is not set
# CONFIG_GP2AP020A00F is not set
# CONFIG_SENSORS_ISL29018 is not set
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
# CONFIG_JSA1212 is not set
# CONFIG_RPR0521 is not set
# CONFIG_LTR501 is not set
# CONFIG_LV0104CS is not set
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
# CONFIG_OPT3001 is not set
# CONFIG_PA12203001 is not set
# CONFIG_SI1133 is not set
# CONFIG_SI1145 is not set
# CONFIG_STK3310 is not set
# CONFIG_ST_UVIS25 is not set
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
# CONFIG_SENSORS_TSL2563 is not set
# CONFIG_TSL2583 is not set
# CONFIG_TSL2772 is not set
# CONFIG_TSL4531 is not set
# CONFIG_US5182D is not set
# CONFIG_VCNL4000 is not set
# CONFIG_VCNL4035 is not set
# CONFIG_VEML6070 is not set
# CONFIG_VL6180 is not set
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
# CONFIG_BMC150_MAGN_I2C is not set
# CONFIG_BMC150_MAGN_SPI is not set
# CONFIG_MAG3110 is not set
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
# CONFIG_MMC35240 is not set
# CONFIG_IIO_ST_MAGN_3AXIS is not set
# CONFIG_SENSORS_HMC5843_I2C is not set
# CONFIG_SENSORS_HMC5843_SPI is not set
# CONFIG_SENSORS_RM3100_I2C is not set
# CONFIG_SENSORS_RM3100_SPI is not set
# end of Magnetometer sensors

#
# Multiplexers
#
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
# CONFIG_IIO_SYSFS_TRIGGER is not set
# end of Triggers - standalone

#
# Digital potentiometers
#
# CONFIG_AD5272 is not set
# CONFIG_DS1803 is not set
# CONFIG_MAX5481 is not set
# CONFIG_MAX5487 is not set
# CONFIG_MCP4018 is not set
# CONFIG_MCP4131 is not set
# CONFIG_MCP4531 is not set
# CONFIG_MCP41010 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
# CONFIG_LMP91000 is not set
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
# CONFIG_DPS310 is not set
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
# CONFIG_MPL115_I2C is not set
# CONFIG_MPL115_SPI is not set
# CONFIG_MPL3115 is not set
# CONFIG_MS5611 is not set
# CONFIG_MS5637 is not set
# CONFIG_IIO_ST_PRESS is not set
# CONFIG_T5403 is not set
# CONFIG_HP206C is not set
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# CONFIG_AS3935 is not set
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_MB1232 is not set
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
# CONFIG_VL53L0X_I2C is not set
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# CONFIG_AD2S90 is not set
# CONFIG_AD2S1200 is not set
# end of Resolver to digital converters

#
# Temperature sensors
#
# CONFIG_MAXIM_THERMOCOUPLE is not set
# CONFIG_HID_SENSOR_TEMP is not set
# CONFIG_MLX90614 is not set
# CONFIG_MLX90632 is not set
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
# CONFIG_TSYS01 is not set
# CONFIG_TSYS02D is not set
# CONFIG_MAX31856 is not set
# end of Temperature sensors

CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
CONFIG_NTB_AMD=m
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=m
CONFIG_NTB_TRANSPORT=m
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_LPSS_PCI is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_CPCAP_USB is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
CONFIG_THUNDERBOLT=y

#
# Android
#
CONFIG_ANDROID=y
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
CONFIG_ND_BLK=m
CONFIG_ND_CLAIM=y
CONFIG_ND_BTT=m
CONFIG_BTT=y
CONFIG_ND_PFN=m
CONFIG_NVDIMM_PFN=y
CONFIG_NVDIMM_DAX=y
CONFIG_NVDIMM_KEYS=y
CONFIG_DAX_DRIVER=y
CONFIG_DAX=y
CONFIG_DEV_DAX=m
CONFIG_DEV_DAX_PMEM=m
CONFIG_DEV_DAX_KMEM=m
CONFIG_DEV_DAX_PMEM_COMPAT=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y

#
# HW tracing support
#
# CONFIG_STM is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_PM_OPP=y
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=m
CONFIG_EXT4_USE_FOR_EXT2=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD2=m
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=m
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_QUOTA=y
CONFIG_XFS_POSIX_ACL=y
CONFIG_XFS_RT=y
CONFIG_XFS_ONLINE_SCRUB=y
CONFIG_XFS_ONLINE_REPAIR=y
CONFIG_XFS_DEBUG=y
CONFIG_XFS_ASSERT_FATAL=y
CONFIG_GFS2_FS=m
CONFIG_GFS2_FS_LOCKING_DLM=y
CONFIG_OCFS2_FS=m
CONFIG_OCFS2_FS_O2CB=m
CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
CONFIG_OCFS2_FS_STATS=y
CONFIG_OCFS2_DEBUG_MASKLOG=y
# CONFIG_OCFS2_DEBUG_FS is not set
CONFIG_BTRFS_FS=m
CONFIG_BTRFS_FS_POSIX_ACL=y
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
# CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
# CONFIG_BTRFS_DEBUG is not set
# CONFIG_BTRFS_ASSERT is not set
# CONFIG_BTRFS_FS_REF_VERIFY is not set
# CONFIG_NILFS2_FS is not set
CONFIG_F2FS_FS=m
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
# CONFIG_F2FS_FS_SECURITY is not set
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_IO_TRACE is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
CONFIG_QUOTA=y
CONFIG_QUOTA_NETLINK_INTERFACE=y
CONFIG_PRINT_QUOTA_WARNING=y
# CONFIG_QUOTA_DEBUG is not set
CONFIG_QUOTA_TREE=y
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
CONFIG_QUOTACTL_COMPAT=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_FSCACHE=m
CONFIG_FSCACHE_STATS=y
# CONFIG_FSCACHE_HISTOGRAM is not set
# CONFIG_FSCACHE_DEBUG is not set
# CONFIG_FSCACHE_OBJECT_LIST is not set
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
# CONFIG_CACHEFILES_HISTOGRAM is not set
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_ECRYPT_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_UBIFS_FS is not set
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
# CONFIG_CRAMFS_MTD is not set
CONFIG_SQUASHFS=m
CONFIG_SQUASHFS_FILE_CACHE=y
# CONFIG_SQUASHFS_FILE_DIRECT is not set
CONFIG_SQUASHFS_DECOMP_SINGLE=y
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
# CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_ZLIB=y
# CONFIG_SQUASHFS_LZ4 is not set
CONFIG_SQUASHFS_LZO=y
CONFIG_SQUASHFS_XZ=y
# CONFIG_SQUASHFS_ZSTD is not set
# CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
# CONFIG_SQUASHFS_EMBEDDED is not set
CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
# CONFIG_VXFS_FS is not set
CONFIG_MINIX_FS=m
# CONFIG_OMFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX6FS_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
# CONFIG_NFS_V2 is not set
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=m
# CONFIG_NFS_SWAP is not set
CONFIG_NFS_V4_1=y
CONFIG_NFS_V4_2=y
CONFIG_PNFS_FILE_LAYOUT=m
CONFIG_PNFS_BLOCK=m
CONFIG_PNFS_FLEXFILE_LAYOUT=m
CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
# CONFIG_NFS_V4_1_MIGRATION is not set
CONFIG_NFS_V4_SECURITY_LABEL=y
CONFIG_ROOT_NFS=y
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DEBUG=y
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
# CONFIG_NFSD_FAULT_INJECTION is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
CONFIG_9P_FS=y
CONFIG_9P_FS_POSIX_ACL=y
# CONFIG_9P_FS_SECURITY is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="utf8"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_MAC_ROMAN=m
CONFIG_NLS_MAC_CELTIC=m
CONFIG_NLS_MAC_CENTEURO=m
CONFIG_NLS_MAC_CROATIAN=m
CONFIG_NLS_MAC_CYRILLIC=m
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
CONFIG_NLS_MAC_INUIT=m
CONFIG_NLS_MAC_ROMANIAN=m
CONFIG_NLS_MAC_TURKISH=m
CONFIG_NLS_UTF8=m
CONFIG_DLM=m
CONFIG_DLM_DEBUG=y
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_COMPAT=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_BIG_KEYS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
# CONFIG_HARDENED_USERCOPY_PAGESPAN is not set
# CONFIG_FORTIFY_SOURCE is not set
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
CONFIG_INTEGRITY_TRUSTED_KEYRING=y
# CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
CONFIG_IMA_LSM_RULES=y
# CONFIG_IMA_TEMPLATE is not set
CONFIG_IMA_NG_TEMPLATE=y
# CONFIG_IMA_SIG_TEMPLATE is not set
CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
CONFIG_IMA_DEFAULT_HASH_SHA1=y
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
CONFIG_IMA_DEFAULT_HASH="sha1"
# CONFIG_IMA_WRITE_POLICY is not set
# CONFIG_IMA_READ_POLICY is not set
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_ARCH_POLICY is not set
# CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
CONFIG_IMA_APPRAISE_BOOTPARAM=y
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
# CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
# CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
# CONFIG_GCC_PLUGIN_STACKLEAK is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_ASYNC_CORE=m
CONFIG_ASYNC_MEMCPY=m
CONFIG_ASYNC_XOR=m
CONFIG_ASYNC_PQ=m
CONFIG_ASYNC_RAID6_RECOV=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=m
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=m
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=m
CONFIG_CRYPTO_GLUE_HELPER_X86=m
CONFIG_CRYPTO_ENGINE=m

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECRDSA is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128L is not set
# CONFIG_CRYPTO_AEGIS256 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
# CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2 is not set
# CONFIG_CRYPTO_AEGIS256_AESNI_SSE2 is not set
# CONFIG_CRYPTO_MORUS640 is not set
# CONFIG_CRYPTO_MORUS640_SSE2 is not set
# CONFIG_CRYPTO_MORUS1280 is not set
# CONFIG_CRYPTO_MORUS1280_SSE2 is not set
# CONFIG_CRYPTO_MORUS1280_AVX2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=y
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=m

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRC32_PCLMUL=m
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD128=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_RMD256=m
CONFIG_CRYPTO_RMD320=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=m
# CONFIG_CRYPTO_SHA3 is not set
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_TGR192=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_X86_64=y
CONFIG_CRYPTO_AES_NI_INTEL=m
CONFIG_CRYPTO_ANUBIS=m
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_ARC4=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
CONFIG_CRYPTO_BLOWFISH_X86_64=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAMELLIA_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=m
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=m
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST5_AVX_X86_64=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_CAST6_AVX_X86_64=m
CONFIG_CRYPTO_DES=m
# CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_SALSA20=m
# CONFIG_CRYPTO_CHACHA20 is not set
# CONFIG_CRYPTO_CHACHA20_X86_64 is not set
CONFIG_CRYPTO_SEED=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX_X86_64=m
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=m
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TEA=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m
CONFIG_CRYPTO_TWOFISH_X86_64=m
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=m
CONFIG_CRYPTO_TWOFISH_AVX_X86_64=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=y
CONFIG_CRYPTO_USER_API_RNG=m
# CONFIG_CRYPTO_USER_API_AEAD is not set
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
CONFIG_CRYPTO_DEV_PADLOCK=m
CONFIG_CRYPTO_DEV_PADLOCK_AES=m
CONFIG_CRYPTO_DEV_PADLOCK_SHA=m
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
CONFIG_CRYPTO_DEV_CCP=y
CONFIG_CRYPTO_DEV_CCP_DD=m
CONFIG_CRYPTO_DEV_SP_CCP=y
CONFIG_CRYPTO_DEV_CCP_CRYPTO=m
CONFIG_CRYPTO_DEV_SP_PSP=y
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
# CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
CONFIG_CRYPTO_DEV_CHELSIO=m
CONFIG_CRYPTO_DEV_VIRTIO=m
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
# CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=m
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC64 is not set
# CONFIG_CRC4 is not set
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=m
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=m
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_BTREE=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=200
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_CHECK_SIGNATURE=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
CONFIG_ARCH_STACKWALK=y
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_BTF is not set
# CONFIG_GDB_SCRIPTS is not set
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_INSTALL is not set
CONFIG_OPTIMIZE_INLINING=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
# CONFIG_PAGE_EXTENSION is not set
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_OWNER is not set
# CONFIG_PAGE_POISONING is not set
# CONFIG_DEBUG_PAGE_REF is not set
CONFIG_DEBUG_RODATA_TEST=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=m
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_CC_HAS_KASAN_GENERIC=y
# CONFIG_KASAN is not set
CONFIG_KASAN_STACK=1
# end of Memory Debugging

CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_DEBUG_SHIRQ=y

#
# Debug Lockups and Hangs
#
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
# end of Debug Lockups and Hangs

CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
CONFIG_WW_MUTEX_SELFTEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=m
CONFIG_RCU_PERF_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_PM_NOTIFIER_ERROR_INJECT=m
# CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_RING_BUFFER_ALLOW_SWAP=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
# CONFIG_PREEMPTIRQ_EVENTS is not set
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
# CONFIG_PROFILE_ALL_BRANCHES is not set
CONFIG_STACK_TRACER=y
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_FUNCTION_PROFILER=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_MMIOTRACE is not set
CONFIG_TRACING_MAP=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_TRACE_EVAL_MAP_FILE is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_SORT is not set
# CONFIG_KPROBES_SANITY_TEST is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_REED_SOLOMON_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_PERCPU_TEST is not set
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_ASYNC_RAID6_TEST is not set
# CONFIG_TEST_HEXDUMP is not set
# CONFIG_TEST_STRING_HELPERS is not set
CONFIG_TEST_STRSCPY=m
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
CONFIG_TEST_BITMAP=m
# CONFIG_TEST_BITFIELD is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
CONFIG_TEST_LKM=m
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_TEST_BPF=m
CONFIG_TEST_BLACKHOLE_DEV=m
# CONFIG_FIND_BIT_BENCHMARK is not set
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=m
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_KMOD=m
# CONFIG_TEST_MEMCAT_P is not set
CONFIG_TEST_LIVEPATCH=m
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_MEMTEST is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_UBSAN_ALIGNMENT=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
# CONFIG_EARLY_PRINTK_USB_XDBC is not set
# CONFIG_X86_PTDUMP is not set
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_WX is not set
CONFIG_DOUBLEFAULT=y
# CONFIG_DEBUG_TLBFLUSH is not set
# CONFIG_IOMMU_DEBUG is not set
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
CONFIG_X86_DECODER_SELFTEST=y
CONFIG_IO_DELAY_0X80=y
# CONFIG_IO_DELAY_0XED is not set
# CONFIG_IO_DELAY_UDELAY is not set
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
# CONFIG_DEBUG_ENTRY is not set
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# CONFIG_UNWINDER_GUESS is not set
# end of Kernel hacking

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='ltp'
	export testcase='ltp'
	export category='functional'
	export need_modules=true
	export need_memory='3G'
	export job_origin='/lkp/lkp/.src-20190829-233528/allot/cyclic:vm-p1:linux-devel:devel-hourly/vm-snb-8G/ltp.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='vm-snb-8G-0fc168167576'
	export tbox_group='vm-snb-8G'
	export nr_vm=64
	export submit_id='5d68c2642eabc149d12bb22b'
	export job_file='/lkp/jobs/scheduled/vm-snb-8G-0fc168167576/ltp-quickhit-debian-x86_64-2018-04-03.cgz-2ad9ab0f742971127f84a5928-20190830-18897-1nsji0w-1.yaml'
	export id='355e936622bf3d6d57c4232013c0f0628edb701d'
	export queuer_version='/lkp-src'
	export arch='x86_64'
	export need_kconfig='CONFIG_BLK_DEV_LOOP
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_VCAN=m
CONFIG_IPV6_VTI=m
CONFIG_MINIX_FS=m
CONFIG_KVM_GUEST=y'
	export commit='2ad9ab0f742971127f84a592802916b68855986a'
	export ssh_base_port=26000
	export kconfig='x86_64-rhel-7.6'
	export compiler='gcc-7'
	export rootfs='debian-x86_64-2018-04-03.cgz'
	export enqueue_time='2019-08-30 14:30:11 +0800'
	export _id='5d68c2732eabc149d12bb22c'
	export _rt='/result/ltp/quickhit/vm-snb-8G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a'
	export user='lkp'
	export head_commit='b6dc409470fa9b5379691be5ee34f60c80b9b4ce'
	export base_commit='a55aa89aab90fae7c815b0551b07be37db359d76'
	export branch='linux-devel/devel-hourly-2019083001'
	export result_root='/result/ltp/quickhit/vm-snb-8G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/3'
	export scheduler_version='/lkp/lkp/.src-20190830-142732'
	export LKP_SERVER='inn'
	export max_uptime=3600
	export initrd='/osimage/debian/debian-x86_64-2018-04-03.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/vm-snb-8G-0fc168167576/ltp-quickhit-debian-x86_64-2018-04-03.cgz-2ad9ab0f742971127f84a5928-20190830-18897-1nsji0w-1.yaml
ARCH=x86_64
kconfig=x86_64-rhel-7.6
branch=linux-devel/devel-hourly-2019083001
commit=2ad9ab0f742971127f84a592802916b68855986a
BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/vmlinuz-5.3.0-rc5-00015-g2ad9ab0f74297
max_uptime=3600
RESULT_ROOT=/result/ltp/quickhit/vm-snb-8G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/3
LKP_SERVER=inn
debug
apic=debug
sysrq_always_enabled
rcupdate.rcu_cpu_stall_timeout=100
net.ifnames=0
printk.devkmsg=on
panic=-1
softlockup_panic=1
nmi_watchdog=panic
oops=panic
load_ramdisk=2
prompt_ramdisk=0
drbd.minor_count=8
systemd.log_level=err
ignore_loglevel
console=tty0
earlyprintk=ttyS0,115200
console=ttyS0,115200
vga=normal
rw'
	export modules_initrd='/pkg/linux/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/modules.cgz'
	export bm_initrd='/osimage/deps/debian-x86_64-2018-04-03.cgz/run-ipconfig_2018-04-03.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/lkp_2019-08-05.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/rsync-rootfs_2018-04-03.cgz,/osimage/deps/debian-x86_64-2018-04-03.cgz/ltp_2019-07-10.cgz,/osimage/pkg/debian-x86_64-2018-04-03.cgz/ltp-x86_64-c2049b5c8_2019-08-23.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export repeat_to=4
	export schedule_notify_address=
	export model='qemu-system-x86_64 -enable-kvm -cpu SandyBridge'
	export nr_cpu=2
	export memory='8G'
	export hdd_partitions='/dev/vda /dev/vdb /dev/vdc /dev/vdd /dev/vde /dev/vdf'
	export swap_partitions='/dev/vdg'
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/vmlinuz-5.3.0-rc5-00015-g2ad9ab0f74297'
	export dequeue_time='2019-08-30 14:30:18 +0800'
	export job_initrd='/lkp/jobs/scheduled/vm-snb-8G-0fc168167576/ltp-quickhit-debian-x86_64-2018-04-03.cgz-2ad9ab0f742971127f84a5928-20190830-18897-1nsji0w-1.cgz'

	[ -n "$LKP_SRC" ] ||
	export LKP_SRC=/lkp/${user:-lkp}/src
}

run_job()
{
	echo $$ > $TMP/run-job.pid

	. $LKP_SRC/lib/http.sh
	. $LKP_SRC/lib/job.sh
	. $LKP_SRC/lib/env.sh

	export_top_env

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='quickhit' $LKP_SRC/tests/wrapper ltp
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	$LKP_SRC/stats/wrapper ltp
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper meminfo

	$LKP_SRC/stats/wrapper time ltp.time
	$LKP_SRC/stats/wrapper dmesg
	$LKP_SRC/stats/wrapper kmsg
	$LKP_SRC/stats/wrapper last_state
	$LKP_SRC/stats/wrapper stderr
	$LKP_SRC/stats/wrapper time
}

"$@"

--AhhlLboLdkugWU4S
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
scRn+wIAAAAABFla

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ltp

2019-08-30 14:31:19 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2019-08-30 14:31:19 ./runltp -f quickhit
INFO: creating /lkp/benchmarks/ltp/output directory
INFO: creating /lkp/benchmarks/ltp/results directory
Checking for required user/group ids

'nobody' user id and group found.
'bin' user id and group found.
'daemon' user id and group found.
Users group found.
Sys group found.
Required users/groups exist.
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

/etc/os-release
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

uname:
Linux vm-snb-8G-0fc168167576 5.3.0-rc5-00015-g2ad9ab0f74297 #1 SMP Fri Aug 30 14:08:41 CST 2019 x86_64 GNU/Linux

/proc/cmdline
ip=::::vm-snb-8G-0fc168167576::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/vm-snb-8G-0fc168167576/ltp-quickhit-debian-x86_64-2018-04-03.cgz-2ad9ab0f742971127f84a5928-20190830-18897-1nsji0w-1.yaml ARCH=x86_64 kconfig=x86_64-rhel-7.6 branch=linux-devel/devel-hourly-2019083001 commit=2ad9ab0f742971127f84a592802916b68855986a BOOT_IMAGE=/pkg/linux/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/vmlinuz-5.3.0-rc5-00015-g2ad9ab0f74297 max_uptime=3600 RESULT_ROOT=/result/ltp/quickhit/vm-snb-8G/debian-x86_64-2018-04-03.cgz/x86_64-rhel-7.6/gcc-7/2ad9ab0f742971127f84a592802916b68855986a/3 LKP_SERVER=inn debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_loglevel console=tty0 earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw rcuperf.shutdown=0

Gnu C                  gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Clang                 
Gnu make               4.1
util-linux             2.29.2
mount                  linux 2.29.2 (libmount 2.29.2: selinux, btrfs, assert, debug)
modutils               23
e2fsprogs              1.43.4
Linux C Library        > libc.2.24
Dynamic linker (ldd)   2.24
Procps                 3.3.12
Net-tools              2.10-alpha
iproute2               iproute2-ss161212
iputils                iputils-s20161105
Kbd                    116:
Sh-utils               8.26
Modules Loaded         intel_rapl_msr intel_rapl_common sr_mod cdrom crct10dif_pclmul sg crc32_pclmul ata_generic pata_acpi crc32c_intel ghash_clmulni_intel bochs_drm drm_vram_helper ttm ppdev drm_kms_helper syscopyarea sysfillrect snd_pcm sysimgblt fb_sys_fops snd_timer drm snd ata_piix aesni_intel crypto_simd libata cryptd glue_helper soundcore joydev pcspkr serio_raw i2c_piix4 floppy parport_pc parport ip_tables

free reports:
              total        used        free      shared  buff/cache   available
Mem:        8149476      257572     5755836       11592     2136068     5644340
Swap:             0           0           0

cpuinfo:
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                2
On-line CPU(s) list:   0,1
Thread(s) per core:    1
Core(s) per socket:    1
Socket(s):             2
NUMA node(s):          1
Vendor ID:             GenuineIntel
CPU family:            6
Model:                 42
Model name:            Intel Xeon E312xx (Sandy Bridge)
Stepping:              1
CPU MHz:               2693.508
BogoMIPS:              5387.01
Hypervisor vendor:     KVM
Virtualization type:   full
L1d cache:             32K
L1i cache:             32K
L2 cache:              4096K
L3 cache:              16384K
NUMA node0 CPU(s):     0,1
Flags:                 fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall nx rdtscp lm constant_tsc rep_good nopl xtopology cpuid tsc_known_freq pni pclmulqdq ssse3 cx16 sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave avx hypervisor lahf_lm cpuid_fault pti xsaveopt arat

AppArmor disabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2168     -n 2168 -p -f /tmp/ltp-uOs3AiQxjS/alltests -l /lkp/benchmarks/ltp/results/LTP_RUN_ON-2019_08_30-14h_31m_19s.log  -C /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2019_08_30-14h_31m_19s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2019_08_30-14h_31m_19s.tconf
Running tests.......
<<<test_start>>>
tag=access01 stime=1567146680
cmdline="access01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
access01.c:243: PASS: access(accessfile_rwx, F_OK) as root
access01.c:243: PASS: access(accessfile_rwx, F_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, W_OK) as root
access01.c:243: PASS: access(accessfile_rwx, W_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, W_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, W_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as root
access01.c:243: PASS: access(accessfile_rwx, R_OK|W_OK|X_OK) as nobody
access01.c:243: PASS: access(accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessfile_r, R_OK) as nobody
access01.c:263: PASS: access(accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_r, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK|X_OK) as root: EACCES
access01.c:263: PASS: access(accessfile_w, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, W_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessfile_x, R_OK|W_OK|X_OK) as nobody: EACCES
access01.c:243: PASS: access(accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessfile_r, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessfile_w, R_OK|W_OK) as root
access01.c:243: PASS: access(accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessfile_x, R_OK|W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_r/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_w/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_x/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_x/accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessdir_rw/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_rw/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_rx/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_rx/accessfile_x, X_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_r, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_r, R_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_r, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_w, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_w, W_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_x, F_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, F_OK) as nobody
access01.c:243: PASS: access(accessdir_wx/accessfile_x, R_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, W_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, X_OK) as root
access01.c:243: PASS: access(accessdir_wx/accessfile_x, X_OK) as nobody
access01.c:263: PASS: access(accessdir_r/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_r/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_w/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_x/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, F_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rw/accessfile_x, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_rx/accessfile_x, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, W_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_r, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, X_OK) as root: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_w, X_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_x, R_OK) as nobody: EACCES
access01.c:263: PASS: access(accessdir_wx/accessfile_x, W_OK) as nobody: EACCES

Summary:
passed   199
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=access03 stime=1567146680
cmdline="access03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
access03.c:47: PASS: access(0xffffffffffffffff, F_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, F_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, R_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, R_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, W_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, W_OK) as nobody: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, X_OK) as root: EFAULT
access03.c:47: PASS: access(0xffffffffffffffff, X_OK) as nobody: EFAULT

Summary:
passed   8
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=alarm02 stime=1567146680
cmdline="alarm02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
alarm02.c:62: PASS: alarm(2147483647) returned 2147483647 as expected for value INT_MAX
alarm02.c:62: PASS: alarm(2147483647) returned 2147483647 as expected for value UINT_MAX/2
alarm02.c:62: PASS: alarm(1073741823) returned 1073741823 as expected for value UINT_MAX/4

Summary:
passed   3
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=alarm03 stime=1567146680
cmdline="alarm03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
alarm03.c:50: PASS: alarm(100), fork, alarm(0) parent's alarm returned 100
alarm03.c:37: PASS: alarm(100), fork, alarm(0) child's alarm returned 0

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=brk01 stime=1567146680
cmdline="brk01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
brk01.c:55: PASS: brk() works fine

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chdir02 stime=1567146680
cmdline="chdir02"
contacts=""
analysis=exit
<<<test_output>>>
chdir02     1  TPASS  :  chdir(/) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chmod02 stime=1567146680
cmdline="chmod02"
contacts=""
analysis=exit
<<<test_output>>>
chmod02     1  TPASS  :  chmod(test_file, 0) returned 0
chmod02     2  TPASS  :  chmod(test_file, 07) returned 0
chmod02     3  TPASS  :  chmod(test_file, 070) returned 0
chmod02     4  TPASS  :  chmod(test_file, 0700) returned 0
chmod02     5  TPASS  :  chmod(test_file, 0777) returned 0
chmod02     6  TPASS  :  chmod(test_file, 02777) returned 0
chmod02     7  TPASS  :  chmod(test_file, 04777) returned 0
chmod02     8  TPASS  :  chmod(test_file, 06777) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chown01 stime=1567146680
cmdline="chown01"
contacts=""
analysis=exit
<<<test_output>>>
chown01     1  TPASS  :  chown(t_2434, 0,0) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=close08 stime=1567146680
cmdline="close08"
contacts=""
analysis=exit
<<<test_output>>>
close08     1  TPASS  :  close(tfile_2435) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup01 stime=1567146680
cmdline="dup01"
contacts=""
analysis=exit
<<<test_output>>>
dup01       1  TPASS  :  dup(dupfile) returned 8
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup02 stime=1567146680
cmdline="dup02"
contacts=""
analysis=exit
<<<test_output>>>
dup02       1  TPASS  :  dup failed as expected with EBADF
dup02       2  TPASS  :  dup failed as expected with EBADF
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup03 stime=1567146680
cmdline="dup03"
contacts=""
analysis=exit
<<<test_output>>>
dup03       1  TPASS  :  dup failed as expected with EMFILE
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup04 stime=1567146680
cmdline="dup04"
contacts=""
analysis=exit
<<<test_output>>>
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=dup05 stime=1567146680
cmdline="dup05"
contacts=""
analysis=exit
<<<test_output>>>
dup05       1  TPASS  :  dup returned 8
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execl01 stime=1567146680
cmdline="execl01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execl01_child.c:20: PASS: execl01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execle01 stime=1567146680
cmdline="execle01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execle01_child.c:34: PASS: execle01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execlp01 stime=1567146680
cmdline="execlp01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execlp01_child.c:20: PASS: execlp01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execv01 stime=1567146680
cmdline="execv01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execv01_child.c:23: PASS: execv01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=execve01 stime=1567146680
cmdline="execve01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execve01_child.c:34: PASS: execve01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=execvp01 stime=1567146680
cmdline="execvp01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
execvp01_child.c:20: PASS: execvp01_child executed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=f00f stime=1567146680
cmdline="f00f"
contacts=""
analysis=exit
<<<test_output>>>
f00f        1  TCONF  :  f00f.c:78: f00f bug test only for i386
f00f        2  TCONF  :  f00f.c:78: Remaining cases not appropriate for configuration
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fchmod01 stime=1567146680
cmdline="fchmod01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fchmod01.c:42: PASS: Functionality of fchmod(7, 0) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 07) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 070) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 0700) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 0777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 02777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 04777) successful
fchmod01.c:42: PASS: Functionality of fchmod(7, 06777) successful

Summary:
passed   8
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fchown01 stime=1567146680
cmdline="fchown01"
contacts=""
analysis=exit
<<<test_output>>>
fchown01    1  TPASS  :  fchown(fd, geteuid(), getegid()) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl02 stime=1567146680
cmdline="fcntl02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 0) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 1) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 2) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 3) returned 8
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 10) returned 10
fcntl02.c:42: PASS: fcntl(fcntl02_2464, F_DUPFD, 100) returned 100

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl03 stime=1567146680
cmdline="fcntl03"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl03.c:33: PASS: fcntl(fcntl03_2466, F_GETFD, 0) returned 0

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl04 stime=1567146680
cmdline="fcntl04"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fcntl04.c:39: PASS: fcntl(fcntl04_2468, F_GETFL, 0) returned 8002

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl05 stime=1567146680
cmdline="fcntl05"
contacts=""
analysis=exit
<<<test_output>>>
fcntl05     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl07 stime=1567146680
cmdline="fcntl07"
contacts=""
analysis=exit
<<<test_output>>>
fcntl07     1  TPASS  :  regular file CLOEXEC fd was closed after exec()
fcntl07     2  TPASS  :  pipe (write end) CLOEXEC fd was closed after exec()
fcntl07     3  TPASS  :  pipe (read end) CLOEXEC fd was closed after exec()
fcntl07     4  TPASS  :  fifo CLOEXEC fd was closed after exec()
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl08 stime=1567146680
cmdline="fcntl08"
contacts=""
analysis=exit
<<<test_output>>>
fcntl08     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl09 stime=1567146680
cmdline="fcntl09"
contacts=""
analysis=exit
<<<test_output>>>
fcntl09     1  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_WRLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_UNLCK returned 0
fcntl09     1  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_RDLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_2476, F_SETLK, &flocks) flocks.l_type = F_UNLCK returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fcntl10 stime=1567146680
cmdline="fcntl10"
contacts=""
analysis=exit
<<<test_output>>>
fcntl10     1  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_WRLCK returned 0
fcntl10     2  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_UNLCK returned 0
fcntl10     1  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_RDLCK returned 0
fcntl10     2  TPASS  :  fcntl(tfile_2478, F_SETLKW, &flocks) flocks.l_type = F_UNLCK returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork01 stime=1567146680
cmdline="fork01"
contacts=""
analysis=exit
<<<test_output>>>
fork01      1  TPASS  :  fork() returned 2480
fork01      2  TPASS  :  child pid and fork() return agree: 2480
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork04 stime=1567146680
cmdline="fork04"
contacts=""
analysis=exit
<<<test_output>>>
fork04      1  TPASS  :  Env var TERM unchanged after fork(): vt220
fork04      2  TPASS  :  Env var NoTSetzWq unchanged after fork(): getenv() does not find variable set
fork04      3  TPASS  :  Env var TESTPROG unchanged after fork(): FRKTCS04
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fork05 stime=1567146680
cmdline="fork05"
contacts=""
analysis=exit
<<<test_output>>>
fork05      0  TINFO  :  %fs test only for ix86
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fpathconf01 stime=1567146680
cmdline="fpathconf01"
contacts=""
analysis=exit
<<<test_output>>>
fpathconf01    1  TPASS  :  fpathconf(fd, _PC_MAX_CANON) returned 255
fpathconf01    2  TPASS  :  fpathconf(fd, _PC_MAX_INPUT) returned 255
fpathconf01    3  TPASS  :  fpathconf(fd, _PC_VDISABLE) returned 0
fpathconf01    4  TPASS  :  fpathconf(fd, _PC_LINK_MAX) returned 127
fpathconf01    5  TPASS  :  fpathconf(fd, _PC_NAME_MAX) returned 255
fpathconf01    6  TPASS  :  fpathconf(fd, _PC_PATH_MAX) returned 4096
fpathconf01    7  TPASS  :  fpathconf(fd, _PC_PIPE_BUF) returned 4096
fpathconf01    8  TPASS  :  fpathconf(fd, _PC_CHOWN_RESTRICTED) returned 1
fpathconf01    9  TPASS  :  fpathconf(fd, _PC_NO_TRUNC) returned 1
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fstatfs01 stime=1567146680
cmdline="fstatfs01"
contacts=""
analysis=exit
<<<test_output>>>
fstatfs01    1  TPASS  :  fstatfs() on a file - f_type=1021994
fstatfs01    2  TPASS  :  fstatfs() on a pipe - f_type=50495045
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=fsync01 stime=1567146680
cmdline="fsync01"
contacts=""
analysis=exit
<<<test_output>>>
tst_device.c:238: INFO: Using test device LTP_DEV='/dev/loop0'
tst_supported_fs_types.c:60: INFO: Kernel supports ext2
tst_supported_fs_types.c:44: INFO: mkfs.ext2 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext3
tst_supported_fs_types.c:44: INFO: mkfs.ext3 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports ext4
tst_supported_fs_types.c:44: INFO: mkfs.ext4 does exist
tst_supported_fs_types.c:60: INFO: Kernel supports xfs
tst_supported_fs_types.c:44: INFO: mkfs.xfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports btrfs
tst_supported_fs_types.c:44: INFO: mkfs.btrfs does exist
tst_supported_fs_types.c:60: INFO: Kernel supports vfat
tst_supported_fs_types.c:44: INFO: mkfs.vfat does exist
tst_supported_fs_types.c:92: INFO: FUSE does support exfat
tst_supported_fs_types.c:44: INFO: mkfs.exfat does exist
tst_supported_fs_types.c:92: INFO: FUSE does support ntfs
tst_supported_fs_types.c:44: INFO: mkfs.ntfs does exist
tst_test.c:1169: INFO: Testing on ext2
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext2 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext3 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on ext4
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with ext4 opts='' extra opts=''
mke2fs 1.43.4 (31-Jan-2017)
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on btrfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with btrfs opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on vfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with vfat opts='' extra opts=''
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
fsync01.c:30: PASS: fsync() returned 0
tst_test.c:1169: INFO: Testing on exfat
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with exfat opts='' extra opts=''
safe_macros.c:739: INFO: Trying FUSE...
fuse: mount failed: Invalid argument
FUSE exfat 1.3.0
safe_macros.c:748: BROK: mount.exfat failed with 256

Summary:
passed   60
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=2 corefile=no
cutime=7 cstime=13
<<<test_end>>>
<<<test_start>>>
tag=getegid01 stime=1567146681
cmdline="getegid01"
contacts=""
analysis=exit
<<<test_output>>>
getegid01    1  TPASS  :  getegid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=geteuid01 stime=1567146681
cmdline="geteuid01"
contacts=""
analysis=exit
<<<test_output>>>
geteuid01    1  TPASS  :  geteuid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getgid01 stime=1567146681
cmdline="getgid01"
contacts=""
analysis=exit
<<<test_output>>>
getgid01    1  TPASS  :  getgid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=getgroups01 stime=1567146681
cmdline="getgroups01"
contacts=""
analysis=exit
<<<test_output>>>
getgroups01    1  TPASS  :  getgroups failed as expected with EINVAL
getgroups01    2  TPASS  :  getgroups did not modify the gidset array
getgroups01    3  TPASS  :  getgroups failed as expected with EINVAL
getgroups01    4  TPASS  :  getgroups(NGROUPS,gidset) returned 3 contains gid 0 (from getgid)
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=gethostid01 stime=1567146681
cmdline="gethostid01"
contacts=""
analysis=exit
<<<test_output>>>
gethostid01    1  TPASS  :  Hostid command and gethostid both report hostid is 007f0100
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=gethostname01 stime=1567146681
cmdline="gethostname01"
contacts=""
analysis=exit
<<<test_output>>>
gethostname01    1  TPASS  :  gethostname returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getpgrp01 stime=1567146681
cmdline="getpgrp01"
contacts=""
analysis=exit
<<<test_output>>>
getpgrp01    1  TPASS  :  getpgrp returned 2635
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getpid01 stime=1567146681
cmdline="getpid01"
contacts=""
analysis=exit
<<<test_output>>>
getpid01    1  TPASS  :  getpid returned 2636
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getppid01 stime=1567146681
cmdline="getppid01"
contacts=""
analysis=exit
<<<test_output>>>
getppid01    1  TPASS  :  getppid returned 2315
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=getuid01 stime=1567146681
cmdline="getuid01"
contacts=""
analysis=exit
<<<test_output>>>
getuid01    1  TPASS  :  getuid returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=kill02 stime=1567146681
cmdline="kill02"
contacts=""
analysis=exit
<<<test_output>>>
kill02      1  TPASS  :  The signal was sent to all processes in the process group.
kill02      2  TPASS  :  The signal was not sent to selective processes that were not in the process group.
<<<execution_status>>>
initiation_status="ok"
duration=10 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=2
<<<test_end>>>
<<<test_start>>>
tag=kill09 stime=1567146691
cmdline="kill09"
contacts=""
analysis=exit
<<<test_output>>>
kill09      1  TPASS  :  kill(2678, SIGKILL) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link02 stime=1567146691
cmdline="link02"
contacts=""
analysis=exit
<<<test_output>>>
link02      1  TPASS  :  link(oldpath,newpath) returned 0 and link counts match
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link03 stime=1567146691
cmdline="link03"
contacts=""
analysis=exit
<<<test_output>>>
link03      1  TPASS  :  link() passed and linkcounts=10 match
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link04 stime=1567146691
cmdline="link04"
contacts=""
analysis=exit
<<<test_output>>>
link04      1  TPASS  :  link(<non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      2  TPASS  :  link(<path is empty string>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      3  TPASS  :  link(<path contains a non-existent file>, <nefile>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      4  TPASS  :  link(<path contains a regular file>, <nefile>): TEST_ERRNO=ENOTDIR(20): Not a directory
link04      5  TPASS  :  link(<pathname too long>, <nefile>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
link04      6  TPASS  :  link(<invalid address>, <nefile>): TEST_ERRNO=EFAULT(14): Bad address
link04      7  TPASS  :  link(<regfile>, <empty string>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      8  TPASS  :  link(<regfile>, <path contains a non-existent file>): TEST_ERRNO=ENOENT(2): No such file or directory
link04      9  TPASS  :  link(<regfile>, <path contains a regular file>): TEST_ERRNO=ENOENT(2): No such file or directory
link04     10  TPASS  :  link(<regfile>, <pathname too long>): TEST_ERRNO=ENAMETOOLONG(36): File name too long
link04     11  TPASS  :  link(<regfile>, <invalid address>): TEST_ERRNO=EFAULT(14): Bad address
link04     12  TPASS  :  link(<regfile>, <regfile2>): TEST_ERRNO=EEXIST(17): File exists
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link05 stime=1567146691
cmdline="link05"
contacts=""
analysis=exit
<<<test_output>>>
link05      1  TPASS  :  link(lkfile_2682, lkfile_2682[1-1000]) ret 0 for 1000 files,stat linkcounts match 1000
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek01 stime=1567146691
cmdline="lseek01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek01.c:67: PASS: lseek(tfile, 4, SEEK_SET) read correct data
lseek01.c:67: PASS: lseek(tfile, -2, SEEK_CUR) read correct data
lseek01.c:67: PASS: lseek(tfile, -4, SEEK_END) read correct data
lseek01.c:67: PASS: lseek(tfile, 0, SEEK_END) read correct data

Summary:
passed   4
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek02 stime=1567146691
cmdline="lseek02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek02.c:65: PASS: lseek(-1, 1, 0) failed as expected: EBADF
lseek02.c:65: PASS: lseek(-1, 1, 1) failed as expected: EBADF
lseek02.c:65: PASS: lseek(-1, 1, 2) failed as expected: EBADF
lseek02.c:65: PASS: lseek(7, 1, 5) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(7, 1, -1) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(7, 1, 7) failed as expected: EINVAL
lseek02.c:65: PASS: lseek(8, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(8, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(8, 1, 2) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(9, 1, 2) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 0) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 1) failed as expected: ESPIPE
lseek02.c:65: PASS: lseek(11, 1, 2) failed as expected: ESPIPE

Summary:
passed   15
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek07 stime=1567146691
cmdline="lseek07"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek07.c:70: PASS: lseek(tfile1, 7, SEEK_SET) wrote correct data abcdefgijk
lseek07.c:70: PASS: lseek(tfile2, 2, SEEK_SET) wrote correct data abijkfg

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lseek11 stime=1567146691
cmdline="lseek11"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lseek11.c:162: INFO: The block size is 4096
lseek11.c:212: PASS: The 0th test passed: SEEK_DATA from startblock 0 offset 0
lseek11.c:212: PASS: The 1th test passed: SEEK_DATA from startblock 0 offset 4
lseek11.c:212: PASS: The 2th test passed: SEEK_HOLE from startblock 0 offset 0
lseek11.c:212: PASS: The 3th test passed: SEEK_HOLE from startblock 0 offset 4
lseek11.c:212: PASS: The 4th test passed: SEEK_HOLE from startblock 1 offset 0
lseek11.c:212: PASS: The 5th test passed: SEEK_HOLE from startblock 1 offset 128
lseek11.c:212: PASS: The 6th test passed: SEEK_DATA from startblock 1 offset 0
lseek11.c:212: PASS: The 7th test passed: SEEK_DATA from startblock 10 offset -1
lseek11.c:212: PASS: The 8th test passed: SEEK_DATA from startblock 10 offset 0
lseek11.c:212: PASS: The 9th test passed: SEEK_DATA from startblock 10 offset 4
lseek11.c:212: PASS: The 10th test passed: SEEK_HOLE from startblock 10 offset 0
lseek11.c:212: PASS: The 11th test passed: SEEK_HOLE from startblock 10 offset 4
lseek11.c:212: PASS: The 12th test passed: SEEK_HOLE from startblock 11 offset 128
lseek11.c:212: PASS: The 13th test passed: SEEK_DATA from startblock 11 offset 128
lseek11.c:212: PASS: The 14th test passed: SEEK_HOLE from startblock 30 offset -128

Summary:
passed   15
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=lstat02 stime=1567146691
cmdline="lstat02"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
lstat02.c:72: PASS: lstat() failed as expected: EACCES
lstat02.c:72: PASS: lstat() failed as expected: ENOENT
lstat02.c:72: PASS: lstat() failed as expected: EFAULT
lstat02.c:72: PASS: lstat() failed as expected: ENAMETOOLONG
lstat02.c:72: PASS: lstat() failed as expected: ENOTDIR
lstat02.c:72: PASS: lstat() failed as expected: ELOOP

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=qmm01 stime=1567146691
cmdline="mmap001 -m 1"
contacts=""
analysis=exit
<<<test_output>>>
mmap001     0  TINFO  :  mmap()ing file of 1 pages or 4096 bytes
mmap001     1  TPASS  :  mmap() completed successfully.
mmap001     0  TINFO  :  touching mmaped memory
mmap001     2  TPASS  :  we're still here, mmaped area must be good
mmap001     3  TPASS  :  synchronizing mmapped page passed
mmap001     4  TPASS  :  munmapping testfile.2693 successful
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=open03 stime=1567146691
cmdline="open03"
contacts=""
analysis=exit
<<<test_output>>>
open03      1  TPASS  :  open(tfile_2694, O_RDWR|O_CREAT,0700) returned 7
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=pathconf01 stime=1567146691
cmdline="pathconf01"
contacts=""
analysis=exit
<<<test_output>>>
pathconf01    1  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_LINK_MAX) returned 127
pathconf01    2  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_NAME_MAX) returned 255
pathconf01    3  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_PATH_MAX) returned 4096
pathconf01    4  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_PIPE_BUF) returned 4096
pathconf01    5  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_CHOWN_RESTRICTED) returned 1
pathconf01    6  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, _PC_NO_TRUNC) returned 1
pathconf01    7  TPASS  :  pathconf(/tmp/ltp-uOs3AiQxjS/pati6IHBl, (null)) returned 127
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=pause01 stime=1567146691
cmdline="pause01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
pause01.c:24: PASS: pause() interrupted with EINTR

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=read01 stime=1567146691
cmdline="read01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
read01.c:24: PASS: read(2) returned 512

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readdir01 stime=1567146691
cmdline="readdir01"
contacts=""
analysis=exit
<<<test_output>>>
readdir01    1  TPASS  :  found all 10 that were created
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readlink01 stime=1567146691
cmdline="readlink01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
readlink01.c:64: INFO: Running test as root
readlink01.c:46: PASS: readlink() functionality on 'slink_file' was correct
readlink01.c:55: INFO: Running test as nobody
readlink01.c:46: PASS: readlink() functionality on 'slink_file' was correct

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rename02 stime=1567146691
cmdline="rename02"
contacts=""
analysis=exit
<<<test_output>>>
rename02    1  TPASS  :  rename(./tfile_2705, ./rnfile_2705) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sbrk01 stime=1567146691
cmdline="sbrk01"
contacts=""
analysis=exit
<<<test_output>>>
sbrk01      1  TPASS  :  sbrk - Increase by 8192 bytes returned 0x561c55ca9000
sbrk01      2  TPASS  :  sbrk - Increase by -8192 bytes returned 0x561c55cab000
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select01 stime=1567146691
cmdline="select01"
contacts=""
analysis=exit
<<<test_output>>>
select01    1  TPASS  :  select(4, &Readfds, 0, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select02 stime=1567146691
cmdline="select02"
contacts=""
analysis=exit
<<<test_output>>>
select02    1  TPASS  :  select(5, &Readfds, &Writefds, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select03 stime=1567146691
cmdline="select03"
contacts=""
analysis=exit
<<<test_output>>>
select03    1  TPASS  :  select(5, &Readfds, &Writefds, 0, &timeout) timeout = 0 usecs
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=select04 stime=1567146691
cmdline="select04"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:66: INFO: Testing libc select()
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1070us, max 1165us, median 1086us, trunc mean 1086.85us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2063us, max 2163us, median 2086us, trunc mean 2085.80us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5023us, max 6950us, median 5087us, trunc mean 5080.59us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10023us, max 13191us, median 10092us, trunc mean 10083.97us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25037us, max 25125us, median 25093us, trunc mean 25089.46us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100147us, max 100188us, median 100152us, trunc mean 100154.89us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1001053us, max 1001054us, median 1001053us, trunc mean 1001053.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:69: INFO: Testing SYS_select syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1032us, max 3463us, median 1088us, trunc mean 1085.77us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2066us, max 2909us, median 2090us, trunc mean 2088.88us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5027us, max 7132us, median 5091us, trunc mean 5083.71us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10020us, max 11097us, median 10065us, trunc mean 10069.60us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25019us, max 25875us, median 25077us, trunc mean 25075.98us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100050us, max 100140us, median 100129us, trunc mean 100121.56us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1000608us, max 1001979us, median 1000608us, trunc mean 1000608.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:72: INFO: Testing SYS_pselect6 syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 1032us, max 7062us, median 1113us, trunc mean 1278.90us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 2000us 500 iterations, threshold 450.01us
tst_timer_test.c:307: INFO: min 2019us, max 9798us, median 2118us, trunc mean 2393.83us (discarded 25)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 5000us 300 iterations, threshold 450.04us
tst_timer_test.c:307: INFO: min 5029us, max 10059us, median 5092us, trunc mean 5322.80us (discarded 15)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 10000us 100 iterations, threshold 450.33us
tst_timer_test.c:307: INFO: min 10023us, max 11715us, median 10099us, trunc mean 10290.46us (discarded 5)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 25000us 50 iterations, threshold 451.29us
tst_timer_test.c:307: INFO: min 25077us, max 27248us, median 25095us, trunc mean 25163.85us (discarded 2)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 100000us 10 iterations, threshold 537.00us
tst_timer_test.c:307: INFO: min 100150us, max 100244us, median 100181us, trunc mean 100179.22us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_timer_test.c:264: INFO: select() sleeping for 1000000us 2 iterations, threshold 4400.00us
tst_timer_test.c:307: INFO: min 1000666us, max 1001053us, median 1000666us, trunc mean 1000666.00us (discarded 1)
tst_timer_test.c:322: PASS: Measured times are within thresholds
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
tst_timer_test.c:345: INFO: CLOCK_MONOTONIC resolution 1ns
tst_timer_test.c:357: INFO: prctl(PR_GET_TIMERSLACK) = 50us
select_var.h:75: INFO: Testing SYS__newselect syscall
tst_timer_test.c:264: INFO: select() sleeping for 1000us 500 iterations, threshold 450.01us
select_var.h:54: CONF: __NR__newselect not implemented

Summary:
passed   21
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=26 termination_type=exited termination_id=0 corefile=no
cutime=4 cstime=6
<<<test_end>>>
<<<test_start>>>
tag=setgid01 stime=1567146717
cmdline="setgid01"
contacts=""
analysis=exit
<<<test_output>>>
setgid01    1  TPASS  :  setgid(0) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setpgid01 stime=1567146717
cmdline="setpgid01"
contacts=""
analysis=exit
<<<test_output>>>
setpgid01    1  TPASS  :  test setpgid(2797, 2797) success
setpgid01    2  TPASS  :  test setpgid(0, 0) success
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setpgrp01 stime=1567146717
cmdline="setpgrp01"
contacts=""
analysis=exit
<<<test_output>>>
setpgrp01    1  TPASS  :  setpgrp -  Call the setpgrp system call returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setregid01 stime=1567146717
cmdline="setregid01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
setregid01.c:49: PASS: Dont change either real or effective gid
setregid01.c:49: PASS: Change effective to effective gid
setregid01.c:49: PASS: Change real to real gid
setregid01.c:49: PASS: Change effective to real gid
setregid01.c:49: PASS: Try to change real to current real

Summary:
passed   5
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setreuid01 stime=1567146717
cmdline="setreuid01"
contacts=""
analysis=exit
<<<test_output>>>
setreuid01    1  TPASS  :  setreuid -  Don't change either real or effective uid returned 0
setreuid01    2  TPASS  :  setreuid -  change effective to effective uid returned 0
setreuid01    3  TPASS  :  setreuid -  change real to real uid returned 0
setreuid01    4  TPASS  :  setreuid -  change effective to real uid returned 0
setreuid01    5  TPASS  :  setreuid -  try to change real to current real returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=setuid01 stime=1567146717
cmdline="setuid01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
setuid01.c:30: PASS: setuid(0) successfully

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sighold02 stime=1567146717
cmdline="sighold02"
contacts=""
analysis=exit
<<<test_output>>>
sighold02    1  TPASS  :  All signals were hold
sighold02    0  TINFO  :  Child process returned TPASS
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=signal03 stime=1567146717
cmdline="signal03"
contacts=""
analysis=exit
<<<test_output>>>
signal03    1  TPASS  :  signal03 call succeeded
signal03    2  TPASS  :  signal03 call succeeded
signal03    3  TPASS  :  signal03 call succeeded
signal03    4  TPASS  :  signal03 call succeeded
signal03    5  TPASS  :  signal03 call succeeded
signal03    6  TPASS  :  signal03 call succeeded
signal03    7  TPASS  :  signal03 call succeeded
signal03    8  TPASS  :  signal03 call succeeded
signal03    9  TPASS  :  signal03 call succeeded
signal03   10  TPASS  :  signal03 call succeeded
signal03   11  TPASS  :  signal03 call succeeded
signal03   12  TPASS  :  signal03 call succeeded
signal03   13  TPASS  :  signal03 call succeeded
signal03   14  TPASS  :  signal03 call succeeded
signal03   15  TPASS  :  signal03 call succeeded
signal03   16  TPASS  :  signal03 call succeeded
signal03   17  TPASS  :  signal03 call succeeded
signal03   18  TPASS  :  signal03 call succeeded
signal03   19  TPASS  :  signal03 call succeeded
signal03   20  TPASS  :  signal03 call succeeded
signal03   21  TPASS  :  signal03 call succeeded
signal03   22  TPASS  :  signal03 call succeeded
signal03   23  TPASS  :  signal03 call succeeded
signal03   24  TPASS  :  signal03 call succeeded
signal03   25  TPASS  :  signal03 call succeeded
signal03   26  TPASS  :  signal03 call succeeded
signal03   27  TPASS  :  signal03 call succeeded
signal03   28  TPASS  :  signal03 call succeeded
signal03   29  TPASS  :  signal03 call succeeded
signal03   30  TPASS  :  signal03 call succeeded
signal03   31  TPASS  :  signal03 call succeeded
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sigrelse01 stime=1567146717
cmdline="sigrelse01"
contacts=""
analysis=exit
<<<test_output>>>
sigrelse01    1  TPASS  :  sigrelse() released all 55 signals under test.
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=statfs01 stime=1567146717
cmdline="statfs01"
contacts=""
analysis=exit
<<<test_output>>>
statfs01    1  TPASS  :  statfs(tfile_2811, ..) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=statvfs01 stime=1567146717
cmdline="statvfs01"
contacts=""
analysis=exit
<<<test_output>>>
statvfs01    1  TPASS  :  statvfs(/, ...) passed
statvfs01    0  TINFO  :  This call is similar to statfs
statvfs01    0  TINFO  :  Extracting info about the '/' file system
statvfs01    0  TINFO  :  file system block size = 4096 bytes
statvfs01    0  TINFO  :  file system fragment size = 4096 bytes
statvfs01    0  TINFO  :  file system free blocks = 0
statvfs01    0  TINFO  :  file system total inodes = 0
statvfs01    0  TINFO  :  file system free inodes = 0
statvfs01    0  TINFO  :  file system id = 0
statvfs01    0  TINFO  :  file system max filename length = 255
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=sync01 stime=1567146717
cmdline="sync01"
contacts=""
analysis=exit
<<<test_output>>>
sync01      1  TPASS  :  sync() returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=time01 stime=1567146717
cmdline="time01"
contacts=""
analysis=exit
<<<test_output>>>
time01      1  TPASS  :  time(0) returned 1567146717
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=times01 stime=1567146717
cmdline="times01"
contacts=""
analysis=exit
<<<test_output>>>
times01     1  TPASS  :  times(&mytimes) returned 429473644
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=ulimit01 stime=1567146717
cmdline="ulimit01"
contacts=""
analysis=exit
<<<test_output>>>
ulimit01    1  TPASS  :  ulimit(1, -1) returned 9223372036854775807
ulimit01    2  TPASS  :  ulimit(2, 9223372036854775807) returned 9223372036854775807
ulimit01    3  TPASS  :  ulimit(2, 9223372036854775806) returned 9223372036854775807
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=umask01 stime=1567146717
cmdline="umask01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
umask01.c:57: PASS: All files created with correct mode

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=uname01 stime=1567146717
cmdline="uname01"
contacts=""
analysis=exit
<<<test_output>>>
uname01     1  TPASS  :  uname(&un) returned 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink05 stime=1567146717
cmdline="unlink05"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink05.c:61: PASS: unlink(file) succeeded
unlink05.c:61: PASS: unlink(fifo) succeeded

Summary:
passed   2
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink07 stime=1567146717
cmdline="unlink07"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink07.c:51: PASS: unlink(<non-existent file>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<path is empty string>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<path contains a non-existent file>) failed as expected: ENOENT
unlink07.c:51: PASS: unlink(<invalid address>) failed as expected: EFAULT
unlink07.c:51: PASS: unlink(<path contains a regular file>) failed as expected: ENOTDIR
unlink07.c:51: PASS: unlink(<pathname too long>) failed as expected: ENAMETOOLONG

Summary:
passed   6
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink08 stime=1567146717
cmdline="unlink08"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
unlink08.c:48: PASS: unlink(<unwritable directory>) failed as expected: EACCES
unlink08.c:48: PASS: unlink(<unsearchable directory>) failed as expected: EACCES
unlink08.c:48: PASS: unlink(<directory>) failed as expected: EISDIR
unlink08.c:48: PASS: unlink(<directory>) failed as expected: EISDIR

Summary:
passed   4
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=wait02 stime=1567146717
cmdline="wait02"
contacts=""
analysis=exit
<<<test_output>>>
wait02      1  TPASS  :  wait(&status) returned 2830
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=write01 stime=1567146718
cmdline="write01"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
write01.c:40: PASS: write() passed

Summary:
passed   1
failed   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=4
<<<test_end>>>
<<<test_start>>>
tag=symlink01 stime=1567146718
cmdline="symlink01"
contacts=""
analysis=exit
<<<test_output>>>
symlink01    1  TPASS  :  Creation of symbolic link file to no object file is ok
symlink01    2  TPASS  :  Creation of symbolic link file to no object file is ok
symlink01    3  TPASS  :  Creation of symbolic link file and object file via symbolic link is ok
symlink01    4  TPASS  :  Creating an existing symbolic link file error is caught
symlink01    5  TPASS  :  Creating a symbolic link which exceeds maximum pathname error is caught
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=symlink02 stime=1567146718
cmdline="symlink02"
contacts=""
analysis=exit
<<<test_output>>>
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=readlink01A stime=1567146718
cmdline="symlink01 -T readlink01"
contacts=""
analysis=exit
<<<test_output>>>
readlink01    1  TPASS  :  Reading of symbolic link file contents checks out ok
readlink01    2  TPASS  :  Reading of symbolic link file contents checks out ok
readlink01    3  TPASS  :  Reading a symbolic link which exceeds maximum pathname error is caught
readlink01    4  TPASS  :  Reading a nonsymbolic link file error condition is caught.  EINVAL is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=1 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=stat04 stime=1567146718
cmdline="symlink01 -T stat04"
contacts=""
analysis=exit
<<<test_output>>>
stat04      1  TPASS  :  Getting stat info about object file through symbolic link file is ok
stat04      2  TPASS  :  Stat(2) error when accessing non-existent object through symbolic link is caught
stat04      3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=lstat01A stime=1567146718
cmdline="symlink01 -T lstat01"
contacts=""
analysis=exit
<<<test_output>>>
lstat01     1  TPASS  :  lstat(2) of symbolic link file which points to no object file is ok
lstat01     2  TPASS  :  lstat(2) of symbolic link file which points at an object file is ok
lstat01     3  TPASS  :  lstat(2) of object file returns object file inode information
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=mkdir05A stime=1567146718
cmdline="symlink01 -T mkdir05"
contacts=""
analysis=exit
<<<test_output>>>
mkdir05     1  TPASS  :  mkdir(2) of object file through symbolic link file failed as expected
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rmdir03A stime=1567146718
cmdline="symlink01 -T rmdir03"
contacts=""
analysis=exit
<<<test_output>>>
rmdir03     1  TPASS  :  rmdir(2) of object file through symbolic link file failed as expected
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chdir01A stime=1567146718
cmdline="symlink01 -T chdir01"
contacts=""
analysis=exit
<<<test_output>>>
chdir01     1  TPASS  :  chdir(2) to object file location through symbolic link file is ok
chdir01     2  TPASS  :  chdir(2) to non-existent object file location through symbolic link file failed as expected
chdir01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=link01 stime=1567146718
cmdline="symlink01 -T link01"
contacts=""
analysis=exit
<<<test_output>>>
link01      1  TPASS  :  link(2) to a symbolic link, which is pointing to an existing object file worked - file created and link count adjusted
link01      2  TPASS  :  link(2) to a symbolic link, which is pointing to a non-existing object file worked ok - file created and link count adjusted.
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=unlink01 stime=1567146718
cmdline="symlink01 -T unlink01"
contacts=""
analysis=exit
<<<test_output>>>
unlink01    1  TPASS  :  unlink(2) of symbolic link file with no object file removal is ok
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=chmod01A stime=1567146718
cmdline="symlink01 -T chmod01"
contacts=""
analysis=exit
<<<test_output>>>
chmod01     1  TPASS  :  chmod(2) of object file permissions through symbolic link file is ok
chmod01     2  TPASS  :  chmod(2) error when accessing non-existent object through symbolic link is caught
chmod01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=utime01A stime=1567146718
cmdline="symlink01 -T utime01"
contacts=""
analysis=exit
<<<test_output>>>
utime01     1  TPASS  :  utime(2) change of object file access and modify times through symbolic link file is ok
utime01     2  TPASS  :  utime(2) error when accessing non-existent object through symbolic link is caught
utime01     3  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
<<<test_start>>>
tag=rename01A stime=1567146718
cmdline="symlink01 -T rename01"
contacts=""
analysis=exit
<<<test_output>>>
rename01    1  TPASS  :  rename(3) of symbolic link file name which points at no object file is ok
rename01    2  TPASS  :  rename(3) of symbolic link file name which points at object file is ok
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=open01A stime=1567146718
cmdline="symlink01 -T open01"
contacts=""
analysis=exit
<<<test_output>>>
open01      1  TPASS  :  open(2) with (O_CREAT | O_RDWR) to create object file through symbolic link file and all writes, reads, and lseeks are ok
open01      2  TPASS  :  open(2) with O_RDWR of existing  object file through symbolic link file and all writes, reads, and lseeks are ok
open01      3  TPASS  :  open(2) with (O_CREAT | O_EXCL) error  is caught when creating object file through symbolic link file
open01      4  TPASS  :  open(2) error with O_RDWR is caught when processing symbolic link file which points at no object file
open01      5  TPASS  :  Nested symbolic link access condition caught.  ELOOP is returned
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=0 cstime=0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20190517-204-gc2049b5c8

       ###############################################################

            Done executing testcases.
            LTP Version:  20190517-204-gc2049b5c8
       ###############################################################


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--AhhlLboLdkugWU4S--
