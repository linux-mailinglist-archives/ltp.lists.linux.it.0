Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A6401001
	for <lists+linux-ltp@lfdr.de>; Sun,  5 Sep 2021 15:28:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCFB53C9551
	for <lists+linux-ltp@lfdr.de>; Sun,  5 Sep 2021 15:28:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8F503C2702
 for <ltp@lists.linux.it>; Sun,  5 Sep 2021 15:28:25 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F4DA100094C
 for <ltp@lists.linux.it>; Sun,  5 Sep 2021 15:28:16 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10097"; a="217919159"
X-IronPort-AV: E=Sophos;i="5.85,269,1624345200"; 
 d="xz'?yaml'?scan'208";a="217919159"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2021 06:28:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,269,1624345200"; 
 d="xz'?yaml'?scan'208";a="535927235"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.41])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2021 06:28:08 -0700
Date: Sun, 5 Sep 2021 21:45:41 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20210905134541.GD15026@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [xattr]  6e21a50861: ltp.setxattr02.fail
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
Cc: lkp@lists.01.org, lkp@intel.com, ltp@lists.linux.it
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 6e21a5086100cebefd21a3058a9e1160668f84fa ("xattr: Allow user.* xatt=
r on symlink and special files")
https://github.com/rhvgoyal/linux user-xattr-symlink-v3


in testcase: ltp
version: ltp-x86_64-14c1f76-1_20210903
with following parameters:

	disk: 1HDD
	fs: xfs
	test: syscalls-02
	ucode: 0xffff0190

test-description: The LTP testsuite contains a collection of tools for test=
ing the Linux kernel and related features.
test-url: http://linux-test-project.github.io/


on test machine: 256 threads 2 sockets Intel(R) Genuine Intel(R) CPU 0000 @=
 1.30GHz with 112G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):




If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>

2021-09-03 18:44:43 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2021-09-03 18:44:44 ./runltp -f syscalls-02 -d /fs/sda1/tmpdir
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
Linux lkp-knl-f1 5.14.0-00001-g6e21a5086100 #1 SMP Fri Sep 3 06:41:13 CST 2=
021 x86_64 GNU/Linux

/proc/cmdline
ip=3D::::lkp-knl-f1::dhcp root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sched=
uled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=3D0xffff0190-debian-10.4-x86=
_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-50479-1q=
f5j0y-2.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8.3 branch=3Drhvgoyal/user=
-xattr-symlink-v3 commit=3D6e21a5086100cebefd21a3058a9e1160668f84fa BOOT_IM=
AGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f=
84fa/vmlinuz-5.14.0-00001-g6e21a5086100 max_uptime=3D2100 RESULT_ROOT=3D/re=
sult/ltp/1HDD-xfs-syscalls-02-ucode=3D0xffff0190/lkp-knl-f1/debian-10.4-x86=
_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f=
84fa/3 LKP_SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Dde=
bug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=
=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpan=
ic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 sy=
stemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,11=
5200 console=3DttyS0,115200 vga=3Dnormal rw

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
Modules Loaded         xfs dm_mod intel_rapl_msr intel_rapl_common btrfs bl=
ake2b_generic xor zstd_compress sb_edac raid6_pq libcrc32c x86_pkg_temp_the=
rmal intel_powerclamp coretemp sd_mod t10_pi sg kvm_intel kvm irqbypass crc=
t10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel mgag200 rapl dr=
m_kms_helper ipmi_ssif intel_cstate syscopyarea sysfillrect sysimgblt ahci =
fb_sys_fops libahci intel_uncore mei_me drm libata acpi_ipmi mei joydev ipm=
i_si wmi ipmi_devintf ipmi_msghandler acpi_power_meter acpi_pad ip_tables

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:      107074092     1351308   103001600       26592     2721184   10237=
2180
Swap:             0           0           0

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       46 bits physical, 48 bits virtual
CPU(s):              256
On-line CPU(s) list: 0-255
Thread(s) per core:  4
Core(s) per socket:  64
Socket(s):           1
NUMA node(s):        2
Vendor ID:           GenuineIntel
CPU family:          6
Model:               87
Model name:          Intel(R) Genuine Intel(R) CPU 0000 @ 1.30GHz
Stepping:            1
CPU MHz:             1500.000
CPU max MHz:         1500.0000
CPU min MHz:         1000.0000
BogoMIPS:            2593.99
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
NUMA node0 CPU(s):   0-255
NUMA node1 CPU(s):  =20
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall n=
x pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopol=
ogy nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx es=
t tm2 ssse3 fma cx16 xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadli=
ne_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch ring3mwait cpu=
id_fault epb pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust =
bmi1 avx2 smep bmi2 erms avx512f rdseed adx avx512pf avx512er avx512cd xsav=
eopt dtherm ida arat pln pts

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 5154     -n 5154 -=
p -f /fs/sda1/tmpdir/ltp-r9GWHcZ5yU/alltests -l /lkp/benchmarks/ltp/results=
/LTP_RUN_ON-2021_09_03-18h_44m_44s.log  -C /lkp/benchmarks/ltp/output/LTP_R=
UN_ON-2021_09_03-18h_44m_44s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_O=
N-2021_09_03-18h_44m_44s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_09_03-18h_44m_44s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_09_03-18h_4=
4m_44s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_09_03-18h_44=
m_44s.tconf
Running tests.......
<<<test_start>>>
tag=3Daccept02 stime=3D1630694685
cmdline=3D"accept02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
tst_buffers.c:55: TINFO: Test is using guarded buffers
accept02.c:130: TINFO: Starting listener on port: 34171
accept02.c:74: TPASS: Multicast group was not copied: EADDRNOTAVAIL (99)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dadd_key02 stime=3D1630694685
cmdline=3D"add_key02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
add_key02.c:60: TPASS: received expected EFAULT with key type 'asymmetric'
add_key02.c:60: TPASS: received expected EFAULT with key type 'cifs.idmap'
add_key02.c:60: TPASS: received expected EFAULT with key type 'cifs.spnego'
add_key02.c:60: TPASS: received expected EFAULT with key type 'pkcs7_test'
add_key02.c:60: TPASS: received expected EFAULT with key type 'rxrpc'
add_key02.c:60: TPASS: received expected EFAULT with key type 'rxrpc_s'
add_key02.c:60: TPASS: received expected EFAULT with key type 'user'
add_key02.c:60: TPASS: received expected EFAULT with key type 'logon'
add_key02.c:60: TPASS: received expected EFAULT with key type 'big_key'

Summary:
passed   9
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dadd_key05 stime=3D1630694685
cmdline=3D"add_key05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
add_key05.c:45: TINFO: Created user ltp_add_key05_0
add_key05.c:186: TINFO: User: 0, UID: 1091
add_key05.c:83: TINFO: test max bytes under unprivileged user
add_key05.c:108: TPASS: add_key(test_inv) failed as expected: EDQUOT (122)
add_key05.c:131: TPASS: add_key(test_max) succeeded as expected
add_key05.c:134: TPASS: allow reaching the max bytes exactly
add_key05.c:45: TINFO: Created user ltp_add_key05_1
add_key05.c:186: TINFO: User: 1, UID: 1092
add_key05.c:144: TINFO: test max keys under unprivileged user
add_key05.c:162: TPASS: add_key(test_invalid_key) failed as expected: EDQUO=
T (122)
add_key05.c:169: TPASS: allow reaching the max key(200) exactly
userdel: ltp_add_key05_1 mail spool (/var/mail/ltp_add_key05_1) not found
userdel: ltp_add_key05_1 home directory (/home/ltp_add_key05_1) not found
userdel: ltp_add_key05_0 mail spool (/var/mail/ltp_add_key05_0) not found
userdel: ltp_add_key05_0 home directory (/home/ltp_add_key05_0) not found

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D57 cstime=3D85
<<<test_end>>>
<<<test_start>>>
tag=3Dadjtimex01 stime=3D1630694686
cmdline=3D"adjtimex01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
adjtimex01.c:24: TPASS: adjtimex() with mode 0x403f=20
adjtimex01.c:34: TPASS: adjtimex() with mode 0x8001=20

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dalarm06 stime=3D1630694686
cmdline=3D"alarm06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
alarm06.c:54: TPASS: Received 0 alarms
alarm06.c:57: TPASS: alarm(0) returned 1

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dcapset02 stime=3D1630694689
cmdline=3D"capset02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
capset02.c:67: TPASS: capset() with bad address header : EFAULT (14)
capset02.c:67: TPASS: capset() with bad address data : EFAULT (14)
capset02.c:67: TPASS: capset() with bad version : EINVAL (22)
capset02.c:67: TPASS: capset() with bad value data(when pE is not in pP) : =
EPERM (1)
capset02.c:67: TPASS: capset() with bad value data(when pP is not in old pP=
) : EPERM (1)
capset02.c:67: TPASS: capset() with bad value data(when pI is not in boundi=
ng set or old pI) : EPERM (1)

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dchdir04 stime=3D1630694689
cmdline=3D"chdir04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chdir04.c:29: TPASS: chdir() : ENAMETOOLONG (36)
chdir04.c:29: TPASS: chdir() : ENOENT (2)
chdir04.c:29: TPASS: chdir() : EFAULT (14)

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchmod03 stime=3D1630694689
cmdline=3D"chmod03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chmod03.c:43: TPASS: chmod(testfile, 1777) passed
chmod03.c:55: TPASS: stat(testfile) mode=3D101777
chmod03.c:43: TPASS: chmod(testdir_3, 1777) passed
chmod03.c:55: TPASS: stat(testdir_3) mode=3D41777

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dchmod05 stime=3D1630694689
cmdline=3D"chmod05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chmod05.c:65: TPASS: Functionality of chmod(testdir, 043777) successful

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown03 stime=3D1630694689
cmdline=3D"chown03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chown03.c:64: TPASS: chown(chown03_testfile, -1, 65534) passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown05 stime=3D1630694689
cmdline=3D"chown05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chown05.c:43: TPASS: chown(testfile, 700, 701), change owner/group ids pass=
ed
chown05.c:43: TPASS: chown(testfile, 702, -1), change owner id only passed
chown05.c:43: TPASS: chown(testfile, 703, 701), change owner id only passed
chown05.c:43: TPASS: chown(testfile, -1, 704), change group id only passed
chown05.c:43: TPASS: chown(testfile, 703, 705), change group id only passed
chown05.c:43: TPASS: chown(testfile, -1, -1), no change passed

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown05_16 stime=3D1630694689
cmdline=3D"chown05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16=
=2Eh:153: TCONF: 16-bit version of chown() is not supported on your platform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dclock_gettime04 stime=3D1630694689
cmdline=3D"clock_gettime04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
clock_gettime04.c:170: TPASS: CLOCK_REALTIME: Difference between successive=
 readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:174: TINFO: 	- gettimeofday
clock_gettime04.c:170: TPASS: CLOCK_REALTIME_COARSE: Difference between suc=
cessive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC: Difference between successiv=
e readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC_COARSE: Difference between su=
ccessive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC_RAW: Difference between succe=
ssive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_BOOTTIME: Difference between successive=
 readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D7
<<<test_end>>>
<<<test_start>>>
tag=3Dleapsec01 stime=3D1630694690
cmdline=3D"leapsec01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
leapsec01.c:130: TINFO: test start at 18:44:50.154628683
leapsec01.c:100: TINFO: now is     18:44:50.155538204
leapsec01.c:104: TINFO: sleep until 18:44:51.155538204
leapsec01.c:112: TINFO: now is     18:44:51.155619032
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:138: TINFO: scheduling leap second 00:00:00.000000000
leapsec01.c:144: TINFO: setting time to        23:59:58.000000000
leapsec01.c:88: TINFO: 23:59:58.000278000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000389000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000432000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000473000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.500604000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:59.000880000 adjtimex: insert leap second
leapsec01.c:88: TINFO: 23:59:59.501054000 adjtimex: insert leap second
leapsec01.c:88: TINFO: 00:00:00.001243000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 23:59:59.510540000 adjtimex: leap second in progress
leapsec01.c:88: TINFO: 00:00:00.010796000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:00.511029000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:01.011205000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:01.511453000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:02.011675000 adjtimex: leap second has occurred
leapsec01.c:100: TINFO: now is     00:00:02.511918746
leapsec01.c:104: TINFO: sleep until 00:00:03.511918746
leapsec01.c:112: TINFO: now is     00:00:03.512002360
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:88: TINFO: 00:00:03.512147000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:03.512195000 adjtimex: clock synchronized
leapsec01.c:170: TINFO: restoring time to 18:44:55.666865335
leapsec01.c:100: TINFO: now is     18:44:55.667044158
leapsec01.c:104: TINFO: sleep until 18:44:56.667044158
leapsec01.c:112: TINFO: now is     18:44:56.667121337
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:177: TPASS: No errors were reported during this test!

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3Dclock_settime03 stime=3D1630694696
cmdline=3D"clock_settime03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
clock_settime03.c:35: TINFO: Testing variant: syscall with old kernel spec
clock_settime03.c:103: TPASS: clock_settime(): Y2038 test passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dclose_range02 stime=3D1630694699
cmdline=3D"close_range02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
close_range02.c:53: TPASS: close_range(4, 100, 0) passed
close_range02.c:55: TPASS: fcntl(4, F_GETFD) : EBADF (9)
close_range02.c:56: TPASS: fcntl(100, F_GETFD) : EBADF (9)
close_range02.c:59: TPASS: close_range(4, 3, 0) : EINVAL (22)
close_range02.c:62: TPASS: close_range(3, ~0U, ~0U) : EINVAL (22)
close_range02.c:65: TPASS: close_range(~0U, ~0U, 0) passed
close_range02.c:72: TPASS: close_range(4, 4, CLOSE_RANGE_CLOEXEC): SUCCESS =
(0)
close_range02.c:79: TPASS: FD_CLOEXEC was set on 4
close_range02.c:90: TPASS: close_range(4, 4, CLOSE_RANGE_UNSHARE): SUCCESS =
(0)
close_range02.c:96: TPASS: fcntl(4, F_GETFD) : EBADF (9)
close_range02.c:102: TPASS: 4 is open passed

Summary:
passed   11
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dcreat04 stime=3D1630694699
cmdline=3D"creat04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
creat04.c:49: TPASS: call failed with EACCES as expected
creat04.c:49: TPASS: call failed with EACCES as expected

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dcreat08 stime=3D1630694699
cmdline=3D"creat08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
creat08.c:45: TINFO: User nobody: uid =3D 65534, gid =3D 65534
creat08.c:46: TINFO: Found unused GID 11: SUCCESS (0)
creat08.c:62: TPASS: dir_a/nosetgid: Owned by correct group
creat08.c:73: TPASS: dir_a/nosetgid: Setgid bit not set
creat08.c:62: TPASS: dir_a/setgid: Owned by correct group
creat08.c:71: TPASS: dir_a/setgid: Setgid bit is set
creat08.c:62: TPASS: dir_b/nosetgid: Owned by correct group
creat08.c:73: TPASS: dir_b/nosetgid: Setgid bit not set
creat08.c:62: TPASS: dir_b/setgid: Owned by correct group
creat08.c:66: TINFO: dir_b/setgid: Skipping setgid bit check
creat08.c:62: TPASS: dir_b/root_setgid: Owned by correct group
creat08.c:71: TPASS: dir_b/root_setgid: Setgid bit is set

Summary:
passed   9
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Depoll_wait01 stime=3D1630694699
cmdline=3D"epoll_wait01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
epoll_wait01.c:46: TINFO: Pipe buffer size is 65536 bytes
epoll_wait01.c:128: TPASS: epoll_wait() epollout
epoll_wait01.c:166: TPASS: epoll_wait() epollin
epoll_wait01.c:213: TPASS: epoll_wait() epollio

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Deventfd2_03 stime=3D1630694699
cmdline=3D"eventfd2_03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
[5475] posting 1 on 5
[5475] waiting on 4
[5475] wait completed on 4: count=3D1
[5475] posting 1 on 5
[5475] waiting on 4
[5475] wait completed on 4: count=3D1
[5475] posting 5 on 5
[5475] waiting 5 times on 4
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5474] posting 1 on 4
[5474] waiting on 5
[5474] wait completed on 5: count=3D1
[5474] posting 1 on 4
[5474] waiting on 5
[5474] wait completed on 5: count=3D1
[5474] posting 5 on 4
[5474] waiting 5 times on 5
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dexecve03 stime=3D1630694699
cmdline=3D"execve03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
execve03.c:124: TPASS: execve failed as expected: ENAMETOOLONG (36)
execve03.c:124: TPASS: execve failed as expected: ENOENT (2)
execve03.c:124: TPASS: execve failed as expected: ENOTDIR (20)
execve03.c:124: TPASS: execve failed as expected: EFAULT (14)
execve03.c:124: TPASS: execve failed as expected: EACCES (13)
execve03.c:124: TPASS: execve failed as expected: ENOEXEC (8)

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfchdir01 stime=3D1630694699
cmdline=3D"fchdir01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fchdir01    1  TPASS  :  fchdir call succeeded
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfchmod01 stime=3D1630694700
cmdline=3D"fchmod01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 07) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 070) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0700) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 02777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 04777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 06777) successful

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfchown01 stime=3D1630694700
cmdline=3D"fchown01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fchown01.c:32: TPASS: fchown(4, 0, 0) passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl03 stime=3D1630694700
cmdline=3D"fcntl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fcntl03.c:33: TPASS: fcntl(fcntl03_5485, F_GETFD, 0) returned 0

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl05 stime=3D1630694700
cmdline=3D"fcntl05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl05     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl06_64 stime=3D1630694700
cmdline=3D"fcntl06_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl06     1  TCONF  :  fcntl06.c:109: system doesn't have LINUX_LOCK_FILE=
_REGION support
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl09 stime=3D1630694700
cmdline=3D"fcntl09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl09     1  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_WRLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_UNLCK returned 0
fcntl09     1  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_RDLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_UNLCK returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl12 stime=3D1630694700
cmdline=3D"fcntl12"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl12     0  TINFO  :  Test for errno EMFILE
fcntl12     1  TPASS  :  block 1 PASSED
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl12_64 stime=3D1630694700
cmdline=3D"fcntl12_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl12     0  TINFO  :  Test for errno EMFILE
fcntl12     1  TPASS  :  block 1 PASSED
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl14 stime=3D1630694700
cmdline=3D"fcntl14"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl14     0  TINFO  :  Enter block 1: without mandatory locking
fcntl14     1  TPASS  :  testcase:1 PASSED
fcntl14     2  TPASS  :  testcase:2 PASSED
fcntl14     3  TPASS  :  testcase:3 PASSED
fcntl14     4  TPASS  :  testcase:4 PASSED
fcntl14     5  TPASS  :  testcase:5 PASSED
fcntl14     6  TPASS  :  testcase:6 PASSED
fcntl14     7  TPASS  :  testcase:7 PASSED
fcntl14     8  TPASS  :  testcase:8 PASSED
fcntl14     9  TPASS  :  testcase:9 PASSED
fcntl14    10  TPASS  :  testcase:10 PASSED
fcntl14    11  TPASS  :  testcase:11 PASSED
fcntl14    12  TPASS  :  testcase:12 PASSED
fcntl14    13  TPASS  :  testcase:13 PASSED
fcntl14    14  TPASS  :  testcase:14 PASSED
fcntl14    15  TPASS  :  testcase:15 PASSED
fcntl14    16  TPASS  :  testcase:16 PASSED
fcntl14    17  TPASS  :  testcase:17 PASSED
fcntl14    18  TPASS  :  testcase:18 PASSED
fcntl14    19  TPASS  :  testcase:19 PASSED
fcntl14    20  TPASS  :  testcase:20 PASSED
fcntl14    21  TPASS  :  testcase:21 PASSED
fcntl14    22  TPASS  :  testcase:22 PASSED
fcntl14    23  TPASS  :  testcase:23 PASSED
fcntl14    24  TPASS  :  testcase:24 PASSED
fcntl14    25  TPASS  :  testcase:25 PASSED
fcntl14    26  TPASS  :  testcase:26 PASSED
fcntl14    27  TPASS  :  testcase:27 PASSED
fcntl14    28  TPASS  :  testcase:28 PASSED
fcntl14    29  TPASS  :  testcase:29 PASSED
fcntl14    30  TPASS  :  testcase:30 PASSED
fcntl14    31  TPASS  :  testcase:31 PASSED
fcntl14    32  TPASS  :  testcase:32 PASSED
fcntl14    33  TPASS  :  testcase:33 PASSED
fcntl14    34  TPASS  :  testcase:34 PASSED
fcntl14    35  TPASS  :  testcase:35 PASSED
fcntl14    36  TPASS  :  testcase:36 PASSED
fcntl14    37  TPASS  :  Block 1, test 1 PASSED
fcntl14    38  TPASS  :  testcase:37 PASSED
fcntl14    39  TPASS  :  testcase:38 PASSED
fcntl14    40  TPASS  :  testcase:39 PASSED
fcntl14    41  TPASS  :  testcase:40 PASSED
fcntl14    42  TPASS  :  testcase:41 PASSED
fcntl14    43  TPASS  :  testcase:42 PASSED
fcntl14    44  TPASS  :  testcase:43 PASSED
fcntl14    45  TPASS  :  testcase:44 PASSED
fcntl14    46  TPASS  :  testcase:45 PASSED
fcntl14    47  TPASS  :  Block 1, test 2 PASSED
fcntl14     0  TINFO  :  Exit block 1
fcntl14     0  TINFO  :  Enter block 2: with mandatory locking
fcntl14    48  TPASS  :  testcase:1 PASSED
fcntl14    49  TPASS  :  testcase:2 PASSED
fcntl14    50  TPASS  :  testcase:3 PASSED
fcntl14    51  TPASS  :  testcase:4 PASSED
fcntl14    52  TPASS  :  testcase:5 PASSED
fcntl14    53  TPASS  :  testcase:6 PASSED
fcntl14    54  TPASS  :  testcase:7 PASSED
fcntl14    55  TPASS  :  testcase:8 PASSED
fcntl14    56  TPASS  :  testcase:9 PASSED
fcntl14    57  TPASS  :  testcase:10 PASSED
fcntl14    58  TPASS  :  testcase:11 PASSED
fcntl14    59  TPASS  :  testcase:12 PASSED
fcntl14    60  TPASS  :  testcase:13 PASSED
fcntl14    61  TPASS  :  testcase:14 PASSED
fcntl14    62  TPASS  :  testcase:15 PASSED
fcntl14    63  TPASS  :  testcase:16 PASSED
fcntl14    64  TPASS  :  testcase:17 PASSED
fcntl14    65  TPASS  :  testcase:18 PASSED
fcntl14    66  TPASS  :  testcase:19 PASSED
fcntl14    67  TPASS  :  testcase:20 PASSED
fcntl14    68  TPASS  :  testcase:21 PASSED
fcntl14    69  TPASS  :  testcase:22 PASSED
fcntl14    70  TPASS  :  testcase:23 PASSED
fcntl14    71  TPASS  :  testcase:24 PASSED
fcntl14    72  TPASS  :  testcase:25 PASSED
fcntl14    73  TPASS  :  testcase:26 PASSED
fcntl14    74  TPASS  :  testcase:27 PASSED
fcntl14    75  TPASS  :  testcase:28 PASSED
fcntl14    76  TPASS  :  testcase:29 PASSED
fcntl14    77  TPASS  :  testcase:30 PASSED
fcntl14    78  TPASS  :  testcase:31 PASSED
fcntl14    79  TPASS  :  testcase:32 PASSED
fcntl14    80  TPASS  :  testcase:33 PASSED
fcntl14    81  TPASS  :  testcase:34 PASSED
fcntl14    82  TPASS  :  testcase:35 PASSED
fcntl14    83  TPASS  :  testcase:36 PASSED
fcntl14    84  TPASS  :  Block 2, test 1 PASSED
fcntl14    85  TPASS  :  testcase:37 PASSED
fcntl14    86  TPASS  :  testcase:38 PASSED
fcntl14    87  TPASS  :  testcase:39 PASSED
fcntl14    88  TPASS  :  testcase:40 PASSED
fcntl14    89  TPASS  :  testcase:41 PASSED
fcntl14    90  TPASS  :  testcase:42 PASSED
fcntl14    91  TPASS  :  testcase:43 PASSED
fcntl14    92  TPASS  :  testcase:44 PASSED
fcntl14    93  TPASS  :  testcase:45 PASSED
fcntl14    94  TPASS  :  Block 2, test 2 PASSED
fcntl14     0  TINFO  :  Exit block 2
fcntl14     0  TINFO  :  Enter block 3
fcntl14    95  TPASS  :  Test with negative whence locking PASSED
fcntl14     0  TINFO  :  Exit block 3
fcntl14     0  TINFO  :  Enter block 4
fcntl14    96  TPASS  :  Test of locks on file PASSED
fcntl14     0  TINFO  :  Exit block 4
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D25
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl18 stime=3D1630694706
cmdline=3D"fcntl18"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl18     0  TINFO  :  Enter block 1
fcntl18     1  TPASS  :  Test F_GETLK: for errno EFAULT PASSED
fcntl18     0  TINFO  :  Block 1 PASSED
fcntl18     0  TINFO  :  Exit block 1
fcntl18     0  TINFO  :  Enter block 2
fcntl18     2  TPASS  :  Test F_GETLK64: for errno EFAULT PASSED
fcntl18     0  TINFO  :  Block 2 PASSED
fcntl18     0  TINFO  :  Exit block 2
fcntl18     0  TINFO  :  Enter block 3
fcntl18     3  TPASS  :  Test for errno EINVAL PASSED
fcntl18     0  TINFO  :  Block 3 PASSED
fcntl18     0  TINFO  :  Exit block 3
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl21 stime=3D1630694706
cmdline=3D"fcntl21"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl21     0  TINFO  :  Enter block 1
fcntl21     0  TINFO  :  Test block 1: PASSED
fcntl21     0  TINFO  :  Exit block 1
fcntl21     0  TINFO  :  Enter block 2
fcntl21     0  TINFO  :  Test block 2: PASSED
fcntl21     0  TINFO  :  Exit block 2
fcntl21     0  TINFO  :  Enter block 3
fcntl21     0  TINFO  :  Test block 3 : PASSED
fcntl21     0  TINFO  :  Exit block 3
fcntl21     0  TINFO  :  Enter block 4
fcntl21     0  TINFO  :  Test block 4: PASSED
fcntl21     0  TINFO  :  Exit block 4
fcntl21     0  TINFO  :  Enter block 5
fcntl21     0  TINFO  :  Test block 5: PASSED
fcntl21     0  TINFO  :  Exit block 5
fcntl21     0  TINFO  :  Enter block 6
fcntl21     0  TINFO  :  Test block 6 PASSED
fcntl21     0  TINFO  :  Exit block 6
fcntl21     0  TINFO  :  Enter block 7
fcntl21     0  TINFO  :  Test block 7: PASSED
fcntl21     0  TINFO  :  Exit block 7
fcntl21     0  TINFO  :  Enter block 8
fcntl21     0  TINFO  :  Test block 8: PASSED
fcntl21     0  TINFO  :  Exit block 8
fcntl21     0  TINFO  :  Enter block 9
fcntl21     0  TINFO  :  Test block 9: PASSED
fcntl21     0  TINFO  :  Exit block 9
fcntl21     0  TINFO  :  Enter block 10
fcntl21     0  TINFO  :  Test block 10: PASSED
fcntl21     0  TINFO  :  Exit block 10
fcntl21     0  TINFO  :  Enter block 11
fcntl21     0  TINFO  :  Test block 11: PASSED
fcntl21     0  TINFO  :  Exit block 11
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl25_64 stime=3D1630694706
cmdline=3D"fcntl25_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl25     1  TPASS  :  fcntl(tfile_5672, F_SETLEASE, F_WRLCK)
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl27 stime=3D1630694706
cmdline=3D"fcntl27"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl27     1  TPASS  :  fcntl(fd, F_SETLEASE, F_RDLCK) succeeded
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl30 stime=3D1630694706
cmdline=3D"fcntl30"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl30     0  TINFO  :  orig_pipe_size: 65536 new_pipe_size: 131072
fcntl30     1  TPASS  :  fcntl test F_GETPIPE_SZ and F_SETPIPE_SZ passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl31_64 stime=3D1630694706
cmdline=3D"fcntl31_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     1  TPASS  :  fcntl test F_GETOWN, F_SETOWN for process ID succe=
ss
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     2  TPASS  :  fcntl test F_GETOWN, F_SETOWN for process group ID=
 success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     3  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for thread ID =
