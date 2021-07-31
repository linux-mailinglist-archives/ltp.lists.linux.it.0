Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 956473DC432
	for <lists+linux-ltp@lfdr.de>; Sat, 31 Jul 2021 08:58:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 162A23C60AB
	for <lists+linux-ltp@lfdr.de>; Sat, 31 Jul 2021 08:58:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C39D13C57B9
 for <ltp@lists.linux.it>; Sat, 31 Jul 2021 08:58:01 +0200 (CEST)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 237E8600E56
 for <ltp@lists.linux.it>; Sat, 31 Jul 2021 08:57:52 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="212939366"
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
 d="xz'?yaml'?scan'208";a="212939366"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 23:57:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
 d="xz'?yaml'?scan'208";a="508571887"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.41])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 23:57:42 -0700
Date: Sat, 31 Jul 2021 15:15:56 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Eric Biggers <ebiggers@google.com>
Message-ID: <20210731071556.GD18773@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [f2fs]  9f6a5d4177: ltp.ADSP042.fail
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
Cc: lkp@intel.com, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, lkp@lists.01.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ltp@lists.linux.it
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 9f6a5d4177019d66e24ab542a3fd28b78bd379a6 ("f2fs: rework write preal=
locations")
https://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs.git dev-test


in testcase: ltp
version: ltp-x86_64-14c1f76-1_20210724
with following parameters:

	disk: 1HDD
	fs: f2fs
	test: ltp-aiodio.part2
	ucode: 0x21

test-description: The LTP testsuite contains a collection of tools for test=
ing the Linux kernel and related features.
test-url: http://linux-test-project.github.io/


on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GH=
z with 8G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>

2021-07-29 11:44:50 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2021-07-29 11:44:50 ./runltp -f ltp-aiodio.part2 -d /fs/sdb1/tmpdir
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
PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"10"
VERSION=3D"10 (buster)"
VERSION_CODENAME=3Dbuster
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

uname:
Linux lkp-ivb-d05 5.14.0-rc1-00014-g9f6a5d417701 #1 SMP Thu Jul 29 17:25:14=
 CST 2021 x86_64 GNU/Linux

/proc/cmdline
ip=3D::::lkp-ivb-d05::dhcp root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sche=
duled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=3D0x21-debian-10.4-x=
86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-85975-=
1sj1wy-5.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8.3 branch=3Df2fs/dev-tes=
t commit=3D9f6a5d4177019d66e24ab542a3fd28b78bd379a6 BOOT_IMAGE=3D/pkg/linux=
/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.1=
4.0-rc1-00014-g9f6a5d417701 max_uptime=3D2100 RESULT_ROOT=3D/result/ltp/1HD=
D-f2fs-ltp-aiodio.part2-ucode=3D0x21/lkp-ivb-d05/debian-10.4-x86_64-2020060=
3.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/3 LKP_=
SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Ddebug sysrq_a=
lways_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.d=
evkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpan=
ic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_lev=
el=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=
=3DttyS0,115200 vga=3Dnormal rw

Gnu C                  gcc (Debian 8.3.0-6) 8.3.0
Clang                =20
Gnu make               4.2.1
util-linux             2.33.1
mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs=
, namespaces, assert, debug)
modutils               26
e2fsprogs              1.44.5
Linux C Library        > libc.2.28
Dynamic linker (ldd)   2.28
Procps                 3.3.15
Net-tools              2.10-alpha
iproute2               iproute2-ss190107
iputils                iputils-s20180629
ethtool                4.19
Kbd                    119:
Sh-utils               8.30
Modules Loaded         dm_mod f2fs crc32_generic netconsole btrfs blake2b_g=
eneric xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg i915 intel_gtt=
 intel_rapl_msr intel_rapl_common ttm x86_pkg_temp_thermal intel_powerclamp=
 coretemp crct10dif_pclmul crc32_pclmul crc32c_intel drm_kms_helper ghash_c=
lmulni_intel ahci rapl libahci syscopyarea sysfillrect sysimgblt intel_csta=
te fb_sys_fops mei_me usb_storage intel_uncore ipmi_devintf ipmi_msghandler=
 drm libata mei video ip_tables

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8015872      352832     5032652       13356     2630388     493=
3272
Swap:             0           0           0

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       36 bits physical, 48 bits virtual
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               58
Model name:          Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
Stepping:            9
CPU MHz:             3300.000
CPU max MHz:         3300.0000
CPU min MHz:         1600.0000
BogoMIPS:            6584.73
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            3072K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall n=
x rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl est tm2 ssse3 =
cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt tsc_deadline_timer xsave avx f16c =
lahf_lm cpuid_fault epb pti ssbd ibrs ibpb stibp fsgsbase smep erms xsaveop=
t dtherm arat pln pts md_clear flush_l1d

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2566     -n 2566 -=
p -f /fs/sdb1/tmpdir/ltp-XrbgPg14q1/alltests -l /lkp/benchmarks/ltp/results=
/LTP_RUN_ON-2021_07_29-11h_44m_50s.log  -C /lkp/benchmarks/ltp/output/LTP_R=
UN_ON-2021_07_29-11h_44m_50s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_O=
N-2021_07_29-11h_44m_50s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_07_29-11h_44m_50s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_07_29-11h_4=
4m_50s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_07_29-11h_44=
m_50s.tconf
Running tests.......
<<<test_start>>>
tag=3DADSP000 stime=3D1627559090
cmdline=3D"aiodio_sparse"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D14 cstime=3D29
<<<test_end>>>
<<<test_start>>>
tag=3DADSP001 stime=3D1627559092
cmdline=3D"aiodio_sparse -s 180k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP002 stime=3D1627559093
cmdline=3D"aiodio_sparse -dd -s 1751k -w 11k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 2706 has opened 'aiodio_sparse' for reading
Child 2706 loop 0
Child 2706 loop 1
Child 2706 loop 2
Child 2706 loop 3
Child 2706 loop 4
Child 2706 loop 5
Child 2706 loop 6
Child 2706 loop 7
Child 2706 loop 8
Child 2706 loop 9
Child 2706 loop 10
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  io_submit() returned 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_Child 2706 loop 11
sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP003 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 9 -d -s 180k -w 18k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 2711 has opened 'aiodio_sparse' for reading
Child 2711 loop 0
Child 2711 loop 1
Child 2711 loop 2
Child 2711 loop 3
Child 2711 loop 4
Child 2711 loop 5
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 55296
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  io_submit() returned 9
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7fff656a2210 filesize=
 184320 inflight 9
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 18432 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TFAIL  :  aiodio_sparse.c:309: 1 children(s) exited abn=
ormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP004 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 2k -w 2k -s 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 2048
non-zero read at offset 2048
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TFAIL  :  aiodio_sparse.c:309: 2 children(s) exited abn=
ormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP005 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 4k -w 4k -s 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP006 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 4k -w 4k -s 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP007 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 8k -s 32k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP008 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16k -s 64k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP009 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 32k -s 128k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP010 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 64k -s 256k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP011 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 128k -s 512k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP012 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 256k -s 1024k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP013 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 512k -s 2048k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP014 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP015 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 2048k -s 8192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP016 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP017 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 8192k -s 32768k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D6
<<<test_end>>>
<<<test_start>>>
tag=3DADSP018 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3DADSP019 stime=3D1627559096
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 4"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D12
<<<test_end>>>
<<<test_start>>>
tag=3DADSP020 stime=3D1627559097
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D14
<<<test_end>>>
<<<test_start>>>
tag=3DADSP021 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 128k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP022 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 256k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP023 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 512k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP024 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP025 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 2048k -s 8192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP026 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D5
<<<test_end>>>
<<<test_start>>>
tag=3DADSP027 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 72768k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D16
<<<test_end>>>
<<<test_start>>>
tag=3DADSP028 stime=3D1627559101
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D12 cstime=3D73
<<<test_end>>>
<<<test_start>>>
tag=3DADSP029 stime=3D1627559106
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 65536k -s 262144k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D32 cstime=3D52
<<<test_end>>>
<<<test_start>>>
tag=3DADSP030 stime=3D1627559109
cmdline=3D"aiodio_sparse -i 6 -a 8k -w 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D15 cstime=3D19
<<<test_end>>>
<<<test_start>>>
tag=3DADSP031 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 8 -a 8k -w 128k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP032 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 16 -a 8k -w 256k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP033 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 32 -a 8k -w 512k -s 16384k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D8 cstime=3D6
<<<test_end>>>
<<<test_start>>>
tag=3DADSP034 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 64 -a 8k -w 1024k -s 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D21 cstime=3D22
<<<test_end>>>
<<<test_start>>>
tag=3DADSP035 stime=3D1627559113
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 32"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP036 stime=3D1627559113
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D41 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3DADSP037 stime=3D1627559114
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 72768k -n 128"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D260 cstime=3D73
<<<test_end>>>
<<<test_start>>>
tag=3DADSP038 stime=3D1627559116
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -n 512"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D8 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2148 cstime=3D535
<<<test_end>>>
<<<test_start>>>
tag=3DADSP039 stime=3D1627559124
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -n 1000"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D20 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5953 cstime=3D1488
<<<test_end>>>
<<<test_start>>>
tag=3DADSP040 stime=3D1627559144
cmdline=3D"dio_sparse"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[0] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 0
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D2 cstime=3D27
<<<test_end>>>
<<<test_start>>>
tag=3DADSP041 stime=3D1627559145
cmdline=3D"dio_sparse -s 180k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP042 stime=3D1627559145
cmdline=3D"dio_sparse -dd -s 1751k -w 11k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 4750 has opened 'dio_sparse' for reading
Child 4750 loop 0
non zero buffer at buf[3072] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 11264
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP043 stime=3D1627559146
cmdline=3D"dio_sparse  -d -s 180k -w 18k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 4752 has opened 'dio_sparse' for reading
Child 4752 loop 0
Child 4752 loop 1
Child 4752 loop 2
Child 4752 loop 3
Child 4752 loop 4
Child 4752 loop 5
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 92160
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP044 stime=3D1627559146
cmdline=3D"dio_sparse  -a 2k -w 2k -s 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[0] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 0
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP045 stime=3D1627559146
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP046 stime=3D1627559146
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP047 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 16k -s 16k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP048 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 32k -s 32k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP049 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 64k -s 64k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP050 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 128k -s 128k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP051 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP052 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP053 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP054 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 2048k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP055 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 4096k -s 4096k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP056 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP057 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 18192k -s 18192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP058 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D24 cstime=3D84
<<<test_end>>>
<<<test_start>>>
tag=3DADSP059 stime=3D1627559153
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 4"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP060 stime=3D1627559154
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP061 stime=3D1627559154
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP062 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP063 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP064 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP065 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP066 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP067 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 18192k -s 18192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D4
<<<test_end>>>
<<<test_start>>>
tag=3DADSP068 stime=3D1627559156
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D13 cstime=3D71
<<<test_end>>>
<<<test_start>>>
tag=3DADSP069 stime=3D1627559161
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3DADSP070 stime=3D1627559162
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D45 cstime=3D86
<<<test_end>>>
<<<test_start>>>
tag=3DADSP071 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP072 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP073 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP074 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP075 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 4096k -s 4096k -n 32"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP076 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D44 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3DADSP077 stime=3D1627559169
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 18192k -n 128"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D8 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1757 cstime=3D397
<<<test_end>>>
<<<test_start>>>
tag=3DADSP078 stime=3D1627559177
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 512"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D32 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D9129 cstime=3D2153
<<<test_end>>>
<<<test_start>>>
tag=3DADSP079 stime=3D1627559209
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 1000"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D66 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19295 cstime=3D4735
<<<test_end>>>
<<<test_start>>>
tag=3DADSP080 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -o 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP081 stime=3D1627559275
cmdline=3D"dio_sparse  -a 2k -w 2k -s 1k -o 1k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP082 stime=3D1627559275
cmdline=3D"dio_sparse  -a 1k -w 1k -s 512 -o 512 -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP083 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -o 3k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP084 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP085 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 6k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP086 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP087 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 16k -s 8k -o 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20210524-202-gc7f979b3d

       ###############################################################

            Done executing testcases.
            LTP Version:  20210524-202-gc7f979b3d
       ###############################################################




To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install                job.yaml  # job file is attached in =
this email
        bin/lkp split-job --compatible job.yaml  # generate the yaml file f=
or lkp run
        bin/lkp run                    generated-yaml-file



---
0DAY/LKP+ Test Infrastructure                   Open Source Technology Cent=
er
https://lists.01.org/hyperkitty/list/lkp@lists.01.org       Intel Corporati=
on

Thanks,
Oliver Sang


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.14.0-rc1-00014-g9f6a5d417701"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.14.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-9 (Debian 9.3.0-22) 9.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=90300
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23502
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23502
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
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
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_TIME_KUNIT_TEST=m

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

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# CONFIG_BPF_PRELOAD is not set
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
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
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
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
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
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
# CONFIG_CGROUP_MISC is not set
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
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
CONFIG_RD_ZSTD=y
# CONFIG_BOOT_CONFIG is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
# CONFIG_EXPERT is not set
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
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
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_USERFAULTFD=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
CONFIG_SLUB_DEBUG=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
CONFIG_SLUB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
# CONFIG_SLAB_FREELIST_HARDENED is not set
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
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
CONFIG_ARCH_HAS_FILTER_PGPROT=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_AUDIT_ARCH=y
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
CONFIG_X86_MPPARSE=y
# CONFIG_GOLDFISH is not set
CONFIG_RETPOLINE=y
# CONFIG_X86_CPU_RESCTRL is not set
CONFIG_X86_EXTENDED_PLATFORM=y
# CONFIG_X86_NUMACHIP is not set
# CONFIG_X86_VSMP is not set
CONFIG_X86_UV=y
# CONFIG_X86_GOLDFISH is not set
# CONFIG_X86_INTEL_MID is not set
CONFIG_X86_INTEL_LPSS=y
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_PARAVIRT_DEBUG is not set
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
# CONFIG_XEN_PV is not set
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
CONFIG_XEN_PVHVM_GUEST=y
CONFIG_XEN_SAVE_RESTORE=y
# CONFIG_XEN_DEBUG_FS is not set
# CONFIG_XEN_PVH is not set
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
# CONFIG_PVH is not set
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
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_CPU_SUP_INTEL=y
CONFIG_CPU_SUP_AMD=y
CONFIG_CPU_SUP_HYGON=y
CONFIG_CPU_SUP_CENTAUR=y
CONFIG_CPU_SUP_ZHAOXIN=y
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_DMI=y
# CONFIG_GART_IOMMU is not set
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