success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     4  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for process ID=
 success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     5  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for process gr=
oup ID success
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl36 stime=3D1630694706
cmdline=3D"fcntl36"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fcntl36.c:289: TINFO: OFD read lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD read lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D7 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5705 cstime=3D31200
<<<test_end>>>
<<<test_start>>>
tag=3Dflistxattr01 stime=3D1630694713
cmdline=3D"flistxattr01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
flistxattr01.c:64: TPASS: flistxattr() succeeded

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfork04 stime=3D1630694713
cmdline=3D"fork04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fork04      1  TPASS  :  Env var TERM unchanged after fork(): getenv() does=
 not find variable set
fork04      2  TPASS  :  Env var NoTSetzWq unchanged after fork(): getenv()=
 does not find variable set
fork04      3  TPASS  :  Env var TESTPROG unchanged after fork(): FRKTCS04
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfork05 stime=3D1630694713
cmdline=3D"fork05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fork05      0  TINFO  :  %fs test only for ix86
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dfsconfig01 stime=3D1630694713
cmdline=3D"fsconfig01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:78: TPASS: fsconfig() passed

Summary:
passed   7
failed   0
broken   0
skipped  15
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D80
<<<test_end>>>
<<<test_start>>>
tag=3Dfspick02 stime=3D1630694716
cmdline=3D"fspick02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)

Summary:
passed   21
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D18 cstime=3D100
<<<test_end>>>
<<<test_start>>>
tag=3Dfstat02_64 stime=3D1630694719
cmdline=3D"fstat02_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fstat02.c:67: TPASS: fstat() reported correct values.

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate01 stime=3D1630694719
cmdline=3D"ftruncate01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate01.c:65: TINFO: Truncated length smaller than file size
ftruncate01.c:60: TPASS: ftruncate() succeeded
ftruncate01.c:74: TINFO: Truncated length exceeds file size
ftruncate01.c:60: TPASS: ftruncate() succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate01_64 stime=3D1630694719
cmdline=3D"ftruncate01_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate01.c:65: TINFO: Truncated length smaller than file size
ftruncate01.c:60: TPASS: ftruncate() succeeded
ftruncate01.c:74: TINFO: Truncated length exceeds file size
ftruncate01.c:60: TPASS: ftruncate() succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate04 stime=3D1630694719
cmdline=3D"ftruncate04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate04.c:116: TINFO: Child locks file
ftruncate04.c:60: TPASS: ftruncate() offset before lock failed with EAGAIN
ftruncate04.c:60: TPASS: ftruncate() offset in lock failed with EAGAIN
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
ftruncate04.c:127: TINFO: Child unlocks file
ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D19
<<<test_end>>>
<<<test_start>>>
tag=3Dgetcwd01 stime=3D1630694720
cmdline=3D"getcwd01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getcwd01.c:62: TPASS: getcwd() failed as expected: EFAULT (14)
getcwd01.c:62: TPASS: getcwd() failed as expected: ENOMEM (12)
getcwd01.c:62: TPASS: getcwd() failed as expected: EINVAL (22)
getcwd01.c:62: TPASS: getcwd() failed as expected: ERANGE (34)
getcwd01.c:62: TPASS: getcwd() failed as expected: ERANGE (34)

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetdents01 stime=3D1630694720
cmdline=3D"getdents01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:148: TINFO: Testing the SYS_getdents syscall
getdents01.c:92: TINFO: Found '.'
getdents01.c:92: TINFO: Found '..'
getdents01.c:92: TINFO: Found 'dir'
getdents01.c:92: TINFO: Found 'file'
getdents01.c:92: TINFO: Found 'symlink'
getdents01.c:126: TPASS: All entries found
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:151: TINFO: Testing the SYS_getdents64 syscall
getdents01.c:92: TINFO: Found '.'
getdents01.c:92: TINFO: Found '..'
getdents01.c:92: TINFO: Found 'dir'
getdents01.c:92: TINFO: Found 'file'
getdents01.c:92: TINFO: Found 'symlink'
getdents01.c:126: TPASS: All entries found
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:157: TCONF: libc getdents() is not implemented
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:164: TCONF: libc getdents64() is not implemented

Summary:
passed   2
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dgetegid01 stime=3D1630694720
cmdline=3D"getegid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getegid01    1  TPASS  :  getegid returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetgid03_16 stime=3D1630694720
cmdline=3D"getgid03_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getgid/../utils/compat_tst_1=
6.h:99: TCONF: 16-bit version of getgid() is not supported on your platform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetgroups01_16 stime=3D1630694720
cmdline=3D"getgroups01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getgroups01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/getgroups/../utils/compat_16.h:82: 16-bit version of getgroups() is not =
supported on your platform
getgroups01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/getgroups/../utils/compat_16.h:82: Remaining cases not appropriate for c=
onfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dgethostid01 stime=3D1630694720
cmdline=3D"gethostid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
gethostid01.c:55: TINFO: get original hostid: 8323328
gethostid01.c:37: TPASS: set hostid to 0 passed
gethostid01.c:44: TPASS: hostid is 0, expected 0
gethostid01.c:37: TPASS: set hostid to 65535 passed
gethostid01.c:44: TPASS: hostid is 65535, expected 65535
gethostid01.c:60: TPASS: set hostid to 8323328 passed

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetpgid02 stime=3D1630694720
cmdline=3D"getpgid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getpgid02    1  TPASS  :  expected failure - errno =3D 3 : No such process
getpgid02    2  TPASS  :  expected failure - errno =3D 3 : No such process
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetpid02 stime=3D1630694720
cmdline=3D"getpid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getpid02.c:36: TPASS: child getppid() =3D=3D parent getpid() (6627)
getpid02.c:49: TPASS: child getpid() =3D=3D parent fork() (6628)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetppid02 stime=3D1630694720
cmdline=3D"getppid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getppid02.c:31: TPASS: getppid() returned parent pid (6630)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom01 stime=3D1630694720
cmdline=3D"getrandom01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom02 stime=3D1630694720
cmdline=3D"getrandom02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom04 stime=3D1630694720
cmdline=3D"getrandom04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom04.c:28: TPASS: getrandom returned 100

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetresuid03 stime=3D1630694720
cmdline=3D"getresuid03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getresuid03    1  TPASS  :  Functionality of getresuid() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetsockname01 stime=3D1630694720
cmdline=3D"getsockname01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getsockname01    1  TPASS  :  bad file descriptor successful
getsockname01    2  TPASS  :  bad file descriptor successful
getsockname01    3  TPASS  :  invalid socket buffer successful
getsockname01    4  TPASS  :  invalid aligned salen successful
getsockname01    5  TPASS  :  invalid unaligned salen successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgettid01 stime=3D1630694720
cmdline=3D"gettid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
gettid01    1  TPASS  :  gettid() returned 6640
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dgetxattr02 stime=3D1630694720
cmdline=3D"getxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getxattr02    1  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    2  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    3  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    4  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl04 stime=3D1630694720
cmdline=3D"ioctl04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl04.c:26: TPASS: BLKROGET returned 0
ioctl04.c:39: TPASS: BLKROGET returned 1
ioctl04.c:50: TPASS: Mounting RO device RW failed: EACCES (13)
ioctl04.c:61: TPASS: Mounting RO device RO works

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D9
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl08 stime=3D1630694721
cmdline=3D"ioctl08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with SUCCESS as expected
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with SUCCESS as expected
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with EINVAL as expected

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D14
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl_loop01 stime=3D1630694721
cmdline=3D"ioctl_loop01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
ioctl_loop01.c:85: TPASS: /sys/block/loop0/loop/partscan =3D 0
ioctl_loop01.c:86: TPASS: /sys/block/loop0/loop/autoclear =3D 0
ioctl_loop01.c:87: TPASS: /sys/block/loop0/loop/backing_file =3D '/fs/sda1/=
tmpdir/ltp-r9GWHcZ5yU/iocf8v5B6/test.img'
ioctl_loop01.c:57: TPASS: get expected lo_flag 12
ioctl_loop01.c:59: TPASS: /sys/block/loop0/loop/partscan =3D 1
ioctl_loop01.c:60: TPASS: /sys/block/loop0/loop/autoclear =3D 1
ioctl_loop01.c:69: TPASS: access /dev/loop0p1 succeeds
ioctl_loop01.c:75: TPASS: access /sys/block/loop0/loop0p1 succeeds
ioctl_loop01.c:91: TINFO: Test flag can be clear
ioctl_loop01.c:57: TPASS: get expected lo_flag 8
ioctl_loop01.c:59: TPASS: /sys/block/loop0/loop/partscan =3D 1
ioctl_loop01.c:60: TPASS: /sys/block/loop0/loop/autoclear =3D 0
ioctl_loop01.c:69: TPASS: access /dev/loop0p1 succeeds
ioctl_loop01.c:75: TPASS: access /sys/block/loop0/loop0p1 succeeds

Summary:
passed   13
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5 cstime=3D12
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl_ns02 stime=3D1630694722
cmdline=3D"ioctl_ns02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl_ns02.c:39: TPASS: NS_GET_PARENT fails with EINVAL

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dinotify01 stime=3D1630694722
cmdline=3D"inotify01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D04 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D20 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D01 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D10 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D20 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D02 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D08 cookie=3D0 len=3D0

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dinotify06 stime=3D1630694722
cmdline=3D"inotify06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 50m 00s
inotify06.c:92: TPASS: kernel survived inotify beating

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D47
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify01 stime=3D1630694722
cmdline=3D"fanotify01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify01.c:92: TINFO: Test #0: inode mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #1: mount mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #2: filesystem mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #3: inode mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1
fanotify01.c:92: TINFO: Test #4: mount mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1
fanotify01.c:92: TINFO: Test #5: filesystem mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1

Summary:
passed   72
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify08 stime=3D1630694723
cmdline=3D"fanotify08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify08.c:39: TPASS: not set close_on_exec
fanotify08.c:39: TPASS: set close_on_exec

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify16 stime=3D1630694723
cmdline=3D"fanotify16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.e001.f46=
f5b88.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.e002.f46f5b89.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f801.f46=
f5b8a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f802.f46f5b8b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.a001.f46=
f5b8c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.a002.f46f5b8d.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f801.f46=
f5b8e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f802.f46f5b8f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.7801.f46=
f5b90.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.7802.f46f5b91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.d001.f46=
f5b92.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.d002.f46f5b93.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.2001.f46=
f5b94.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.2002.f46f5b95.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f001.f46=
f5b96.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f002.f46f5b97.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.ab1=
d7d98.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.d14c1101.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d58=
6674.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.70fc927b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.da1=
00606.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.d6a74aeb.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d1e=
ecbb6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.dcc59f62.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.971=
7d02d.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.77035322.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d2d=
80241.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.1b20fa0b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.5d0=
d6207.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.e6adc439.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.619=
194d4.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.55d340ef.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.487=
a09d6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.fdd29e6.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.a59=
a0912.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.d9d667c6.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.fec=
0a681.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.83c209c3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.5d6=
dca28.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.7eb4fc7b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.aec=
3e25a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.aaeb8c01.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.910=
94df7.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.3b80497e.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.eea=
da82.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.b6ebfc91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.a90=
fbeb0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.ac832ede.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.83.0.91bdbbe7...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.84.0.fe4d=
e937...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.20080.0.f3afaeff...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.20081.0.7=
bac28a8...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.41b00.0.1b31fe77...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.41b01.0.f=
b939a28...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.60060.0.e122187d...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.60061.0.8=
8caae4a...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.83.0.91bdbbe8...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.84.0.fe4d=
e938...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.20060.0.d2f9709e...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.20061.0.5=
8a9d831...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.41b40.0.dbc753ae...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.41b41.0.7=
6b8ae2a...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.60080.0.4286b50a...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.60081.0.1=
1f97226...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.101.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.102.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.103.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.104.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.105.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.106.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.107.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.108.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.109.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10a.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D40=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D104; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10b.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10c.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D40=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D104; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10d.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10e.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10f.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.110.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.71.89fc7a20.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.72.bbfbba=
37.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.73.ab220e1c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.74.756b3d=
c3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.75.d10452e2.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.76.c5e986=
cd.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.77.9799459c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.78.27a0a2=
d1.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.79.712ac38.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7a.b68b3f=
c5.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7b.54d7ca8e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7c.c3e1f3=
4f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7d.f2712880.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7e.bebbe8=
91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7f.edbb13fa.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.80.90aa35=
c7.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ntfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with ntfs opts=3D'' extra opts=
=3D''
The partition start sector was not specified for /dev/loop0 and it could no=
t be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop0 and it cou=
ld not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop0 and it could not be ob=
tained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sec=
tors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
tst_test.c:937: TINFO: Trying FUSE...
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:547: TCONF: FAN_REPORT_DIR_FID not supported on ntfs filesystem
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.986d4d2c.=
2.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.661ab1bd.3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.6ee6ba4e.=
4.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.323ea4d9.5.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.f3380478.=
6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.e9d0cc51.7.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.9fd8087c.=
8.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.15c4d483.9.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.1b6200f9.=
a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.af578e8f.b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.283df6f5.=
c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.c935f61a.d.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.56affeaf.=
e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.37bb7cfa.f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.c5c96299.=
10.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.8cc1b43f.11.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12

Summary:
passed   490
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D12 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D25 cstime=3D574
<<<test_end>>>
<<<test_start>>>
tag=3Diopl01 stime=3D1630694735
cmdline=3D"iopl01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_lockdown.c:60: TINFO: Unable to determine system lockdown state
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
iopl01.c:40: TPASS: iopl() passed for level 0, returned 0
iopl01.c:40: TPASS: iopl() passed for level 1, returned 0
iopl01.c:40: TPASS: iopl() passed for level 2, returned 0
iopl01.c:40: TPASS: iopl() passed for level 3, returned 0

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_destroy01 stime=3D1630694735
cmdline=3D"io_destroy01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_destroy01.c:42: TPASS: io_destroy() failed as expected, returned -EINVAL

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_getevents01 stime=3D1630694735
cmdline=3D"io_getevents01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_getevents01.c:27: TPASS: io_getevents syscall with invalid ctx : EINVAL =
(22)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_setup01 stime=3D1630694735
cmdline=3D"io_setup01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_setup01.c:66: TPASS: io_setup() passed as expected
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EINVAL
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EINVAL
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EFAULT
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EAGAIN/EWO=
ULDBLOCK

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dkeyctl08 stime=3D1630694735
cmdline=3D"keyctl08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
keyctl08.c:22: TPASS: Denied access to .builtin_trusted_keys

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlinkat01 stime=3D1630694735
cmdline=3D"linkat01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
linkat01    1  TPASS  :  linkat is functionality correct
linkat01    2  TPASS  :  linkat succeeded as expected
linkat01    3  TPASS  :  linkat is functionality correct
linkat01    4  TPASS  :  linkat is functionality correct
linkat01    5  TPASS  :  linkat is functionality correct
linkat01    6  TPASS  :  linkat succeeded as expected
linkat01    7  TPASS  :  linkat is functionality correct
linkat01    8  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOTDIR(20=
): Not a directory
linkat01    9  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOTDIR(20=
): Not a directory
linkat01   10  TPASS  :  linkat succeeded as expected
linkat01   11  TPASS  :  linkat is functionality correct
linkat01   12  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEBADF(9): =
Bad file descriptor
linkat01   13  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEBADF(9): =
Bad file descriptor
linkat01   14  TPASS  :  linkat succeeded as expected
linkat01   15  TPASS  :  linkat is functionality correct
linkat01   16  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOENT(2):=
 No such file or directory
linkat01   17  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOENT(2):=
 No such file or directory
linkat01   18  TPASS  :  linkat succeeded as expected
linkat01   19  TPASS  :  linkat is functionality correct
linkat01   20  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEXDEV(18):=
 Invalid cross-device link
linkat01   21  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEPERM(1): =
Operation not permitted
linkat01   22  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEINVAL(22)=
: Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlistxattr01 stime=3D1630694735
cmdline=3D"listxattr01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
listxattr01.c:63: TPASS: listxattr() succeeded

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlistxattr02 stime=3D1630694735
cmdline=3D"listxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
listxattr02.c:73: TPASS: listxattr() failed as expected: ERANGE (34)
listxattr02.c:73: TPASS: listxattr() failed as expected: ENOENT (2)
listxattr02.c:73: TPASS: listxattr() failed as expected: EFAULT (14)
listxattr02.c:73: TPASS: listxattr() failed as expected: ENAMETOOLONG (36)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dlseek11 stime=3D1630694735
cmdline=3D"lseek11"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
lseek11.c:162: TINFO: The block size is 4096
lseek11.c:212: TPASS: The 0th test passed: SEEK_DATA from startblock 0 offs=
et 0
lseek11.c:212: TPASS: The 1th test passed: SEEK_DATA from startblock 0 offs=
et 4
lseek11.c:212: TPASS: The 2th test passed: SEEK_HOLE from startblock 0 offs=
et 0
lseek11.c:212: TPASS: The 3th test passed: SEEK_HOLE from startblock 0 offs=
et 4
lseek11.c:212: TPASS: The 4th test passed: SEEK_HOLE from startblock 1 offs=
et 0
lseek11.c:212: TPASS: The 5th test passed: SEEK_HOLE from startblock 1 offs=
et 128
lseek11.c:212: TPASS: The 6th test passed: SEEK_DATA from startblock 1 offs=
et 0
lseek11.c:212: TPASS: The 7th test passed: SEEK_DATA from startblock 10 off=
set -1
lseek11.c:212: TPASS: The 8th test passed: SEEK_DATA from startblock 10 off=
set 0
lseek11.c:212: TPASS: The 9th test passed: SEEK_DATA from startblock 10 off=
set 4
lseek11.c:212: TPASS: The 10th test passed: SEEK_HOLE from startblock 10 of=
fset 0
lseek11.c:212: TPASS: The 11th test passed: SEEK_HOLE from startblock 10 of=
fset 4
lseek11.c:212: TPASS: The 12th test passed: SEEK_HOLE from startblock 11 of=
fset 128
lseek11.c:212: TPASS: The 13th test passed: SEEK_DATA from startblock 11 of=
fset 128
lseek11.c:212: TPASS: The 14th test passed: SEEK_HOLE from startblock 30 of=
fset -128

Summary:
passed   15
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir03 stime=3D1630694735
cmdline=3D"mkdir03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mkdir03.c:62: TPASS: mkdir() failed as expected: EFAULT (14)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENAMETOOLONG (36)
mkdir03.c:62: TPASS: mkdir() failed as expected: EEXIST (17)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENOENT (2)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENOTDIR (20)
mkdir03.c:62: TPASS: mkdir() failed as expected: ELOOP (40)
mkdir03.c:62: TPASS: mkdir() failed as expected: EROFS (30)

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir05 stime=3D1630694735
cmdline=3D"mkdir05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mkdir05.c:45: TPASS: mkdir() functionality is correct

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir09 stime=3D1630694735
cmdline=3D"mkdir09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mkdir09     1  TPASS  :  PASS
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D10 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D68 cstime=3D5873
<<<test_end>>>
<<<test_start>>>
tag=3Dmknodat02 stime=3D1630694745
cmdline=3D"mknodat02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mke2fs 1.44.5 (15-Dec-2018)
mknodat     0  TINFO  :  Found free device 0 '/dev/loop0'
mknodat     0  TINFO  :  Formatting /dev/loop0 with ext2 opts=3D'' extra op=
ts=3D''
mknodat     1  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     2  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     3  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     4  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     5  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     6  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     7  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
mknodat     8  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
mknodat     9  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D8
<<<test_end>>>
<<<test_start>>>
tag=3Dmlock201 stime=3D1630694746
cmdline=3D"mlock201"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 1 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 8 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 3 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 2 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 0 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 4 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 1 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 4 pages

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap02 stime=3D1630694746
cmdline=3D"mmap02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap02      1  TPASS  :  Functionality of mmap() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap03 stime=3D1630694746
cmdline=3D"mmap03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap03      1  TPASS  :  mmap() functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap14 stime=3D1630694746
cmdline=3D"mmap14"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap14      1  TPASS  :  Functionality of mmap() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap15 stime=3D1630694746
cmdline=3D"mmap15"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap15      1  TPASS  :  mmap into high region failed as expected: errno=3D=
ENOMEM(12): Cannot allocate memory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dmove_mount02 stime=3D1630694746
cmdline=3D"move_mount02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)