#
# Performance monitoring
#
CONFIG_PERF_EVENTS_INTEL_UNCORE=m
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# CONFIG_PERF_EVENTS_AMD_POWER is not set
# end of Performance monitoring

CONFIG_X86_16BIT=y
CONFIG_X86_ESPFIX64=y
CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
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
# CONFIG_AMD_MEM_ENCRYPT is not set
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
CONFIG_X86_64_ACPI_NUMA=y
CONFIG_NUMA_EMU=y
CONFIG_NODES_SHIFT=10
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
# CONFIG_ARCH_MEMORY_PROBE is not set
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_PMEM_LEGACY_DEVICE=y
CONFIG_X86_PMEM_LEGACY=m
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
# CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
CONFIG_MTRR=y
CONFIG_MTRR_SANITIZER=y
CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=1
CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=1
CONFIG_X86_PAT=y
CONFIG_ARCH_USES_PG_UNCACHED=y
CONFIG_ARCH_RANDOM=y
CONFIG_X86_SMAP=y
CONFIG_X86_UMIP=y
CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=y
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
# CONFIG_X86_SGX is not set
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
CONFIG_HZ_1000=y
CONFIG_HZ=1000
CONFIG_SCHED_HRTICK=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
# CONFIG_KEXEC_SIG is not set
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
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y

#
# Power management and ACPI options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_SUSPEND=y
CONFIG_SUSPEND_FREEZER=y
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_PM_TEST_SUSPEND is not set
CONFIG_PM_SLEEP_DEBUG=y
# CONFIG_PM_TRACE_RTC is not set
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
# CONFIG_ACPI_FPDT is not set
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
CONFIG_ACPI_EC_DEBUGFS=m
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
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
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_PCI_SLOT=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
CONFIG_ACPI_SBS=m
CONFIG_ACPI_HED=y
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
CONFIG_ACPI_NFIT=m
# CONFIG_NFIT_SECURITY_DEBUG is not set
CONFIG_ACPI_NUMA=y
# CONFIG_ACPI_HMAT is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
CONFIG_ACPI_APEI=y
CONFIG_ACPI_APEI_GHES=y
CONFIG_ACPI_APEI_PCIEAER=y
CONFIG_ACPI_APEI_MEMORY_FAILURE=y
CONFIG_ACPI_APEI_EINJ=m
# CONFIG_ACPI_APEI_ERST_DEBUG is not set
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_PRMT=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
# CONFIG_X86_PCC_CPUFREQ is not set
CONFIG_X86_ACPI_CPUFREQ=m
CONFIG_X86_ACPI_CPUFREQ_CPB=y
CONFIG_X86_POWERNOW_K8=m
# CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
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
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
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

#
# Firmware Drivers
#
CONFIG_EDD=m
# CONFIG_EDD_OFF is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_DMIID=y
CONFIG_DMI_SYSFS=y
CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y
# CONFIG_ISCSI_IBFT is not set
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
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
# CONFIG_EFI_BOOTLOADER_CONTROL is not set
# CONFIG_EFI_CAPSULE_LOADER is not set
# CONFIG_EFI_TEST is not set
CONFIG_APPLE_PROPERTIES=y
# CONFIG_RESET_ATTACK_MITIGATION is not set
# CONFIG_EFI_RCI2_TABLE is not set
# CONFIG_EFI_DISABLE_PCI_DMA is not set
# end of EFI (Extensible Firmware Interface) Support

CONFIG_UEFI_CPER=y
CONFIG_UEFI_CPER_X86=y
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y

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
CONFIG_KVM_XFER_TO_GUEST_WORK=y
CONFIG_HAVE_KVM_PM_NOTIFIER=y
CONFIG_VIRTUALIZATION=y
CONFIG_KVM=m
CONFIG_KVM_INTEL=m
# CONFIG_KVM_AMD is not set
# CONFIG_KVM_XEN is not set
CONFIG_KVM_MMU_AUDIT=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
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
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING=y
CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_COMPAT_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
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
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLK_SCSI_REQUEST=y
CONFIG_BLK_CGROUP_RWSTAT=y
CONFIG_BLK_DEV_BSG=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=m
CONFIG_BLK_DEV_ZONED=y
CONFIG_BLK_DEV_THROTTLING=y
# CONFIG_BLK_DEV_THROTTLING_LOW is not set
# CONFIG_BLK_CMDLINE_PARSER is not set
CONFIG_BLK_WBT=y
CONFIG_BLK_WBT_MQ=y
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_FC_APPID is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
# CONFIG_BLK_CGROUP_IOPRIO is not set
CONFIG_BLK_DEBUG_FS=y
CONFIG_BLK_DEBUG_FS_ZONED=y
# CONFIG_BLK_SED_OPAL is not set
# CONFIG_BLK_INLINE_ENCRYPTION is not set

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
CONFIG_BLK_MQ_RDMA=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_DEADLINE_CGROUP=y
CONFIG_MQ_IOSCHED_KYBER=y
CONFIG_IOSCHED_BFQ=y
CONFIG_BFQ_GROUP_IOSCHED=y
# CONFIG_BFQ_CGROUP_DEBUG is not set
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
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
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
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_HAVE_BOOTMEM_INFO_NODE=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG=y
CONFIG_MEMORY_HOTPLUG_SPARSE=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTREMOVE=y
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
CONFIG_BALLOON_COMPACTION=y
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
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
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
# CONFIG_MEM_SOFT_DIRTY is not set
CONFIG_ZSWAP=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
# CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
# CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
# CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
# CONFIG_ZSWAP_DEFAULT_ON is not set
CONFIG_ZPOOL=y
CONFIG_ZBUD=y
# CONFIG_Z3FOLD is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y
CONFIG_GENERIC_EARLY_IOREMAP=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ZONE_DMA=y
CONFIG_ZONE_DMA32=y
CONFIG_ZONE_DEVICE=y
CONFIG_DEV_PAGEMAP_OPS=y
CONFIG_HMM_MIRROR=y
CONFIG_DEVICE_PRIVATE=y
CONFIG_VMAP_PFN=y
CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
CONFIG_ARCH_HAS_PKEYS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set
# CONFIG_READ_ONLY_THP_FOR_FS is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_SECRETMEM=y
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
CONFIG_TLS=m
CONFIG_TLS_DEVICE=y
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
CONFIG_XFRM_USER=y
# CONFIG_XFRM_USER_COMPAT is not set
# CONFIG_XFRM_INTERFACE is not set
CONFIG_XFRM_SUB_POLICY=y
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=m
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
# CONFIG_XDP_SOCKETS_DIAG is not set
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
# CONFIG_NET_FOU is not set
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_ESP_OFFLOAD=m
# CONFIG_INET_ESPINTCP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=m
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
CONFIG_TCP_CONG_BIC=m
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
CONFIG_TCP_CONG_HTCP=m
CONFIG_TCP_CONG_HSTCP=m
CONFIG_TCP_CONG_HYBLA=m
CONFIG_TCP_CONG_VEGAS=m
CONFIG_TCP_CONG_NV=m
CONFIG_TCP_CONG_SCALABLE=m
CONFIG_TCP_CONG_LP=m
CONFIG_TCP_CONG_VENO=m
CONFIG_TCP_CONG_YEAH=m
CONFIG_TCP_CONG_ILLINOIS=m
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
CONFIG_TCP_CONG_BBR=m
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
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
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
CONFIG_IPV6_MULTIPLE_TABLES=y
# CONFIG_IPV6_SUBTREES is not set
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
CONFIG_IPV6_PIMSM_V2=y
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
# CONFIG_IPV6_SEG6_HMAC is not set
# CONFIG_IPV6_RPL_LWTUNNEL is not set
CONFIG_NETLABEL=y
# CONFIG_MPTCP is not set
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
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
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
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
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
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
CONFIG_NFT_COUNTER=m
CONFIG_NFT_CONNLIMIT=m
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
CONFIG_NFT_REDIR=m
CONFIG_NFT_NAT=m
# CONFIG_NFT_TUNNEL is not set
CONFIG_NFT_OBJREF=m
CONFIG_NFT_QUEUE=m
CONFIG_NFT_QUOTA=m
CONFIG_NFT_REJECT=m
CONFIG_NFT_REJECT_INET=m
CONFIG_NFT_COMPAT=m
CONFIG_NFT_HASH=m
CONFIG_NFT_FIB=m
CONFIG_NFT_FIB_INET=m
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
# CONFIG_NFT_OSF is not set
# CONFIG_NFT_TPROXY is not set
# CONFIG_NFT_SYNPROXY is not set
CONFIG_NF_DUP_NETDEV=m
CONFIG_NFT_DUP_NETDEV=m
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NFT_FIB_NETDEV=m
# CONFIG_NFT_REJECT_NETDEV is not set
# CONFIG_NF_FLOW_TABLE is not set
CONFIG_NETFILTER_XTABLES=y
CONFIG_NETFILTER_XTABLES_COMPAT=y

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
# CONFIG_NETFILTER_XT_TARGET_LED is not set
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
# CONFIG_NETFILTER_XT_MATCH_L2TP is not set
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
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
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
# CONFIG_NETFILTER_XT_MATCH_U32 is not set
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
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
CONFIG_IP_VS_LBLC=m
CONFIG_IP_VS_LBLCR=m
CONFIG_IP_VS_DH=m
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
CONFIG_IP_VS_NQ=m
# CONFIG_IP_VS_TWOS is not set

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
CONFIG_NF_TABLES_IPV4=y
CONFIG_NFT_REJECT_IPV4=m
CONFIG_NFT_DUP_IPV4=m
CONFIG_NFT_FIB_IPV4=m
CONFIG_NF_TABLES_ARP=y
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=m
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
# CONFIG_IP_NF_TARGET_CLUSTERIP is not set
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
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
CONFIG_NFT_FIB_IPV6=m
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
# CONFIG_IP6_NF_TARGET_HL is not set
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
CONFIG_NF_TABLES_BRIDGE=m
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NFT_BRIDGE_REJECT=m
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
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
# CONFIG_TIPC_MEDIA_IB is not set
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
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
# CONFIG_BRIDGE_MRP is not set
# CONFIG_BRIDGE_CFM is not set
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
# CONFIG_6LOWPAN_NHC is not set
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
CONFIG_NET_SCH_FQ_CODEL=y
# CONFIG_NET_SCH_CAKE is not set
CONFIG_NET_SCH_FQ=m
CONFIG_NET_SCH_HHF=m
CONFIG_NET_SCH_PIE=m
# CONFIG_NET_SCH_FQ_PIE is not set
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_SCH_PLUG=m
# CONFIG_NET_SCH_ETS is not set
CONFIG_NET_SCH_DEFAULT=y
# CONFIG_DEFAULT_FQ is not set
# CONFIG_DEFAULT_CODEL is not set
CONFIG_DEFAULT_FQ_CODEL=y
# CONFIG_DEFAULT_SFQ is not set
# CONFIG_DEFAULT_PFIFO_FAST is not set
CONFIG_DEFAULT_NET_SCH="fq_codel"

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
# CONFIG_NET_ACT_IPT is not set
CONFIG_NET_ACT_NAT=m
CONFIG_NET_ACT_PEDIT=m
CONFIG_NET_ACT_SIMP=m
CONFIG_NET_ACT_SKBEDIT=m
CONFIG_NET_ACT_CSUM=m
# CONFIG_NET_ACT_MPLS is not set
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
# CONFIG_NET_ACT_CONNMARK is not set
# CONFIG_NET_ACT_CTINFO is not set
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=m
# CONFIG_NET_ACT_GATE is not set
# CONFIG_NET_TC_SKB_EXT is not set
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_OPENVSWITCH_GRE=m
CONFIG_VSOCKETS=m
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=m
CONFIG_VMWARE_VMCI_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS=m
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_HYPERV_VSOCKETS=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
CONFIG_MPLS_IPTUNNEL=m
CONFIG_NET_NSH=y
# CONFIG_HSR is not set
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
# CONFIG_NET_NCSI is not set
CONFIG_PCPU_DEV_REFCNT=y
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
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
# CONFIG_CAN_J1939 is not set
# CONFIG_CAN_ISOTP is not set

#
# CAN Device Drivers
#
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_SLCAN=m
CONFIG_CAN_DEV=m
CONFIG_CAN_CALC_BITTIMING=y
# CONFIG_CAN_KVASER_PCIEFD is not set
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
CONFIG_CAN_EMS_PCI=m
# CONFIG_CAN_F81601 is not set
CONFIG_CAN_KVASER_PCI=m
CONFIG_CAN_PEAK_PCI=m
CONFIG_CAN_PEAK_PCIEC=y
CONFIG_CAN_PLX_PCI=m
# CONFIG_CAN_SJA1000_ISA is not set
CONFIG_CAN_SJA1000_PLATFORM=m
CONFIG_CAN_SOFTING=m