Summary:
passed   35
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D131
<<<test_end>>>
<<<test_start>>>
tag=3Dmove_pages05 stime=3D1630694751
cmdline=3D"move_pages05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
move_pages05    1  TPASS  :  status[0] set to expected -EACCES
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D4
<<<test_end>>>
<<<test_start>>>
tag=3Dmprotect01 stime=3D1630694751
cmdline=3D"mprotect01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mprotect01    1  TPASS  :  expected failure - errno =3D 12 : Cannot allocat=
e memory
mprotect01    2  TPASS  :  expected failure - errno =3D 22 : Invalid argume=
nt
mprotect01    3  TPASS  :  expected failure - errno =3D 13 : Permission den=
ied
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmq_timedsend01 stime=3D1630694751
cmdline=3D"mq_timedsend01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_timedsend01.c:153: TINFO: Testing variant: vDSO or syscall with libc spec
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 0, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 8192, priority 0, l=
ength: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 32767, =
length: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EMSGSIZE (90)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 16, priority 0, len=
gth: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: ETIMEDOUT (1=
10)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINTR (4)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_timedsend01.c:153: TINFO: Testing variant: syscall with old kernel spec
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 0, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 8192, priority 0, l=
ength: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 32767, =
length: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EMSGSIZE (90)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 16, priority 0, len=
gth: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: ETIMEDOUT (1=
10)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINTR (4)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)

Summary:
passed   34
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmq_unlink01 stime=3D1630694751
cmdline=3D"mq_unlink01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_unlink01.c:76: TINFO: queue name /test_mqueue
mq_unlink01.c:99: TPASS: mq_unlink returned 0: SUCCESS (0)
mq_unlink01.c:76: TINFO: queue name /test_mqueue
mq_unlink01.c:99: TPASS: mq_unlink returned -1: EACCES (13)
mq_unlink01.c:76: TINFO: queue name /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
mq_unlink01.c:99: TPASS: mq_unlink returned -1: ENOENT (2)
mq_unlink01.c:76: TINFO: queue name /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
mq_unlink01.c:99: TPASS: mq_unlink returned -1: ENAMETOOLONG (36)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmremap04 stime=3D1630694751
cmdline=3D"mremap04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mremap04    1  TPASS  :  mremap() failed, 'MREMAP_MAYMOVE flag unset', errn=
o 12
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgctl02 stime=3D1630694751
cmdline=3D"msgctl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgctl02.c:34: TPASS: msgctl(IPC_SET) msg_qbytes - 1
msgctl02.c:41: TPASS: msg_qbytes =3D 16383

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgrcv07 stime=3D1630694751
cmdline=3D"msgrcv07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgrcv07.c:68: TPASS: msgrcv(MSG_EXCEPT) succeeded
msgrcv07.c:71: TPASS: MSG_EXCEPT excepted MSGTYPE2 and got MSGTYPE1
msgrcv07.c:95: TPASS: msgrcv(MSG_NOERROR) succeeded
msgrcv07.c:98: TPASS: MSG_NOERROR truncated message correctly
msgrcv07.c:134: TPASS: msgrcv(0, MSG_COPY) succeeded
msgrcv07.c:137: TPASS: MSG_COPY got MSGTYPE1 data correctly
msgrcv07.c:148: TPASS: msgrcv(1, MSG_COPY) succeeded
msgrcv07.c:151: TPASS: MSG_COPY got MSGTYPE2 data correctly
msgrcv07.c:157: TPASS: Two messages still in queue
msgrcv07.c:178: TPASS: msgrcv(zero_msgtyp) succeeded
msgrcv07.c:181: TPASS: zero_msgtyp got the first message
msgrcv07.c:200: TPASS: msgrcv(positive_msgtyp) succeeded
msgrcv07.c:204: TPASS: msgtyp got the first message in the queue of type ms=
gtyp
msgrcv07.c:225: TPASS: msgrcv(negative_msgtyp) succeeded
msgrcv07.c:229: TPASS: -msgtyp got the first message in the queue with the =
lowest type

Summary:
passed   15
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgsnd05 stime=3D1630694751
cmdline=3D"msgsnd05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgsnd05.c:45: TPASS: msgsnd(7, 0x5588a8ccc680, 1024, 2048) : EAGAIN/EWOULD=
BLOCK (11)
msgsnd05.c:45: TPASS: msgsnd(7, 0x5588a8ccc680, 1024, 0) : EINTR (4)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsync03 stime=3D1630694751
cmdline=3D"msync03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
msync03     1  TPASS  :  msync failed as expected: TEST_ERRNO=3DEBUSY(16): =
Device or resource busy
msync03     2  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     3  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     4  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     5  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     6  TPASS  :  msync failed as expected: TEST_ERRNO=3DENOMEM(12):=
 Cannot allocate memory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmadvise09 stime=3D1630694751
cmdline=3D"madvise09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
madvise09.c:319: TCONF: MADV_FREE does not work without swap

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpidfd_open03 stime=3D1630694751
cmdline=3D"pidfd_open03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pidfd_open03.c:49: TPASS: pidfd_open() passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe06 stime=3D1630694751
cmdline=3D"pipe06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe06      1  TPASS  :  failed with EMFILE
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe07 stime=3D1630694751
cmdline=3D"pipe07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe07      0  TINFO  :  Found 4 files open
pipe07      1  TPASS  :  Opened 510 pipes
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe10 stime=3D1630694751
cmdline=3D"pipe10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe10      1  TPASS  :  functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe11 stime=3D1630694751
cmdline=3D"pipe11"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pipe11.c:70: TINFO: Reading 4096 per each of 1 children
pipe11.c:50: TPASS: Child 7203 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 2048 per each of 2 children
pipe11.c:50: TPASS: Child 7204 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7205 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 1365 per each of 3 children
pipe11.c:50: TPASS: Child 7206 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7207 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7208 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 1024 per each of 4 children
pipe11.c:50: TPASS: Child 7209 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7210 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7211 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7212 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 409 per each of 10 children
pipe11.c:50: TPASS: Child 7213 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7214 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7215 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7217 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7218 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7219 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7220 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7221 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7222 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7223 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 81 per each of 50 children
pipe11.c:50: TPASS: Child 7224 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7225 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7226 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7227 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7229 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7230 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7231 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7232 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7233 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7234 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7235 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7236 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7237 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7238 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7239 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7240 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7242 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7243 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7244 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7245 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7246 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7247 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7248 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7249 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7250 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7251 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7252 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7253 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7254 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7255 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7256 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7257 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7258 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7259 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7260 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7261 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7262 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7263 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7264 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7265 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7266 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7267 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7268 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7269 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7270 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7271 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7272 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7273 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7274 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7275 read pipe buffer correctly

Summary:
passed   70
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D8
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe2_01 stime=3D1630694751
cmdline=3D"pipe2_01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pipe2_01.c:56: TINFO: Test pipe2 with 0 flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(0)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(0)
pipe2_01.c:56: TINFO: Test pipe2 using O_CLOEXEC flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(524288)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(524288)
pipe2_01.c:56: TINFO: Test pipe2 using O_DIRECT flag=20
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(16384)
pipe2_01.c:56: TINFO: Test pipe2 using O_NONBLOCK flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(2048)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(2048)

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dppoll01 stime=3D1630694751
cmdline=3D"ppoll01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ppoll01.c:199: TINFO: Testing variant: vDSO or syscall with libc spec
ppoll01.c:246: TINFO: case NORMAL
ppoll01.c:277: TPASS: revents=3D0x0005
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case MASK_SIGNAL
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case TIMEOUT
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case FD_ALREADY_CLOSED
ppoll01.c:277: TPASS: revents=3D0x0020
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case SEND_SIGINT
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case SEND_SIGINT_RACE_TEST
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case INVALID_NFDS
ppoll01.c:286: TPASS: ret: -1, errno: EINVAL (22)
ppoll01.c:246: TINFO: case INVALID_FDS
ppoll01.c:286: TPASS: ret: -1, errno: EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ppoll01.c:199: TINFO: Testing variant: syscall with old kernel spec
ppoll01.c:246: TINFO: case NORMAL
ppoll01.c:277: TPASS: revents=3D0x0005
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case MASK_SIGNAL
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case TIMEOUT
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case FD_ALREADY_CLOSED
ppoll01.c:277: TPASS: revents=3D0x0020
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case SEND_SIGINT
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case SEND_SIGINT_RACE_TEST
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case INVALID_NFDS
ppoll01.c:286: TPASS: ret: -1, errno: EINVAL (22)
ppoll01.c:246: TINFO: case INVALID_FDS
ppoll01.c:286: TPASS: ret: -1, errno: EFAULT (14)

Summary:
passed   20
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpreadv01 stime=3D1630694752
cmdline=3D"preadv01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a'=
 expectedly
preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a'=
 expectedly
preadv01.c:81: TPASS: Preadv(2) read 32 bytes successfully with content 'b'=
 expectedly

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpreadv203_64 stime=3D1630694752
cmdline=3D"preadv203_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 1236, short reads 10, zero len=
 reads 0, EAGAIN(s) 131780
preadv203.c:180: TINFO: Number of writes 2400
preadv203.c:194: TINFO: Cache dropped 2 times
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 3741, short reads 10, zero len=
 reads 0, EAGAIN(s) 74572
preadv203.c:194: TINFO: Cache dropped 1 times
preadv203.c:180: TINFO: Number of writes 1020
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 1459, short reads 10, zero len=
 reads 0, EAGAIN(s) 298738
preadv203.c:180: TINFO: Number of writes 106920
preadv203.c:194: TINFO: Cache dropped 5 times
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 2219, short reads 10, zero len=
 reads 0, EAGAIN(s) 90067
preadv203.c:194: TINFO: Cache dropped 1 times
preadv203.c:180: TINFO: Number of writes 1620
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on ntfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with ntfs opts=3D'' extra opts=
=3D''
The partition start sector was not specified for /dev/loop0 and it could no=
t be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop0 and it cou=
ld not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop0 and it could not be ob=
tained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sec=
tors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
tst_test.c:937: TINFO: Trying FUSE...
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)

Summary:
passed   4
failed   0
broken   0
skipped  4
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D42 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D118 cstime=3D3258
<<<test_end>>>
<<<test_start>>>
tag=3Dquotactl02 stime=3D1630694794
cmdline=3D"quotactl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
quotactl02.c:133: TINFO: Test #0: QCMD(Q_XGETQSTAT, USRQUOTA) off
quotactl02.h:68: TPASS: quotactl() succeeded to turn off xfs quota and get =
xfs quota off status for user
quotactl02.c:133: TINFO: Test #1: QCMD(Q_XGETQSTAT, USRQUOTA) on
quotactl02.h:88: TPASS: quotactl() succeeded to turn on xfs quota and get x=
fs quota on status for user
quotactl02.c:133: TINFO: Test #2: QCMD(Q_XGETQUOTA, USRQUOTA) qlim
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETQUOTA fo=
r user to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #3: QCMD(Q_XGETNEXTQUOTA, USRQUOTA)
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETNEXTQUOT=
A for user to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #4: QCMD(Q_XGETQSTATV, USRQUOTA) off
quotactl02.h:110: TPASS: quotactl() succeeded to turn off xfs quota and get=
 xfs quota off statv for user
quotactl02.c:133: TINFO: Test #5: QCMD(Q_XGETQSTATV, USRQUOTA) on
quotactl02.h:132: TPASS: quotactl() succeeded to turn on xfs quota and get =
xfs quota on statv for user
quotactl02.c:133: TINFO: Test #6: QCMD(Q_XGETQSTAT, GRPQUOTA) off
quotactl02.h:68: TPASS: quotactl() succeeded to turn off xfs quota and get =
xfs quota off status for group
quotactl02.c:133: TINFO: Test #7: QCMD(Q_XGETQSTAT, GRPQUOTA) on
quotactl02.h:88: TPASS: quotactl() succeeded to turn on xfs quota and get x=
fs quota on status for group
quotactl02.c:133: TINFO: Test #8: QCMD(Q_XGETQUOTA, GRPQUOTA) qlim
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETQUOTA fo=
r group to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #9: QCMD(Q_XGETNEXTQUOTA, GRPQUOTA)
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETNEXTQUOT=
A for group to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #10: QCMD(Q_XGETQSTATV, GRPQUOTA) off
quotactl02.h:110: TPASS: quotactl() succeeded to turn off xfs quota and get=
 xfs quota off statv for group
quotactl02.c:133: TINFO: Test #11: QCMD(Q_XGETQSTATV, GRPQUOTA) on
quotactl02.h:132: TPASS: quotactl() succeeded to turn on xfs quota and get =
xfs quota on statv for group

Summary:
passed   12
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D17
<<<test_end>>>
<<<test_start>>>
tag=3Dreaddir21 stime=3D1630694795
cmdline=3D"readdir21"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
readdir21    1  TCONF  :  readdir21.c:122: syscall(-1) __NR_readdir not sup=
ported on your arch
readdir21    2  TCONF  :  readdir21.c:122: Remaining cases not appropriate =
for configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dreadlink03 stime=3D1630694795
cmdline=3D"readlink03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
readlink03.c:86: TPASS: readlink() failed as expected: EACCES (13)
readlink03.c:86: TPASS: readlink() failed as expected: EINVAL (22)
readlink03.c:86: TPASS: readlink() failed as expected: EINVAL (22)
readlink03.c:86: TPASS: readlink() failed as expected: ENAMETOOLONG (36)
readlink03.c:86: TPASS: readlink() failed as expected: ENOENT (2)
readlink03.c:86: TPASS: readlink() failed as expected: ENOTDIR (20)
readlink03.c:86: TPASS: readlink() failed as expected: ELOOP (40)
readlink03.c:86: TPASS: readlink() failed as expected: EFAULT (14)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dreadv01 stime=3D1630694795
cmdline=3D"readv01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 01m 15s
readv01.c:71: TPASS: readv() with 0 I/O vectors
readv01.c:85: TPASS: readv() correctly read 0 bytes=20
readv01.c:71: TPASS: readv() with NULL I/O vectors
readv01.c:85: TPASS: readv() correctly read 64 bytes=20
readv01.c:71: TPASS: readv() with too big I/O vectors
readv01.c:85: TPASS: readv() correctly read 64 bytes=20
readv01.c:71: TPASS: readv() with multiple I/O vectors
readv01.c:85: TPASS: readv() correctly read 48 bytes=20
readv01.c:71: TPASS: readv() with zero-len buffer
readv01.c:85: TPASS: readv() correctly read 64 bytes=20

Summary:
passed   10
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drecvmmsg01 stime=3D1630694795
cmdline=3D"recvmmsg01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
recvmmsg01.c:102: TINFO: Testing variant: vDSO or syscall with libc spec
recvmmsg01.c:93: TPASS: recvmmsg() bad socket file descriptor : EBADF (9)
recvmmsg01.c:93: TPASS: recvmmsg() bad message vector address : EFAULT (14)
recvmmsg01.c:93: TPASS: recvmmsg() negative seconds in timeout : EINVAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() overflow in nanoseconds in timeout : EIN=
VAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() bad timeout address : EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
recvmmsg01.c:102: TINFO: Testing variant: syscall with old kernel spec
recvmmsg01.c:93: TPASS: recvmmsg() bad socket file descriptor : EBADF (9)
recvmmsg01.c:93: TPASS: recvmmsg() bad message vector address : EFAULT (14)
recvmmsg01.c:93: TPASS: recvmmsg() negative seconds in timeout : EINVAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() overflow in nanoseconds in timeout : EIN=
VAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() bad timeout address : EFAULT (14)

Summary:
passed   10
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drename02 stime=3D1630694795
cmdline=3D"rename02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rename02    1  TPASS  :  rename(./tfile_7577, ./rnfile_7577) returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drename10 stime=3D1630694795
cmdline=3D"rename10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rename10    1  TPASS  :  expected failure - errno =3D 36 : File name too lo=
ng
rename10    2  TPASS  :  expected failure - errno =3D 2 : No such file or d=
irectory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drenameat202 stime=3D1630694795
cmdline=3D"renameat202 -i 10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drt_sigaction03 stime=3D1630694795
cmdline=3D"rt_sigaction03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rt_sigaction03    0  TINFO  :  Signal 34
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    1  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03    2  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    3  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    4  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03    5  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 35
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    6  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03    7  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    8  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    9  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   10  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 36
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   11  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   12  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   13  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   14  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   15  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 37
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   16  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   17  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   18  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   19  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   20  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 38
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   21  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   22  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   23  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   24  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   25  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 39
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   26  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   27  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   28  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   29  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   30  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 40
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   31  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   32  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   33  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   34  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   35  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 41
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   36  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   37  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   38  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   39  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   40  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 42
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   41  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   42  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   43  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   44  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   45  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 43
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   46  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   47  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   48  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   49  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   50  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 44
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   51  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   52  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   53  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   54  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   55  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 45
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   56  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   57  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   58  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   59  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   60  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 46
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   61  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   62  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   63  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   64  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   65  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 47
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   66  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   67  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   68  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   69  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   70  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 48
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   71  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   72  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   73  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   74  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   75  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 49
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   76  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   77  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   78  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   79  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   80  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 50
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   81  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   82  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   83  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   84  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   85  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 51
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   86  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   87  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   88  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   89  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   90  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 52
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   91  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   92  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   93  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   94  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   95  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 53
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   96  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   97  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   98  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   99  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  100  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 54
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  101  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  102  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  103  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  104  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  105  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 55
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  106  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  107  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  108  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  109  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  110  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 56
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  111  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  112  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  113  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  114  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  115  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 57
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  116  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  117  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  118  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  119  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  120  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 58
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  121  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  122  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  123  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  124  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  125  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 59
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  126  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  127  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  128  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  129  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  130  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 60
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  131  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  132  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  133  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  134  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  135  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 61
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  136  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  137  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  138  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  139  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  140  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 62
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  141  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  142  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  143  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  144  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  145  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 63
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  146  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  147  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  148  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  149  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  150  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 64
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  151  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  152  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  153  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  154  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  155  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drt_sigprocmask02 stime=3D1630694795
cmdline=3D"rt_sigprocmask02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rt_sigprocmask02    1  TPASS  :  Got expected errno: TEST_ERRNO=3DEINVAL(22=
): Invalid argument
rt_sigprocmask02    2  TPASS  :  Got expected errno: TEST_ERRNO=3DEFAULT(14=
): Bad address
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsbrk01 stime=3D1630694795
cmdline=3D"sbrk01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sbrk01      1  TPASS  :  sbrk - Increase by 8192 bytes returned 0x560fe4e56=
000
sbrk01      2  TPASS  :  sbrk - Increase by -8192 bytes returned 0x560fe4e5=
8000
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_get_priority_max02 stime=3D1630694795
cmdline=3D"sched_get_priority_max02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sched_get_priority_max02    1  TPASS  :  Test Passed, Got EINVAL
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_rr_get_interval03 stime=3D1630694795
cmdline=3D"sched_rr_get_interval03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_rr_get_interval03.c:53: TINFO: Testing variant: vDSO or syscall with =
libc spec
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(-1, 0x562b9f5599=
48) : EINVAL (22)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(262144, 0x562b9f=
559948) : ESRCH (3)
sched_rr_get_interval03.c:72: TCONF: EFAULT skipped for libc_variant
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_rr_get_interval03.c:53: TINFO: Testing variant: syscall with old kern=
el spec
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(-1, 0x562b9f5599=
48) : EINVAL (22)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(262144, 0x562b9f=
559948) : ESRCH (3)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(0, 0x7f4649b9600=
0) : EFAULT (14)

Summary:
passed   5
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_setparam04 stime=3D1630694795
cmdline=3D"sched_setparam04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_setparam04.c:48: TINFO: Testing libc variant
sched_setparam04.c:58: TPASS: test with non-existing pid : ESRCH (3)
sched_setparam04.c:58: TPASS: test invalid pid value : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid address for p : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid p.sched_priority : EINVAL (=
22)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_setparam04.c:48: TINFO: Testing syscall variant
sched_setparam04.c:58: TPASS: test with non-existing pid : ESRCH (3)
sched_setparam04.c:58: TPASS: test invalid pid value : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid address for p : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid p.sched_priority : EINVAL (=
22)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_getscheduler02 stime=3D1630694795
cmdline=3D"sched_getscheduler02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_getscheduler02.c:23: TINFO: Testing libc variant
sched_getscheduler02.c:33: TPASS: sched_getscheduler(262144) : ESRCH (3)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_getscheduler02.c:23: TINFO: Testing syscall variant
sched_getscheduler02.c:33: TPASS: sched_getscheduler(262144) : ESRCH (3)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsemctl03 stime=3D1630694795
cmdline=3D"semctl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
semctl03.c:82: TINFO: Testing variant: libc semctl()
semctl03.c:74: TPASS: semctl() with invalid IPC command : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid sem id : EINVAL (22)
semctl03.c:69: TCONF: EFAULT is skipped for libc variant
semctl03.c:69: TCONF: EFAULT is skipped for libc variant
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
semctl03.c:82: TINFO: Testing variant: __NR_semctl syscall
semctl03.c:74: TPASS: semctl() with invalid IPC command : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid sem id : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid union arg : EFAULT (14)
semctl03.c:74: TPASS: semctl() with invalid union arg : EFAULT (14)

Summary:
passed   6
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsemget06 stime=3D1630694795
cmdline=3D"semget06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
semget06    1  TPASS  :  expected failure - errno =3D 22 : Invalid argument
semget06    2  TPASS  :  expected failure - errno =3D 22 : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsendfile03 stime=3D1630694795
cmdline=3D"sendfile03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3D-1 : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3DO_RDONLY : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with in_fd=3D-1 : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3DO_WRONLY : EBADF (9)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsendfile08_64 stime=3D1630694795
cmdline=3D"sendfile08_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sendfile08.c:44: TPASS: sendfile() copies data correctly

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dset_robust_list01 stime=3D1630694795
cmdline=3D"set_robust_list01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
set_robust_list01    1  TPASS  :  set_robust_list: retval =3D -1 (expected =
-1), errno =3D 22 (expected 22)
set_robust_list01    2  TPASS  :  set_robust_list: retval =3D 0 (expected 0=
), errno =3D 0 (expected 0)
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dset_thread_area01 stime=3D1630694795
cmdline=3D"set_thread_area01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
set_thread_area_01    1  TCONF  :  set_thread_area01.c:77: syscall(205) tes=
ts[i].syscall not supported on your arch
set_thread_area_01    2  TCONF  :  set_thread_area01.c:77: Remaining cases =
not appropriate for configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetfsuid01_16 stime=3D1630694795
cmdline=3D"setfsuid01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setfsuid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setfsuid/../utils/compat_16.h:117: 16-bit version of setfsuid() is not su=
pported on your platform
setfsuid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setfsuid/../utils/compat_16.h:117: Remaining cases not appropriate for co=
nfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsetegid02 stime=3D1630694795
cmdline=3D"setegid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setegid02    1  TPASS  :  setegid failed as expected: TEST_ERRNO=3DEPERM(1)=
: Operation not permitted
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetgroups01_16 stime=3D1630694796
cmdline=3D"setgroups01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setgroups01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setgroups/../utils/compat_16.h:82: 16-bit version of getgroups() is not =
supported on your platform
setgroups01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setgroups/../utils/compat_16.h:82: Remaining cases not appropriate for c=
onfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsetitimer01 stime=3D1630694796
cmdline=3D"setitimer01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setitimer01    1  TPASS  :  functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetitimer02 stime=3D1630694796
cmdline=3D"setitimer02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setitimer02.c:31: TPASS: sys_setitimer(ITIMER_REAL, value, (struct itimerva=
l *)-1) : EFAULT (14)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetpgid01 stime=3D1630694796
cmdline=3D"setpgid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setpgid01    1  TPASS  :  test setpgid(7609, 7609) success
setpgid01    2  TPASS  :  test setpgid(0, 0) success
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetregid04_16 stime=3D1630694796
cmdline=3D"setregid04_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setregid04.c:84: TINFO: getgrnam(nobody) failed - try fallback nogroup
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setregid/../utils/compat_tst=
_16.h:128: TCONF: 16-bit version of setregid() is not supported on your pla=
tform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetresuid05_16 stime=3D1630694796
cmdline=3D"setresuid05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setresuid05_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setresuid/../utils/compat_16.h:136: 16-bit version of setresuid() is not=
 supported on your platform