#
# CAN SPI interfaces
#
# CONFIG_CAN_HI311X is not set
# CONFIG_CAN_MCP251X is not set
# CONFIG_CAN_MCP251XFD is not set
# end of CAN SPI interfaces

#
# CAN USB interfaces
#
# CONFIG_CAN_8DEV_USB is not set
# CONFIG_CAN_EMS_USB is not set
# CONFIG_CAN_ESD_USB2 is not set
# CONFIG_CAN_ETAS_ES58X is not set
# CONFIG_CAN_GS_USB is not set
# CONFIG_CAN_KVASER_USB is not set
# CONFIG_CAN_MCBA_USB is not set
# CONFIG_CAN_PEAK_USB is not set
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
CONFIG_BT_HIDP=m
CONFIG_BT_HS=y
CONFIG_BT_LE=y
# CONFIG_BT_6LOWPAN is not set
# CONFIG_BT_LEDS is not set
# CONFIG_BT_MSFTEXT is not set
# CONFIG_BT_AOSPEXT is not set
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
# CONFIG_BT_HCIBTUSB is not set
# CONFIG_BT_HCIBTSDIO is not set
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_H4=y
CONFIG_BT_HCIUART_BCSP=y
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_INTEL is not set
# CONFIG_BT_HCIUART_AG6XX is not set
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
# CONFIG_BT_MRVL_SDIO is not set
# CONFIG_BT_MTKSDIO is not set
# CONFIG_BT_VIRTIO is not set
# end of Bluetooth device drivers

# CONFIG_AF_RXRPC is not set
# CONFIG_AF_KCM is not set
CONFIG_STREAM_PARSER=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_CFG80211=m
# CONFIG_NL80211_TESTMODE is not set
# CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
CONFIG_CFG80211_WEXT=y
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
CONFIG_RFKILL=m
CONFIG_RFKILL_LEDS=y
CONFIG_RFKILL_INPUT=y
# CONFIG_RFKILL_GPIO is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
# CONFIG_NET_9P_XEN is not set
# CONFIG_NET_9P_RDMA is not set
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
CONFIG_SOCK_VALIDATE_XMIT=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

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
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PME=y
CONFIG_PCIE_DPC=y
# CONFIG_PCIE_PTM is not set
# CONFIG_PCIE_EDR is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
CONFIG_PCI_STUB=y
CONFIG_PCI_PF_STUB=m
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
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCI_MESON is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
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

# CONFIG_CXL_BUS is not set
# CONFIG_PCCARD is not set
# CONFIG_RAPIDIO is not set

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
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
CONFIG_FW_CACHE=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_PM_QOS_KUNIT_TEST=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPI=m
CONFIG_DMA_SHARED_BUFFER=y
# CONFIG_DMA_FENCE_TRACE is not set
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y
# CONFIG_GNSS is not set
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=m
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_SERIAL=m
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_AX88796 is not set
CONFIG_PARPORT_1284=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=y
# CONFIG_BLK_DEV_FD is not set
CONFIG_CDROM=m
# CONFIG_PARIDE is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_ZRAM is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
# CONFIG_BLK_DEV_CRYPTOLOOP is not set
# CONFIG_BLK_DEV_DRBD is not set
CONFIG_BLK_DEV_NBD=m
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=m
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=16384
CONFIG_CDROM_PKTCDVD=m
CONFIG_CDROM_PKTCDVD_BUFFERS=8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set
# CONFIG_ATA_OVER_ETH is not set
CONFIG_XEN_BLKDEV_FRONTEND=m
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_RBD=m
# CONFIG_BLK_DEV_RSXX is not set

#
# NVME Support
#
CONFIG_NVME_CORE=m
CONFIG_BLK_DEV_NVME=m
CONFIG_NVME_MULTIPATH=y
# CONFIG_NVME_HWMON is not set
CONFIG_NVME_FABRICS=m
# CONFIG_NVME_RDMA is not set
CONFIG_NVME_FC=m
# CONFIG_NVME_TCP is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_PASSTHRU is not set
CONFIG_NVME_TARGET_LOOP=m
# CONFIG_NVME_TARGET_RDMA is not set
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
# CONFIG_DW_XDATA_PCIE is not set
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
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
# CONFIG_GENWQE is not set
# CONFIG_ECHO is not set
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
# CONFIG_UACCE is not set
CONFIG_PVPANIC=y
# CONFIG_PVPANIC_MMIO is not set
# CONFIG_PVPANIC_PCI is not set
# end of Misc devices

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
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_SCSI_ESAS2R is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_MPT3SAS=m
CONFIG_SCSI_MPT2SAS_MAX_SGE=128
CONFIG_SCSI_MPT3SAS_MAX_SGE=128
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPI3MR is not set
# CONFIG_SCSI_SMARTPQI is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_MYRB is not set
# CONFIG_SCSI_MYRS is not set
# CONFIG_VMWARE_PVSCSI is not set
# CONFIG_XEN_SCSI_FRONTEND is not set
CONFIG_HYPERV_STORAGE=m
# CONFIG_LIBFC is not set
# CONFIG_SCSI_SNIC is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FDOMAIN_PCI is not set
CONFIG_SCSI_ISCI=m
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_STEX is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_EFCT is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_AM53C974 is not set
# CONFIG_SCSI_WD719X is not set
CONFIG_SCSI_DEBUG=m
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_VIRTIO is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=y
CONFIG_SCSI_DH_HP_SW=y
CONFIG_SCSI_DH_EMC=y
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=m
CONFIG_SATA_HOST=y
CONFIG_PATA_TIMINGS=y
CONFIG_ATA_VERBOSE_ERROR=y
CONFIG_ATA_FORCE=y
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
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
CONFIG_ATA_SFF=y

#
# SFF controllers with custom DMA interface
#
# CONFIG_PDC_ADMA is not set
# CONFIG_SATA_QSTOR is not set
# CONFIG_SATA_SX4 is not set
CONFIG_ATA_BMDMA=y

#
# SATA SFF controllers with BMDMA
#
CONFIG_ATA_PIIX=m
# CONFIG_SATA_DWC is not set
# CONFIG_SATA_MV is not set
# CONFIG_SATA_NV is not set
# CONFIG_SATA_PROMISE is not set
# CONFIG_SATA_SIL is not set
# CONFIG_SATA_SIS is not set
# CONFIG_SATA_SVW is not set
# CONFIG_SATA_ULI is not set
# CONFIG_SATA_VIA is not set
# CONFIG_SATA_VITESSE is not set

#
# PATA SFF controllers with BMDMA
#
# CONFIG_PATA_ALI is not set
# CONFIG_PATA_AMD is not set
# CONFIG_PATA_ARTOP is not set
# CONFIG_PATA_ATIIXP is not set
# CONFIG_PATA_ATP867X is not set
# CONFIG_PATA_CMD64X is not set
# CONFIG_PATA_CYPRESS is not set
# CONFIG_PATA_EFAR is not set
# CONFIG_PATA_HPT366 is not set
# CONFIG_PATA_HPT37X is not set
# CONFIG_PATA_HPT3X2N is not set
# CONFIG_PATA_HPT3X3 is not set
# CONFIG_PATA_IT8213 is not set
# CONFIG_PATA_IT821X is not set
# CONFIG_PATA_JMICRON is not set
# CONFIG_PATA_MARVELL is not set
# CONFIG_PATA_NETCELL is not set
# CONFIG_PATA_NINJA32 is not set
# CONFIG_PATA_NS87415 is not set
# CONFIG_PATA_OLDPIIX is not set
# CONFIG_PATA_OPTIDMA is not set
# CONFIG_PATA_PDC2027X is not set
# CONFIG_PATA_PDC_OLD is not set
# CONFIG_PATA_RADISYS is not set
# CONFIG_PATA_RDC is not set
# CONFIG_PATA_SCH is not set
# CONFIG_PATA_SERVERWORKS is not set
# CONFIG_PATA_SIL680 is not set
# CONFIG_PATA_SIS is not set
# CONFIG_PATA_TOSHIBA is not set
# CONFIG_PATA_TRIFLEX is not set
# CONFIG_PATA_VIA is not set
# CONFIG_PATA_WINBOND is not set

#
# PIO-only SFF controllers
#
# CONFIG_PATA_CMD640_PCI is not set
# CONFIG_PATA_MPIIX is not set
# CONFIG_PATA_NS87410 is not set
# CONFIG_PATA_OPTI is not set
# CONFIG_PATA_RZ1000 is not set

#
# Generic fallback / legacy drivers
#
# CONFIG_PATA_ACPI is not set
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
CONFIG_MD_CLUSTER=m
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
CONFIG_DM_WRITECACHE=m
# CONFIG_DM_EBS is not set
CONFIG_DM_ERA=m
# CONFIG_DM_CLONE is not set
CONFIG_DM_MIRROR=m
CONFIG_DM_LOG_USERSPACE=m
CONFIG_DM_RAID=m
CONFIG_DM_ZERO=m
CONFIG_DM_MULTIPATH=m
CONFIG_DM_MULTIPATH_QL=m
CONFIG_DM_MULTIPATH_ST=m
# CONFIG_DM_MULTIPATH_HST is not set
# CONFIG_DM_MULTIPATH_IOA is not set
CONFIG_DM_DELAY=m
# CONFIG_DM_DUST is not set
CONFIG_DM_UEVENT=y
CONFIG_DM_FLAKEY=m
CONFIG_DM_VERITY=m
# CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
# CONFIG_DM_VERITY_FEC is not set
CONFIG_DM_SWITCH=m
CONFIG_DM_LOG_WRITES=m
CONFIG_DM_INTEGRITY=m
# CONFIG_DM_ZONED is not set
CONFIG_TARGET_CORE=m
CONFIG_TCM_IBLOCK=m
CONFIG_TCM_FILEIO=m
CONFIG_TCM_PSCSI=m
CONFIG_TCM_USER2=m
CONFIG_LOOPBACK_TARGET=m
CONFIG_ISCSI_TARGET=m
# CONFIG_SBP_TARGET is not set
# CONFIG_FUSION is not set

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
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_MACSEC is not set
CONFIG_NETCONSOLE=m
CONFIG_NETCONSOLE_DYNAMIC=y
CONFIG_NETPOLL=y
CONFIG_NET_POLL_CONTROLLER=y
CONFIG_TUN=m
# CONFIG_TUN_VNET_CROSS_LE is not set
CONFIG_VETH=m
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_NET_VRF is not set
# CONFIG_VSOCKMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_FIRESTREAM is not set
# CONFIG_ATM_ZATM is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_AMBASSADOR is not set
# CONFIG_ATM_HORIZON is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
CONFIG_ETHERNET=y
CONFIG_MDIO=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
CONFIG_NET_VENDOR_AMD=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_PCNET32 is not set
# CONFIG_AMD_XGBE is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
CONFIG_CAVIUM_PTP=y
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
# CONFIG_CX_ECAT is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_E1000E_HWTS=y
CONFIG_IGB=y
CONFIG_IGB_HWMON=y
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
CONFIG_IXGBE=y
CONFIG_IXGBE_HWMON=y
# CONFIG_IXGBE_DCB is not set
CONFIG_IXGBE_IPSEC=y
# CONFIG_IXGBEVF is not set
CONFIG_I40E=y
# CONFIG_I40E_DCB is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
CONFIG_IGC=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_PRESTERA is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8842 is not set
# CONFIG_KS8851 is not set
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_ENC28J60 is not set
# CONFIG_ENCX24J600 is not set
# CONFIG_LAN743X is not set
# CONFIG_SPARX5_SWITCH is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
# CONFIG_VXGE is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_NE2K_PCI is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
CONFIG_R8169=y
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
# CONFIG_ROCKER is not set
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
# CONFIG_LED_TRIGGER_PHY is not set
CONFIG_FIXED_PHY=y

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
CONFIG_AX88796B_PHY=y
# CONFIG_BROADCOM_PHY is not set
# CONFIG_BCM54140_PHY is not set
# CONFIG_BCM7XXX_PHY is not set
# CONFIG_BCM84881_PHY is not set
# CONFIG_BCM87XX_PHY is not set
# CONFIG_CICADA_PHY is not set
# CONFIG_CORTINA_PHY is not set
# CONFIG_DAVICOM_PHY is not set
# CONFIG_ICPLUS_PHY is not set
# CONFIG_LXT_PHY is not set
# CONFIG_INTEL_XWAY_PHY is not set
# CONFIG_LSI_ET1011C_PHY is not set
# CONFIG_MARVELL_PHY is not set
# CONFIG_MARVELL_10G_PHY is not set
# CONFIG_MARVELL_88X2222_PHY is not set
# CONFIG_MEDIATEK_GE_PHY is not set
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_MOTORCOMM_PHY is not set
# CONFIG_NATIONAL_PHY is not set
# CONFIG_NXP_C45_TJA11XX_PHY is not set
# CONFIG_NXP_TJA11XX_PHY is not set
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=y
# CONFIG_RENESAS_PHY is not set
# CONFIG_ROCKCHIP_PHY is not set
# CONFIG_SMSC_PHY is not set
# CONFIG_STE10XP is not set
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
# CONFIG_DP83848_PHY is not set
# CONFIG_DP83867_PHY is not set
# CONFIG_DP83869_PHY is not set
# CONFIG_VITESSE_PHY is not set
# CONFIG_XILINX_GMII2RGMII is not set
# CONFIG_MICREL_KS8995MA is not set
CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_ACPI_MDIO=y
CONFIG_MDIO_DEVRES=y
# CONFIG_MDIO_BITBANG is not set
# CONFIG_MDIO_BCM_UNIMAC is not set
# CONFIG_MDIO_MVUSB is not set
# CONFIG_MDIO_MSCC_MIIM is not set
# CONFIG_MDIO_THUNDER is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# CONFIG_PCS_XPCS is not set
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
CONFIG_USB_NET_DRIVERS=y
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
CONFIG_USB_RTL8152=y
# CONFIG_USB_LAN78XX is not set
CONFIG_USB_USBNET=y
CONFIG_USB_NET_AX8817X=y
CONFIG_USB_NET_AX88179_178A=y
# CONFIG_USB_NET_CDCETHER is not set
# CONFIG_USB_NET_CDC_EEM is not set
# CONFIG_USB_NET_CDC_NCM is not set
# CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
# CONFIG_USB_NET_CDC_MBIM is not set
# CONFIG_USB_NET_DM9601 is not set
# CONFIG_USB_NET_SR9700 is not set
# CONFIG_USB_NET_SR9800 is not set
# CONFIG_USB_NET_SMSC75XX is not set
# CONFIG_USB_NET_SMSC95XX is not set
# CONFIG_USB_NET_GL620A is not set
# CONFIG_USB_NET_NET1080 is not set
# CONFIG_USB_NET_PLUSB is not set
# CONFIG_USB_NET_MCS7830 is not set
# CONFIG_USB_NET_RNDIS_HOST is not set
# CONFIG_USB_NET_CDC_SUBSET is not set
# CONFIG_USB_NET_ZAURUS is not set
# CONFIG_USB_NET_CX82310_ETH is not set
# CONFIG_USB_NET_KALMIA is not set
# CONFIG_USB_NET_QMI_WWAN is not set
# CONFIG_USB_HSO is not set
# CONFIG_USB_NET_INT51X1 is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_USB_SIERRA_NET is not set
# CONFIG_USB_NET_CH9200 is not set
# CONFIG_USB_NET_AQC111 is not set
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_ADM8211 is not set
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
# CONFIG_ATH9K is not set
# CONFIG_ATH9K_HTC is not set
# CONFIG_CARL9170 is not set
# CONFIG_ATH6KL is not set
# CONFIG_AR5523 is not set
# CONFIG_WIL6210 is not set
# CONFIG_ATH10K is not set
# CONFIG_WCN36XX is not set
# CONFIG_ATH11K is not set
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
# CONFIG_IWL4965 is not set
# CONFIG_IWL3945 is not set
# CONFIG_IWLWIFI is not set
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
# CONFIG_MT7663U is not set
# CONFIG_MT7663S is not set
# CONFIG_MT7915E is not set
# CONFIG_MT7921E is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
# CONFIG_WILC1000_SPI is not set
CONFIG_WLAN_VENDOR_RALINK=y
# CONFIG_RT2X00 is not set
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTL8180 is not set
# CONFIG_RTL8187 is not set
CONFIG_RTL_CARDS=m
# CONFIG_RTL8192CE is not set
# CONFIG_RTL8192SE is not set
# CONFIG_RTL8192DE is not set
# CONFIG_RTL8723AE is not set
# CONFIG_RTL8723BE is not set
# CONFIG_RTL8188EE is not set
# CONFIG_RTL8192EE is not set
# CONFIG_RTL8821AE is not set
# CONFIG_RTL8192CU is not set
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
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=m
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_AT86RF230 is not set
# CONFIG_IEEE802154_MRF24J40 is not set
# CONFIG_IEEE802154_CC2520 is not set
# CONFIG_IEEE802154_ATUSB is not set
# CONFIG_IEEE802154_ADF7242 is not set
# CONFIG_IEEE802154_CA8210 is not set
# CONFIG_IEEE802154_MCR20A is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_HYPERV_NET is not set
CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set
# CONFIG_NVM is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=y
CONFIG_INPUT_FF_MEMLESS=m
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
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
CONFIG_MOUSE_ELAN_I2C_SMBUS=y
CONFIG_MOUSE_VSXXXAA=m
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=m
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
CONFIG_RMI4_I2C=m
CONFIG_RMI4_SPI=m
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
# CONFIG_RMI4_F54 is not set
CONFIG_RMI4_F55=y

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
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_PNP=y
# CONFIG_SERIAL_8250_16550A_VARIANTS is not set
# CONFIG_SERIAL_8250_FINTEK is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_DMA=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_EXAR=y
CONFIG_SERIAL_8250_NR_UARTS=64
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
CONFIG_SERIAL_8250_RSA=y
CONFIG_SERIAL_8250_DWLIB=y
CONFIG_SERIAL_8250_DW=y
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=y
CONFIG_SERIAL_8250_MID=y

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MAX3100 is not set
# CONFIG_SERIAL_MAX310X is not set
# CONFIG_SERIAL_UARTLITE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
# CONFIG_SERIAL_LANTIQ is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_BCM63XX is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=m
CONFIG_SERIAL_ARC_NR_PORTS=1
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
CONFIG_HVC_XEN_FRONTEND=y
# CONFIG_SERIAL_DEV_BUS is not set
CONFIG_PRINTER=m
# CONFIG_LP_CONSOLE is not set
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=m
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_DMI_DECODE=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_WATCHDOG=m
CONFIG_IPMI_POWEROFF=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_INTEL=m
CONFIG_HW_RANDOM_AMD=m
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=m
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_XIPHERA is not set
# CONFIG_APPLICOM is not set
# CONFIG_MWAVE is not set
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
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
# CONFIG_TCG_TIS_I2C_CR50 is not set
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
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# end of Character devices

# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set

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
CONFIG_I2C_MUX_MLXCPLD=m
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
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
CONFIG_I2C_I801=y
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
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EMEV2 is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=m
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
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
# CONFIG_SPI_LANTIQ_SSC is not set
# CONFIG_SPI_OC_TINY is not set
# CONFIG_SPI_PXA2XX is not set
# CONFIG_SPI_ROCKCHIP is not set
# CONFIG_SPI_SC18IS602 is not set
# CONFIG_SPI_SIFIVE is not set
# CONFIG_SPI_MXIC is not set
# CONFIG_SPI_XCOMM is not set
# CONFIG_SPI_XILINX is not set
# CONFIG_SPI_ZYNQMP_GQSPI is not set
# CONFIG_SPI_AMD is not set

#
# SPI Multiplexer support
#
# CONFIG_SPI_MUX is not set

#
# SPI Protocol Masters
#
# CONFIG_SPI_SPIDEV is not set
# CONFIG_SPI_LOOPBACK_TEST is not set
# CONFIG_SPI_TLE62X0 is not set
# CONFIG_SPI_SLAVE is not set
CONFIG_SPI_DYNAMIC=y
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
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
# CONFIG_PTP_1588_CLOCK_IDTCM is not set
# CONFIG_PTP_1588_CLOCK_VMW is not set
# CONFIG_PTP_1588_CLOCK_OCP is not set
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
# CONFIG_PINCTRL_LYNXPOINT is not set
CONFIG_PINCTRL_INTEL=y
# CONFIG_PINCTRL_ALDERLAKE is not set
CONFIG_PINCTRL_BROXTON=m
CONFIG_PINCTRL_CANNONLAKE=m
CONFIG_PINCTRL_CEDARFORK=m
CONFIG_PINCTRL_DENVERTON=m
# CONFIG_PINCTRL_ELKHARTLAKE is not set
# CONFIG_PINCTRL_EMMITSBURG is not set
CONFIG_PINCTRL_GEMINILAKE=m
# CONFIG_PINCTRL_ICELAKE is not set
# CONFIG_PINCTRL_JASPERLAKE is not set
# CONFIG_PINCTRL_LAKEFIELD is not set
CONFIG_PINCTRL_LEWISBURG=m
CONFIG_PINCTRL_SUNRISEPOINT=m
# CONFIG_PINCTRL_TIGERLAKE is not set

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_AMDPT=m
# CONFIG_GPIO_DWAPB is not set
# CONFIG_GPIO_EXAR is not set
# CONFIG_GPIO_GENERIC_PLATFORM is not set
CONFIG_GPIO_ICH=m
# CONFIG_GPIO_MB86S7X is not set
# CONFIG_GPIO_VX855 is not set
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
# CONFIG_GPIO_PCA9570 is not set
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
# CONFIG_GPIO_BT8XX is not set
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
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
# CONFIG_GPIO_MOCKUP is not set
# end of Virtual GPIO drivers

# CONFIG_W1 is not set
CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_POWER_SUPPLY_HWMON=y
# CONFIG_PDA_POWER is not set
# CONFIG_TEST_POWER is not set
# CONFIG_CHARGER_ADP5061 is not set
# CONFIG_BATTERY_CW2015 is not set
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
# CONFIG_CHARGER_LTC4162L is not set
# CONFIG_CHARGER_BQ2415X is not set
# CONFIG_CHARGER_BQ24257 is not set
# CONFIG_CHARGER_BQ24735 is not set
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
# CONFIG_CHARGER_BQ25980 is not set
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=m
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
# CONFIG_BATTERY_RT5033 is not set
# CONFIG_CHARGER_RT9455 is not set
# CONFIG_CHARGER_BD99954 is not set
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
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
# CONFIG_SENSORS_ADT7310 is not set
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
# CONFIG_SENSORS_AHT10 is not set
# CONFIG_SENSORS_AS370 is not set
CONFIG_SENSORS_ASC7621=m
# CONFIG_SENSORS_AXI_FAN_CONTROL is not set
CONFIG_SENSORS_K8TEMP=m
CONFIG_SENSORS_K10TEMP=m
CONFIG_SENSORS_FAM15H_POWER=m
CONFIG_SENSORS_APPLESMC=m
CONFIG_SENSORS_ASB100=m
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_CORSAIR_CPRO is not set
# CONFIG_SENSORS_CORSAIR_PSU is not set
# CONFIG_SENSORS_DRIVETEMP is not set
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
CONFIG_SENSORS_I5500=m
CONFIG_SENSORS_CORETEMP=m
CONFIG_SENSORS_IT87=m
CONFIG_SENSORS_JC42=m
# CONFIG_SENSORS_POWR1220 is not set
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_LTC2947_SPI is not set
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
# CONFIG_SENSORS_LTC4222 is not set
CONFIG_SENSORS_LTC4245=m
# CONFIG_SENSORS_LTC4260 is not set
CONFIG_SENSORS_LTC4261=m
# CONFIG_SENSORS_MAX1111 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
# CONFIG_SENSORS_MAX31722 is not set
# CONFIG_SENSORS_MAX31730 is not set
# CONFIG_SENSORS_MAX6621 is not set
CONFIG_SENSORS_MAX6639=m
CONFIG_SENSORS_MAX6642=m
CONFIG_SENSORS_MAX6650=m
CONFIG_SENSORS_MAX6697=m
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
# CONFIG_SENSORS_MLXREG_FAN is not set
# CONFIG_SENSORS_TC654 is not set
# CONFIG_SENSORS_TPS23861 is not set
# CONFIG_SENSORS_MR75203 is not set
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
# CONFIG_SENSORS_NZXT_KRAKEN2 is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_BPA_RS600 is not set
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR36021 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
# CONFIG_SENSORS_MAX15301 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_PIM4328 is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
CONFIG_SENSORS_UCD9200=m
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
# CONFIG_SENSORS_SBTSI is not set
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
# CONFIG_SENSORS_SHT3x is not set
# CONFIG_SENSORS_SHT4x is not set
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
# CONFIG_SENSORS_TMP513 is not set
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
# CONFIG_THERMAL_NETLINK is not set
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
CONFIG_THERMAL_HWMON=y
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
CONFIG_X86_PKG_TEMP_THERMAL=m
CONFIG_INTEL_SOC_DTS_IOSF_CORE=m
# CONFIG_INTEL_SOC_DTS_THERMAL is not set

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=m
CONFIG_ACPI_THERMAL_REL=m
# CONFIG_INT3406_THERMAL is not set
CONFIG_PROC_THERMAL_MMIO_RAPL=m
# end of ACPI INT340X thermal drivers

CONFIG_INTEL_PCH_THERMAL=m
# CONFIG_INTEL_TCC_COOLING is not set
# end of Intel thermal drivers

CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

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
# CONFIG_MLX_WDT is not set
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
# CONFIG_USBPCWATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
# CONFIG_SSB is not set
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
# CONFIG_MFD_MP2629 is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_HTC_I2CPLD is not set
# CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
CONFIG_LPC_ICH=y
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
CONFIG_MFD_INTEL_LPSS=y
CONFIG_MFD_INTEL_LPSS_ACPI=y
CONFIG_MFD_INTEL_LPSS_PCI=y
# CONFIG_MFD_INTEL_PMC_BXT is not set
# CONFIG_MFD_INTEL_PMT is not set
# CONFIG_MFD_IQS62X is not set
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
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6397 is not set
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_EZX_PCAP is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RT4831 is not set
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
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
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_INTEL_M10_BMC is not set
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
# CONFIG_IR_SHARP_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=m
# CONFIG_IR_XMP_DECODER is not set
CONFIG_IR_IMON_DECODER=m
# CONFIG_IR_RCMM_DECODER is not set
CONFIG_RC_DEVICES=y
# CONFIG_RC_ATI_REMOTE is not set
CONFIG_IR_ENE=m
# CONFIG_IR_IMON is not set
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_ITE_CIR=m
CONFIG_IR_FINTEK=m
CONFIG_IR_NUVOTON=m
# CONFIG_IR_REDRAT3 is not set
# CONFIG_IR_STREAMZAP is not set
CONFIG_IR_WINBOND_CIR=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
# CONFIG_IR_TTUSBIR is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_IR_SERIAL=m
CONFIG_IR_SERIAL_TRANSMITTER=y
CONFIG_IR_SIR=m
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_TOY is not set
CONFIG_MEDIA_CEC_SUPPORT=y
# CONFIG_CEC_CH7322 is not set
# CONFIG_CEC_SECO is not set
# CONFIG_USB_PULSE8_CEC is not set
# CONFIG_USB_RAINSHADOW_CEC is not set
CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2=m
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=y
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
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_VMALLOC=m
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_V4L_MEM2MEM_DRIVERS is not set
# CONFIG_DVB_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set

#
# MMC/SDIO DVB adapters
#
# CONFIG_SMS_SDIO_DRV is not set
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set

#
# FireWire (IEEE 1394) Adapters
#
# CONFIG_DVB_FIREDTV is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=m

#
# Audio decoders, processors and mixers
#
# CONFIG_VIDEO_TVAUDIO is not set
# CONFIG_VIDEO_TDA7432 is not set
# CONFIG_VIDEO_TDA9840 is not set
# CONFIG_VIDEO_TEA6415C is not set
# CONFIG_VIDEO_TEA6420 is not set
# CONFIG_VIDEO_MSP3400 is not set
# CONFIG_VIDEO_CS3308 is not set
# CONFIG_VIDEO_CS5345 is not set
# CONFIG_VIDEO_CS53L32A is not set
# CONFIG_VIDEO_TLV320AIC23B is not set
# CONFIG_VIDEO_UDA1342 is not set
# CONFIG_VIDEO_WM8775 is not set
# CONFIG_VIDEO_WM8739 is not set
# CONFIG_VIDEO_VP27SMPX is not set
# CONFIG_VIDEO_SONY_BTF_MPX is not set
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
# CONFIG_VIDEO_SAA6588 is not set
# end of RDS decoders

#
# Video decoders
#
# CONFIG_VIDEO_ADV7180 is not set
# CONFIG_VIDEO_ADV7183 is not set
# CONFIG_VIDEO_ADV7604 is not set
# CONFIG_VIDEO_ADV7842 is not set
# CONFIG_VIDEO_BT819 is not set
# CONFIG_VIDEO_BT856 is not set
# CONFIG_VIDEO_BT866 is not set
# CONFIG_VIDEO_KS0127 is not set
# CONFIG_VIDEO_ML86V7667 is not set
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
# CONFIG_VIDEO_TC358743 is not set
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
# CONFIG_VIDEO_SAA717X is not set
# CONFIG_VIDEO_CX25840 is not set
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_SAA7127 is not set
# CONFIG_VIDEO_SAA7185 is not set
# CONFIG_VIDEO_ADV7170 is not set
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
# CONFIG_VIDEO_ADV7393 is not set
# CONFIG_VIDEO_ADV7511 is not set
# CONFIG_VIDEO_AD9389B is not set
# CONFIG_VIDEO_AK881X is not set
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
# CONFIG_VIDEO_UPD64083 is not set
# end of Video improvement chips

#
# Audio/Video compression chips
#
# CONFIG_VIDEO_SAA6752HS is not set
# end of Audio/Video compression chips

#
# SDR tuner chips
#
# CONFIG_SDR_MAX2175 is not set
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_THS7303 is not set
# CONFIG_VIDEO_M52790 is not set
# CONFIG_VIDEO_I2C is not set
# CONFIG_VIDEO_ST_MIPID02 is not set
# end of Miscellaneous helper chips

#
# Camera sensor devices
#
# CONFIG_VIDEO_HI556 is not set
# CONFIG_VIDEO_IMX208 is not set
# CONFIG_VIDEO_IMX214 is not set
# CONFIG_VIDEO_IMX219 is not set
# CONFIG_VIDEO_IMX258 is not set
# CONFIG_VIDEO_IMX274 is not set
# CONFIG_VIDEO_IMX290 is not set
# CONFIG_VIDEO_IMX319 is not set
# CONFIG_VIDEO_IMX355 is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV2640 is not set
# CONFIG_VIDEO_OV2659 is not set
# CONFIG_VIDEO_OV2680 is not set
# CONFIG_VIDEO_OV2685 is not set
# CONFIG_VIDEO_OV2740 is not set
# CONFIG_VIDEO_OV5647 is not set
# CONFIG_VIDEO_OV5648 is not set
# CONFIG_VIDEO_OV6650 is not set
# CONFIG_VIDEO_OV5670 is not set
# CONFIG_VIDEO_OV5675 is not set
# CONFIG_VIDEO_OV5695 is not set
# CONFIG_VIDEO_OV7251 is not set
# CONFIG_VIDEO_OV772X is not set
# CONFIG_VIDEO_OV7640 is not set
# CONFIG_VIDEO_OV7670 is not set
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV8865 is not set
# CONFIG_VIDEO_OV9640 is not set
# CONFIG_VIDEO_OV9650 is not set
# CONFIG_VIDEO_OV9734 is not set
# CONFIG_VIDEO_OV13858 is not set
# CONFIG_VIDEO_VS6624 is not set
# CONFIG_VIDEO_MT9M001 is not set
# CONFIG_VIDEO_MT9M032 is not set
# CONFIG_VIDEO_MT9M111 is not set
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
# CONFIG_VIDEO_MT9T112 is not set
# CONFIG_VIDEO_MT9V011 is not set
# CONFIG_VIDEO_MT9V032 is not set
# CONFIG_VIDEO_MT9V111 is not set
# CONFIG_VIDEO_SR030PC30 is not set
# CONFIG_VIDEO_NOON010PC30 is not set
# CONFIG_VIDEO_M5MOLS is not set
# CONFIG_VIDEO_RDACM20 is not set
# CONFIG_VIDEO_RDACM21 is not set
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K6AA is not set
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
# CONFIG_VIDEO_S5K5BAF is not set
# CONFIG_VIDEO_CCS is not set
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_S5C73M3 is not set
# end of Camera sensor devices

#
# Lens drivers
#
# CONFIG_VIDEO_AD5820 is not set
# CONFIG_VIDEO_AK7375 is not set
# CONFIG_VIDEO_DW9714 is not set
# CONFIG_VIDEO_DW9768 is not set
# CONFIG_VIDEO_DW9807_VCM is not set
# end of Lens drivers

#
# Flash devices
#
# CONFIG_VIDEO_ADP1653 is not set
# CONFIG_VIDEO_LM3560 is not set
# CONFIG_VIDEO_LM3646 is not set
# end of Flash devices

#
# SPI helper chips
#
# CONFIG_VIDEO_GS1662 is not set
# end of SPI helper chips

#
# Media SPI Adapters
#
CONFIG_CXD2880_SPI_DRV=m
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
CONFIG_MEDIA_TUNER_MSI001=m
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
CONFIG_MEDIA_TUNER_MXL301RF=m
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
CONFIG_DVB_SP887X=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_S5H1432=m
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
CONFIG_DVB_DIB9000=m
CONFIG_DVB_TDA10048=m
CONFIG_DVB_AF9013=m
CONFIG_DVB_EC100=m
CONFIG_DVB_STV0367=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_RTL2832_SDR=m
CONFIG_DVB_SI2168=m
CONFIG_DVB_ZD1301_DEMOD=m
CONFIG_DVB_CXD2880=m

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
CONFIG_DVB_MXL692=m

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
CONFIG_DVB_MN88443X=m

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
CONFIG_DVB_LNBH29=m
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_ISL6405=m
CONFIG_DVB_ISL6421=m
CONFIG_DVB_ISL6423=m
CONFIG_DVB_A8293=m
CONFIG_DVB_LGS8GL5=m
CONFIG_DVB_LGS8GXX=m
CONFIG_DVB_ATBM8830=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_HORUS3A=m
CONFIG_DVB_ASCOT2E=m
CONFIG_DVB_HELENE=m

#
# Common Interface (EN50221) controller drivers
#
CONFIG_DVB_CXD2099=m
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_INTEL_GTT=m
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=64
CONFIG_VGA_SWITCHEROO=y
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
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
# CONFIG_DRM_NOUVEAU is not set
CONFIG_DRM_I915=m
CONFIG_DRM_I915_FORCE_PROBE=""
CONFIG_DRM_I915_CAPTURE_ERROR=y
CONFIG_DRM_I915_COMPRESS_ERROR=y
CONFIG_DRM_I915_USERPTR=y
CONFIG_DRM_I915_GVT=y
CONFIG_DRM_I915_GVT_KVMGT=m
CONFIG_DRM_I915_REQUEST_TIMEOUT=20000
CONFIG_DRM_I915_FENCE_TIMEOUT=10000
CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=250
CONFIG_DRM_I915_HEARTBEAT_INTERVAL=2500
CONFIG_DRM_I915_PREEMPT_TIMEOUT=640
CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=8000
CONFIG_DRM_I915_STOP_TIMEOUT=100
CONFIG_DRM_I915_TIMESLICE_DURATION=1
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_VMWGFX is not set
CONFIG_DRM_GMA500=m
# CONFIG_DRM_UDL is not set
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
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
CONFIG_DRM_CIRRUS_QEMU=m
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN_FRONTEND is not set
# CONFIG_DRM_VBOXVIDEO is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_HYPERV is not set
# CONFIG_DRM_LEGACY is not set
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y

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
# CONFIG_FB_SSD1307 is not set
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
# CONFIG_BACKLIGHT_KTD253 is not set
# CONFIG_BACKLIGHT_PWM is not set
CONFIG_BACKLIGHT_APPLE=m
# CONFIG_BACKLIGHT_QCOM_WLED is not set
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

# CONFIG_SOUND is not set

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
CONFIG_HID_A4TECH=m
# CONFIG_HID_ACCUTOUCH is not set
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=m
# CONFIG_HID_APPLEIR is not set
CONFIG_HID_ASUS=m
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
# CONFIG_HID_BETOP_FF is not set
# CONFIG_HID_BIGBEN_FF is not set
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
# CONFIG_HID_CORSAIR is not set
# CONFIG_HID_COUGAR is not set
# CONFIG_HID_MACALLY is not set
CONFIG_HID_CMEDIA=m
# CONFIG_HID_CP2112 is not set
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=m
CONFIG_HID_DRAGONRISE=m
# CONFIG_DRAGONRISE_FF is not set
# CONFIG_HID_EMS_FF is not set
# CONFIG_HID_ELAN is not set
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
CONFIG_HID_EZKEY=m
# CONFIG_HID_FT260 is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=m
# CONFIG_HID_GLORIOUS is not set
# CONFIG_HID_HOLTEK is not set
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_GT683R is not set
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=m
# CONFIG_HID_VIEWSONIC is not set
CONFIG_HID_GYRATION=m
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
CONFIG_HID_JABRA=m
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=m
CONFIG_HID_LCPOWER=m
CONFIG_HID_LED=m
CONFIG_HID_LENOVO=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
# CONFIG_LOGITECH_FF is not set
# CONFIG_LOGIRUMBLEPAD2_FF is not set
# CONFIG_LOGIG940_FF is not set
# CONFIG_LOGIWHEELS_FF is not set
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
# CONFIG_HID_MAYFLASH is not set
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NTI=m
# CONFIG_HID_NTRIG is not set
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
CONFIG_HID_PLANTRONICS=m
# CONFIG_HID_PLAYSTATION is not set
CONFIG_HID_PRIMAX=m
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
CONFIG_HID_SAITEK=m
CONFIG_HID_SAMSUNG=m
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SONY is not set
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
# CONFIG_HID_WACOM is not set
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=m
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# CONFIG_HID_MCP2221 is not set
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=y
# CONFIG_HID_PID is not set
# CONFIG_USB_HIDDEV is not set
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=m
# CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_FEW_INIT_RETRIES is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_OTG is not set
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=y

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
CONFIG_USB_XHCI_HCD=y
# CONFIG_USB_XHCI_DBGCAP is not set
CONFIG_USB_XHCI_PCI=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
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
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set
# CONFIG_USB_HCD_BCMA is not set
# CONFIG_USB_HCD_TEST_MODE is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=m
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set
# CONFIG_USB_UAS is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USBIP_CORE is not set
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_DWC2 is not set
# CONFIG_USB_CHIPIDEA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
# CONFIG_USB_SERIAL_SIMPLE is not set
# CONFIG_USB_SERIAL_AIRCABLE is not set
# CONFIG_USB_SERIAL_ARK3116 is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_CH341 is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_F81232 is not set
# CONFIG_USB_SERIAL_F8153X is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_IUU is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_METRO is not set
# CONFIG_USB_SERIAL_MOS7720 is not set
# CONFIG_USB_SERIAL_MOS7840 is not set
# CONFIG_USB_SERIAL_MXUPORT is not set
# CONFIG_USB_SERIAL_NAVMAN is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_OTI6858 is not set
# CONFIG_USB_SERIAL_QCAUX is not set
# CONFIG_USB_SERIAL_QUALCOMM is not set
# CONFIG_USB_SERIAL_SPCP8X5 is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
# CONFIG_USB_SERIAL_SYMBOL is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_OPTION is not set
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
# CONFIG_USB_SERIAL_XSENS_MT is not set
# CONFIG_USB_SERIAL_WISHBONE is not set
# CONFIG_USB_SERIAL_SSU100 is not set
# CONFIG_USB_SERIAL_QT2 is not set
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=m

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_APPLE_MFI_FASTCHARGE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HUB_USB251XB is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_HSIC_USB4604 is not set
# CONFIG_USB_LINK_LAYER_TEST is not set
# CONFIG_USB_CHAOSKEY is not set
# CONFIG_USB_ATM is not set

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
# CONFIG_TYPEC_STUSB160X is not set

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
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
CONFIG_MMC_RICOH_MMC=y
CONFIG_MMC_SDHCI_ACPI=m
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_F_SDH30 is not set
# CONFIG_MMC_WBSD is not set
# CONFIG_MMC_TIFM_SD is not set
# CONFIG_MMC_SPI is not set
# CONFIG_MMC_CB710 is not set
# CONFIG_MMC_VIA_SDMMC is not set
# CONFIG_MMC_VUB300 is not set
# CONFIG_MMC_USHC is not set
# CONFIG_MMC_USDHI6ROL0 is not set
# CONFIG_MMC_REALTEK_PCI is not set
CONFIG_MMC_CQHCI=m
# CONFIG_MMC_HSQ is not set
# CONFIG_MMC_TOSHIBA_PCI is not set
# CONFIG_MMC_MTK is not set
# CONFIG_MMC_SDHCI_XENON is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
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
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_CLEVO_MAIL=m
# CONFIG_LEDS_PCA955X is not set
# CONFIG_LEDS_PCA963X is not set
# CONFIG_LEDS_DAC124S085 is not set
# CONFIG_LEDS_PWM is not set
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_INTEL_SS4200=m
CONFIG_LEDS_LT3593=m
# CONFIG_LEDS_TCA6507 is not set
# CONFIG_LEDS_TLC591XX is not set
# CONFIG_LEDS_LM355x is not set

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXCPLD=m
# CONFIG_LEDS_MLXREG is not set
# CONFIG_LEDS_USER is not set
# CONFIG_LEDS_NIC78BX is not set
# CONFIG_LEDS_TI_LMU_COMMON is not set