setresuid05_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setresuid/../utils/compat_16.h:136: Remaining cases not appropriate for =
configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetreuid01_16 stime=3D1630694796
cmdline=3D"setreuid01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setreuid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: 16-bit version of setreuid() is not su=
pported on your platform
setreuid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: Remaining cases not appropriate for co=
nfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetreuid05_16 stime=3D1630694796
cmdline=3D"setreuid05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setreuid05_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: 16-bit version of setreuid() is not su=
pported on your platform
setreuid05_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: Remaining cases not appropriate for co=
nfiguration
setreuid05_16    0  TINFO  :  Child process returned TCONF
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetsid01 stime=3D1630694796
cmdline=3D"setsid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setsid01    1  TPASS  :  setsid SUCCESS to set errno to EPERM
setsid01    1  TPASS  :  all misc tests passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetsockopt01 stime=3D1630694797
cmdline=3D"setsockopt01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setsockopt01.c:66: TINFO: Testing invalid file descriptor
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EBADF =
(9)
setsockopt01.c:66: TINFO: Testing non-socket file descriptor
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOTSO=
CK (88)
setsockopt01.c:66: TINFO: Testing invalid option buffer
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EFAULT=
 (14)
setsockopt01.c:66: TINFO: Testing invalid optlen
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EINVAL=
 (22)