#
# Flash and Torch LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
# CONFIG_LEDS_TRIGGER_DISK is not set
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
# CONFIG_LEDS_TRIGGER_TTY is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
CONFIG_INFINIBAND_USER_ACCESS=m
CONFIG_INFINIBAND_USER_MEM=y
CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_EFA is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_RDMAVT is not set
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
CONFIG_INFINIBAND_IPOIB=m
# CONFIG_INFINIBAND_IPOIB_CM is not set
CONFIG_INFINIBAND_IPOIB_DEBUG=y
# CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
CONFIG_INFINIBAND_SRP=m
CONFIG_INFINIBAND_SRPT=m
# CONFIG_INFINIBAND_ISER is not set
# CONFIG_INFINIBAND_ISERT is not set
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
# CONFIG_INFINIBAND_RTRS_SERVER is not set
# CONFIG_INFINIBAND_OPA_VNIC is not set
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=y
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_DECODE_MCE=m
CONFIG_EDAC_GHES=y
CONFIG_EDAC_AMD64=m
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
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_S35390A is not set
CONFIG_RTC_DRV_FM3130=m
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
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
# CONFIG_RTC_DRV_RV3029_HWMON is not set
# CONFIG_RTC_DRV_RX6110 is not set

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
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_ACPI=y
# CONFIG_ALTERA_MSGDMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IDXD is not set
CONFIG_INTEL_IOATDMA=m
# CONFIG_PLX_DMA is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
# CONFIG_QCOM_HIDMA is not set
CONFIG_DW_DMAC_CORE=y
CONFIG_DW_DMAC=m
CONFIG_DW_DMAC_PCI=y
# CONFIG_DW_EDMA is not set
# CONFIG_DW_EDMA_PCIE is not set
CONFIG_HSU_DMA=y
# CONFIG_SF_PDMA is not set
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
# CONFIG_UDMABUF is not set
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
# end of DMABUF options

CONFIG_DCA=m
# CONFIG_AUXDISPLAY is not set
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
CONFIG_IRQ_BYPASS_MANAGER=m
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
CONFIG_VIRTIO_PCI_LIB=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y
# CONFIG_VIRTIO_PMEM is not set
CONFIG_VIRTIO_BALLOON=m
CONFIG_VIRTIO_MEM=m
CONFIG_VIRTIO_INPUT=m
# CONFIG_VIRTIO_MMIO is not set
CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
# CONFIG_VDPA is not set
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
# CONFIG_VHOST_SCSI is not set
CONFIG_VHOST_VSOCK=m
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_UTILS=m
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
# CONFIG_XEN_BALLOON is not set
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
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
# CONFIG_XEN_UNPOPULATED_ALLOC is not set
# end of Xen driver support

# CONFIG_GREYBUS is not set
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_HUAWEI_WMI is not set
# CONFIG_UV_SYSFS is not set
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m
CONFIG_MXM_WMI=m
# CONFIG_PEAQ_WMI is not set
# CONFIG_XIAOMI_WMI is not set
# CONFIG_GIGABYTE_WMI is not set
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMC is not set
# CONFIG_ADV_SWBUTTON is not set
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
CONFIG_ASUS_WMI=m
CONFIG_ASUS_NB_WMI=m
CONFIG_EEEPC_LAPTOP=m
CONFIG_EEEPC_WMI=m
# CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
CONFIG_AMILO_RFKILL=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=m
# CONFIG_GPD_POCKET_FAN is not set
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
# CONFIG_IBM_RTL is not set
CONFIG_IDEAPAD_LAPTOP=m
CONFIG_SENSORS_HDAPS=m
CONFIG_THINKPAD_ACPI=m
# CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
# CONFIG_THINKPAD_ACPI_DEBUG is not set
# CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
CONFIG_THINKPAD_ACPI_VIDEO=y
CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y
# CONFIG_THINKPAD_LMI is not set
CONFIG_X86_PLATFORM_DRIVERS_INTEL=y
# CONFIG_INTEL_ATOMISP2_PM is not set
CONFIG_INTEL_HID_EVENT=m
# CONFIG_INTEL_INT0002_VGPIO is not set
# CONFIG_INTEL_MENLOW is not set
CONFIG_INTEL_OAKTRAIL=m
CONFIG_INTEL_VBTN=m
CONFIG_MSI_LAPTOP=m
CONFIG_MSI_WMI=m
# CONFIG_PCENGINES_APU2 is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
CONFIG_TOSHIBA_BT_RFKILL=m
# CONFIG_TOSHIBA_HAPS is not set
# CONFIG_TOSHIBA_WMI is not set
CONFIG_ACPI_CMPC=m
CONFIG_COMPAL_LAPTOP=m
# CONFIG_LG_LAPTOP is not set
CONFIG_PANASONIC_LAPTOP=m
CONFIG_SONY_LAPTOP=m
CONFIG_SONYPI_COMPAT=y
# CONFIG_SYSTEM76_ACPI is not set
CONFIG_TOPSTAR_LAPTOP=m
# CONFIG_I2C_MULTI_INSTANTIATE is not set
CONFIG_MLX_PLATFORM=m
CONFIG_INTEL_IPS=m
CONFIG_INTEL_RST=m
# CONFIG_INTEL_SMARTCONNECT is not set

#
# Intel Speed Select Technology interface support
#
# CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_TURBO_MAX_3=y
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
CONFIG_INTEL_PMC_CORE=m
# CONFIG_INTEL_PUNIT_IPC is not set
# CONFIG_INTEL_SCU_PCI is not set
# CONFIG_INTEL_SCU_PLATFORM is not set
CONFIG_PMC_ATOM=y
# CONFIG_CHROME_PLATFORMS is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
# CONFIG_MLXREG_IO is not set
CONFIG_SURFACE_PLATFORMS=y
# CONFIG_SURFACE3_WMI is not set
# CONFIG_SURFACE_3_POWER_OPREGION is not set
# CONFIG_SURFACE_GPE is not set
# CONFIG_SURFACE_HOTPLUG is not set
# CONFIG_SURFACE_PRO3_BUTTON is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

# CONFIG_LMK04832 is not set
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
# CONFIG_COMMON_CLK_SI544 is not set
# CONFIG_COMMON_CLK_CDCE706 is not set
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_PWM is not set
# CONFIG_XILINX_VCU is not set
CONFIG_HWSPINLOCK=y

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
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
CONFIG_IRQ_REMAP=y
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

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
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_NTB=m
# CONFIG_NTB_MSI is not set
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
# CONFIG_NTB_EPF is not set
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
# CONFIG_NTB_TOOL is not set
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_TRANSPORT is not set
# CONFIG_VME_BUS is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
# CONFIG_PWM_DWC is not set
CONFIG_PWM_LPSS=m
CONFIG_PWM_LPSS_PCI=m
CONFIG_PWM_LPSS_PLATFORM=m
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
# CONFIG_GENERIC_PHY is not set
# CONFIG_USB_LGM_PHY is not set
# CONFIG_PHY_CAN_TRANSCEIVER is not set
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_PXA_28NM_HSIC is not set
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_INTEL_RAPL_CORE=m
CONFIG_INTEL_RAPL=m
# CONFIG_IDLE_INJECT is not set
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_RAS_CEC is not set
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID is not set
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
# CONFIG_NVMEM_RMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
# CONFIG_STM_PROTO_BASIC is not set
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=m
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
CONFIG_INTEL_TH_ACPI=m
CONFIG_INTEL_TH_GTH=m
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

# CONFIG_FPGA is not set
# CONFIG_TEE is not set
# CONFIG_UNISYS_VISORBUS is not set
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
CONFIG_EXT2_FS=m
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT2_FS_SECURITY=y
# CONFIG_EXT3_FS is not set
CONFIG_EXT4_FS=y
CONFIG_EXT4_FS_POSIX_ACL=y
CONFIG_EXT4_FS_SECURITY=y
# CONFIG_EXT4_DEBUG is not set
CONFIG_EXT4_KUNIT_TESTS=m
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
CONFIG_XFS_FS=m
CONFIG_XFS_SUPPORT_V4=y
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
CONFIG_F2FS_FS_SECURITY=y
# CONFIG_F2FS_CHECK_FS is not set
# CONFIG_F2FS_FAULT_INJECTION is not set
# CONFIG_F2FS_FS_COMPRESSION is not set
# CONFIG_ZONEFS_FS is not set
CONFIG_FS_DAX=y
CONFIG_FS_DAX_PMD=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_MANDATORY_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
# CONFIG_FS_VERITY is not set
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
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
# CONFIG_VIRTIO_FS is not set
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
# CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
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
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
# CONFIG_FAT_DEFAULT_UTF8 is not set
# CONFIG_EXFAT_FS is not set
# CONFIG_NTFS_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_VMCORE=y
CONFIG_PROC_VMCORE_DEVICE_DUMP=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
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
CONFIG_CRAMFS=m
CONFIG_CRAMFS_BLOCKDEV=y
CONFIG_SQUASHFS=m
# CONFIG_SQUASHFS_FILE_CACHE is not set
CONFIG_SQUASHFS_FILE_DIRECT=y
# CONFIG_SQUASHFS_DECOMP_SINGLE is not set
# CONFIG_SQUASHFS_DECOMP_MULTI is not set
CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=y
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
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
# CONFIG_PSTORE_LZO_COMPRESS is not set
# CONFIG_PSTORE_LZ4_COMPRESS is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS is not set
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
# CONFIG_PSTORE_CONSOLE is not set
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
CONFIG_PSTORE_RAM=m
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set
# CONFIG_EROFS_FS is not set
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
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFS_V4_2_READ_PLUS is not set
CONFIG_NFSD=m
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_PNFS=y
# CONFIG_NFSD_BLOCKLAYOUT is not set
CONFIG_NFSD_SCSILAYOUT=y
# CONFIG_NFSD_FLEXFILELAYOUT is not set
# CONFIG_NFSD_V4_2_INTER_SSC is not set
CONFIG_NFSD_V4_SECURITY_LABEL=y
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_NFS_V4_2_SSC_HELPER=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_SUNRPC_BACKCHANNEL=y
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
CONFIG_SUNRPC_DEBUG=y
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
# CONFIG_CEPH_FSCACHE is not set
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
CONFIG_CIFS_WEAK_PW_HASH=y
CONFIG_CIFS_UPCALL=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_DEBUG=y
# CONFIG_CIFS_DEBUG2 is not set
# CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
CONFIG_CIFS_DFS_UPCALL=y
# CONFIG_CIFS_SWN_UPCALL is not set
# CONFIG_CIFS_SMB_DIRECT is not set
# CONFIG_CIFS_FSCACHE is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set
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
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
# CONFIG_KEYS_REQUEST_CACHE is not set
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_TRUSTED_KEYS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_PAGE_TABLE_ISOLATION=y
# CONFIG_SECURITY_INFINIBAND is not set
CONFIG_SECURITY_NETWORK_XFRM=y
CONFIG_SECURITY_PATH=y
CONFIG_INTEL_TXT=y
CONFIG_LSM_MMAP_MIN_ADDR=65535
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_HARDENED_USERCOPY_FALLBACK=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
CONFIG_SECURITY_SELINUX=y
CONFIG_SECURITY_SELINUX_BOOTPARAM=y
CONFIG_SECURITY_SELINUX_DISABLE=y
CONFIG_SECURITY_SELINUX_DEVELOP=y
CONFIG_SECURITY_SELINUX_AVC_STATS=y
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=y
CONFIG_SECURITY_APPARMOR_HASH=y
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=y
# CONFIG_SECURITY_APPARMOR_DEBUG is not set
CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
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
# CONFIG_IMA_APPRAISE_MODSIG is not set
CONFIG_IMA_TRUSTED_KEYRING=y
# CONFIG_IMA_BLACKLIST_KEYRING is not set
# CONFIG_IMA_LOAD_X509 is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_IMA_DISABLE_HTABLE is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_INIT_STACK_NONE=y
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
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
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
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_SIMD=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_ECC=m
CONFIG_CRYPTO_ECDH=m
# CONFIG_CRYPTO_ECDSA is not set
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=m
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=m
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
CONFIG_CRYPTO_PCBC=m
CONFIG_CRYPTO_XTS=m
# CONFIG_CRYPTO_KEYWRAP is not set
# CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
# CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_ESSIV=m

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
CONFIG_CRYPTO_XXHASH=m
CONFIG_CRYPTO_BLAKE2B=m
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_BLAKE2S_X86 is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=m
CONFIG_CRYPTO_POLY1305_X86_64=m
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=y
CONFIG_CRYPTO_SHA512_SSSE3=m
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=m
CONFIG_CRYPTO_SHA3=m
# CONFIG_CRYPTO_SM3 is not set
# CONFIG_CRYPTO_STREEBOG is not set
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
CONFIG_CRYPTO_ANUBIS=m
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
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_CHACHA20=m
CONFIG_CRYPTO_CHACHA20_X86_64=m
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
CONFIG_CRYPTO_USER_API_RNG=y
# CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# CONFIG_CRYPTO_STATS is not set
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=m
# CONFIG_CRYPTO_LIB_CHACHA is not set
# CONFIG_CRYPTO_LIB_CURVE25519 is not set
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=m
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=m
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
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
# CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
CONFIG_CRYPTO_DEV_QAT=m
CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
CONFIG_CRYPTO_DEV_QAT_C3XXX=m
CONFIG_CRYPTO_DEV_QAT_C62X=m
# CONFIG_CRYPTO_DEV_QAT_4XXX is not set
CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
CONFIG_CRYPTO_DEV_QAT_C62XVF=m
CONFIG_CRYPTO_DEV_NITROX=m
CONFIG_CRYPTO_DEV_NITROX_CNN55XX=m
# CONFIG_CRYPTO_DEV_VIRTIO is not set
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
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
# CONFIG_SYSTEM_REVOCATION_LIST is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
CONFIG_RAID6_PQ_BENCHMARK=y
CONFIG_LINEAR_RANGES=m
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
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
CONFIG_CRC7=m
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
CONFIG_ZSTD_DECOMPRESS=y
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
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_TEXTSEARCH=y
CONFIG_TEXTSEARCH_KMP=m
CONFIG_TEXTSEARCH_BM=m
CONFIG_TEXTSEARCH_FSM=m
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

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
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
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
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACK_HASH_ORDER=20
CONFIG_SBITMAP=y
# CONFIG_STRING_SELFTEST is not set
# end of Library routines

CONFIG_ASN1_ENCODER=y

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_BOOT_PRINTK_DELAY=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=2048
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_STACK_VALIDATION=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
# CONFIG_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
# end of Generic Kernel Debugging Instruments

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
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SLUB_DEBUG_ON is not set
# CONFIG_SLUB_STATS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
# CONFIG_DEBUG_VIRTUAL is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# CONFIG_KASAN is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=0
CONFIG_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
CONFIG_HARDLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=1
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

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
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
# CONFIG_DEBUG_PLIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_RCU_SCALE_TEST is not set
# CONFIG_RCU_TORTURE_TEST is not set
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_TRACE is not set
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
# CONFIG_BOOTTIME_TRACING is not set
CONFIG_FUNCTION_TRACER=y
CONFIG_FUNCTION_GRAPH_TRACER=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_FUNCTION_PROFILER=y
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
# CONFIG_OSNOISE_TRACER is not set
# CONFIG_TIMERLAT_TRACER is not set
# CONFIG_MMIOTRACE is not set
CONFIG_FTRACE_SYSCALLS=y
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_BLK_DEV_IO_TRACE=y
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
# CONFIG_BPF_KPROBE_OVERRIDE is not set
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_CC=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
# CONFIG_TRACE_EVENT_INJECT is not set
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
# CONFIG_HIST_TRIGGERS_DEBUG is not set
CONFIG_PROVIDE_OHCI1394_DMA_INIT=y
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
CONFIG_STRICT_DEVMEM=y
# CONFIG_IO_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
# CONFIG_DEBUG_TLBFLUSH is not set
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
# CONFIG_X86_DEBUG_FPU is not set
# CONFIG_PUNIT_ATOM_DEBUG is not set
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
# CONFIG_KUNIT_TEST is not set
# CONFIG_KUNIT_EXAMPLE_TEST is not set
CONFIG_KUNIT_ALL_TESTS=m
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
CONFIG_FAULT_INJECTION=y
# CONFIG_FAILSLAB is not set
# CONFIG_FAIL_PAGE_ALLOC is not set
# CONFIG_FAULT_INJECTION_USERCOPY is not set
CONFIG_FAIL_MAKE_REQUEST=y
# CONFIG_FAIL_IO_TIMEOUT is not set
# CONFIG_FAIL_FUTEX is not set
CONFIG_FAULT_INJECTION_DEBUG_FS=y
# CONFIG_FAIL_FUNCTION is not set
# CONFIG_FAIL_MMC_REQUEST is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_KCOV is not set
CONFIG_RUNTIME_TESTING_MENU=y
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_TEST_MIN_HEAP is not set
# CONFIG_TEST_SORT is not set
# CONFIG_TEST_DIV64 is not set
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
# CONFIG_TEST_STRSCPY is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_TEST_PRINTF is not set
# CONFIG_TEST_SCANF is not set
# CONFIG_TEST_BITMAP is not set
# CONFIG_TEST_UUID is not set
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_HASH is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
# CONFIG_TEST_VMALLOC is not set
# CONFIG_TEST_USER_COPY is not set
CONFIG_TEST_BPF=m
# CONFIG_TEST_BLACKHOLE_DEV is not set
# CONFIG_FIND_BIT_BENCHMARK is not set
# CONFIG_TEST_FIRMWARE is not set
# CONFIG_TEST_SYSCTL is not set
CONFIG_BITFIELD_KUNIT=m
CONFIG_RESOURCE_KUNIT_TEST=m
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
CONFIG_LINEAR_RANGES_TEST=m
CONFIG_CMDLINE_KUNIT_TEST=m
CONFIG_BITS_TEST=m
CONFIG_SLUB_KUNIT_TEST=m
CONFIG_RATIONAL_KUNIT_TEST=m
# CONFIG_TEST_UDELAY is not set
# CONFIG_TEST_STATIC_KEYS is not set
# CONFIG_TEST_KMOD is not set
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_LIVEPATCH is not set
# CONFIG_TEST_STACKINIT is not set
# CONFIG_TEST_MEMINIT is not set
# CONFIG_TEST_HMM is not set
# CONFIG_TEST_FREE_PAGES is not set
# CONFIG_TEST_FPU is not set
# CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='ltp'
	export testcase='ltp'
	export category='functional'
	export need_modules=true
	export need_memory='7G'
	export job_origin='ltp-part5.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='lkp-ivb-d05'
	export tbox_group='lkp-ivb-d05'
	export kconfig='x86_64-rhel-8.3'
	export submit_id='610290f244b8b04fd7ff6fe4'
	export job_file='/lkp/jobs/scheduled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-85975-1sj1wy-5.yaml'
	export id='faf9202ff425dda4b171b25ce419c046d86010a5'
	export queuer_version='/lkp-src'
	export model='Ivy Bridge'
	export nr_node=1
	export nr_cpu=4
	export memory='8G'
	export nr_ssd_partitions=1
	export nr_hdd_partitions=4
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402S31P2GGN-part2'
	export hdd_partitions='/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DARLY7-part*'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402S31P2GGN-part1'
	export brand='Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz'
	export need_kconfig='BLK_DEV_SD
SCSI
{"BLOCK"=>"y"}
SATA_AHCI
SATA_AHCI_PLATFORM
ATA
{"PCI"=>"y"}
BLK_DEV_LOOP
{"CAN"=>"m"}
{"CAN_RAW"=>"m"}
{"CAN_VCAN"=>"m"}
{"IPV6_VTI"=>"m"}
{"MINIX_FS"=>"m"}
{"CHECKPOINT_RESTORE"=>"y"}
F2FS_FS'
	export commit='9f6a5d4177019d66e24ab542a3fd28b78bd379a6'
	export netconsole_port=6679
	export ucode='0x21'
	export need_kconfig_hw='{"NET_VENDOR_REALTEK"=>"y"}
{"R8169"=>"y"}
SATA_AHCI
DRM_I915'
	export bisect_dmesg=true
	export enqueue_time='2021-07-29 19:28:51 +0800'
	export _id='6102910544b8b04fd7ff6fe8'
	export _rt='/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6'
	export user='lkp'
	export compiler='gcc-9'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='3b06d31dba9b6f892faa1ea719916c9d68e5dbd0'
	export base_commit='ff1176468d368232b684f75e82563369208bc371'
	export branch='f2fs/dev-test'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/3'
	export scheduler_version='/lkp/lkp/.src-20210728-191903'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-85975-1sj1wy-5.yaml
ARCH=x86_64
kconfig=x86_64-rhel-8.3
branch=f2fs/dev-test
commit=9f6a5d4177019d66e24ab542a3fd28b78bd379a6
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.14.0-rc1-00014-g9f6a5d417701
max_uptime=2100
RESULT_ROOT=/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/3
LKP_SERVER=internal-lkp-server
nokaslr
selinux=0
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/modules.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210724.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210724.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20210222.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='5.14.0-rc3'
	export repeat_to=6
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.14.0-rc1-00014-g9f6a5d417701'
	export dequeue_time='2021-07-29 19:43:13 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-85975-1sj1wy-5.cgz'

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

	run_setup nr_hdd=1 $LKP_SRC/setup/disk

	run_setup fs='f2fs' $LKP_SRC/setup/fs

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='ltp-aiodio.part2' $LKP_SRC/tests/wrapper ltp
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='ltp-aiodio.part2' $LKP_SRC/stats/wrapper ltp
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

--g7w8+K/95kPelPD2
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
VAYAAYmpAaGXDXhcaqexxGf7AgAAAAAEWVo=

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ltp
Content-Transfer-Encoding: quoted-printable

2021-07-29 11:44:50 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2021-07-29 11:44:50 ./runltp -f ltp-aiodio.part2 -d /fs/sdb1/tmpdir
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
PRETTY_NAME=3D"Debian GNU/Linux 10 (buster)"
NAME=3D"Debian GNU/Linux"
VERSION_ID=3D"10"
VERSION=3D"10 (buster)"
VERSION_CODENAME=3Dbuster
ID=3Ddebian
HOME_URL=3D"https://www.debian.org/"
SUPPORT_URL=3D"https://www.debian.org/support"
BUG_REPORT_URL=3D"https://bugs.debian.org/"

uname:
Linux lkp-ivb-d05 5.14.0-rc1-00014-g9f6a5d417701 #1 SMP Thu Jul 29 17:25:14=
 CST 2021 x86_64 GNU/Linux

/proc/cmdline
ip=3D::::lkp-ivb-d05::dhcp root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sche=
duled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=3D0x21-debian-10.4-x=
86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-85975-=
1sj1wy-5.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8.3 branch=3Df2fs/dev-tes=
t commit=3D9f6a5d4177019d66e24ab542a3fd28b78bd379a6 BOOT_IMAGE=3D/pkg/linux=
/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.1=
4.0-rc1-00014-g9f6a5d417701 max_uptime=3D2100 RESULT_ROOT=3D/result/ltp/1HD=
D-f2fs-ltp-aiodio.part2-ucode=3D0x21/lkp-ivb-d05/debian-10.4-x86_64-2020060=
3.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/3 LKP_=
SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Ddebug sysrq_a=
lways_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.d=
evkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpan=
ic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_lev=
el=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=
=3DttyS0,115200 vga=3Dnormal rw

Gnu C                  gcc (Debian 8.3.0-6) 8.3.0
Clang                =20
Gnu make               4.2.1
util-linux             2.33.1
mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs=
, namespaces, assert, debug)
modutils               26
e2fsprogs              1.44.5
Linux C Library        > libc.2.28
Dynamic linker (ldd)   2.28
Procps                 3.3.15
Net-tools              2.10-alpha
iproute2               iproute2-ss190107
iputils                iputils-s20180629
ethtool                4.19
Kbd                    119:
Sh-utils               8.30
Modules Loaded         dm_mod f2fs crc32_generic netconsole btrfs blake2b_g=
eneric xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg i915 intel_gtt=
 intel_rapl_msr intel_rapl_common ttm x86_pkg_temp_thermal intel_powerclamp=
 coretemp crct10dif_pclmul crc32_pclmul crc32c_intel drm_kms_helper ghash_c=