setsockopt01.c:66: TINFO: Testing invalid level
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (UDP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (IP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (TCP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetuid04 stime=3D1630694797
cmdline=3D"setuid04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setuid04.c:49: TPASS: open() returned errno EACCES
setuid04.c:49: TPASS: open() returned errno EACCES

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dsetxattr02 stime=3D1630694797
cmdline=3D"setxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setxattr02.c:154: TPASS: setxattr(2) on testfile passed
setxattr02.c:154: TPASS: setxattr(2) on testdir passed
setxattr02.c:179: TPASS: setxattr(2) on symlink failed: EEXIST (17)
setxattr02.c:160: TFAIL: setxattr(2) on fifo passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on chr passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on blk passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on sock passed unexpectedly

Summary:
passed   3
failed   4
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dshmctl02 stime=3D1630694797
cmdline=3D"shmctl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
shmctl02.c:109: TINFO: Testing variant: libc shmctl()
shmctl02.c:98: TPASS: shmctl(3, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:93: TCONF: EFAULT is skipped for libc variant
shmctl02.c:93: TCONF: EFAULT is skipped for libc variant
shmctl02.c:98: TPASS: shmctl(4, -1, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(-1, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(5, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(2, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(2, 0, (nil)) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 1, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 11, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 12, 0x55fb783188c0) : EPERM (1)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
shmctl02.c:109: TINFO: Testing variant: __NR_shmctl syscall
shmctl02.c:98: TPASS: shmctl(7, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(8, 1, 0xffffffffffffffff) : EFAULT (14)
shmctl02.c:98: TPASS: shmctl(8, 2, 0xffffffffffffffff) : EFAULT (14)
shmctl02.c:98: TPASS: shmctl(8, -1, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(-1, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(9, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(6, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(6, 0, (nil)) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 1, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 11, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 12, 0x55fb783188c0) : EPERM (1)

Summary:
passed   20
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dshmdt02 stime=3D1630694797
cmdline=3D"shmdt02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
shmdt02     1  TPASS  :  expected failure - errno =3D 22 : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsigaltstack02 stime=3D1630694797
cmdline=3D"sigaltstack02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sigaltstack02    1  TPASS  :  stgaltstack() fails, Invalid Flag value, errn=
o:22
sigaltstack02    2  TPASS  :  stgaltstack() fails, alternate stack is < MIN=
SIGSTKSZ, errno:12
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsignalfd4_01 stime=3D1630694797
cmdline=3D"signalfd4_01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
signalfd4_01    1  TPASS  :  signalfd4(SFD_CLOEXEC) Passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsigrelse01 stime=3D1630694797
cmdline=3D"sigrelse01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sigrelse01    1  TPASS  :  sigrelse() released all 55 signals under test.
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dstat01_64 stime=3D1630694797
cmdline=3D"stat01_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stat01.c:75: TPASS: stat(test_fileread)
stat01.c:75: TPASS: stat(test_filenoread)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dstime02 stime=3D1630694797
cmdline=3D"stime02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:46: TINFO: Testing libc stime()
stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:49: TINFO: Testing SYS_stime syscall
stime_var.h:28: TCONF: syscall(-1) __NR_stime not supported
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:52: TINFO: Testing SYS_settimeofday syscall
stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)

Summary:
passed   2
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dsysctl03 stime=3D1630694797
cmdline=3D"sysctl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sysctl03.c:76: TINFO: this test's results are based on potentially undocume=
nted behavior in the kernel. read the NOTE in the source file for more deta=
ils
sysctl03.c:55: TCONF: syscall(156) __NR__sysctl not supported

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
sysctl03.c:55: TCONF: syscall(156) __NR__sysctl not supported
<<<test_start>>>
tag=3Dsyslog07 stime=3D1630694797
cmdline=3D"syslog07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
syslog07    0  TINFO  :  testing syslog priorities ...
syslog07    0  TINFO  :   o Send syslog messages at all levels and see whet=
her
syslog07    0  TINFO  :     All level messages are logged.
syslog07    0  TINFO  :  restarting syslog daemon
syslog07    0  TINFO  :  restarting syslog daemon
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D7 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D11 cstime=3D30
<<<test_end>>>
<<<test_start>>>
tag=3Dtimerfd01 stime=3D1630694804
cmdline=3D"timerfd01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timerfd01.c:153: TINFO: Testing variant: syscall with old kernel spec
timerfd01.c:102: TINFO: testing CLOCK MONOTONIC
timerfd01.c:106: TINFO: relative timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:110: TINFO: absolute timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:115: TINFO: sequential timer (50 ms)
timerfd01.c:128: TPASS: Timer read back value is relative
timerfd01.c:89: TPASS: got 3 tick(s)
timerfd01.c:134: TINFO: testing with O_NONBLOCK
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:146: TPASS: read failed with: EAGAIN/EWOULDBLOCK (11)
timerfd01.c:102: TINFO: testing CLOCK REALTIME
timerfd01.c:106: TINFO: relative timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:110: TINFO: absolute timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:115: TINFO: sequential timer (50 ms)
timerfd01.c:128: TPASS: Timer read back value is relative
timerfd01.c:89: TPASS: got 3 tick(s)
timerfd01.c:134: TINFO: testing with O_NONBLOCK
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:146: TPASS: read failed with: EAGAIN/EWOULDBLOCK (11)

Summary:
passed   12
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dtimerfd_create01 stime=3D1630694805
cmdline=3D"timerfd_create01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
timerfd_create01    1  TPASS  :  timerfd_create() failed as expected: TEST_=
ERRNO=3DEINVAL(22): Invalid argument
timerfd_create01    2  TPASS  :  timerfd_create() failed as expected: TEST_=
ERRNO=3DEINVAL(22): Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dtimer_create01 stime=3D1630694805
cmdline=3D"timer_create01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timer_create01.c:51: TINFO: Testing notification type: SIGEV_NONE
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_SIGNAL
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_THREAD
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_THREAD_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: NULL
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI

Summary:
passed   40
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dtimer_settime01 stime=3D1630694805
cmdline=3D"timer_settime01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timer_settime01.c:85: TINFO: Testing variant: syscall with old kernel spec
timer_settime01.c:96: TINFO: Testing for general initialization:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for setting old_value:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for using periodic timer:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for using absolute time:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed

Summary:
passed   32
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D160 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dtruncate02 stime=3D1630694806
cmdline=3D"truncate02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
truncate02.c:90: TPASS: truncate(testfile, 256) succeeded
truncate02.c:90: TPASS: truncate(testfile, 512) succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Duname01 stime=3D1630694806
cmdline=3D"uname01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
uname01.c:21: TPASS: uname(&un) passed
uname01.c:31: TPASS: sysname set to Linux

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dunshare02 stime=3D1630694806
cmdline=3D"unshare02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
unshare02.c:52: TPASS: unshare(-1) : EINVAL (22)
unshare02.c:52: TPASS: unshare(CLONE_NEWNS) : EPERM (1)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dumount03 stime=3D1630694806
cmdline=3D"umount03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
umount03.c:35: TPASS: umount() fails as expected: EPERM (1)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3Dumount2_03 stime=3D1630694807
cmdline=3D"umount2_03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mke2fs 1.44.5 (15-Dec-2018)
umount2_03    0  TINFO  :  Found free device 0 '/dev/loop0'
umount2_03    0  TINFO  :  Formatting /dev/loop0 with ext2 opts=3D'' extra =
opts=3D''
umount2_03    1  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=3DEINV=
AL(22): Invalid argument
umount2_03    2  TPASS  :  umount2(2) succeeded as expected
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3Dutime01 stime=3D1630694807
cmdline=3D"utime01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
utime01     1  TPASS  :  Functionality of utime(tmp_file, NULL) successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D4 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dwaitpid09 stime=3D1630694811
cmdline=3D"waitpid09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
waitpid09.c:66: TPASS: waitpid(pid, WNOHANG) =3D 0 for a running child
waitpid09.c:106: TPASS: waitpid(pid, WNOHANG) =3D pid for an exited child
waitpid09.c:126: TPASS: waitpid(-1, 0) =3D -1 with ECHILD if no children
waitpid09.c:145: TPASS: waitpid(-1, WNOHANG) =3D -1 with ECHILD if no child=
ren

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dwaitpid13 stime=3D1630694811
cmdline=3D"waitpid13"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
waitpid_common.h:129: TINFO: Sending SIGCONT to 7781
waitpid_common.h:129: TINFO: Sending SIGCONT to 7782
waitpid_common.h:129: TINFO: Sending SIGCONT to 7783
waitpid_common.h:129: TINFO: Sending SIGCONT to 7784
waitpid_common.h:129: TINFO: Sending SIGCONT to 7777
waitpid_common.h:129: TINFO: Sending SIGCONT to 7778
waitpid_common.h:129: TINFO: Sending SIGCONT to 7779
waitpid_common.h:129: TINFO: Sending SIGCONT to 7780
waitpid13.c:70: TPASS: Test PASSED

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dwritev07 stime=3D1630694811
cmdline=3D"writev07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
writev07.c:51: TINFO: starting test with initial file offset: 0=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 65=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 4096=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 4097=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dcopy_file_range03 stime=3D1630694812
cmdline=3D"copy_file_range03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
copy_file_range.h:36: TINFO: Testing libc copy_file_range()
copy_file_range03.c:48: TPASS: copy_file_range sucessfully updated the time=
stamp
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
copy_file_range.h:39: TINFO: Testing __NR_copy_file_range syscall
copy_file_range03.c:48: TPASS: copy_file_range sucessfully updated the time=
stamp

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dperf_event_open03 stime=3D1630694814
cmdline=3D"perf_event_open03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
perf_event_open03.c:38: TCONF: intel_pt is not available

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20210524-395-ga191a3740

       ###############################################################

            Done executing testcases.
            LTP Version:  20210524-395-ga191a3740
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


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.14.0-00001-g6e21a5086100"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.14.0 Kernel Configuration
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
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
CONFIG_MPTCP_IPV6=y
CONFIG_MPTCP_KUNIT_TEST=m
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
# CONFIG_EDAC_IGEN6 is not set
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
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
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
CONFIG_CRYPTO_SHA512=y
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
CONFIG_CMA_SIZE_MBYTES=0
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
CONFIG_SBITMAP=y
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
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
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
# CONFIG_STRING_SELFTEST is not set
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

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=job-script

#!/bin/sh

export_top_env()
{
	export suite='ltp'
	export testcase='ltp'
	export category='functional'
	export need_modules=true
	export need_memory='4G'
	export job_origin='ltp-syscalls.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='lkp-knl-f1'
	export tbox_group='lkp-knl-f1'
	export kconfig='x86_64-rhel-8.3'
	export submit_id='613265673ae6bbc52f6600cd'
	export job_file='/lkp/jobs/scheduled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=0xffff0190-debian-10.4-x86_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-50479-1qf5j0y-2.yaml'
	export id='9598ee441be3837d497b3d4e80a82f31fcc533f1'
	export queuer_version='/lkp-src'
	export model='Knights Landing'
	export nr_node=2
	export nr_cpu=256
	export memory='112G'
	export nr_hdd_partitions=4
	export nr_ssd_partitions=1
	export hdd_partitions='/dev/disk/by-id/ata-ST4000NM0033-9ZM170_Z1ZBHQMW-part*'
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL42040051800RGN-part2'
	export rootfs_partition='/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL42040051800RGN-part1'
	export brand='Intel(R) Genuine Intel(R) CPU 0000 @ 1.30GHz'
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
XFS_FS'
	export commit='6e21a5086100cebefd21a3058a9e1160668f84fa'
	export ucode='0xffff0190'
	export need_kconfig_hw='{"IGB"=>"y"}
SATA_AHCI'
	export bisect_dmesg=true
	export enqueue_time='2021-09-04 02:11:52 +0800'
	export _id='613265773ae6bbc52f6600ce'
	export _rt='/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa'
	export user='lkp'
	export compiler='gcc-9'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='340df6e73222ef5ab0948ac71c9ed68203b99fd3'
	export base_commit='7d2a07b769330c34b4deabeed939325c77a7ec2f'
	export branch='rhvgoyal/user-xattr-symlink-v3'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/3'
	export scheduler_version='/lkp/lkp/.src-20210903-234613'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=0xffff0190-debian-10.4-x86_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-50479-1qf5j0y-2.yaml
ARCH=x86_64
kconfig=x86_64-rhel-8.3
branch=rhvgoyal/user-xattr-symlink-v3
commit=6e21a5086100cebefd21a3058a9e1160668f84fa
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/vmlinuz-5.14.0-00001-g6e21a5086100
max_uptime=2100
RESULT_ROOT=/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/3
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/modules.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210828.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210903.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20210222.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='5.14.0-04424-g5aafbebbd37e'
	export repeat_to=6
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/vmlinuz-5.14.0-00001-g6e21a5086100'
	export dequeue_time='2021-09-04 02:40:34 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=0xffff0190-debian-10.4-x86_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-50479-1qf5j0y-2.cgz'

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

	run_setup fs='xfs' $LKP_SRC/setup/fs

	run_monitor $LKP_SRC/monitors/wrapper kmsg
	run_monitor $LKP_SRC/monitors/wrapper heartbeat
	run_monitor $LKP_SRC/monitors/wrapper meminfo
	run_monitor $LKP_SRC/monitors/wrapper oom-killer
	run_monitor $LKP_SRC/monitors/plain/watchdog

	run_test test='syscalls-02' $LKP_SRC/tests/wrapper ltp
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='syscalls-02' $LKP_SRC/stats/wrapper ltp
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

--NtwzykIc2mflq5ck
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

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
WVo=

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ltp
Content-Transfer-Encoding: quoted-printable

2021-09-03 18:44:43 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2021-09-03 18:44:44 ./runltp -f syscalls-02 -d /fs/sda1/tmpdir
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
Linux lkp-knl-f1 5.14.0-00001-g6e21a5086100 #1 SMP Fri Sep 3 06:41:13 CST 2=
021 x86_64 GNU/Linux

/proc/cmdline
ip=3D::::lkp-knl-f1::dhcp root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sched=
uled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=3D0xffff0190-debian-10.4-x86=
_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-50479-1q=
f5j0y-2.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-rhel-8.3 branch=3Drhvgoyal/user=
-xattr-symlink-v3 commit=3D6e21a5086100cebefd21a3058a9e1160668f84fa BOOT_IM=
AGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f=
84fa/vmlinuz-5.14.0-00001-g6e21a5086100 max_uptime=3D2100 RESULT_ROOT=3D/re=
sult/ltp/1HDD-xfs-syscalls-02-ucode=3D0xffff0190/lkp-knl-f1/debian-10.4-x86=
_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f=
84fa/3 LKP_SERVER=3Dinternal-lkp-server nokaslr selinux=3D0 debug apic=3Dde=
bug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=
=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpan=
ic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 sy=
stemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,11=
5200 console=3DttyS0,115200 vga=3Dnormal rw

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
Modules Loaded         xfs dm_mod intel_rapl_msr intel_rapl_common btrfs bl=
ake2b_generic xor zstd_compress sb_edac raid6_pq libcrc32c x86_pkg_temp_the=
rmal intel_powerclamp coretemp sd_mod t10_pi sg kvm_intel kvm irqbypass crc=
t10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel mgag200 rapl dr=
m_kms_helper ipmi_ssif intel_cstate syscopyarea sysfillrect sysimgblt ahci =
fb_sys_fops libahci intel_uncore mei_me drm libata acpi_ipmi mei joydev ipm=
i_si wmi ipmi_devintf ipmi_msghandler acpi_power_meter acpi_pad ip_tables

free reports:
              total        used        free      shared  buff/cache   avail=
able
Mem:      107074092     1351308   103001600       26592     2721184   10237=
2180
Swap:             0           0           0

cpuinfo:
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
Byte Order:          Little Endian
Address sizes:       46 bits physical, 48 bits virtual
CPU(s):              256
On-line CPU(s) list: 0-255
Thread(s) per core:  4
Core(s) per socket:  64
Socket(s):           1
NUMA node(s):        2
Vendor ID:           GenuineIntel
CPU family:          6
Model:               87
Model name:          Intel(R) Genuine Intel(R) CPU 0000 @ 1.30GHz
Stepping:            1
CPU MHz:             1500.000
CPU max MHz:         1500.0000
CPU min MHz:         1000.0000
BogoMIPS:            2593.99
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            1024K
NUMA node0 CPU(s):   0-255
NUMA node1 CPU(s):  =20
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge m=
ca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall n=
x pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopol=
ogy nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx es=
t tm2 ssse3 fma cx16 xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadli=
ne_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch ring3mwait cpu=
id_fault epb pti tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust =
bmi1 avx2 smep bmi2 erms avx512f rdseed adx avx512pf avx512er avx512cd xsav=
eopt dtherm ida arat pln pts

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 5154     -n 5154 -=
p -f /fs/sda1/tmpdir/ltp-r9GWHcZ5yU/alltests -l /lkp/benchmarks/ltp/results=
/LTP_RUN_ON-2021_09_03-18h_44m_44s.log  -C /lkp/benchmarks/ltp/output/LTP_R=
UN_ON-2021_09_03-18h_44m_44s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_O=
N-2021_09_03-18h_44m_44s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_09_03-18h_44m_44s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_09_03-18h_4=
4m_44s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_09_03-18h_44=
m_44s.tconf
Running tests.......
<<<test_start>>>
tag=3Daccept02 stime=3D1630694685
cmdline=3D"accept02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
tst_buffers.c:55: TINFO: Test is using guarded buffers
accept02.c:130: TINFO: Starting listener on port: 34171
accept02.c:74: TPASS: Multicast group was not copied: EADDRNOTAVAIL (99)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dadd_key02 stime=3D1630694685
cmdline=3D"add_key02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
add_key02.c:60: TPASS: received expected EFAULT with key type 'asymmetric'
add_key02.c:60: TPASS: received expected EFAULT with key type 'cifs.idmap'
add_key02.c:60: TPASS: received expected EFAULT with key type 'cifs.spnego'
add_key02.c:60: TPASS: received expected EFAULT with key type 'pkcs7_test'
add_key02.c:60: TPASS: received expected EFAULT with key type 'rxrpc'
add_key02.c:60: TPASS: received expected EFAULT with key type 'rxrpc_s'
add_key02.c:60: TPASS: received expected EFAULT with key type 'user'
add_key02.c:60: TPASS: received expected EFAULT with key type 'logon'
add_key02.c:60: TPASS: received expected EFAULT with key type 'big_key'

Summary:
passed   9
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dadd_key05 stime=3D1630694685
cmdline=3D"add_key05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
add_key05.c:45: TINFO: Created user ltp_add_key05_0
add_key05.c:186: TINFO: User: 0, UID: 1091
add_key05.c:83: TINFO: test max bytes under unprivileged user
add_key05.c:108: TPASS: add_key(test_inv) failed as expected: EDQUOT (122)
add_key05.c:131: TPASS: add_key(test_max) succeeded as expected
add_key05.c:134: TPASS: allow reaching the max bytes exactly
add_key05.c:45: TINFO: Created user ltp_add_key05_1
add_key05.c:186: TINFO: User: 1, UID: 1092
add_key05.c:144: TINFO: test max keys under unprivileged user
add_key05.c:162: TPASS: add_key(test_invalid_key) failed as expected: EDQUO=
T (122)
add_key05.c:169: TPASS: allow reaching the max key(200) exactly
userdel: ltp_add_key05_1 mail spool (/var/mail/ltp_add_key05_1) not found
userdel: ltp_add_key05_1 home directory (/home/ltp_add_key05_1) not found
userdel: ltp_add_key05_0 mail spool (/var/mail/ltp_add_key05_0) not found
userdel: ltp_add_key05_0 home directory (/home/ltp_add_key05_0) not found

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D57 cstime=3D85
<<<test_end>>>
<<<test_start>>>
tag=3Dadjtimex01 stime=3D1630694686
cmdline=3D"adjtimex01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
adjtimex01.c:24: TPASS: adjtimex() with mode 0x403f=20
adjtimex01.c:34: TPASS: adjtimex() with mode 0x8001=20

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dalarm06 stime=3D1630694686
cmdline=3D"alarm06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
alarm06.c:54: TPASS: Received 0 alarms
alarm06.c:57: TPASS: alarm(0) returned 1

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dcapset02 stime=3D1630694689
cmdline=3D"capset02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
capset02.c:67: TPASS: capset() with bad address header : EFAULT (14)
capset02.c:67: TPASS: capset() with bad address data : EFAULT (14)
capset02.c:67: TPASS: capset() with bad version : EINVAL (22)
capset02.c:67: TPASS: capset() with bad value data(when pE is not in pP) : =
EPERM (1)
capset02.c:67: TPASS: capset() with bad value data(when pP is not in old pP=
) : EPERM (1)
capset02.c:67: TPASS: capset() with bad value data(when pI is not in boundi=
ng set or old pI) : EPERM (1)

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dchdir04 stime=3D1630694689
cmdline=3D"chdir04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chdir04.c:29: TPASS: chdir() : ENAMETOOLONG (36)
chdir04.c:29: TPASS: chdir() : ENOENT (2)
chdir04.c:29: TPASS: chdir() : EFAULT (14)

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchmod03 stime=3D1630694689
cmdline=3D"chmod03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chmod03.c:43: TPASS: chmod(testfile, 1777) passed
chmod03.c:55: TPASS: stat(testfile) mode=3D101777
chmod03.c:43: TPASS: chmod(testdir_3, 1777) passed
chmod03.c:55: TPASS: stat(testdir_3) mode=3D41777

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dchmod05 stime=3D1630694689
cmdline=3D"chmod05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chmod05.c:65: TPASS: Functionality of chmod(testdir, 043777) successful

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown03 stime=3D1630694689
cmdline=3D"chown03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chown03.c:64: TPASS: chown(chown03_testfile, -1, 65534) passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown05 stime=3D1630694689
cmdline=3D"chown05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
chown05.c:43: TPASS: chown(testfile, 700, 701), change owner/group ids pass=
ed
chown05.c:43: TPASS: chown(testfile, 702, -1), change owner id only passed
chown05.c:43: TPASS: chown(testfile, 703, 701), change owner id only passed
chown05.c:43: TPASS: chown(testfile, -1, 704), change group id only passed
chown05.c:43: TPASS: chown(testfile, 703, 705), change group id only passed
chown05.c:43: TPASS: chown(testfile, -1, -1), no change passed

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dchown05_16 stime=3D1630694689
cmdline=3D"chown05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16=
=2Eh:153: TCONF: 16-bit version of chown() is not supported on your platform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dclock_gettime04 stime=3D1630694689
cmdline=3D"clock_gettime04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
clock_gettime04.c:170: TPASS: CLOCK_REALTIME: Difference between successive=
 readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:174: TINFO: 	- gettimeofday
clock_gettime04.c:170: TPASS: CLOCK_REALTIME_COARSE: Difference between suc=
cessive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC: Difference between successiv=
e readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC_COARSE: Difference between su=
ccessive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_MONOTONIC_RAW: Difference between succe=
ssive readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec
clock_gettime04.c:170: TPASS: CLOCK_BOOTTIME: Difference between successive=
 readings is reasonable for following variants:
clock_gettime04.c:174: TINFO: 	- vDSO or syscall with libc spec
clock_gettime04.c:174: TINFO: 	- syscall with old kernel spec
clock_gettime04.c:174: TINFO: 	- vDSO with old kernel spec

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D10 cstime=3D7
<<<test_end>>>
<<<test_start>>>
tag=3Dleapsec01 stime=3D1630694690
cmdline=3D"leapsec01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
leapsec01.c:130: TINFO: test start at 18:44:50.154628683
leapsec01.c:100: TINFO: now is     18:44:50.155538204
leapsec01.c:104: TINFO: sleep until 18:44:51.155538204
leapsec01.c:112: TINFO: now is     18:44:51.155619032
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:138: TINFO: scheduling leap second 00:00:00.000000000
leapsec01.c:144: TINFO: setting time to        23:59:58.000000000
leapsec01.c:88: TINFO: 23:59:58.000278000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000389000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000432000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.000473000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:58.500604000 adjtimex: clock synchronized
leapsec01.c:88: TINFO: 23:59:59.000880000 adjtimex: insert leap second
leapsec01.c:88: TINFO: 23:59:59.501054000 adjtimex: insert leap second
leapsec01.c:88: TINFO: 00:00:00.001243000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 23:59:59.510540000 adjtimex: leap second in progress
leapsec01.c:88: TINFO: 00:00:00.010796000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:00.511029000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:01.011205000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:01.511453000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:02.011675000 adjtimex: leap second has occurred
leapsec01.c:100: TINFO: now is     00:00:02.511918746
leapsec01.c:104: TINFO: sleep until 00:00:03.511918746
leapsec01.c:112: TINFO: now is     00:00:03.512002360
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:88: TINFO: 00:00:03.512147000 adjtimex: leap second has occurred
leapsec01.c:88: TINFO: 00:00:03.512195000 adjtimex: clock synchronized
leapsec01.c:170: TINFO: restoring time to 18:44:55.666865335
leapsec01.c:100: TINFO: now is     18:44:55.667044158
leapsec01.c:104: TINFO: sleep until 18:44:56.667044158
leapsec01.c:112: TINFO: now is     18:44:56.667121337
leapsec01.c:115: TINFO: hrtimer early expiration is not detected.
leapsec01.c:177: TPASS: No errors were reported during this test!

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D3
<<<test_end>>>
<<<test_start>>>
tag=3Dclock_settime03 stime=3D1630694696
cmdline=3D"clock_settime03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
clock_settime03.c:35: TINFO: Testing variant: syscall with old kernel spec
clock_settime03.c:103: TPASS: clock_settime(): Y2038 test passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dclose_range02 stime=3D1630694699
cmdline=3D"close_range02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
close_range02.c:53: TPASS: close_range(4, 100, 0) passed
close_range02.c:55: TPASS: fcntl(4, F_GETFD) : EBADF (9)
close_range02.c:56: TPASS: fcntl(100, F_GETFD) : EBADF (9)
close_range02.c:59: TPASS: close_range(4, 3, 0) : EINVAL (22)
close_range02.c:62: TPASS: close_range(3, ~0U, ~0U) : EINVAL (22)
close_range02.c:65: TPASS: close_range(~0U, ~0U, 0) passed
close_range02.c:72: TPASS: close_range(4, 4, CLOSE_RANGE_CLOEXEC): SUCCESS =
(0)
close_range02.c:79: TPASS: FD_CLOEXEC was set on 4
close_range02.c:90: TPASS: close_range(4, 4, CLOSE_RANGE_UNSHARE): SUCCESS =
(0)
close_range02.c:96: TPASS: fcntl(4, F_GETFD) : EBADF (9)
close_range02.c:102: TPASS: 4 is open passed

Summary:
passed   11
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dcreat04 stime=3D1630694699
cmdline=3D"creat04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
creat04.c:49: TPASS: call failed with EACCES as expected
creat04.c:49: TPASS: call failed with EACCES as expected

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dcreat08 stime=3D1630694699
cmdline=3D"creat08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
creat08.c:45: TINFO: User nobody: uid =3D 65534, gid =3D 65534
creat08.c:46: TINFO: Found unused GID 11: SUCCESS (0)
creat08.c:62: TPASS: dir_a/nosetgid: Owned by correct group
creat08.c:73: TPASS: dir_a/nosetgid: Setgid bit not set
creat08.c:62: TPASS: dir_a/setgid: Owned by correct group
creat08.c:71: TPASS: dir_a/setgid: Setgid bit is set
creat08.c:62: TPASS: dir_b/nosetgid: Owned by correct group
creat08.c:73: TPASS: dir_b/nosetgid: Setgid bit not set
creat08.c:62: TPASS: dir_b/setgid: Owned by correct group
creat08.c:66: TINFO: dir_b/setgid: Skipping setgid bit check
creat08.c:62: TPASS: dir_b/root_setgid: Owned by correct group
creat08.c:71: TPASS: dir_b/root_setgid: Setgid bit is set

Summary:
passed   9
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Depoll_wait01 stime=3D1630694699
cmdline=3D"epoll_wait01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
epoll_wait01.c:46: TINFO: Pipe buffer size is 65536 bytes
epoll_wait01.c:128: TPASS: epoll_wait() epollout
epoll_wait01.c:166: TPASS: epoll_wait() epollin
epoll_wait01.c:213: TPASS: epoll_wait() epollio

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Deventfd2_03 stime=3D1630694699
cmdline=3D"eventfd2_03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
[5475] posting 1 on 5
[5475] waiting on 4
[5475] wait completed on 4: count=3D1
[5475] posting 1 on 5
[5475] waiting on 4
[5475] wait completed on 4: count=3D1
[5475] posting 5 on 5
[5475] waiting 5 times on 4
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5475] wait completed on 4: count=3D1
[5474] posting 1 on 4
[5474] waiting on 5
[5474] wait completed on 5: count=3D1
[5474] posting 1 on 4
[5474] waiting on 5
[5474] wait completed on 5: count=3D1
[5474] posting 5 on 4
[5474] waiting 5 times on 5
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
[5474] wait completed on 5: count=3D1
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dexecve03 stime=3D1630694699
cmdline=3D"execve03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
execve03.c:124: TPASS: execve failed as expected: ENAMETOOLONG (36)
execve03.c:124: TPASS: execve failed as expected: ENOENT (2)
execve03.c:124: TPASS: execve failed as expected: ENOTDIR (20)
execve03.c:124: TPASS: execve failed as expected: EFAULT (14)
execve03.c:124: TPASS: execve failed as expected: EACCES (13)
execve03.c:124: TPASS: execve failed as expected: ENOEXEC (8)

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfchdir01 stime=3D1630694699
cmdline=3D"fchdir01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fchdir01    1  TPASS  :  fchdir call succeeded
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfchmod01 stime=3D1630694700
cmdline=3D"fchmod01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 07) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 070) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0700) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 0777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 02777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 04777) successful
fchmod01.c:42: TPASS: Functionality of fchmod(4, 06777) successful

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfchown01 stime=3D1630694700
cmdline=3D"fchown01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fchown01.c:32: TPASS: fchown(4, 0, 0) passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl03 stime=3D1630694700
cmdline=3D"fcntl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fcntl03.c:33: TPASS: fcntl(fcntl03_5485, F_GETFD, 0) returned 0

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl05 stime=3D1630694700
cmdline=3D"fcntl05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl05     1  TPASS  :  fcntl returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl06_64 stime=3D1630694700
cmdline=3D"fcntl06_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl06     1  TCONF  :  fcntl06.c:109: system doesn't have LINUX_LOCK_FILE=
_REGION support
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl09 stime=3D1630694700
cmdline=3D"fcntl09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl09     1  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_WRLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_UNLCK returned 0
fcntl09     1  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_RDLCK returned 0
fcntl09     2  TPASS  :  fcntl(./file_5491, F_SETLK, &flocks) flocks.l_type=
 =3D F_UNLCK returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl12 stime=3D1630694700
cmdline=3D"fcntl12"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl12     0  TINFO  :  Test for errno EMFILE
fcntl12     1  TPASS  :  block 1 PASSED
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl12_64 stime=3D1630694700
cmdline=3D"fcntl12_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl12     0  TINFO  :  Test for errno EMFILE
fcntl12     1  TPASS  :  block 1 PASSED
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl14 stime=3D1630694700
cmdline=3D"fcntl14"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl14     0  TINFO  :  Enter block 1: without mandatory locking
fcntl14     1  TPASS  :  testcase:1 PASSED
fcntl14     2  TPASS  :  testcase:2 PASSED
fcntl14     3  TPASS  :  testcase:3 PASSED
fcntl14     4  TPASS  :  testcase:4 PASSED
fcntl14     5  TPASS  :  testcase:5 PASSED
fcntl14     6  TPASS  :  testcase:6 PASSED
fcntl14     7  TPASS  :  testcase:7 PASSED
fcntl14     8  TPASS  :  testcase:8 PASSED
fcntl14     9  TPASS  :  testcase:9 PASSED
fcntl14    10  TPASS  :  testcase:10 PASSED
fcntl14    11  TPASS  :  testcase:11 PASSED
fcntl14    12  TPASS  :  testcase:12 PASSED
fcntl14    13  TPASS  :  testcase:13 PASSED
fcntl14    14  TPASS  :  testcase:14 PASSED
fcntl14    15  TPASS  :  testcase:15 PASSED
fcntl14    16  TPASS  :  testcase:16 PASSED
fcntl14    17  TPASS  :  testcase:17 PASSED
fcntl14    18  TPASS  :  testcase:18 PASSED
fcntl14    19  TPASS  :  testcase:19 PASSED
fcntl14    20  TPASS  :  testcase:20 PASSED
fcntl14    21  TPASS  :  testcase:21 PASSED
fcntl14    22  TPASS  :  testcase:22 PASSED
fcntl14    23  TPASS  :  testcase:23 PASSED
fcntl14    24  TPASS  :  testcase:24 PASSED
fcntl14    25  TPASS  :  testcase:25 PASSED
fcntl14    26  TPASS  :  testcase:26 PASSED
fcntl14    27  TPASS  :  testcase:27 PASSED
fcntl14    28  TPASS  :  testcase:28 PASSED
fcntl14    29  TPASS  :  testcase:29 PASSED
fcntl14    30  TPASS  :  testcase:30 PASSED
fcntl14    31  TPASS  :  testcase:31 PASSED
fcntl14    32  TPASS  :  testcase:32 PASSED
fcntl14    33  TPASS  :  testcase:33 PASSED
fcntl14    34  TPASS  :  testcase:34 PASSED
fcntl14    35  TPASS  :  testcase:35 PASSED
fcntl14    36  TPASS  :  testcase:36 PASSED
fcntl14    37  TPASS  :  Block 1, test 1 PASSED
fcntl14    38  TPASS  :  testcase:37 PASSED
fcntl14    39  TPASS  :  testcase:38 PASSED
fcntl14    40  TPASS  :  testcase:39 PASSED
fcntl14    41  TPASS  :  testcase:40 PASSED
fcntl14    42  TPASS  :  testcase:41 PASSED
fcntl14    43  TPASS  :  testcase:42 PASSED
fcntl14    44  TPASS  :  testcase:43 PASSED
fcntl14    45  TPASS  :  testcase:44 PASSED
fcntl14    46  TPASS  :  testcase:45 PASSED
fcntl14    47  TPASS  :  Block 1, test 2 PASSED
fcntl14     0  TINFO  :  Exit block 1
fcntl14     0  TINFO  :  Enter block 2: with mandatory locking
fcntl14    48  TPASS  :  testcase:1 PASSED
fcntl14    49  TPASS  :  testcase:2 PASSED
fcntl14    50  TPASS  :  testcase:3 PASSED
fcntl14    51  TPASS  :  testcase:4 PASSED
fcntl14    52  TPASS  :  testcase:5 PASSED
fcntl14    53  TPASS  :  testcase:6 PASSED
fcntl14    54  TPASS  :  testcase:7 PASSED
fcntl14    55  TPASS  :  testcase:8 PASSED
fcntl14    56  TPASS  :  testcase:9 PASSED
fcntl14    57  TPASS  :  testcase:10 PASSED
fcntl14    58  TPASS  :  testcase:11 PASSED
fcntl14    59  TPASS  :  testcase:12 PASSED
fcntl14    60  TPASS  :  testcase:13 PASSED
fcntl14    61  TPASS  :  testcase:14 PASSED
fcntl14    62  TPASS  :  testcase:15 PASSED
fcntl14    63  TPASS  :  testcase:16 PASSED
fcntl14    64  TPASS  :  testcase:17 PASSED
fcntl14    65  TPASS  :  testcase:18 PASSED
fcntl14    66  TPASS  :  testcase:19 PASSED
fcntl14    67  TPASS  :  testcase:20 PASSED
fcntl14    68  TPASS  :  testcase:21 PASSED
fcntl14    69  TPASS  :  testcase:22 PASSED
fcntl14    70  TPASS  :  testcase:23 PASSED
fcntl14    71  TPASS  :  testcase:24 PASSED
fcntl14    72  TPASS  :  testcase:25 PASSED
fcntl14    73  TPASS  :  testcase:26 PASSED
fcntl14    74  TPASS  :  testcase:27 PASSED
fcntl14    75  TPASS  :  testcase:28 PASSED
fcntl14    76  TPASS  :  testcase:29 PASSED
fcntl14    77  TPASS  :  testcase:30 PASSED
fcntl14    78  TPASS  :  testcase:31 PASSED
fcntl14    79  TPASS  :  testcase:32 PASSED
fcntl14    80  TPASS  :  testcase:33 PASSED
fcntl14    81  TPASS  :  testcase:34 PASSED
fcntl14    82  TPASS  :  testcase:35 PASSED
fcntl14    83  TPASS  :  testcase:36 PASSED
fcntl14    84  TPASS  :  Block 2, test 1 PASSED
fcntl14    85  TPASS  :  testcase:37 PASSED
fcntl14    86  TPASS  :  testcase:38 PASSED
fcntl14    87  TPASS  :  testcase:39 PASSED
fcntl14    88  TPASS  :  testcase:40 PASSED
fcntl14    89  TPASS  :  testcase:41 PASSED
fcntl14    90  TPASS  :  testcase:42 PASSED
fcntl14    91  TPASS  :  testcase:43 PASSED
fcntl14    92  TPASS  :  testcase:44 PASSED
fcntl14    93  TPASS  :  testcase:45 PASSED
fcntl14    94  TPASS  :  Block 2, test 2 PASSED
fcntl14     0  TINFO  :  Exit block 2
fcntl14     0  TINFO  :  Enter block 3
fcntl14    95  TPASS  :  Test with negative whence locking PASSED
fcntl14     0  TINFO  :  Exit block 3
fcntl14     0  TINFO  :  Enter block 4
fcntl14    96  TPASS  :  Test of locks on file PASSED
fcntl14     0  TINFO  :  Exit block 4
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D6 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D4 cstime=3D25
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl18 stime=3D1630694706
cmdline=3D"fcntl18"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl18     0  TINFO  :  Enter block 1
fcntl18     1  TPASS  :  Test F_GETLK: for errno EFAULT PASSED
fcntl18     0  TINFO  :  Block 1 PASSED
fcntl18     0  TINFO  :  Exit block 1
fcntl18     0  TINFO  :  Enter block 2
fcntl18     2  TPASS  :  Test F_GETLK64: for errno EFAULT PASSED
fcntl18     0  TINFO  :  Block 2 PASSED
fcntl18     0  TINFO  :  Exit block 2
fcntl18     0  TINFO  :  Enter block 3
fcntl18     3  TPASS  :  Test for errno EINVAL PASSED
fcntl18     0  TINFO  :  Block 3 PASSED
fcntl18     0  TINFO  :  Exit block 3
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl21 stime=3D1630694706
cmdline=3D"fcntl21"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl21     0  TINFO  :  Enter block 1
fcntl21     0  TINFO  :  Test block 1: PASSED
fcntl21     0  TINFO  :  Exit block 1
fcntl21     0  TINFO  :  Enter block 2
fcntl21     0  TINFO  :  Test block 2: PASSED
fcntl21     0  TINFO  :  Exit block 2
fcntl21     0  TINFO  :  Enter block 3
fcntl21     0  TINFO  :  Test block 3 : PASSED
fcntl21     0  TINFO  :  Exit block 3
fcntl21     0  TINFO  :  Enter block 4
fcntl21     0  TINFO  :  Test block 4: PASSED
fcntl21     0  TINFO  :  Exit block 4
fcntl21     0  TINFO  :  Enter block 5
fcntl21     0  TINFO  :  Test block 5: PASSED
fcntl21     0  TINFO  :  Exit block 5
fcntl21     0  TINFO  :  Enter block 6
fcntl21     0  TINFO  :  Test block 6 PASSED
fcntl21     0  TINFO  :  Exit block 6
fcntl21     0  TINFO  :  Enter block 7
fcntl21     0  TINFO  :  Test block 7: PASSED
fcntl21     0  TINFO  :  Exit block 7
fcntl21     0  TINFO  :  Enter block 8
fcntl21     0  TINFO  :  Test block 8: PASSED
fcntl21     0  TINFO  :  Exit block 8
fcntl21     0  TINFO  :  Enter block 9
fcntl21     0  TINFO  :  Test block 9: PASSED
fcntl21     0  TINFO  :  Exit block 9
fcntl21     0  TINFO  :  Enter block 10
fcntl21     0  TINFO  :  Test block 10: PASSED
fcntl21     0  TINFO  :  Exit block 10
fcntl21     0  TINFO  :  Enter block 11
fcntl21     0  TINFO  :  Test block 11: PASSED
fcntl21     0  TINFO  :  Exit block 11
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl25_64 stime=3D1630694706
cmdline=3D"fcntl25_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl25     1  TPASS  :  fcntl(tfile_5672, F_SETLEASE, F_WRLCK)
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl27 stime=3D1630694706
cmdline=3D"fcntl27"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl27     1  TPASS  :  fcntl(fd, F_SETLEASE, F_RDLCK) succeeded
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl30 stime=3D1630694706
cmdline=3D"fcntl30"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl30     0  TINFO  :  orig_pipe_size: 65536 new_pipe_size: 131072
fcntl30     1  TPASS  :  fcntl test F_GETPIPE_SZ and F_SETPIPE_SZ passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl31_64 stime=3D1630694706
cmdline=3D"fcntl31_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     1  TPASS  :  fcntl test F_GETOWN, F_SETOWN for process ID succe=
ss
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     2  TPASS  :  fcntl test F_GETOWN, F_SETOWN for process group ID=
 success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     3  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for thread ID =
success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     4  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for process ID=
 success
fcntl31     0  TINFO  :  default io events signal is SIGIO
fcntl31     5  TPASS  :  fcntl test F_GETOWN_EX, F_SETOWN_EX for process gr=
oup ID success
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfcntl36 stime=3D1630694706
cmdline=3D"fcntl36"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fcntl36.c:289: TINFO: OFD read lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD read lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D7 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5705 cstime=3D31200
<<<test_end>>>
<<<test_start>>>
tag=3Dflistxattr01 stime=3D1630694713
cmdline=3D"flistxattr01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
flistxattr01.c:64: TPASS: flistxattr() succeeded

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dfork04 stime=3D1630694713
cmdline=3D"fork04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fork04      1  TPASS  :  Env var TERM unchanged after fork(): getenv() does=
 not find variable set
fork04      2  TPASS  :  Env var NoTSetzWq unchanged after fork(): getenv()=
 does not find variable set
fork04      3  TPASS  :  Env var TESTPROG unchanged after fork(): FRKTCS04
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfork05 stime=3D1630694713
cmdline=3D"fork05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
fork05      0  TINFO  :  %fs test only for ix86
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dfsconfig01 stime=3D1630694713
cmdline=3D"fsconfig01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:40: TCONF: fsconfig(FSCONFIG_SET_PATH) not supported
fsconfig01.c:48: TCONF: fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported
fsconfig01.c:56: TCONF: fsconfig(FSCONFIG_SET_FD) not supported
fsconfig01.c:78: TPASS: fsconfig() passed
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fsconfig01.c:78: TPASS: fsconfig() passed

Summary:
passed   7
failed   0
broken   0
skipped  15
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D80
<<<test_end>>>
<<<test_start>>>
tag=3Dfspick02 stime=3D1630694716
cmdline=3D"fspick02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fspick02.c:42: TPASS: invalid-fd: fspick() failed as expected: EBADF (9)
fspick02.c:42: TPASS: invalid-path: fspick() failed as expected: ENOENT (2)
fspick02.c:42: TPASS: invalid-flags: fspick() failed as expected: EINVAL (2=
2)

Summary:
passed   21
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D3 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D18 cstime=3D100
<<<test_end>>>
<<<test_start>>>
tag=3Dfstat02_64 stime=3D1630694719
cmdline=3D"fstat02_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fstat02.c:67: TPASS: fstat() reported correct values.

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate01 stime=3D1630694719
cmdline=3D"ftruncate01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate01.c:65: TINFO: Truncated length smaller than file size
ftruncate01.c:60: TPASS: ftruncate() succeeded
ftruncate01.c:74: TINFO: Truncated length exceeds file size
ftruncate01.c:60: TPASS: ftruncate() succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate01_64 stime=3D1630694719
cmdline=3D"ftruncate01_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate01.c:65: TINFO: Truncated length smaller than file size
ftruncate01.c:60: TPASS: ftruncate() succeeded
ftruncate01.c:74: TINFO: Truncated length exceeds file size
ftruncate01.c:60: TPASS: ftruncate() succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dftruncate04 stime=3D1630694719
cmdline=3D"ftruncate04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ftruncate04.c:116: TINFO: Child locks file
ftruncate04.c:60: TPASS: ftruncate() offset before lock failed with EAGAIN
ftruncate04.c:60: TPASS: ftruncate() offset in lock failed with EAGAIN
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded
ftruncate04.c:127: TINFO: Child unlocks file
ftruncate04.c:84: TPASS: ftruncate() offset in lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset before lock succeded
ftruncate04.c:84: TPASS: ftruncate() offset after lock succeded

Summary:
passed   6
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D19
<<<test_end>>>
<<<test_start>>>
tag=3Dgetcwd01 stime=3D1630694720
cmdline=3D"getcwd01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getcwd01.c:62: TPASS: getcwd() failed as expected: EFAULT (14)
getcwd01.c:62: TPASS: getcwd() failed as expected: ENOMEM (12)
getcwd01.c:62: TPASS: getcwd() failed as expected: EINVAL (22)
getcwd01.c:62: TPASS: getcwd() failed as expected: ERANGE (34)
getcwd01.c:62: TPASS: getcwd() failed as expected: ERANGE (34)

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetdents01 stime=3D1630694720
cmdline=3D"getdents01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:148: TINFO: Testing the SYS_getdents syscall
getdents01.c:92: TINFO: Found '.'
getdents01.c:92: TINFO: Found '..'
getdents01.c:92: TINFO: Found 'dir'
getdents01.c:92: TINFO: Found 'file'
getdents01.c:92: TINFO: Found 'symlink'
getdents01.c:126: TPASS: All entries found
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:151: TINFO: Testing the SYS_getdents64 syscall
getdents01.c:92: TINFO: Found '.'
getdents01.c:92: TINFO: Found '..'
getdents01.c:92: TINFO: Found 'dir'
getdents01.c:92: TINFO: Found 'file'
getdents01.c:92: TINFO: Found 'symlink'
getdents01.c:126: TPASS: All entries found
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:157: TCONF: libc getdents() is not implemented
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getdents.h:164: TCONF: libc getdents64() is not implemented

Summary:
passed   2
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dgetegid01 stime=3D1630694720
cmdline=3D"getegid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getegid01    1  TPASS  :  getegid returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetgid03_16 stime=3D1630694720
cmdline=3D"getgid03_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/getgid/../utils/compat_tst_1=
6.h:99: TCONF: 16-bit version of getgid() is not supported on your platform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetgroups01_16 stime=3D1630694720
cmdline=3D"getgroups01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getgroups01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/getgroups/../utils/compat_16.h:82: 16-bit version of getgroups() is not =
supported on your platform
getgroups01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/getgroups/../utils/compat_16.h:82: Remaining cases not appropriate for c=
onfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dgethostid01 stime=3D1630694720
cmdline=3D"gethostid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
gethostid01.c:55: TINFO: get original hostid: 8323328
gethostid01.c:37: TPASS: set hostid to 0 passed
gethostid01.c:44: TPASS: hostid is 0, expected 0
gethostid01.c:37: TPASS: set hostid to 65535 passed
gethostid01.c:44: TPASS: hostid is 65535, expected 65535
gethostid01.c:60: TPASS: set hostid to 8323328 passed

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetpgid02 stime=3D1630694720
cmdline=3D"getpgid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getpgid02    1  TPASS  :  expected failure - errno =3D 3 : No such process
getpgid02    2  TPASS  :  expected failure - errno =3D 3 : No such process
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetpid02 stime=3D1630694720
cmdline=3D"getpid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getpid02.c:36: TPASS: child getppid() =3D=3D parent getpid() (6627)
getpid02.c:49: TPASS: child getpid() =3D=3D parent fork() (6628)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetppid02 stime=3D1630694720
cmdline=3D"getppid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getppid02.c:31: TPASS: getppid() returned parent pid (6630)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom01 stime=3D1630694720
cmdline=3D"getrandom01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)
getrandom01.c:21: TPASS: getrandom returned -1: EFAULT (14)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom02 stime=3D1630694720
cmdline=3D"getrandom02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256
getrandom02.c:59: TPASS: getrandom returned 256

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetrandom04 stime=3D1630694720
cmdline=3D"getrandom04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
getrandom04.c:28: TPASS: getrandom returned 100

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetresuid03 stime=3D1630694720
cmdline=3D"getresuid03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getresuid03    1  TPASS  :  Functionality of getresuid() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgetsockname01 stime=3D1630694720
cmdline=3D"getsockname01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getsockname01    1  TPASS  :  bad file descriptor successful
getsockname01    2  TPASS  :  bad file descriptor successful
getsockname01    3  TPASS  :  invalid socket buffer successful
getsockname01    4  TPASS  :  invalid aligned salen successful
getsockname01    5  TPASS  :  invalid unaligned salen successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dgettid01 stime=3D1630694720
cmdline=3D"gettid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
gettid01    1  TPASS  :  gettid() returned 6640
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dgetxattr02 stime=3D1630694720
cmdline=3D"getxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
getxattr02    1  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    2  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    3  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
getxattr02    4  TPASS  :  expected behavior: TEST_ERRNO=3DENODATA(61): No =
data available
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl04 stime=3D1630694720
cmdline=3D"ioctl04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl04.c:26: TPASS: BLKROGET returned 0
ioctl04.c:39: TPASS: BLKROGET returned 1
ioctl04.c:50: TPASS: Mounting RO device RW failed: EACCES (13)
ioctl04.c:61: TPASS: Mounting RO device RO works

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D9
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl08 stime=3D1630694721
cmdline=3D"ioctl08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with SUCCESS as expected
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with SUCCESS as expected
ioctl08.c:93: TPASS: ioctl(FIDEDUPERANGE) ended with EINVAL as expected

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D14
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl_loop01 stime=3D1630694721
cmdline=3D"ioctl_loop01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
ioctl_loop01.c:85: TPASS: /sys/block/loop0/loop/partscan =3D 0
ioctl_loop01.c:86: TPASS: /sys/block/loop0/loop/autoclear =3D 0
ioctl_loop01.c:87: TPASS: /sys/block/loop0/loop/backing_file =3D '/fs/sda1/=
tmpdir/ltp-r9GWHcZ5yU/iocf8v5B6/test.img'
ioctl_loop01.c:57: TPASS: get expected lo_flag 12
ioctl_loop01.c:59: TPASS: /sys/block/loop0/loop/partscan =3D 1
ioctl_loop01.c:60: TPASS: /sys/block/loop0/loop/autoclear =3D 1
ioctl_loop01.c:69: TPASS: access /dev/loop0p1 succeeds
ioctl_loop01.c:75: TPASS: access /sys/block/loop0/loop0p1 succeeds
ioctl_loop01.c:91: TINFO: Test flag can be clear
ioctl_loop01.c:57: TPASS: get expected lo_flag 8
ioctl_loop01.c:59: TPASS: /sys/block/loop0/loop/partscan =3D 1
ioctl_loop01.c:60: TPASS: /sys/block/loop0/loop/autoclear =3D 0
ioctl_loop01.c:69: TPASS: access /dev/loop0p1 succeeds
ioctl_loop01.c:75: TPASS: access /sys/block/loop0/loop0p1 succeeds

Summary:
passed   13
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D5 cstime=3D12
<<<test_end>>>
<<<test_start>>>
tag=3Dioctl_ns02 stime=3D1630694722
cmdline=3D"ioctl_ns02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ioctl_ns02.c:39: TPASS: NS_GET_PARENT fails with EINVAL

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dinotify01 stime=3D1630694722
cmdline=3D"inotify01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D04 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D20 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D01 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D10 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D20 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D02 cookie=3D0 len=3D0
inotify01.c:119: TPASS: get event: wd=3D1 mask=3D08 cookie=3D0 len=3D0

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dinotify06 stime=3D1630694722
cmdline=3D"inotify06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 50m 00s
inotify06.c:92: TPASS: kernel survived inotify beating

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D47
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify01 stime=3D1630694722
cmdline=3D"fanotify01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify01.c:92: TINFO: Test #0: inode mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #1: mount mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #2: filesystem mark events
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D5
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D6
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D8
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D7
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D10
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D9
fanotify01.c:92: TINFO: Test #3: inode mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1
fanotify01.c:92: TINFO: Test #4: mount mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1
fanotify01.c:92: TINFO: Test #5: filesystem mark events (FAN_REPORT_FID)
fanotify01.c:297: TPASS: got event: mask=3D31 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D11 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D10 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2a pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Da pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D20 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3Db pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D9 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-2
fanotify01.c:297: TPASS: got event: mask=3D2 pid=3D6699 fd=3D-1
fanotify01.c:297: TPASS: got event: mask=3D8 pid=3D6699 fd=3D-1

Summary:
passed   72
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify08 stime=3D1630694723
cmdline=3D"fanotify08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify08.c:39: TPASS: not set close_on_exec
fanotify08.c:39: TPASS: set close_on_exec

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dfanotify16 stime=3D1630694723
cmdline=3D"fanotify16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.e001.f46=
f5b88.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.e002.f46f5b89.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f801.f46=
f5b8a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f802.f46f5b8b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.a001.f46=
f5b8c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.a002.f46f5b8d.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f801.f46=
f5b8e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f802.f46f5b8f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.7801.f46=
f5b90.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.7802.f46f5b91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.d001.f46=
f5b92.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.d002.f46f5b93.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6728 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.2001.f46=
f5b94.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.2002.f46f5b95.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6728 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9611e2a3.52e2b4fb.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9611e2a3.52e2b4fb.f001.f46=
f5b96.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9611e2a3.52e2b4=
fb.f002.f46f5b97.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6728 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6728 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6728 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6728 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6728 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6728 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.ab1=
d7d98.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.d14c1101.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d58=
6674.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.70fc927b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.da1=
00606.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.d6a74aeb.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d1e=
ecbb6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.dcc59f62.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.971=
7d02d.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.77035322.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.d2d=
80241.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.1b20fa0b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6736 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.5d0=
d6207.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.e6adc439.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6736 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 91074da7.a1ac7026.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 91074da7.a1ac7026.6001.619=
194d4.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 91074da7.a1ac70=
26.6002.55d340ef.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6736 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6736 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6736 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6736 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6736 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6736 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.487=
a09d6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.fdd29e6.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.a59=
a0912.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.d9d667c6.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.fec=
0a681.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.83c209c3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.5d6=
dca28.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.7eb4fc7b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.aec=
3e25a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.aaeb8c01.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.910=
94df7.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.3b80497e.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6758 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.eea=
da82.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.b6ebfc91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6758 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 9a8e71f6.9d031f4d.2.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 9a8e71f6.9d031f4d.8001.a90=
fbeb0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 9a8e71f6.9d031f=
4d.8002.ac832ede.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6758 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6758 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6758 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6758 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6758 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6758 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.83.0.91bdbbe7...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.84.0.fe4d=
e937...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.20080.0.f3afaeff...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.20081.0.7=
bac28a8...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.41b00.0.1b31fe77...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.41b01.0.f=
b939a28...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.60060.0.e122187d...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.60061.0.8=
8caae4a...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.83.0.91bdbbe8...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.84.0.fe4d=
e938...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.20060.0.d2f9709e...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.20061.0.5=
8a9d831...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6776 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.41b40.0.dbc753ae...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.41b41.0.7=
6b8ae2a...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6776 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.80.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.60080.0.4286b50a...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.60081.0.1=
1f97226...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6776 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6776 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6776 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6776 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6776 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6776 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.101.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.102.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.103.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.104.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.105.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.106.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.107.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.108.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.109.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10a.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D40=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D104; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10b.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10c.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D40=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6813 fd=3D-1 name=3D=
'' len=3D104; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'' len=3D64; info #0: info_type=3D3 info_len=3D40 fh_len=3D20
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10d.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.10e.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6813 fd=3D-1 name=
=3D'' len=3D64; info #0: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D b9df46f8.4aca5142.100.0.5...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D b9df46f8.4aca5142.10f.0.5.=
=2E.
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D b9df46f8.4aca51=
42.110.0.5...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6813 fd=3D-1 name=
=3D'test_file1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6813 fd=3D-1 name=3D=
'test_file1' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6813 fd=3D-1 name=
=3D'test_file2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D52=
 fh_len=3D20
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6813 fd=3D-1 name=3D'=
test_file2' len=3D116; info #1: info_type=3D1 info_len=3D40 fh_len=3D20
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6813 fd=3D-1 n=
ame=3D'.' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D20
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir1' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6813 fd=3D-1 n=
ame=3D'test_dir2' len=3D76; info #0: info_type=3D2 info_len=3D52 fh_len=3D20
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.71.89fc7a20.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.72.bbfbba=
37.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.73.ab220e1c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.74.756b3d=
c3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.75.d10452e2.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.76.c5e986=
cd.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.77.9799459c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.78.27a0a2=
d1.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.79.712ac38.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7a.b68b3f=
c5.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7b.54d7ca8e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7c.c3e1f3=
4f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D28=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6819 fd=3D-1 name=3D=
'' len=3D80; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'' len=3D52; info #0: info_type=3D3 info_len=3D28 fh_len=3D8
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7d.f2712880.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.7e.bebbe8=
91.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6819 fd=3D-1 name=
=3D'' len=3D52; info #0: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 700.0.1.0.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 700.0.7f.edbb13fa.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 700.0.80.90aa35=
c7.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6819 fd=3D-1 name=
=3D'test_file1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6819 fd=3D-1 name=3D=
'test_file1' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6819 fd=3D-1 name=
=3D'test_file2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D40=
 fh_len=3D8
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6819 fd=3D-1 name=3D'=
test_file2' len=3D92; info #1: info_type=3D1 info_len=3D28 fh_len=3D8
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6819 fd=3D-1 n=
ame=3D'.' len=3D56; info #0: info_type=3D2 info_len=3D32 fh_len=3D8
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir1' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6819 fd=3D-1 n=
ame=3D'test_dir2' len=3D64; info #0: info_type=3D2 info_len=3D40 fh_len=3D8
tst_test.c:1421: TINFO: Testing on ntfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with ntfs opts=3D'' extra opts=
=3D''
The partition start sector was not specified for /dev/loop0 and it could no=
t be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop0 and it cou=
ld not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop0 and it could not be ob=
tained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sec=
tors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
tst_test.c:937: TINFO: Trying FUSE...
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:547: TCONF: FAN_REPORT_DIR_FID not supported on ntfs filesystem
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
fanotify16.c:162: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.986d4d2c.=
2.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.661ab1bd.3.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories =
for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.6ee6ba4e.=
4.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.323ea4d9.5.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D160 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D288 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for=
 create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.f3380478.=
6.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.e9d0cc51.7.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.9fd8087c.=
8.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.15c4d483.9.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3e8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D2a8 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem fo=
r create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.1b6200f9.=
a.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.af578e8f.b.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories f=
or create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.283df6f5.=
c.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.c935f61a.d.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D3c0 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #3: info #0: info_type=3D3 info_len=3D32=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D28 pid=3D6855 fd=3D-1 name=3D=
'' len=3D88; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D400002c0 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'' len=3D56; info #0: info_type=3D3 info_len=3D32 fh_len=3D12
fanotify16.c:162: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesyst=
em for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.56affeaf.=
e.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.37bb7cfa.f.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3Dc00 pid=3D6855 fd=3D-1 name=
=3D'' len=3D56; info #0: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:501: TINFO: got event #5: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #9: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:162: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor director=
ies for create/delete/move/open/close
fanotify.h:240: TINFO: fid(fs_mnt) =3D 4e429ed.1839ea05.8a6cdc4c.1.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1) =3D 4e429ed.1839ea05.c5c96299.=
10.0...
fanotify.h:240: TINFO: fid(fs_mnt/test_dir1/test_file1) =3D 4e429ed.1839ea0=
5.8cc1b43f.11.0...
fanotify16.c:520: TPASS: got event #0: mask=3D40000100 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #1: mask=3D140 pid=3D6855 fd=3D-1 name=
=3D'test_file1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #2: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #2: mask=3D20 pid=3D6855 fd=3D-1 name=3D=
'test_file1' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #3: mask=3D280 pid=3D6855 fd=3D-1 name=
=3D'test_file2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:501: TINFO: got event #4: info #0: info_type=3D2 info_len=3D44=
 fh_len=3D12
fanotify16.c:520: TPASS: got event #4: mask=3D8 pid=3D6855 fd=3D-1 name=3D'=
test_file2' len=3D100; info #1: info_type=3D1 info_len=3D32 fh_len=3D12
fanotify16.c:520: TPASS: got event #5: mask=3D40000c30 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #6: mask=3D40000c00 pid=3D6855 fd=3D-1 n=
ame=3D'.' len=3D60; info #0: info_type=3D2 info_len=3D36 fh_len=3D12
fanotify16.c:520: TPASS: got event #7: mask=3D40000040 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir1' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12
fanotify16.c:520: TPASS: got event #8: mask=3D40000280 pid=3D6855 fd=3D-1 n=
ame=3D'test_dir2' len=3D68; info #0: info_type=3D2 info_len=3D44 fh_len=3D12

Summary:
passed   490
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D12 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D25 cstime=3D574
<<<test_end>>>
<<<test_start>>>
tag=3Diopl01 stime=3D1630694735
cmdline=3D"iopl01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_lockdown.c:60: TINFO: Unable to determine system lockdown state
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
iopl01.c:40: TPASS: iopl() passed for level 0, returned 0
iopl01.c:40: TPASS: iopl() passed for level 1, returned 0
iopl01.c:40: TPASS: iopl() passed for level 2, returned 0
iopl01.c:40: TPASS: iopl() passed for level 3, returned 0

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_destroy01 stime=3D1630694735
cmdline=3D"io_destroy01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_destroy01.c:42: TPASS: io_destroy() failed as expected, returned -EINVAL

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_getevents01 stime=3D1630694735
cmdline=3D"io_getevents01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_getevents01.c:27: TPASS: io_getevents syscall with invalid ctx : EINVAL =
(22)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dio_setup01 stime=3D1630694735
cmdline=3D"io_setup01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
io_setup01.c:66: TPASS: io_setup() passed as expected
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EINVAL
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EINVAL
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EFAULT
io_setup01.c:45: TPASS: io_setup() failed as expected, returned -EAGAIN/EWO=
ULDBLOCK

Summary:
passed   5
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dkeyctl08 stime=3D1630694735
cmdline=3D"keyctl08"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
keyctl08.c:22: TPASS: Denied access to .builtin_trusted_keys

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlinkat01 stime=3D1630694735
cmdline=3D"linkat01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
linkat01    1  TPASS  :  linkat is functionality correct
linkat01    2  TPASS  :  linkat succeeded as expected
linkat01    3  TPASS  :  linkat is functionality correct
linkat01    4  TPASS  :  linkat is functionality correct
linkat01    5  TPASS  :  linkat is functionality correct
linkat01    6  TPASS  :  linkat succeeded as expected
linkat01    7  TPASS  :  linkat is functionality correct
linkat01    8  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOTDIR(20=
): Not a directory
linkat01    9  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOTDIR(20=
): Not a directory
linkat01   10  TPASS  :  linkat succeeded as expected
linkat01   11  TPASS  :  linkat is functionality correct
linkat01   12  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEBADF(9): =
Bad file descriptor
linkat01   13  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEBADF(9): =
Bad file descriptor
linkat01   14  TPASS  :  linkat succeeded as expected
linkat01   15  TPASS  :  linkat is functionality correct
linkat01   16  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOENT(2):=
 No such file or directory
linkat01   17  TPASS  :  linkat failed as expected: TEST_ERRNO=3DENOENT(2):=
 No such file or directory
linkat01   18  TPASS  :  linkat succeeded as expected
linkat01   19  TPASS  :  linkat is functionality correct
linkat01   20  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEXDEV(18):=
 Invalid cross-device link
linkat01   21  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEPERM(1): =
Operation not permitted
linkat01   22  TPASS  :  linkat failed as expected: TEST_ERRNO=3DEINVAL(22)=
: Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlistxattr01 stime=3D1630694735
cmdline=3D"listxattr01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
listxattr01.c:63: TPASS: listxattr() succeeded

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dlistxattr02 stime=3D1630694735
cmdline=3D"listxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
listxattr02.c:73: TPASS: listxattr() failed as expected: ERANGE (34)
listxattr02.c:73: TPASS: listxattr() failed as expected: ENOENT (2)
listxattr02.c:73: TPASS: listxattr() failed as expected: EFAULT (14)
listxattr02.c:73: TPASS: listxattr() failed as expected: ENAMETOOLONG (36)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dlseek11 stime=3D1630694735
cmdline=3D"lseek11"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
lseek11.c:162: TINFO: The block size is 4096
lseek11.c:212: TPASS: The 0th test passed: SEEK_DATA from startblock 0 offs=
et 0
lseek11.c:212: TPASS: The 1th test passed: SEEK_DATA from startblock 0 offs=
et 4
lseek11.c:212: TPASS: The 2th test passed: SEEK_HOLE from startblock 0 offs=
et 0
lseek11.c:212: TPASS: The 3th test passed: SEEK_HOLE from startblock 0 offs=
et 4
lseek11.c:212: TPASS: The 4th test passed: SEEK_HOLE from startblock 1 offs=
et 0
lseek11.c:212: TPASS: The 5th test passed: SEEK_HOLE from startblock 1 offs=
et 128
lseek11.c:212: TPASS: The 6th test passed: SEEK_DATA from startblock 1 offs=
et 0
lseek11.c:212: TPASS: The 7th test passed: SEEK_DATA from startblock 10 off=
set -1
lseek11.c:212: TPASS: The 8th test passed: SEEK_DATA from startblock 10 off=
set 0
lseek11.c:212: TPASS: The 9th test passed: SEEK_DATA from startblock 10 off=
set 4
lseek11.c:212: TPASS: The 10th test passed: SEEK_HOLE from startblock 10 of=
fset 0
lseek11.c:212: TPASS: The 11th test passed: SEEK_HOLE from startblock 10 of=
fset 4
lseek11.c:212: TPASS: The 12th test passed: SEEK_HOLE from startblock 11 of=
fset 128
lseek11.c:212: TPASS: The 13th test passed: SEEK_DATA from startblock 11 of=
fset 128
lseek11.c:212: TPASS: The 14th test passed: SEEK_HOLE from startblock 30 of=
fset -128

Summary:
passed   15
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir03 stime=3D1630694735
cmdline=3D"mkdir03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mkdir03.c:62: TPASS: mkdir() failed as expected: EFAULT (14)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENAMETOOLONG (36)
mkdir03.c:62: TPASS: mkdir() failed as expected: EEXIST (17)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENOENT (2)
mkdir03.c:62: TPASS: mkdir() failed as expected: ENOTDIR (20)
mkdir03.c:62: TPASS: mkdir() failed as expected: ELOOP (40)
mkdir03.c:62: TPASS: mkdir() failed as expected: EROFS (30)

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir05 stime=3D1630694735
cmdline=3D"mkdir05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mkdir05.c:45: TPASS: mkdir() functionality is correct

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmkdir09 stime=3D1630694735
cmdline=3D"mkdir09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mkdir09     1  TPASS  :  PASS
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D10 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D68 cstime=3D5873
<<<test_end>>>
<<<test_start>>>
tag=3Dmknodat02 stime=3D1630694745
cmdline=3D"mknodat02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mke2fs 1.44.5 (15-Dec-2018)
mknodat     0  TINFO  :  Found free device 0 '/dev/loop0'
mknodat     0  TINFO  :  Formatting /dev/loop0 with ext2 opts=3D'' extra op=
ts=3D''
mknodat     1  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     2  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     3  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DSUCCESS(0): Success
mknodat     4  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     5  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     6  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DEROFS(30): Read-only file system
mknodat     7  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
mknodat     8  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
mknodat     9  TPASS  :  mknodat() returned the expected value: TEST_ERRNO=
=3DELOOP(40): Too many levels of symbolic links
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D8
<<<test_end>>>
<<<test_start>>>
tag=3Dmlock201 stime=3D1630694746
cmdline=3D"mlock201"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 1 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 8 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 3 pages
mlock201.c:128: TPASS: mlock2(0) succeeded in locking 2 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 0 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 4 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 1 pages
mlock201.c:128: TPASS: mlock2(1) succeeded in locking 4 pages

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap02 stime=3D1630694746
cmdline=3D"mmap02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap02      1  TPASS  :  Functionality of mmap() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap03 stime=3D1630694746
cmdline=3D"mmap03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap03      1  TPASS  :  mmap() functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap14 stime=3D1630694746
cmdline=3D"mmap14"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap14      1  TPASS  :  Functionality of mmap() successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmmap15 stime=3D1630694746
cmdline=3D"mmap15"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mmap15      1  TPASS  :  mmap into high region failed as expected: errno=3D=
ENOMEM(12): Cannot allocate memory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dmove_mount02 stime=3D1630694746
cmdline=3D"move_mount02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:157: TINFO: Skipping FUSE based ntfs as requested =
by the test
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
move_mount02.c:80: TPASS: invalid-from-fd: move_mount() failed as expected:=
 EBADF (9)
move_mount02.c:80: TPASS: invalid-from-path: move_mount() failed as expecte=
d: ENOENT (2)
move_mount02.c:80: TPASS: invalid-to-fd: move_mount() failed as expected: E=
BADF (9)
move_mount02.c:80: TPASS: invalid-to-path: move_mount() failed as expected:=
 ENOENT (2)
move_mount02.c:80: TPASS: invalid-flags: move_mount() failed as expected: E=
INVAL (22)

Summary:
passed   35
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D5 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D19 cstime=3D131
<<<test_end>>>
<<<test_start>>>
tag=3Dmove_pages05 stime=3D1630694751
cmdline=3D"move_pages05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
move_pages05    1  TPASS  :  status[0] set to expected -EACCES
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D4
<<<test_end>>>
<<<test_start>>>
tag=3Dmprotect01 stime=3D1630694751
cmdline=3D"mprotect01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mprotect01    1  TPASS  :  expected failure - errno =3D 12 : Cannot allocat=
e memory
mprotect01    2  TPASS  :  expected failure - errno =3D 22 : Invalid argume=
nt
mprotect01    3  TPASS  :  expected failure - errno =3D 13 : Permission den=
ied
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmq_timedsend01 stime=3D1630694751
cmdline=3D"mq_timedsend01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_timedsend01.c:153: TINFO: Testing variant: vDSO or syscall with libc spec
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 0, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 8192, priority 0, l=
ength: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 32767, =
length: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EMSGSIZE (90)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 16, priority 0, len=
gth: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: ETIMEDOUT (1=
10)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINTR (4)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_timedsend01.c:153: TINFO: Testing variant: syscall with old kernel spec
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 0, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 0, leng=
th: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 8192, priority 0, l=
ength: 8192
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 1, priority 32767, =
length: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EMSGSIZE (90)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EBADF (9)
mq_timedsend01.c:260: TPASS: mq_timedreceive() returned 16, priority 0, len=
gth: 8192
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINVAL (22)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: ETIMEDOUT (1=
10)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EINTR (4)
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 1/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 2/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 3/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 4/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 5/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 6/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 7/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 8/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 9/10 message
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/mq_timedsend/../utils/mq.h:7=
0: TINFO: receive 10/10 message
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)
mq_timedsend01.c:210: TPASS: mq_timedsend() failed expectedly: EFAULT (14)

Summary:
passed   34
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmq_unlink01 stime=3D1630694751
cmdline=3D"mq_unlink01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
mq_unlink01.c:76: TINFO: queue name /test_mqueue
mq_unlink01.c:99: TPASS: mq_unlink returned 0: SUCCESS (0)
mq_unlink01.c:76: TINFO: queue name /test_mqueue
mq_unlink01.c:99: TPASS: mq_unlink returned -1: EACCES (13)
mq_unlink01.c:76: TINFO: queue name /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
mq_unlink01.c:99: TPASS: mq_unlink returned -1: ENOENT (2)
mq_unlink01.c:76: TINFO: queue name /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
mq_unlink01.c:99: TPASS: mq_unlink returned -1: ENAMETOOLONG (36)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmremap04 stime=3D1630694751
cmdline=3D"mremap04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mremap04    1  TPASS  :  mremap() failed, 'MREMAP_MAYMOVE flag unset', errn=
o 12
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgctl02 stime=3D1630694751
cmdline=3D"msgctl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgctl02.c:34: TPASS: msgctl(IPC_SET) msg_qbytes - 1
msgctl02.c:41: TPASS: msg_qbytes =3D 16383

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgrcv07 stime=3D1630694751
cmdline=3D"msgrcv07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgrcv07.c:68: TPASS: msgrcv(MSG_EXCEPT) succeeded
msgrcv07.c:71: TPASS: MSG_EXCEPT excepted MSGTYPE2 and got MSGTYPE1
msgrcv07.c:95: TPASS: msgrcv(MSG_NOERROR) succeeded
msgrcv07.c:98: TPASS: MSG_NOERROR truncated message correctly
msgrcv07.c:134: TPASS: msgrcv(0, MSG_COPY) succeeded
msgrcv07.c:137: TPASS: MSG_COPY got MSGTYPE1 data correctly
msgrcv07.c:148: TPASS: msgrcv(1, MSG_COPY) succeeded
msgrcv07.c:151: TPASS: MSG_COPY got MSGTYPE2 data correctly
msgrcv07.c:157: TPASS: Two messages still in queue
msgrcv07.c:178: TPASS: msgrcv(zero_msgtyp) succeeded
msgrcv07.c:181: TPASS: zero_msgtyp got the first message
msgrcv07.c:200: TPASS: msgrcv(positive_msgtyp) succeeded
msgrcv07.c:204: TPASS: msgtyp got the first message in the queue of type ms=
gtyp
msgrcv07.c:225: TPASS: msgrcv(negative_msgtyp) succeeded
msgrcv07.c:229: TPASS: -msgtyp got the first message in the queue with the =
lowest type

Summary:
passed   15
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dmsgsnd05 stime=3D1630694751
cmdline=3D"msgsnd05"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
msgsnd05.c:45: TPASS: msgsnd(7, 0x5588a8ccc680, 1024, 2048) : EAGAIN/EWOULD=
BLOCK (11)
msgsnd05.c:45: TPASS: msgsnd(7, 0x5588a8ccc680, 1024, 0) : EINTR (4)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmsync03 stime=3D1630694751
cmdline=3D"msync03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
msync03     1  TPASS  :  msync failed as expected: TEST_ERRNO=3DEBUSY(16): =
Device or resource busy
msync03     2  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     3  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     4  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     5  TPASS  :  msync failed as expected: TEST_ERRNO=3DEINVAL(22):=
 Invalid argument
msync03     6  TPASS  :  msync failed as expected: TEST_ERRNO=3DENOMEM(12):=
 Cannot allocate memory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dmadvise09 stime=3D1630694751
cmdline=3D"madvise09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
madvise09.c:319: TCONF: MADV_FREE does not work without swap

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpidfd_open03 stime=3D1630694751
cmdline=3D"pidfd_open03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pidfd_open03.c:49: TPASS: pidfd_open() passed

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe06 stime=3D1630694751
cmdline=3D"pipe06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe06      1  TPASS  :  failed with EMFILE
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe07 stime=3D1630694751
cmdline=3D"pipe07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe07      0  TINFO  :  Found 4 files open
pipe07      1  TPASS  :  Opened 510 pipes
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe10 stime=3D1630694751
cmdline=3D"pipe10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
pipe10      1  TPASS  :  functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe11 stime=3D1630694751
cmdline=3D"pipe11"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pipe11.c:70: TINFO: Reading 4096 per each of 1 children
pipe11.c:50: TPASS: Child 7203 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 2048 per each of 2 children
pipe11.c:50: TPASS: Child 7204 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7205 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 1365 per each of 3 children
pipe11.c:50: TPASS: Child 7206 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7207 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7208 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 1024 per each of 4 children
pipe11.c:50: TPASS: Child 7209 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7210 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7211 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7212 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 409 per each of 10 children
pipe11.c:50: TPASS: Child 7213 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7214 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7215 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7217 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7218 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7219 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7220 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7221 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7222 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7223 read pipe buffer correctly
pipe11.c:70: TINFO: Reading 81 per each of 50 children
pipe11.c:50: TPASS: Child 7224 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7225 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7226 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7227 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7229 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7230 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7231 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7232 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7233 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7234 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7235 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7236 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7237 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7238 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7239 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7240 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7242 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7243 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7244 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7245 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7246 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7247 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7248 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7249 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7250 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7251 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7252 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7253 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7254 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7255 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7256 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7257 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7258 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7259 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7260 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7261 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7262 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7263 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7264 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7265 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7266 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7267 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7268 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7269 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7270 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7271 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7272 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7273 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7274 read pipe buffer correctly
pipe11.c:50: TPASS: Child 7275 read pipe buffer correctly

Summary:
passed   70
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D2 cstime=3D8
<<<test_end>>>
<<<test_start>>>
tag=3Dpipe2_01 stime=3D1630694751
cmdline=3D"pipe2_01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
pipe2_01.c:56: TINFO: Test pipe2 with 0 flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(0)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(0)
pipe2_01.c:56: TINFO: Test pipe2 using O_CLOEXEC flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(524288)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(524288)
pipe2_01.c:56: TINFO: Test pipe2 using O_DIRECT flag=20
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(16384)
pipe2_01.c:56: TINFO: Test pipe2 using O_NONBLOCK flag=20
pipe2_01.c:68: TPASS: pipe2 fds[0] gets expected flag(2048)
pipe2_01.c:68: TPASS: pipe2 fds[1] gets expected flag(2048)

Summary:
passed   7
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dppoll01 stime=3D1630694751
cmdline=3D"ppoll01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ppoll01.c:199: TINFO: Testing variant: vDSO or syscall with libc spec
ppoll01.c:246: TINFO: case NORMAL
ppoll01.c:277: TPASS: revents=3D0x0005
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case MASK_SIGNAL
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case TIMEOUT
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case FD_ALREADY_CLOSED
ppoll01.c:277: TPASS: revents=3D0x0020
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case SEND_SIGINT
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case SEND_SIGINT_RACE_TEST
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case INVALID_NFDS
ppoll01.c:286: TPASS: ret: -1, errno: EINVAL (22)
ppoll01.c:246: TINFO: case INVALID_FDS
ppoll01.c:286: TPASS: ret: -1, errno: EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
ppoll01.c:199: TINFO: Testing variant: syscall with old kernel spec
ppoll01.c:246: TINFO: case NORMAL
ppoll01.c:277: TPASS: revents=3D0x0005
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case MASK_SIGNAL
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case TIMEOUT
ppoll01.c:283: TPASS: ret: 0
ppoll01.c:246: TINFO: case FD_ALREADY_CLOSED
ppoll01.c:277: TPASS: revents=3D0x0020
ppoll01.c:283: TPASS: ret: 1
ppoll01.c:246: TINFO: case SEND_SIGINT
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case SEND_SIGINT_RACE_TEST
ppoll01.c:286: TPASS: ret: -1, errno: EINTR (4)
ppoll01.c:246: TINFO: case INVALID_NFDS
ppoll01.c:286: TPASS: ret: -1, errno: EINVAL (22)
ppoll01.c:246: TINFO: case INVALID_FDS
ppoll01.c:286: TPASS: ret: -1, errno: EFAULT (14)

Summary:
passed   20
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpreadv01 stime=3D1630694752
cmdline=3D"preadv01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a'=
 expectedly
preadv01.c:81: TPASS: Preadv(2) read 64 bytes successfully with content 'a'=
 expectedly
preadv01.c:81: TPASS: Preadv(2) read 32 bytes successfully with content 'b'=
 expectedly

Summary:
passed   3
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dpreadv203_64 stime=3D1630694752
cmdline=3D"preadv203_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_supported_fs_types.c:89: TINFO: Kernel supports ext2
tst_supported_fs_types.c:51: TINFO: mkfs.ext2 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext3
tst_supported_fs_types.c:51: TINFO: mkfs.ext3 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports ext4
tst_supported_fs_types.c:51: TINFO: mkfs.ext4 does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports xfs
tst_supported_fs_types.c:51: TINFO: mkfs.xfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports btrfs
tst_supported_fs_types.c:51: TINFO: mkfs.btrfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports vfat
tst_supported_fs_types.c:51: TINFO: mkfs.vfat does exist
tst_supported_fs_types.c:115: TINFO: Filesystem exfat is not supported
tst_supported_fs_types.c:119: TINFO: FUSE does support ntfs
tst_supported_fs_types.c:51: TINFO: mkfs.ntfs does exist
tst_supported_fs_types.c:89: TINFO: Kernel supports tmpfs
tst_supported_fs_types.c:38: TINFO: mkfs is not needed for tmpfs
tst_test.c:1421: TINFO: Testing on ext2
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on ext3
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 1236, short reads 10, zero len=
 reads 0, EAGAIN(s) 131780
preadv203.c:180: TINFO: Number of writes 2400
preadv203.c:194: TINFO: Cache dropped 2 times
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on ext4
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext4 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 3741, short reads 10, zero len=
 reads 0, EAGAIN(s) 74572
preadv203.c:194: TINFO: Cache dropped 1 times
preadv203.c:180: TINFO: Number of writes 1020
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on xfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 1459, short reads 10, zero len=
 reads 0, EAGAIN(s) 298738
preadv203.c:180: TINFO: Number of writes 106920
preadv203.c:194: TINFO: Cache dropped 5 times
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on btrfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with btrfs opts=3D'' extra opt=
s=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:145: TINFO: Number of full_reads 2219, short reads 10, zero len=
 reads 0, EAGAIN(s) 90067
preadv203.c:194: TINFO: Cache dropped 1 times
preadv203.c:180: TINFO: Number of writes 1620
preadv203.c:223: TPASS: Got some EAGAIN
tst_test.c:1421: TINFO: Testing on vfat
tst_test.c:923: TINFO: Formatting /dev/loop0 with vfat opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on ntfs
tst_test.c:923: TINFO: Formatting /dev/loop0 with ntfs opts=3D'' extra opts=
=3D''
The partition start sector was not specified for /dev/loop0 and it could no=
t be obtained automatically.  It has been set to 0.
The number of sectors per track was not specified for /dev/loop0 and it cou=
ld not be obtained automatically.  It has been set to 0.
The number of heads was not specified for /dev/loop0 and it could not be ob=
tained automatically.  It has been set to 0.
To boot from a device, Windows needs the 'partition start sector', the 'sec=
tors per track' and the 'number of heads' to be set.
Windows will not be able to boot from this device.
tst_test.c:937: TINFO: Trying FUSE...
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)
tst_test.c:1421: TINFO: Testing on tmpfs
tst_test.c:923: TINFO: Skipping mkfs for TMPFS filesystem
tst_test.c:903: TINFO: Limiting tmpfs size to 256MB
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
preadv203.c:238: TCONF: preadv2(): EOPNOTSUPP (95)

Summary:
passed   4
failed   0
broken   0
skipped  4
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D42 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D118 cstime=3D3258
<<<test_end>>>
<<<test_start>>>
tag=3Dquotactl02 stime=3D1630694794
cmdline=3D"quotactl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_kconfig.c:64: TINFO: Parsing kernel config '/proc/config.gz'
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=
=3D''
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
quotactl02.c:133: TINFO: Test #0: QCMD(Q_XGETQSTAT, USRQUOTA) off
quotactl02.h:68: TPASS: quotactl() succeeded to turn off xfs quota and get =
xfs quota off status for user
quotactl02.c:133: TINFO: Test #1: QCMD(Q_XGETQSTAT, USRQUOTA) on
quotactl02.h:88: TPASS: quotactl() succeeded to turn on xfs quota and get x=
fs quota on status for user
quotactl02.c:133: TINFO: Test #2: QCMD(Q_XGETQUOTA, USRQUOTA) qlim
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETQUOTA fo=
r user to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #3: QCMD(Q_XGETNEXTQUOTA, USRQUOTA)
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETNEXTQUOT=
A for user to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #4: QCMD(Q_XGETQSTATV, USRQUOTA) off
quotactl02.h:110: TPASS: quotactl() succeeded to turn off xfs quota and get=
 xfs quota off statv for user
quotactl02.c:133: TINFO: Test #5: QCMD(Q_XGETQSTATV, USRQUOTA) on
quotactl02.h:132: TPASS: quotactl() succeeded to turn on xfs quota and get =
xfs quota on statv for user
quotactl02.c:133: TINFO: Test #6: QCMD(Q_XGETQSTAT, GRPQUOTA) off
quotactl02.h:68: TPASS: quotactl() succeeded to turn off xfs quota and get =
xfs quota off status for group
quotactl02.c:133: TINFO: Test #7: QCMD(Q_XGETQSTAT, GRPQUOTA) on
quotactl02.h:88: TPASS: quotactl() succeeded to turn on xfs quota and get x=
fs quota on status for group
quotactl02.c:133: TINFO: Test #8: QCMD(Q_XGETQUOTA, GRPQUOTA) qlim
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETQUOTA fo=
r group to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #9: QCMD(Q_XGETNEXTQUOTA, GRPQUOTA)
quotactl02.h:162: TPASS: quotactl() succeeded to set and use Q_XGETNEXTQUOT=
A for group to get xfs disk quota limits
quotactl02.c:133: TINFO: Test #10: QCMD(Q_XGETQSTATV, GRPQUOTA) off
quotactl02.h:110: TPASS: quotactl() succeeded to turn off xfs quota and get=
 xfs quota off statv for group
quotactl02.c:133: TINFO: Test #11: QCMD(Q_XGETQSTATV, GRPQUOTA) on
quotactl02.h:132: TPASS: quotactl() succeeded to turn on xfs quota and get =
xfs quota on statv for group

Summary:
passed   12
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D3 cstime=3D17
<<<test_end>>>
<<<test_start>>>
tag=3Dreaddir21 stime=3D1630694795
cmdline=3D"readdir21"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
readdir21    1  TCONF  :  readdir21.c:122: syscall(-1) __NR_readdir not sup=
ported on your arch
readdir21    2  TCONF  :  readdir21.c:122: Remaining cases not appropriate =
for configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dreadlink03 stime=3D1630694795
cmdline=3D"readlink03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
readlink03.c:86: TPASS: readlink() failed as expected: EACCES (13)
readlink03.c:86: TPASS: readlink() failed as expected: EINVAL (22)
readlink03.c:86: TPASS: readlink() failed as expected: EINVAL (22)
readlink03.c:86: TPASS: readlink() failed as expected: ENAMETOOLONG (36)
readlink03.c:86: TPASS: readlink() failed as expected: ENOENT (2)
readlink03.c:86: TPASS: readlink() failed as expected: ENOTDIR (20)
readlink03.c:86: TPASS: readlink() failed as expected: ELOOP (40)
readlink03.c:86: TPASS: readlink() failed as expected: EFAULT (14)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dreadv01 stime=3D1630694795
cmdline=3D"readv01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 01m 15s
readv01.c:71: TPASS: readv() with 0 I/O vectors
readv01.c:85: TPASS: readv() correctly read 0 bytes=20
readv01.c:71: TPASS: readv() with NULL I/O vectors
readv01.c:85: TPASS: readv() correctly read 64 bytes=20
readv01.c:71: TPASS: readv() with too big I/O vectors
readv01.c:85: TPASS: readv() correctly read 64 bytes=20
readv01.c:71: TPASS: readv() with multiple I/O vectors
readv01.c:85: TPASS: readv() correctly read 48 bytes=20
readv01.c:71: TPASS: readv() with zero-len buffer
readv01.c:85: TPASS: readv() correctly read 64 bytes=20

Summary:
passed   10
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drecvmmsg01 stime=3D1630694795
cmdline=3D"recvmmsg01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
recvmmsg01.c:102: TINFO: Testing variant: vDSO or syscall with libc spec
recvmmsg01.c:93: TPASS: recvmmsg() bad socket file descriptor : EBADF (9)
recvmmsg01.c:93: TPASS: recvmmsg() bad message vector address : EFAULT (14)
recvmmsg01.c:93: TPASS: recvmmsg() negative seconds in timeout : EINVAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() overflow in nanoseconds in timeout : EIN=
VAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() bad timeout address : EFAULT (14)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
recvmmsg01.c:102: TINFO: Testing variant: syscall with old kernel spec
recvmmsg01.c:93: TPASS: recvmmsg() bad socket file descriptor : EBADF (9)
recvmmsg01.c:93: TPASS: recvmmsg() bad message vector address : EFAULT (14)
recvmmsg01.c:93: TPASS: recvmmsg() negative seconds in timeout : EINVAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() overflow in nanoseconds in timeout : EIN=
VAL (22)
recvmmsg01.c:93: TPASS: recvmmsg() bad timeout address : EFAULT (14)

Summary:
passed   10
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drename02 stime=3D1630694795
cmdline=3D"rename02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rename02    1  TPASS  :  rename(./tfile_7577, ./rnfile_7577) returned 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drename10 stime=3D1630694795
cmdline=3D"rename10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rename10    1  TPASS  :  expected failure - errno =3D 36 : File name too lo=
ng
rename10    2  TPASS  :  expected failure - errno =3D 2 : No such file or d=
irectory
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drenameat202 stime=3D1630694795
cmdline=3D"renameat202 -i 10"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
renameat202    1  TPASS  :  renameat2() test passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drt_sigaction03 stime=3D1630694795
cmdline=3D"rt_sigaction03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rt_sigaction03    0  TINFO  :  Signal 34
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    1  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03    2  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    3  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    4  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03    5  TPASS  :  rt_sigaction03 failure with sig: 34 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 35
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    6  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03    7  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    8  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03    9  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   10  TPASS  :  rt_sigaction03 failure with sig: 35 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 36
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   11  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   12  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   13  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   14  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   15  TPASS  :  rt_sigaction03 failure with sig: 36 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 37
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   16  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   17  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   18  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   19  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   20  TPASS  :  rt_sigaction03 failure with sig: 37 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 38
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   21  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   22  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   23  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   24  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   25  TPASS  :  rt_sigaction03 failure with sig: 38 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 39
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   26  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   27  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   28  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   29  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   30  TPASS  :  rt_sigaction03 failure with sig: 39 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 40
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   31  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   32  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   33  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   34  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   35  TPASS  :  rt_sigaction03 failure with sig: 40 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 41
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   36  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   37  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   38  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   39  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   40  TPASS  :  rt_sigaction03 failure with sig: 41 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 42
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   41  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   42  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   43  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   44  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   45  TPASS  :  rt_sigaction03 failure with sig: 42 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 43
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   46  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   47  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   48  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   49  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   50  TPASS  :  rt_sigaction03 failure with sig: 43 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 44
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   51  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   52  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   53  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   54  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   55  TPASS  :  rt_sigaction03 failure with sig: 44 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 45
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   56  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   57  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   58  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   59  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   60  TPASS  :  rt_sigaction03 failure with sig: 45 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 46
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   61  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   62  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   63  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   64  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   65  TPASS  :  rt_sigaction03 failure with sig: 46 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 47
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   66  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   67  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   68  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   69  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   70  TPASS  :  rt_sigaction03 failure with sig: 47 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 48
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   71  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   72  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   73  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   74  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   75  TPASS  :  rt_sigaction03 failure with sig: 48 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 49
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   76  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   77  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   78  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   79  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   80  TPASS  :  rt_sigaction03 failure with sig: 49 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 50
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   81  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   82  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   83  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   84  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   85  TPASS  :  rt_sigaction03 failure with sig: 50 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 51
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   86  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   87  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   88  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   89  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   90  TPASS  :  rt_sigaction03 failure with sig: 51 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 52
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   91  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   92  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   93  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   94  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03   95  TPASS  :  rt_sigaction03 failure with sig: 52 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 53
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   96  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03   97  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   98  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03   99  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  100  TPASS  :  rt_sigaction03 failure with sig: 53 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 54
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  101  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  102  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  103  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  104  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  105  TPASS  :  rt_sigaction03 failure with sig: 54 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 55
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  106  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  107  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  108  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  109  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  110  TPASS  :  rt_sigaction03 failure with sig: 55 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 56
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  111  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  112  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  113  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  114  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  115  TPASS  :  rt_sigaction03 failure with sig: 56 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 57
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  116  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  117  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  118  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  119  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  120  TPASS  :  rt_sigaction03 failure with sig: 57 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 58
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  121  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  122  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  123  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  124  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  125  TPASS  :  rt_sigaction03 failure with sig: 58 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 59
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  126  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  127  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  128  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  129  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  130  TPASS  :  rt_sigaction03 failure with sig: 59 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 60
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  131  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  132  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  133  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  134  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  135  TPASS  :  rt_sigaction03 failure with sig: 60 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 61
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  136  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  137  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  138  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  139  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  140  TPASS  :  rt_sigaction03 failure with sig: 61 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 62
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  141  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  142  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  143  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  144  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  145  TPASS  :  rt_sigaction03 failure with sig: 62 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 63
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  146  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  147  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  148  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  149  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  150  TPASS  :  rt_sigaction03 failure with sig: 63 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  Signal 64
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  151  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND=20
rt_sigaction03  152  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  153  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_RESETHAND|SA_SIGINFO=20
rt_sigaction03  154  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
rt_sigaction03    0  TINFO  :  sa.sa_flags =3D SA_NOMASK=20
rt_sigaction03  155  TPASS  :  rt_sigaction03 failure with sig: 64 as expec=
ted errno  =3D EINVAL : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Drt_sigprocmask02 stime=3D1630694795
cmdline=3D"rt_sigprocmask02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
rt_sigprocmask02    1  TPASS  :  Got expected errno: TEST_ERRNO=3DEINVAL(22=
): Invalid argument
rt_sigprocmask02    2  TPASS  :  Got expected errno: TEST_ERRNO=3DEFAULT(14=
): Bad address
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsbrk01 stime=3D1630694795
cmdline=3D"sbrk01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sbrk01      1  TPASS  :  sbrk - Increase by 8192 bytes returned 0x560fe4e56=
000
sbrk01      2  TPASS  :  sbrk - Increase by -8192 bytes returned 0x560fe4e5=
8000
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_get_priority_max02 stime=3D1630694795
cmdline=3D"sched_get_priority_max02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sched_get_priority_max02    1  TPASS  :  Test Passed, Got EINVAL
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_rr_get_interval03 stime=3D1630694795
cmdline=3D"sched_rr_get_interval03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_rr_get_interval03.c:53: TINFO: Testing variant: vDSO or syscall with =
libc spec
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(-1, 0x562b9f5599=
48) : EINVAL (22)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(262144, 0x562b9f=
559948) : ESRCH (3)
sched_rr_get_interval03.c:72: TCONF: EFAULT skipped for libc_variant
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_rr_get_interval03.c:53: TINFO: Testing variant: syscall with old kern=
el spec
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(-1, 0x562b9f5599=
48) : EINVAL (22)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(262144, 0x562b9f=
559948) : ESRCH (3)
sched_rr_get_interval03.c:82: TPASS: sched_rr_get_interval(0, 0x7f4649b9600=
0) : EFAULT (14)

Summary:
passed   5
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_setparam04 stime=3D1630694795
cmdline=3D"sched_setparam04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_setparam04.c:48: TINFO: Testing libc variant
sched_setparam04.c:58: TPASS: test with non-existing pid : ESRCH (3)
sched_setparam04.c:58: TPASS: test invalid pid value : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid address for p : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid p.sched_priority : EINVAL (=
22)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_setparam04.c:48: TINFO: Testing syscall variant
sched_setparam04.c:58: TPASS: test with non-existing pid : ESRCH (3)
sched_setparam04.c:58: TPASS: test invalid pid value : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid address for p : EINVAL (22)
sched_setparam04.c:58: TPASS: test with invalid p.sched_priority : EINVAL (=
22)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsched_getscheduler02 stime=3D1630694795
cmdline=3D"sched_getscheduler02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_getscheduler02.c:23: TINFO: Testing libc variant
sched_getscheduler02.c:33: TPASS: sched_getscheduler(262144) : ESRCH (3)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sched_getscheduler02.c:23: TINFO: Testing syscall variant
sched_getscheduler02.c:33: TPASS: sched_getscheduler(262144) : ESRCH (3)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsemctl03 stime=3D1630694795
cmdline=3D"semctl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
semctl03.c:82: TINFO: Testing variant: libc semctl()
semctl03.c:74: TPASS: semctl() with invalid IPC command : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid sem id : EINVAL (22)
semctl03.c:69: TCONF: EFAULT is skipped for libc variant
semctl03.c:69: TCONF: EFAULT is skipped for libc variant
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
semctl03.c:82: TINFO: Testing variant: __NR_semctl syscall
semctl03.c:74: TPASS: semctl() with invalid IPC command : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid sem id : EINVAL (22)
semctl03.c:74: TPASS: semctl() with invalid union arg : EFAULT (14)
semctl03.c:74: TPASS: semctl() with invalid union arg : EFAULT (14)

Summary:
passed   6
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsemget06 stime=3D1630694795
cmdline=3D"semget06"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
semget06    1  TPASS  :  expected failure - errno =3D 22 : Invalid argument
semget06    2  TPASS  :  expected failure - errno =3D 22 : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsendfile03 stime=3D1630694795
cmdline=3D"sendfile03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3D-1 : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3DO_RDONLY : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with in_fd=3D-1 : EBADF (9)
sendfile03.c:54: TPASS: sendfile(..) with out_fd=3DO_WRONLY : EBADF (9)

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsendfile08_64 stime=3D1630694795
cmdline=3D"sendfile08_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sendfile08.c:44: TPASS: sendfile() copies data correctly

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dset_robust_list01 stime=3D1630694795
cmdline=3D"set_robust_list01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
set_robust_list01    1  TPASS  :  set_robust_list: retval =3D -1 (expected =
-1), errno =3D 22 (expected 22)
set_robust_list01    2  TPASS  :  set_robust_list: retval =3D 0 (expected 0=
), errno =3D 0 (expected 0)
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dset_thread_area01 stime=3D1630694795
cmdline=3D"set_thread_area01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
set_thread_area_01    1  TCONF  :  set_thread_area01.c:77: syscall(205) tes=
ts[i].syscall not supported on your arch
set_thread_area_01    2  TCONF  :  set_thread_area01.c:77: Remaining cases =
not appropriate for configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetfsuid01_16 stime=3D1630694795
cmdline=3D"setfsuid01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setfsuid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setfsuid/../utils/compat_16.h:117: 16-bit version of setfsuid() is not su=
pported on your platform
setfsuid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setfsuid/../utils/compat_16.h:117: Remaining cases not appropriate for co=
nfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsetegid02 stime=3D1630694795
cmdline=3D"setegid02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setegid02    1  TPASS  :  setegid failed as expected: TEST_ERRNO=3DEPERM(1)=
: Operation not permitted
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetgroups01_16 stime=3D1630694796
cmdline=3D"setgroups01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setgroups01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setgroups/../utils/compat_16.h:82: 16-bit version of getgroups() is not =
supported on your platform
setgroups01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setgroups/../utils/compat_16.h:82: Remaining cases not appropriate for c=
onfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsetitimer01 stime=3D1630694796
cmdline=3D"setitimer01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setitimer01    1  TPASS  :  functionality is correct
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetitimer02 stime=3D1630694796
cmdline=3D"setitimer02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_buffers.c:55: TINFO: Test is using guarded buffers
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setitimer02.c:31: TPASS: sys_setitimer(ITIMER_REAL, value, (struct itimerva=
l *)-1) : EFAULT (14)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetpgid01 stime=3D1630694796
cmdline=3D"setpgid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setpgid01    1  TPASS  :  test setpgid(7609, 7609) success
setpgid01    2  TPASS  :  test setpgid(0, 0) success
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetregid04_16 stime=3D1630694796
cmdline=3D"setregid04_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setregid04.c:84: TINFO: getgrnam(nobody) failed - try fallback nogroup
/tmp/lkp/ltp/src/ltp/testcases/kernel/syscalls/setregid/../utils/compat_tst=
_16.h:128: TCONF: 16-bit version of setregid() is not supported on your pla=
tform

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetresuid05_16 stime=3D1630694796
cmdline=3D"setresuid05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setresuid05_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setresuid/../utils/compat_16.h:136: 16-bit version of setresuid() is not=
 supported on your platform
setresuid05_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscal=
ls/setresuid/../utils/compat_16.h:136: Remaining cases not appropriate for =
configuration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetreuid01_16 stime=3D1630694796
cmdline=3D"setreuid01_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setreuid01_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: 16-bit version of setreuid() is not su=
pported on your platform
setreuid01_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: Remaining cases not appropriate for co=
nfiguration
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetreuid05_16 stime=3D1630694796
cmdline=3D"setreuid05_16"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setreuid05_16    1  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: 16-bit version of setreuid() is not su=
pported on your platform
setreuid05_16    2  TCONF  :  /tmp/lkp/ltp/src/ltp/testcases/kernel/syscall=
s/setreuid/../utils/compat_16.h:127: Remaining cases not appropriate for co=
nfiguration
setreuid05_16    0  TINFO  :  Child process returned TCONF
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetsid01 stime=3D1630694796
cmdline=3D"setsid01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
setsid01    1  TPASS  :  setsid SUCCESS to set errno to EPERM
setsid01    1  TPASS  :  all misc tests passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetsockopt01 stime=3D1630694797
cmdline=3D"setsockopt01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setsockopt01.c:66: TINFO: Testing invalid file descriptor
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EBADF =
(9)
setsockopt01.c:66: TINFO: Testing non-socket file descriptor
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOTSO=
CK (88)
setsockopt01.c:66: TINFO: Testing invalid option buffer
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EFAULT=
 (14)
setsockopt01.c:66: TINFO: Testing invalid optlen
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: EINVAL=
 (22)
setsockopt01.c:66: TINFO: Testing invalid level
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (UDP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (IP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)
setsockopt01.c:66: TINFO: Testing invalid option name (TCP)
setsockopt01.c:101: TPASS: setsockopt() returned the expected error: ENOPRO=
TOOPT (92)

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsetuid04 stime=3D1630694797
cmdline=3D"setuid04"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setuid04.c:49: TPASS: open() returned errno EACCES
setuid04.c:49: TPASS: open() returned errno EACCES

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dsetxattr02 stime=3D1630694797
cmdline=3D"setxattr02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
setxattr02.c:154: TPASS: setxattr(2) on testfile passed
setxattr02.c:154: TPASS: setxattr(2) on testdir passed
setxattr02.c:179: TPASS: setxattr(2) on symlink failed: EEXIST (17)
setxattr02.c:160: TFAIL: setxattr(2) on fifo passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on chr passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on blk passed unexpectedly
setxattr02.c:160: TFAIL: setxattr(2) on sock passed unexpectedly

Summary:
passed   3
failed   4
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D1 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dshmctl02 stime=3D1630694797
cmdline=3D"shmctl02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
shmctl02.c:109: TINFO: Testing variant: libc shmctl()
shmctl02.c:98: TPASS: shmctl(3, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:93: TCONF: EFAULT is skipped for libc variant
shmctl02.c:93: TCONF: EFAULT is skipped for libc variant
shmctl02.c:98: TPASS: shmctl(4, -1, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(-1, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(5, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(2, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(2, 0, (nil)) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 1, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 11, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(2, 12, 0x55fb783188c0) : EPERM (1)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
shmctl02.c:109: TINFO: Testing variant: __NR_shmctl syscall
shmctl02.c:98: TPASS: shmctl(7, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(8, 1, 0xffffffffffffffff) : EFAULT (14)
shmctl02.c:98: TPASS: shmctl(8, 2, 0xffffffffffffffff) : EFAULT (14)
shmctl02.c:98: TPASS: shmctl(8, -1, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(-1, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(9, 2, 0x55fb783188c0) : EINVAL (22)
shmctl02.c:98: TPASS: shmctl(6, 2, 0x55fb783188c0) : EACCES (13)
shmctl02.c:98: TPASS: shmctl(6, 0, (nil)) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 1, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 11, 0x55fb783188c0) : EPERM (1)
shmctl02.c:98: TPASS: shmctl(6, 12, 0x55fb783188c0) : EPERM (1)

Summary:
passed   20
failed   0
broken   0
skipped  2
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dshmdt02 stime=3D1630694797
cmdline=3D"shmdt02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
shmdt02     1  TPASS  :  expected failure - errno =3D 22 : Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsigaltstack02 stime=3D1630694797
cmdline=3D"sigaltstack02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sigaltstack02    1  TPASS  :  stgaltstack() fails, Invalid Flag value, errn=
o:22
sigaltstack02    2  TPASS  :  stgaltstack() fails, alternate stack is < MIN=
SIGSTKSZ, errno:12
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dsignalfd4_01 stime=3D1630694797
cmdline=3D"signalfd4_01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
signalfd4_01    1  TPASS  :  signalfd4(SFD_CLOEXEC) Passed
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dsigrelse01 stime=3D1630694797
cmdline=3D"sigrelse01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
sigrelse01    1  TPASS  :  sigrelse() released all 55 signals under test.
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dstat01_64 stime=3D1630694797
cmdline=3D"stat01_64"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stat01.c:75: TPASS: stat(test_fileread)
stat01.c:75: TPASS: stat(test_filenoread)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dstime02 stime=3D1630694797
cmdline=3D"stime02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:46: TINFO: Testing libc stime()
stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:49: TINFO: Testing SYS_stime syscall
stime_var.h:28: TCONF: syscall(-1) __NR_stime not supported
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
stime_var.h:52: TINFO: Testing SYS_settimeofday syscall
stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)

Summary:
passed   2
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dsysctl03 stime=3D1630694797
cmdline=3D"sysctl03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
sysctl03.c:76: TINFO: this test's results are based on potentially undocume=
nted behavior in the kernel. read the NOTE in the source file for more deta=
ils
sysctl03.c:55: TCONF: syscall(156) __NR__sysctl not supported

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
sysctl03.c:55: TCONF: syscall(156) __NR__sysctl not supported
<<<test_start>>>
tag=3Dsyslog07 stime=3D1630694797
cmdline=3D"syslog07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
syslog07    0  TINFO  :  testing syslog priorities ...
syslog07    0  TINFO  :   o Send syslog messages at all levels and see whet=
her
syslog07    0  TINFO  :     All level messages are logged.
syslog07    0  TINFO  :  restarting syslog daemon
syslog07    0  TINFO  :  restarting syslog daemon
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D7 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D11 cstime=3D30
<<<test_end>>>
<<<test_start>>>
tag=3Dtimerfd01 stime=3D1630694804
cmdline=3D"timerfd01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timerfd01.c:153: TINFO: Testing variant: syscall with old kernel spec
timerfd01.c:102: TINFO: testing CLOCK MONOTONIC
timerfd01.c:106: TINFO: relative timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:110: TINFO: absolute timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:115: TINFO: sequential timer (50 ms)
timerfd01.c:128: TPASS: Timer read back value is relative
timerfd01.c:89: TPASS: got 3 tick(s)
timerfd01.c:134: TINFO: testing with O_NONBLOCK
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:146: TPASS: read failed with: EAGAIN/EWOULDBLOCK (11)
timerfd01.c:102: TINFO: testing CLOCK REALTIME
timerfd01.c:106: TINFO: relative timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:110: TINFO: absolute timer (100 ms)
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:115: TINFO: sequential timer (50 ms)
timerfd01.c:128: TPASS: Timer read back value is relative
timerfd01.c:89: TPASS: got 3 tick(s)
timerfd01.c:134: TINFO: testing with O_NONBLOCK
timerfd01.c:89: TPASS: got 1 tick(s)
timerfd01.c:146: TPASS: read failed with: EAGAIN/EWOULDBLOCK (11)

Summary:
passed   12
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dtimerfd_create01 stime=3D1630694805
cmdline=3D"timerfd_create01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
timerfd_create01    1  TPASS  :  timerfd_create() failed as expected: TEST_=
ERRNO=3DEINVAL(22): Invalid argument
timerfd_create01    2  TPASS  :  timerfd_create() failed as expected: TEST_=
ERRNO=3DEINVAL(22): Invalid argument
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D0
<<<test_end>>>
<<<test_start>>>
tag=3Dtimer_create01 stime=3D1630694805
cmdline=3D"timer_create01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timer_create01.c:51: TINFO: Testing notification type: SIGEV_NONE
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_SIGNAL
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_THREAD
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: SIGEV_THREAD_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI
timer_create01.c:51: TINFO: Testing notification type: NULL
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_MONOTONIC
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_PROCESS_CP=
UTIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_THREAD_CPU=
TIME_ID
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_BOOTTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_REALTIME_A=
LARM
timer_create01.c:96: TPASS: Timer successfully created for CLOCK_TAI

Summary:
passed   40
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dtimer_settime01 stime=3D1630694805
cmdline=3D"timer_settime01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
timer_settime01.c:85: TINFO: Testing variant: syscall with old kernel spec
timer_settime01.c:96: TINFO: Testing for general initialization:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for setting old_value:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for using periodic timer:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:96: TINFO: Testing for using absolute time:
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:172: TPASS: timer_settime(CLOCK_TAI) passed

Summary:
passed   32
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D160 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dtruncate02 stime=3D1630694806
cmdline=3D"truncate02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
truncate02.c:90: TPASS: truncate(testfile, 256) succeeded
truncate02.c:90: TPASS: truncate(testfile, 512) succeeded

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Duname01 stime=3D1630694806
cmdline=3D"uname01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
uname01.c:21: TPASS: uname(&un) passed
uname01.c:31: TPASS: sysname set to Linux

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dunshare02 stime=3D1630694806
cmdline=3D"unshare02"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
unshare02.c:52: TPASS: unshare(-1) : EINVAL (22)
unshare02.c:52: TPASS: unshare(CLONE_NEWNS) : EPERM (1)

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dumount03 stime=3D1630694806
cmdline=3D"umount03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_device.c:89: TINFO: Found free device 0 '/dev/loop0'
tst_test.c:923: TINFO: Formatting /dev/loop0 with ext2 opts=3D'' extra opts=
=3D''
mke2fs 1.44.5 (15-Dec-2018)
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
umount03.c:35: TPASS: umount() fails as expected: EPERM (1)

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D11
<<<test_end>>>
<<<test_start>>>
tag=3Dumount2_03 stime=3D1630694807
cmdline=3D"umount2_03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
mke2fs 1.44.5 (15-Dec-2018)
umount2_03    0  TINFO  :  Found free device 0 '/dev/loop0'
umount2_03    0  TINFO  :  Formatting /dev/loop0 with ext2 opts=3D'' extra =
opts=3D''
umount2_03    1  TPASS  :  umount2(2) failed as expected: TEST_ERRNO=3DEINV=
AL(22): Invalid argument
umount2_03    2  TPASS  :  umount2(2) succeeded as expected
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D13
<<<test_end>>>
<<<test_start>>>
tag=3Dutime01 stime=3D1630694807
cmdline=3D"utime01"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
utime01     1  TPASS  :  Functionality of utime(tmp_file, NULL) successful
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D4 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dwaitpid09 stime=3D1630694811
cmdline=3D"waitpid09"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
waitpid09.c:66: TPASS: waitpid(pid, WNOHANG) =3D 0 for a running child
waitpid09.c:106: TPASS: waitpid(pid, WNOHANG) =3D pid for an exited child
waitpid09.c:126: TPASS: waitpid(-1, 0) =3D -1 with ECHILD if no children
waitpid09.c:145: TPASS: waitpid(-1, WNOHANG) =3D -1 with ECHILD if no child=
ren

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dwaitpid13 stime=3D1630694811
cmdline=3D"waitpid13"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
waitpid_common.h:129: TINFO: Sending SIGCONT to 7781
waitpid_common.h:129: TINFO: Sending SIGCONT to 7782
waitpid_common.h:129: TINFO: Sending SIGCONT to 7783
waitpid_common.h:129: TINFO: Sending SIGCONT to 7784
waitpid_common.h:129: TINFO: Sending SIGCONT to 7777
waitpid_common.h:129: TINFO: Sending SIGCONT to 7778
waitpid_common.h:129: TINFO: Sending SIGCONT to 7779
waitpid_common.h:129: TINFO: Sending SIGCONT to 7780
waitpid13.c:70: TPASS: Test PASSED

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dwritev07 stime=3D1630694811
cmdline=3D"writev07"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
writev07.c:51: TINFO: starting test with initial file offset: 0=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 65=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 4096=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged
writev07.c:51: TINFO: starting test with initial file offset: 4097=20
writev07.c:73: TINFO: got EFAULT
writev07.c:80: TPASS: file stayed untouched
writev07.c:84: TPASS: offset stayed unchanged

Summary:
passed   8
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D1 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D1 cstime=3D2
<<<test_end>>>
<<<test_start>>>
tag=3Dcopy_file_range03 stime=3D1630694812
cmdline=3D"copy_file_range03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
copy_file_range.h:36: TINFO: Testing libc copy_file_range()
copy_file_range03.c:48: TPASS: copy_file_range sucessfully updated the time=
stamp
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
copy_file_range.h:39: TINFO: Testing __NR_copy_file_range syscall
copy_file_range03.c:48: TPASS: copy_file_range sucessfully updated the time=
stamp

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D2 termination_type=3Dexited termination_id=3D0 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
<<<test_start>>>
tag=3Dperf_event_open03 stime=3D1630694814
cmdline=3D"perf_event_open03"
contacts=3D""
analysis=3Dexit
<<<test_output>>>
tst_test.c:1355: TINFO: Timeout per run is 0h 25m 00s
perf_event_open03.c:38: TCONF: intel_pt is not available

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status=3D"ok"
duration=3D0 termination_type=3Dexited termination_id=3D32 corefile=3Dno
cutime=3D0 cstime=3D1
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20210524-395-ga191a3740

       ###############################################################

            Done executing testcases.
            LTP Version:  20210524-395-ga191a3740
       ###############################################################


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---
:#! jobs/ltp-syscalls.yaml:
suite: ltp
testcase: ltp
category: functional
need_modules: true
need_memory: 4G
disk: 1HDD
fs: xfs
ltp:
  test: syscalls-02
job_origin: ltp-syscalls.yaml
:#! queue options:
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-knl-f1
tbox_group: lkp-knl-f1
kconfig: x86_64-rhel-8.3
submit_id: 61325b943ae6bbc1e77c13d8
job_file: "/lkp/jobs/scheduled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=0xffff0190-debian-10.4-x86_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-49639-1vkxw86-0.yaml"
id: 0c2d7cee74d9511fd1f1f6d52589a2e3c5dc45a4
queuer_version: "/lkp-src"
:#! hosts/lkp-knl-f1:
model: Knights Landing
nr_node: 2
nr_cpu: 256
memory: 112G
nr_hdd_partitions: 4
nr_ssd_partitions: 1
hdd_partitions: "/dev/disk/by-id/ata-ST4000NM0033-9ZM170_Z1ZBHQMW-part*"
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL42040051800RGN-part2"
rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL42040051800RGN-part1"
brand: Intel(R) Genuine Intel(R) CPU 0000 @ 1.30GHz
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
- XFS_FS
:#! include/ltp:
:#! include/queue/cyclic:
commit: 6e21a5086100cebefd21a3058a9e1160668f84fa
:#! include/testbox/lkp-knl-f1:
ucode: '0xffff0190'
need_kconfig_hw:
- IGB: y
- SATA_AHCI
bisect_dmesg: true
:#! include/fs/OTHERS:
enqueue_time: 2021-09-04 01:29:56.930454886 +08:00
_id: 61325b943ae6bbc1e77c13d8
_rt: "/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa"
:#! schedule options:
user: lkp
compiler: gcc-9
LKP_SERVER: internal-lkp-server
head_commit: 340df6e73222ef5ab0948ac71c9ed68203b99fd3
base_commit: 7d2a07b769330c34b4deabeed939325c77a7ec2f
branch: linux-devel/devel-hourly-20210903-123202
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/0"
scheduler_version: "/lkp/lkp/.src-20210903-234613"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- user=lkp
- job=/lkp/jobs/scheduled/lkp-knl-f1/ltp-1HDD-xfs-syscalls-02-ucode=0xffff0190-debian-10.4-x86_64-20200603.cgz-6e21a5086100cebefd21a3058a9e1160668f84fa-20210904-49639-1vkxw86-0.yaml
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- branch=linux-devel/devel-hourly-20210903-123202
- commit=6e21a5086100cebefd21a3058a9e1160668f84fa
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/vmlinuz-5.14.0-00001-g6e21a5086100
- max_uptime=2100
- RESULT_ROOT=/result/ltp/1HDD-xfs-syscalls-02-ucode=0xffff0190/lkp-knl-f1/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/0
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/modules.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20200714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210828.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210903.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn
:#! /lkp/lkp/.src-20210903-141322/include/site/inn:
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer:
watchdog:
:#! runtime status:
last_kernel: 5.14.0-00001-g6e21a5086100
:#! user overrides:
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/6e21a5086100cebefd21a3058a9e1160668f84fa/vmlinuz-5.14.0-00001-g6e21a5086100"
dequeue_time: 2021-09-04 01:53:40.365811682 +08:00
:#! /lkp/lkp/.src-20210903-234613/include/site/inn:
job_state: finished
loadavg: 3.09 3.11 1.49 2/2377 7973
start_time: '1630691860'
end_time: '1630692022'
version: "/lkp/lkp/.src-20210903-234710:9cfae862:2d6eafa30"

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

dmsetup remove_all
wipefs -a --force /dev/sda1
mkfs -t xfs -f /dev/sda1
mkdir -p /fs/sda1
modprobe xfs
mount -t xfs -o inode64 /dev/sda1 /fs/sda1
ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
./runltp -f syscalls-02 -d /fs/sda1/tmpdir

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--NtwzykIc2mflq5ck--