lmulni_intel ahci rapl libahci syscopyarea sysfillrect sysimgblt intel_csta=
te fb_sys_fops mei_me usb_storage intel_uncore ipmi_devintf ipmi_msghandler=
 drm libata mei video ip_tables

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:        8015872      352832     5032652       13356     2630388     493=
3272
Swap:             0           0           0

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       36 bits physical, 48 bits virtual
CPU(s):              4
On-line CPU(s) list: 0-3
Thread(s) per core:  2
Core(s) per socket:  2
Socket(s):           1
NUMA node(s):        1
Vendor ID:           GenuineIntel
CPU family:          6
Model:               58
Model name:          Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
Stepping:            9
CPU MHz:             3300.000
CPU max MHz:         3300.0000
CPU min MHz:         1600.0000
BogoMIPS:            6584.73
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            3072K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall n=
x rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl est tm2 ssse3 =
cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt tsc_deadline_timer xsave avx f16c =
lahf_lm cpuid_fault epb pti ssbd ibrs ibpb stibp fsgsbase smep erms xsaveop=
t dtherm arat pln pts md_clear flush_l1d

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2566     -n 2566 -=
p -f /fs/sdb1/tmpdir/ltp-XrbgPg14q1/alltests -l /lkp/benchmarks/ltp/results=
/LTP_RUN_ON-2021_07_29-11h_44m_50s.log  -C /lkp/benchmarks/ltp/output/LTP_R=
UN_ON-2021_07_29-11h_44m_50s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_O=
N-2021_07_29-11h_44m_50s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_07_29-11h_44m_50s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_07_29-11h_4=
4m_50s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_07_29-11h_44=
m_50s.tconf
Running tests.......
<<<test_start>>>
tag=3DADSP000 stime=3D1627559090
cmdline=3D"aiodio_sparse"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D14 cstime=3D29
<<<test_end>>>
<<<test_start>>>
tag=3DADSP001 stime=3D1627559092
cmdline=3D"aiodio_sparse -s 180k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP002 stime=3D1627559093
cmdline=3D"aiodio_sparse -dd -s 1751k -w 11k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 2706 has opened 'aiodio_sparse' for reading
Child 2706 loop 0
Child 2706 loop 1
Child 2706 loop 2
Child 2706 loop 3
Child 2706 loop 4
Child 2706 loop 5
Child 2706 loop 6
Child 2706 loop 7
Child 2706 loop 8
Child 2706 loop 9
Child 2706 loop 10
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  io_submit() returned 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_Child 2706 loop 11
sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7ffd647a6b10 filesize=
 1793024 inflight 16
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 11264 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP003 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 9 -d -s 180k -w 18k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 2711 has opened 'aiodio_sparse' for reading
Child 2711 loop 0
Child 2711 loop 1
Child 2711 loop 2
Child 2711 loop 3
Child 2711 loop 4
Child 2711 loop 5
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 55296
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  io_submit() returned 9
aiodio_sparse    0  TINFO  :  aiodio_sparse: offset 0x7fff656a2210 filesize=
 184320 inflight 9
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() returned 1
aiodio_sparse    0  TINFO  :  aiodio_sparse: io_getevent() res 18432 res2 0
aiodio_sparse    0  TINFO  :  io_submit() return 1
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TFAIL  :  aiodio_sparse.c:309: 1 children(s) exited abn=
ormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP004 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 2k -w 2k -s 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 2048
non-zero read at offset 2048
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TFAIL  :  aiodio_sparse.c:309: 2 children(s) exited abn=
ormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP005 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 4k -w 4k -s 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP006 stime=3D1627559093
cmdline=3D"aiodio_sparse -i 2 -a 4k -w 4k -s 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP007 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 8k -s 32k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP008 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16k -s 64k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP009 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 32k -s 128k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP010 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 64k -s 256k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP011 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 128k -s 512k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP012 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 256k -s 1024k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP013 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 512k -s 2048k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP014 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP015 stime=3D1627559094
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 2048k -s 8192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP016 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP017 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 8192k -s 32768k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D6
<<<test_end>>>
<<<test_start>>>
tag=3DADSP018 stime=3D1627559095
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3DADSP019 stime=3D1627559096
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 4"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D12
<<<test_end>>>
<<<test_start>>>
tag=3DADSP020 stime=3D1627559097
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 16384k -s 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D14
<<<test_end>>>
<<<test_start>>>
tag=3DADSP021 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 128k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP022 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 256k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP023 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 512k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP024 stime=3D1627559098
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 1024k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP025 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 2048k -s 8192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP026 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D5
<<<test_end>>>
<<<test_start>>>
tag=3DADSP027 stime=3D1627559099
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 72768k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D16
<<<test_end>>>
<<<test_start>>>
tag=3DADSP028 stime=3D1627559101
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D12 cstime=3D73
<<<test_end>>>
<<<test_start>>>
tag=3DADSP029 stime=3D1627559106
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 65536k -s 262144k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D32 cstime=3D52
<<<test_end>>>
<<<test_start>>>
tag=3DADSP030 stime=3D1627559109
cmdline=3D"aiodio_sparse -i 6 -a 8k -w 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D15 cstime=3D19
<<<test_end>>>
<<<test_start>>>
tag=3DADSP031 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 8 -a 8k -w 128k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP032 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 16 -a 8k -w 256k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP033 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 32 -a 8k -w 512k -s 16384k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D8 cstime=3D6
<<<test_end>>>
<<<test_start>>>
tag=3DADSP034 stime=3D1627559111
cmdline=3D"aiodio_sparse -i 64 -a 8k -w 1024k -s 65536k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D21 cstime=3D22
<<<test_end>>>
<<<test_start>>>
tag=3DADSP035 stime=3D1627559113
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 32"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP036 stime=3D1627559113
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 4096k -s 16384k -n 64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D41 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3DADSP037 stime=3D1627559114
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -s 72768k -n 128"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D260 cstime=3D73
<<<test_end>>>
<<<test_start>>>
tag=3DADSP038 stime=3D1627559116
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -n 512"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D8 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2148 cstime=3D535
<<<test_end>>>
<<<test_start>>>
tag=3DADSP039 stime=3D1627559124
cmdline=3D"aiodio_sparse -i 4 -a 8k -w 18192k -n 1000"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
aiodio_sparse    0  TINFO  :  Dirtying free blocks
aiodio_sparse    0  TINFO  :  Starting I/O tests
aiodio_sparse    0  TINFO  :  Killing childrens(s)
aiodio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D20 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5953 cstime=3D1488
<<<test_end>>>
<<<test_start>>>
tag=3DADSP040 stime=3D1627559144
cmdline=3D"dio_sparse"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[0] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 0
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D2 cstime=3D27
<<<test_end>>>
<<<test_start>>>
tag=3DADSP041 stime=3D1627559145
cmdline=3D"dio_sparse -s 180k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP042 stime=3D1627559145
cmdline=3D"dio_sparse -dd -s 1751k -w 11k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 4750 has opened 'dio_sparse' for reading
Child 4750 loop 0
non zero buffer at buf[3072] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 11264
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP043 stime=3D1627559146
cmdline=3D"dio_sparse  -d -s 180k -w 18k"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
Child 4752 has opened 'dio_sparse' for reading
Child 4752 loop 0
Child 4752 loop 1
Child 4752 loop 2
Child 4752 loop 3
Child 4752 loop 4
Child 4752 loop 5
non zero buffer at buf[2048] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 92160
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP044 stime=3D1627559146
cmdline=3D"dio_sparse  -a 2k -w 2k -s 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
non zero buffer at buf[0] =3D> 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
non-zero read at offset 0
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TFAIL  :  dio_sparse.c:190: 1 children(s) exited abnormally
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP045 stime=3D1627559146
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP046 stime=3D1627559146
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP047 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 16k -s 16k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP048 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 32k -s 32k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP049 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 64k -s 64k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP050 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 128k -s 128k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP051 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP052 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP053 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP054 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 2048k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP055 stime=3D1627559146
cmdline=3D"dio_sparse  -a 8k -w 4096k -s 4096k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP056 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP057 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 18192k -s 18192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP058 stime=3D1627559147
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D24 cstime=3D84
<<<test_end>>>
<<<test_start>>>
tag=3DADSP059 stime=3D1627559153
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 4"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP060 stime=3D1627559154
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D10
<<<test_end>>>
<<<test_start>>>
tag=3DADSP061 stime=3D1627559154
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP062 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP063 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP064 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP065 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 2048k -s 4096k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP066 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3DADSP067 stime=3D1627559155
cmdline=3D"dio_sparse  -a 8k -w 18192k -s 18192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D4
<<<test_end>>>
<<<test_start>>>
tag=3DADSP068 stime=3D1627559156
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D13 cstime=3D71
<<<test_end>>>
<<<test_start>>>
tag=3DADSP069 stime=3D1627559161
cmdline=3D"dio_sparse  -a 8k -w 58192k -s 58192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3DADSP070 stime=3D1627559162
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D45 cstime=3D86
<<<test_end>>>
<<<test_start>>>
tag=3DADSP071 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 256k -s 256k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP072 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 512k -s 512k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP073 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 1024k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP074 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 1024k -s 2048k -n 6"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP075 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 4096k -s 4096k -n 32"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D6 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3DADSP076 stime=3D1627559168
cmdline=3D"dio_sparse  -a 8k -w 8192k -s 8192k -n 64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D44 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3DADSP077 stime=3D1627559169
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 18192k -n 128"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D8 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1757 cstime=3D397
<<<test_end>>>
<<<test_start>>>
tag=3DADSP078 stime=3D1627559177
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 512"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D32 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D9129 cstime=3D2153
<<<test_end>>>
<<<test_start>>>
tag=3DADSP079 stime=3D1627559209
cmdline=3D"dio_sparse  -a 8k -w 518192k -s 518192k -n 1000"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D66 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19295 cstime=3D4735
<<<test_end>>>
<<<test_start>>>
tag=3DADSP080 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -o 2k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP081 stime=3D1627559275
cmdline=3D"dio_sparse  -a 2k -w 2k -s 1k -o 1k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP082 stime=3D1627559275
cmdline=3D"dio_sparse  -a 1k -w 1k -s 512 -o 512 -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP083 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 2k -o 3k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3DADSP084 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 4k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP085 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 6k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP086 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 4k -s 4k -o 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3DADSP087 stime=3D1627559275
cmdline=3D"dio_sparse  -a 4k -w 16k -s 8k -o 8k -n 2"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
dio_sparse    0  TINFO  :  Dirtying free blocks
dio_sparse    0  TINFO  :  Starting I/O tests
dio_sparse    0  TINFO  :  Killing childrens(s)
dio_sparse    1  TPASS  :  Test passed
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20210524-202-gc7f979b3d

       ###############################################################

            Done executing testcases.
            LTP Version:  20210524-202-gc7f979b3d
       ###############################################################


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---
:#! jobs/ltp-part5.yaml:
suite: ltp
testcase: ltp
category: functional
need_modules: true
need_memory: 7G
disk: 1HDD
fs: f2fs
ltp:
  test: ltp-aiodio.part2
job_origin: ltp-part5.yaml
:#! queue options:
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-ivb-d05
tbox_group: lkp-ivb-d05
kconfig: x86_64-rhel-8.3
submit_id: 610272f544b8b0432e1dea2e
job_file: "/lkp/jobs/scheduled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-82734-1mbpy9-0.yaml"
id: b877af8bc319f0c34bb1588b3d3c3916c05c14a6
queuer_version: "/lkp-src"
:#! hosts/lkp-ivb-d05:
model: Ivy Bridge
nr_node: 1
nr_cpu: 4
memory: 8G
nr_ssd_partitions: 1
nr_hdd_partitions: 4
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402S31P2GGN-part2"
hdd_partitions: "/dev/disk/by-id/ata-ST1000DM003-1CH162_Z1DARLY7-part*"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB012T4_BTWD422402S31P2GGN-part1"
brand: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz
:#! include/category/functional:
kmsg:
heartbeat:
meminfo:
:#! include/disk/nr_hdd:
need_kconfig:
- BLK_DEV_SD
- SCSI
- BLOCK: y
- SATA_AHCI
- SATA_AHCI_PLATFORM
- ATA
- PCI: y
- BLK_DEV_LOOP
- CAN: m
- CAN_RAW: m
- CAN_VCAN: m
- IPV6_VTI: m
- MINIX_FS: m
- CHECKPOINT_RESTORE: y
- F2FS_FS
:#! include/ltp:
:#! include/queue/cyclic:
commit: 9f6a5d4177019d66e24ab542a3fd28b78bd379a6
:#! include/testbox/lkp-ivb-d05:
netconsole_port: 6679
ucode: '0x21'
need_kconfig_hw:
- NET_VENDOR_REALTEK: y
- R8169: y
- SATA_AHCI
- DRM_I915
bisect_dmesg: true
:#! include/fs/OTHERS:
enqueue_time: 2021-07-29 17:20:53.805223954 +08:00
_id: 610272f544b8b0432e1dea2e
_rt: "/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6"
:#! schedule options:
user: lkp
compiler: gcc-9
LKP_SERVER: internal-lkp-server
head_commit: 3b06d31dba9b6f892faa1ea719916c9d68e5dbd0
base_commit: ff1176468d368232b684f75e82563369208bc371
branch: linux-devel/devel-hourly-20210729-040643
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/0"
scheduler_version: "/lkp/lkp/.src-20210728-191903"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- user=lkp
- job=/lkp/jobs/scheduled/lkp-ivb-d05/ltp-1HDD-f2fs-ltp-aiodio.part2-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9f6a5d4177019d66e24ab542a3fd28b78bd379a6-20210729-82734-1mbpy9-0.yaml
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- branch=linux-devel/devel-hourly-20210729-040643
- commit=9f6a5d4177019d66e24ab542a3fd28b78bd379a6
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.14.0-rc1-00014-g9f6a5d417701
- max_uptime=2100
- RESULT_ROOT=/result/ltp/1HDD-f2fs-ltp-aiodio.part2-ucode=0x21/lkp-ivb-d05/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/0
- LKP_SERVER=internal-lkp-server
- nokaslr
- selinux=0
- debug
- apic=debug
- sysrq_always_enabled
- rcupdate.rcu_cpu_stall_timeout=100
- net.ifnames=0
- printk.devkmsg=on
- panic=-1
- softlockup_panic=1
- nmi_watchdog=panic
- oops=panic
- load_ramdisk=2
- prompt_ramdisk=0
- drbd.minor_count=8
- systemd.log_level=err
- ignore_loglevel
- console=tty0
- earlyprintk=ttyS0,115200
- console=ttyS0,115200
- vga=normal
- rw
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/modules.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210724.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210724.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn
:#! /lkp/lkp/.src-20210728-191903/include/site/inn:
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
:#! runtime status:
last_kernel: 5.14.0-rc3-intel-next-00966-g51ee7201d2bf
:#! user overrides:
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/9f6a5d4177019d66e24ab542a3fd28b78bd379a6/vmlinuz-5.14.0-rc1-00014-g9f6a5d417701"
dequeue_time: 2021-07-29 17:58:04.307356297 +08:00
job_state: finished
loadavg: 663.87 255.70 94.91 1/226 7021
start_time: '1627552794'
end_time: '1627552981'
version: "/lkp/lkp/.src-20210728-191934:cceb8212:b57eb1679"

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

dmsetup remove_all
wipefs -a --force /dev/sdb1
mkfs -t f2fs /dev/sdb1
mkdir -p /fs/sdb1
mount -t f2fs /dev/sdb1 /fs/sdb1
ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
./runltp -f ltp-aiodio.part2 -d /fs/sdb1/tmpdir

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--g7w8+K/95kPelPD2--
