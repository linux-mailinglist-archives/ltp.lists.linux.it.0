Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F68437F3FE
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:23:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E860B3C5533
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 10:23:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDCD63C4AE3
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:23:02 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 406F710011A8
 for <ltp@lists.linux.it>; Thu, 13 May 2021 10:22:51 +0200 (CEST)
IronPort-SDR: j7djvOgW8BIJJQ27+B3o5oflBSlKcFJQ0No8peZTvgEzIZuL161OmeTt9SC/4OhgmnqKzb9ZF8
 l9A9LXc968rw==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="220885443"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
 d="xz'?yaml'?scan'208";a="220885443"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 01:22:44 -0700
IronPort-SDR: ljsPXm5dTV67PeW4pCDNLi9pBJmKeENQbkxeRXOrKiiCouvwP0gHSur/NZWgIRVZy39Bb71bvS
 pRwE8SnDHz/A==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
 d="xz'?yaml'?scan'208";a="625916135"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.140])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 01:22:40 -0700
Date: Thu, 13 May 2021 16:39:39 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20210513083939.GB20142@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE, T_SPF_TEMPERROR
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [tracing] 9a6944fee6:
 WARNING:at_kernel/trace/trace.c:#trace_check_vprintf
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
Cc: lkp@lists.01.org, LKML <linux-kernel@vger.kernel.org>, ltp@lists.linux.it,
 lkp@intel.com
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Greeting,

FYI, we noticed the following commit (built with gcc-9):

commit: 9a6944fee68e25084130386c608c5ac8db487581 ("tracing: Add a verifier to check string pointers for trace events")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


in testcase: ltp
version: ltp-x86_64-14c1f76-1_20210506
with following parameters:

	test: tracing
	ucode: 0x21

test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
test-url: http://linux-test-project.github.io/


on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory

caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):



If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


user  :notice: [   66.505494] INFO: creating /lkp/benchmarks/ltp/output directory

user  :notice: [   66.516773] INFO: creating /lkp/benchmarks/ltp/results directory

user  :notice: [   66.526731] Checking for required user/group ids



user  :notice: [   66.543650] 'nobody' user id and group found.

user  :notice: [   66.552776] 'bin' user id and group found.

user  :notice: [   66.561578] 'daemon' user id and group found.

user  :notice: [   66.569557] Users group found.

user  :notice: [   66.577171] Sys group found.

user  :notice: [   66.585007] Required users/groups exist.

user  :notice: [   66.594540] If some fields are empty or look unusual you may have an old version.

user  :notice: [   66.604091] Compare to the current minimal requirements in Documentation/Changes.



user  :notice: [   66.618481] /etc/os-release

user  :notice: [   66.626798] PRETTY_NAME="Debian GNU/Linux 10 (buster)"

user  :notice: [   66.634219] NAME="Debian GNU/Linux"

user  :notice: [   66.641163] VERSION_ID="10"

user  :notice: [   66.648325] VERSION="10 (buster)"

user  :notice: [   66.655516] VERSION_CODENAME=buster

user  :notice: [   66.661858] ID=debian

user  :notice: [   66.669030] HOME_URL="https://www.debian.org/"

user  :notice: [   66.676713] SUPPORT_URL="https://www.debian.org/support"

user  :notice: [   66.684091] BUG_REPORT_URL="https://bugs.debian.org/"



user  :notice: [   66.695535] uname:

user  :notice: [   66.704982] Linux lkp-ivb-d02 5.12.0-rc3-00014-g9a6944fee68e #1 SMP Fri May 7 16:22:42 CST 2021 x86_64 GNU/Linux



user  :notice: [   66.716804] /proc/cmdline

kern  :warn  : [   67.379069] ------------[ cut here ]------------
kern  :warn  : [   67.379895] fmt: 'bdi %s: ino=%lu state=%s flags=%s
' current_buffer: '             cat-4413    [001] ...1    67.121270: sys_openat -> 0x4
cat-4413    [001] ...1    67.121270: <user stack trace>
=>  <00007f1cb9ad8641>
=>  <00007f1cb9a172c8>
=>  <00007f1cb9a166df>
=>  <000055dce7ed6da1>
cat-4413    [001] ...1    67.121272: sys_exit: NR 257 = 4
cat-4413    [001] ...1    67.121272: <user stack trace>
=>  <00007f1cb9ad8641>
=>  <00007f1cb9a172c8>
=>  <00007f1cb9a166df>
=>  <000055dce7ed6da1>
cat-4413    [001] ...1    67.121275: sys_newfstat(fd: 4, statbuf: 7ffcf3dad040)
cat-4413    [001] ...1    67.121276: <user stack trace>
=>  <00007f1cb9ad2af3>
=>  <00007f1cb9a172c8>
=>  <00007f1cb9a166df>
=>  <000055dce7ed6da1>
cat-4413    [001] ...1    67.121277: sys_enter: NR 5 (4, 7ffcf3dad040, 7ffcf3dad040, 0, f, 55dce909ca20)
cat-4413    [001] ...1    67.121277: <user stack trace>
=>  <00007f1cb9ad
kern :warn : [   67.379916] WARNING: CPU: 1 PID: 3760 at kernel/trace/trace.c:3731 trace_check_vprintf (kbuild/src/consumer/kernel/trace/trace.c:3731) 
kern  :warn  : [   67.394939] Modules linked in: netconsole btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c intel_rapl_msr intel_rapl_common sd_mod x86_pkg_temp_thermal t10_pi sg intel_powerclamp coretemp i915 kvm_intel kvm irqbypass intel_gtt crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel ghash_clmulni_intel syscopyarea rapl sysfillrect ahci sysimgblt fb_sys_fops libahci drm intel_cstate libata intel_uncore ipmi_devintf ipmi_msghandler mei_me joydev mei video ip_tables
kern  :warn  : [   67.399156] CPU: 1 PID: 3760 Comm: cat Not tainted 5.12.0-rc3-00014-g9a6944fee68e #1
kern  :warn  : [   67.400249] Hardware name: Hewlett-Packard p6-1451cx/2ADA, BIOS 8.15 02/05/2013
kern :warn : [   67.401365] RIP: 0010:trace_check_vprintf (kbuild/src/consumer/kernel/trace/trace.c:3731) 
kern :warn : [ 67.402453] Code: 48 39 c8 72 31 39 c8 74 2d c6 04 0a 00 49 8b 96 b0 20 00 00 48 8b 74 24 10 48 c7 c7 78 32 56 82 44 89 54 24 18 e8 8e d2 9b 00 <0f> 0b 44 8b 54 24 18 e9 9f fe ff ff c6 44 02 ff 00 49 8b 96 b0 20
All code
========
   0:	48 39 c8             	cmp    %rcx,%rax
   3:	72 31                	jb     0x36
   5:	39 c8                	cmp    %ecx,%eax
   7:	74 2d                	je     0x36
   9:	c6 04 0a 00          	movb   $0x0,(%rdx,%rcx,1)
   d:	49 8b 96 b0 20 00 00 	mov    0x20b0(%r14),%rdx
  14:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  19:	48 c7 c7 78 32 56 82 	mov    $0xffffffff82563278,%rdi
  20:	44 89 54 24 18       	mov    %r10d,0x18(%rsp)
  25:	e8 8e d2 9b 00       	callq  0x9bd2b8
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	44 8b 54 24 18       	mov    0x18(%rsp),%r10d
  31:	e9 9f fe ff ff       	jmpq   0xfffffffffffffed5
  36:	c6 44 02 ff 00       	movb   $0x0,-0x1(%rdx,%rax,1)
  3b:	49                   	rex.WB
  3c:	8b                   	.byte 0x8b
  3d:	96                   	xchg   %eax,%esi
  3e:	b0 20                	mov    $0x20,%al

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	44 8b 54 24 18       	mov    0x18(%rsp),%r10d
   7:	e9 9f fe ff ff       	jmpq   0xfffffffffffffeab
   c:	c6 44 02 ff 00       	movb   $0x0,-0x1(%rdx,%rax,1)
  11:	49                   	rex.WB
  12:	8b                   	.byte 0x8b
  13:	96                   	xchg   %eax,%esi
  14:	b0 20                	mov    $0x20,%al
kern  :warn  : [   67.404903] RSP: 0018:ffffc900013c7d38 EFLAGS: 00010282
kern  :warn  : [   67.406040] RAX: 0000000000000000 RBX: 0000000000000011 RCX: 0000000000000027
kern  :warn  : [   67.407360] RDX: 0000000000000027 RSI: 00000000ffff7fff RDI: ffff88821fa977f8
kern  :warn  : [   67.408721] RBP: ffffffff8257bf7e R08: ffff88821fa977f0 R09: ffffc900013c7b50
kern  :warn  : [   67.409981] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000004343
kern  :warn  : [   67.411260] R13: ffffffff8257bf6e R14: ffff88820d4bc000 R15: ffff88820d4bd0b0
kern  :warn  : [   67.412534] FS:  00007f7ac32aa540(0000) GS:ffff88821fa80000(0000) knlGS:0000000000000000
kern  :warn  : [   67.413844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [   67.415055] CR2: 0000000000000001 CR3: 000000021193a005 CR4: 00000000001706e0
kern  :warn  : [   67.416323] Call Trace:
kern :warn : [   67.417564] trace_event_printf (kbuild/src/consumer/kernel/trace/trace_output.c:322) 
kern :warn : [   67.418864] ? trace_print_flags_seq (kbuild/src/consumer/kernel/trace/trace_output.c:99) 
kern :warn : [   67.420198] trace_raw_output_writeback_dirty_inode_template (kbuild/src/consumer/include/trace/events/writeback.h:95 (discriminator 2)) 
kern :warn : [   67.421593] print_trace_line (kbuild/src/consumer/kernel/trace/trace.c:4233 kbuild/src/consumer/kernel/trace/trace.c:4398) 
kern :warn : [   67.422908] tracing_read_pipe (kbuild/src/consumer/kernel/trace/trace.c:6601) 
kern :warn : [   67.424211] vfs_read (kbuild/src/consumer/fs/read_write.c:494) 
kern :warn : [   67.425491] ksys_read (kbuild/src/consumer/fs/read_write.c:634) 
kern :warn : [   67.426775] do_syscall_64 (kbuild/src/consumer/arch/x86/entry/common.c:46) 
kern :warn : [   67.428048] entry_SYSCALL_64_after_hwframe (kbuild/src/consumer/arch/x86/entry/entry_64.S:112) 
kern  :warn  : [   67.429352] RIP: 0033:0x7f7ac31d2461
kern :warn : [ 67.430578] Code: fe ff ff 50 48 8d 3d fe d0 09 00 e8 e9 03 02 00 66 0f 1f 84 00 00 00 00 00 48 8d 05 99 62 0d 00 8b 00 85 c0 75 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 57 c3 66 0f 1f 44 00 00 41 54 49 89 d4 55 48
All code
========
   0:	fe                   	(bad)  
   1:	ff                   	(bad)  
   2:	ff 50 48             	callq  *0x48(%rax)
   5:	8d 3d fe d0 09 00    	lea    0x9d0fe(%rip),%edi        # 0x9d109
   b:	e8 e9 03 02 00       	callq  0x203f9
  10:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  17:	00 00 
  19:	48 8d 05 99 62 0d 00 	lea    0xd6299(%rip),%rax        # 0xd62b9
  20:	8b 00                	mov    (%rax),%eax
  22:	85 c0                	test   %eax,%eax
  24:	75 13                	jne    0x39
  26:	31 c0                	xor    %eax,%eax
  28:	0f 05                	syscall 
  2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
  30:	77 57                	ja     0x89
  32:	c3                   	retq   
  33:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  39:	41 54                	push   %r12
  3b:	49 89 d4             	mov    %rdx,%r12
  3e:	55                   	push   %rbp
  3f:	48                   	rex.W

Code starting with the faulting instruction
===========================================
   0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
   6:	77 57                	ja     0x5f
   8:	c3                   	retq   
   9:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   f:	41 54                	push   %r12
  11:	49 89 d4             	mov    %rdx,%r12
  14:	55                   	push   %rbp
  15:	48                   	rex.W
kern  :warn  : [   67.433466] RSP: 002b:00007fff53c43788 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
kern  :warn  : [   67.434862] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f7ac31d2461
kern  :warn  : [   67.436248] RDX: 0000000000020000 RSI: 00007f7ac2f1f000 RDI: 0000000000000004
kern  :warn  : [   67.437690] RBP: 00007f7ac2f1f000 R08: 00000000ffffffff R09: 0000000000000000
kern  :warn  : [   67.439179] R10: fffffffffffffb9c R11: 0000000000000246 R12: 00007f7ac2f1f000
kern  :warn  : [   67.440666] R13: 0000000000000004 R14: 0000000000000fd6 R15: 0000000000020000
kern  :warn  : [   67.442154] ---[ end trace 111907d32e944db5 ]---
user  :notice: [   73.663747]  ip=::::lkp-ivb-d02::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-28413-btefsg-3.yaml ARCH=x86_64 kconfig=x86_64-rhel-8.3 branch=linus/master commit=9a6944fee68e25084130386c608c5ac8db487581 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e max_uptime=2100 RESULT_ROOT=/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/4 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_l



user  :notice: [   77.704925] Gnu C                  gcc (Debian 8.3.0-6) 8.3.0

user  :notice: [   77.716244] Clang

user  :notice: [   77.727745] Gnu make               4.2.1

user  :notice: [   77.738801] util-linux             2.33.1

user  :notice: [   81.495940] mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs, namespaces, assert, debug)

user  :notice: [   81.505144] modutils               26

user  :notice: [   81.514181] e2fsprogs              1.44.5

user  :notice: [   81.523248] Linux C Library        > libc.2.28

user  :notice: [   81.530829] Dynamic linker (ldd)   2.28

user  :notice: [   81.537497] Procps                 3.3.15

user  :notice: [   81.544273] Net-tools              2.10-alpha

user  :notice: [   81.551273] iproute2               iproute2-ss190107

user  :notice: [   81.558277] iputils                iputils-s20180629

user  :notice: [   81.564776] ethtool                4.19

user  :notice: [   81.574843] Kbd                    119:

user  :notice: [   81.581528] Sh-utils               8.30

user  :notice: [   95.012211] Modules Loaded         netconsole btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c intel_rapl_msr intel_rapl_common sd_mod x86_pkg_temp_thermal t10_pi sg intel_powerclamp coretemp i915 kvm_intel kvm irqbypass intel_gtt crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel ghash_clmulni_intel syscopyarea rapl sysfillrect ahci sysimgblt fb_sys_fops libahci drm intel_cstate libata intel_uncore ipmi_devintf ipmi_msghandler mei_me joydev mei video ip_tables



user  :notice: [   95.038003] free reports:

user  :notice: [   95.048893]               total        used        free      shared  buff/cache   available

user  :notice: [   95.060064] Mem:        8024612      296536     5171728       13384     2556348     5067056

user  :notice: [   95.069333] Swap:             0           0           0



user  :notice: [   95.083410] cpuinfo:

user  :notice: [   95.091601] Architecture:        x86_64


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install                job.yaml  # job file is attached in this email
        bin/lkp split-job --compatible job.yaml  # generate the yaml file for lkp run
        bin/lkp run                    generated-yaml-file



---
0DAY/LKP+ Test Infrastructure                   Open Source Technology Center
https://lists.01.org/hyperkitty/list/lkp@lists.01.org       Intel Corporation

Thanks,
Oliver Sang


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="config-5.12.0-rc3-00014-g9a6944fee68e"

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 5.12.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="gcc-9 (Debian 9.3.0-22) 9.3.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=90300
CONFIG_CLANG_VERSION=0
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23502
CONFIG_LLD_VERSION=0
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_INLINE=y
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
CONFIG_TASKS_RCU=y
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
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
CONFIG_IPC_NS=y
CONFIG_USER_NS=y
CONFIG_PID_NS=y
CONFIG_NET_NS=y
# CONFIG_CHECKPOINT_RESTORE is not set
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
CONFIG_BPF=y
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
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_BPF_LSM is not set
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
# CONFIG_BPF_PRELOAD is not set
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
CONFIG_PERF_EVENTS_AMD_POWER=m
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
CONFIG_AMD_MEM_ENCRYPT=y
# CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
CONFIG_NUMA=y
CONFIG_AMD_NUMA=y
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
CONFIG_X86_RESERVE_LOW=64
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
CONFIG_ACPI_APEI_ERST_DEBUG=y
# CONFIG_ACPI_DPTF is not set
CONFIG_ACPI_WATCHDOG=y
CONFIG_ACPI_EXTLOG=m
CONFIG_ACPI_ADXL=y
# CONFIG_ACPI_CONFIGFS is not set
CONFIG_PMIC_OPREGION=y
CONFIG_X86_PM_TIMER=y

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
# CONFIG_MODULE_COMPRESS is not set
# CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
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
# CONFIG_BLK_CGROUP_IOLATENCY is not set
# CONFIG_BLK_CGROUP_IOCOST is not set
CONFIG_BLK_WBT_MQ=y
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
CONFIG_NEED_MULTIPLE_NODES=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
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
CONFIG_PAGE_REPORTING=y
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
CONFIG_CLEANCACHE=y
CONFIG_FRONTSWAP=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
CONFIG_CMA_AREAS=19
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
CONFIG_ARCH_HAS_PTE_DEVMAP=y
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
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=m
CONFIG_NETFILTER_NETLINK_LOG=m
CONFIG_NETFILTER_NETLINK_OSF=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_COMMON=m
CONFIG_NF_LOG_NETDEV=m
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
CONFIG_NF_LOG_BRIDGE=m
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
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
CONFIG_CGROUP_NET_PRIO=y
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
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y
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
# CONFIG_PM_QOS_KUNIT_TEST is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_KUNIT_DRIVER_PE_TEST=y
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
# CONFIG_BLK_DEV_UMEM is not set
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
# CONFIG_PCI_ENDPOINT_TEST is not set
# CONFIG_XILINX_SDFEC is not set
CONFIG_MISC_RTSX=m
CONFIG_PVPANIC=y
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

#
# Distributed Switch Architecture drivers
#
# CONFIG_NET_DSA_MV88E6XXX_PTP is not set
# end of Distributed Switch Architecture drivers

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
# CONFIG_LED_TRIGGER_PHY is not set
# CONFIG_FIXED_PHY is not set

#
# MII PHY device drivers
#
# CONFIG_AMD_PHY is not set
# CONFIG_ADIN_PHY is not set
# CONFIG_AQUANTIA_PHY is not set
# CONFIG_AX88796B_PHY is not set
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
# CONFIG_MICREL_PHY is not set
# CONFIG_MICROCHIP_PHY is not set
# CONFIG_MICROCHIP_T1_PHY is not set
# CONFIG_MICROSEMI_PHY is not set
# CONFIG_NATIONAL_PHY is not set
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
# CONFIG_ROCKETPORT is not set
CONFIG_CYCLADES=m
# CONFIG_CYZ_INTR is not set
# CONFIG_MOXA_INTELLIO is not set
# CONFIG_MOXA_SMARTIO is not set
CONFIG_SYNCLINK_GT=m
# CONFIG_ISI is not set
CONFIG_N_HDLC=m
CONFIG_N_GSM=m
CONFIG_NOZOMI=m
# CONFIG_NULL_TTY is not set
# CONFIG_TRACE_SINK is not set
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
# CONFIG_DEVKMEM is not set
CONFIG_NVRAM=y
CONFIG_RAW_DRIVER=y
CONFIG_MAX_RAW_DEVS=8192
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
# CONFIG_SENSORS_AMD_ENERGY is not set
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
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
CONFIG_SENSORS_PMBUS=m
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_INSPUR_IPSPS is not set
# CONFIG_SENSORS_IR35221 is not set
# CONFIG_SENSORS_IR38064 is not set
# CONFIG_SENSORS_IRPS5401 is not set
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
# CONFIG_SENSORS_MAX20730 is not set
# CONFIG_SENSORS_MAX20751 is not set
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2975 is not set
# CONFIG_SENSORS_PM6764TR is not set
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
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
# end of Intel thermal drivers

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
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SM501=m
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
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
CONFIG_DVB_SP8870=m
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
CONFIG_DRM_KMS_FB_HELPER=y
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
CONFIG_DRM_GMA600=y
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
# CONFIG_TINYDRM_HX8357D is not set
# CONFIG_TINYDRM_ILI9225 is not set
# CONFIG_TINYDRM_ILI9341 is not set
# CONFIG_TINYDRM_ILI9486 is not set
# CONFIG_TINYDRM_MI0283QT is not set
# CONFIG_TINYDRM_REPAPER is not set
# CONFIG_TINYDRM_ST7586 is not set
# CONFIG_TINYDRM_ST7735R is not set
# CONFIG_DRM_XEN is not set
# CONFIG_DRM_VBOXVIDEO is not set
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

#
# LED Blink
#
# CONFIG_LEDS_BLINK is not set
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
# CONFIG_INFINIBAND_I40IW is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_OCRDMA is not set
# CONFIG_INFINIBAND_USNIC is not set
# CONFIG_INFINIBAND_BNXT_RE is not set
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
# CONFIG_XILINX_ZYNQMP_DPDMA is not set
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
CONFIG_VFIO_MDEV_DEVICE=m
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
CONFIG_ACERHDF=m
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
# CONFIG_AMD_PMC is not set
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
CONFIG_HP_WIRELESS=m
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
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
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
CONFIG_IOMMU_IO_PGTABLE=y
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_IOMMU_DMA=y
CONFIG_AMD_IOMMU=y
CONFIG_AMD_IOMMU_V2=m
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
# CONFIG_INTEL_IOMMU_SVM is not set
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
# CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
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
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_INODE64 is not set
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
# CONFIG_PSTORE_BLK is not set
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
# CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
# CONFIG_SECURITY_LOADPIN is not set
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
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
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
# CONFIG_EVM_LOAD_X509 is not set
CONFIG_DEFAULT_SECURITY_SELINUX=y
# CONFIG_DEFAULT_SECURITY_APPARMOR is not set
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tomoyo,apparmor,bpf"

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
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_COHERENT_POOL=y
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
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
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
CONFIG_LOCK_TORTURE_TEST=m
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
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
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
# CONFIG_KUNIT_DEBUGFS is not set
CONFIG_KUNIT_TEST=m
CONFIG_KUNIT_EXAMPLE_TEST=m
# CONFIG_KUNIT_ALL_TESTS is not set
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
# CONFIG_BITFIELD_KUNIT is not set
# CONFIG_RESOURCE_KUNIT_TEST is not set
CONFIG_SYSCTL_KUNIT_TEST=m
CONFIG_LIST_KUNIT_TEST=m
# CONFIG_LINEAR_RANGES_TEST is not set
# CONFIG_CMDLINE_KUNIT_TEST is not set
# CONFIG_BITS_TEST is not set
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
# CONFIG_MEMTEST is not set
# CONFIG_HYPERV_TESTING is not set
# end of Kernel Testing and Coverage
# end of Kernel hacking

--vGgW1X5XWziG23Ko
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
	export job_origin='ltp-part3.yaml'
	export queue_cmdline_keys='branch
commit
queue_at_least_once'
	export queue='validate'
	export testbox='lkp-ivb-d02'
	export tbox_group='lkp-ivb-d02'
	export kconfig='x86_64-rhel-8.3'
	export submit_id='6095334a6c5a406efdc3e36a'
	export job_file='/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-28413-btefsg-3.yaml'
	export id='1353ff514b6041f9f7189bb90168700bdccdf34a'
	export queuer_version='/lkp-src'
	export model='Ivy Bridge'
	export nr_node=1
	export nr_cpu=4
	export memory='8G'
	export nr_hdd_partitions=4
	export nr_ssd_partitions=1
	export ssd_partitions='/dev/disk/by-id/ata-INTEL_SSDSC2BA400G4_BTHV634505W5400NGN-part1'
	export hdd_partitions='/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part1 /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part2 /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part3 /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part4'
	export swap_partitions='/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part6'
	export rootfs_partition='/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part5'
	export brand='Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz'
	export need_kconfig='CONFIG_BLK_DEV_LOOP
CONFIG_CAN=m
CONFIG_CAN_RAW=m
CONFIG_CAN_VCAN=m
CONFIG_IPV6_VTI=m
CONFIG_MINIX_FS=m'
	export commit='9a6944fee68e25084130386c608c5ac8db487581'
	export netconsole_port=6673
	export ucode='0x21'
	export need_kconfig_hw='CONFIG_NET_VENDOR_REALTEK=y
CONFIG_R8169=y
CONFIG_SATA_AHCI
CONFIG_DRM_I915'
	export bisect_dmesg=true
	export enqueue_time='2021-05-07 20:32:10 +0800'
	export _id='609533506c5a406efdc3e36c'
	export _rt='/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581'
	export user='lkp'
	export compiler='gcc-9'
	export LKP_SERVER='internal-lkp-server'
	export head_commit='7390f3fa2cd2742a52d410df8bc98bac0abfb1df'
	export base_commit='9f4ad9e425a1d3b6a34617b8ea226d56a119a717'
	export branch='linus/master'
	export rootfs='debian-10.4-x86_64-20200603.cgz'
	export result_root='/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/4'
	export scheduler_version='/lkp/lkp/.src-20210506-110429'
	export arch='x86_64'
	export max_uptime=2100
	export initrd='/osimage/debian/debian-10.4-x86_64-20200603.cgz'
	export bootloader_append='root=/dev/ram0
user=lkp
job=/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-28413-btefsg-3.yaml
ARCH=x86_64
kconfig=x86_64-rhel-8.3
branch=linus/master
commit=9a6944fee68e25084130386c608c5ac8db487581
BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e
max_uptime=2100
RESULT_ROOT=/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/4
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
	export modules_initrd='/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/modules.cgz'
	export bm_initrd='/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210506.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210506.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
	export ucode_initrd='/osimage/ucode/intel-ucode-20210222.cgz'
	export lkp_initrd='/osimage/user/lkp/lkp-x86_64.cgz'
	export site='inn'
	export LKP_CGI_PORT=80
	export LKP_CIFS_PORT=139
	export last_kernel='4.20.0'
	export repeat_to=6
	export queue_at_least_once=1
	export kernel='/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e'
	export dequeue_time='2021-05-07 20:48:38 +0800'
	export job_initrd='/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-28413-btefsg-3.cgz'

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

	run_test test='tracing' $LKP_SRC/tests/wrapper ltp
}

extract_stats()
{
	export stats_part_begin=
	export stats_part_end=

	env test='tracing' $LKP_SRC/stats/wrapper ltp
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

--vGgW1X5XWziG23Ko
Content-Type: application/x-xz
Content-Disposition: attachment; filename="kmsg.xz"
Content-Transfer-Encoding: base64

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

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=ltp

2021-05-07 12:50:06 ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
2021-05-07 12:50:06 ./runltp -f tracing
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
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

uname:
Linux lkp-ivb-d02 5.12.0-rc3-00014-g9a6944fee68e #1 SMP Fri May 7 16:22:42 CST 2021 x86_64 GNU/Linux

/proc/cmdline
 ip=::::lkp-ivb-d02::dhcp root=/dev/ram0 user=lkp job=/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-28413-btefsg-3.yaml ARCH=x86_64 kconfig=x86_64-rhel-8.3 branch=linus/master commit=9a6944fee68e25084130386c608c5ac8db487581 BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e max_uptime=2100 RESULT_ROOT=/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/4 LKP_SERVER=internal-lkp-server nokaslr selinux=0 debug apic=debug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=100 net.ifnames=0 printk.devkmsg=on panic=-1 softlockup_panic=1 nmi_watchdog=panic oops=panic load_ramdisk=2 prompt_ramdisk=0 drbd.minor_count=8 systemd.log_level=err ignore_loglevel console=tty0 earlyprintk=ttyS0,115200 console=ttyS0,115200 vga=normal rw

Gnu C                  gcc (Debian 8.3.0-6) 8.3.0
Clang                 
Gnu make               4.2.1
util-linux             2.33.1
mount                  linux 2.33.1 (libmount 2.33.1: selinux, smack, btrfs, namespaces, assert, debug)
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
Modules Loaded         netconsole btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c intel_rapl_msr intel_rapl_common sd_mod x86_pkg_temp_thermal t10_pi sg intel_powerclamp coretemp i915 kvm_intel kvm irqbypass intel_gtt crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel ghash_clmulni_intel syscopyarea rapl sysfillrect ahci sysimgblt fb_sys_fops libahci drm intel_cstate libata intel_uncore ipmi_devintf ipmi_msghandler mei_me joydev mei video ip_tables

free reports:
              total        used        free      shared  buff/cache   available
Mem:        8024612      296536     5171728       13384     2556348     5067056
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
CPU MHz:             3292.839
CPU max MHz:         3300.0000
CPU min MHz:         1600.0000
BogoMIPS:            6585.15
Virtualization:      VT-x
L1d cache:           32K
L1i cache:           32K
L2 cache:            256K
L3 cache:            3072K
NUMA node0 CPU(s):   0-3
Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 popcnt tsc_deadline_timer xsave avx f16c lahf_lm cpuid_fault epb pti tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt dtherm arat pln pts

AppArmor enabled

SELinux mode: unknown
no big block device was specified on commandline.
Tests which require a big block device are disabled.
You can specify it with option -z
COMMAND:    /lkp/benchmarks/ltp/bin/ltp-pan   -e -S   -a 2434     -n 2434 -p -f /tmp/ltp-gvBYn11H4A/alltests -l /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_05_07-12h_50m_06s.log  -C /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-12h_50m_06s.failed -T /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-12h_50m_06s.tconf
LOG File: /lkp/benchmarks/ltp/results/LTP_RUN_ON-2021_05_07-12h_50m_06s.log
FAILED COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-12h_50m_06s.failed
TCONF COMMAND File: /lkp/benchmarks/ltp/output/LTP_RUN_ON-2021_05_07-12h_50m_06s.tconf
Running tests.......
<<<test_start>>>
tag=ftrace_regression01 stime=1620391806
cmdline="ftrace_regression01.sh"
contacts=""
analysis=exit
<<<test_output>>>
ftrace_regression01 1 TPASS: Finished running the test
/lkp/benchmarks/ltp/testcases/bin/ftrace_lib.sh: line 128: echo: write error: Invalid argument
<<<execution_status>>>
initiation_status="ok"
duration=1 termination_type=exited termination_id=0 corefile=no
cutime=2 cstime=29
<<<test_end>>>
<<<test_start>>>
tag=ftrace_regression02 stime=1620391807
cmdline="ftrace_regression02.sh"
contacts=""
analysis=exit
<<<test_output>>>
ftrace_regression02 1 TPASS: finished running the test.
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=0 corefile=no
cutime=13 cstime=17
<<<test_end>>>
<<<test_start>>>
tag=ftrace-stress-test stime=1620391807
cmdline="ftrace_stress_test.sh 90"
contacts=""
analysis=exit
<<<test_output>>>
ftrace-stress-test 1 TINFO: Ftrace Stress Test Begin
ftrace-stress-test 1 TINFO: Test targets:  trace_pipe current_tracer ftrace_enabled function_profile_enabled set_event set_ftrace_pid stack_max_size stack_trace trace trace_clock trace_options trace_stat tracing_enabled tracing_max_latency tracing_on function_profile_enabled buffer_size_kb tracing_cpumask set_ftrace_filter
ftrace-stress-test 1 TINFO: tracing_enabled is not supported. Skip it.
ftrace-stress-test 1 TINFO: Start pid0=2718 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_trace_pipe.sh
ftrace-stress-test 1 TINFO: Start pid1=2719 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_current_tracer.sh
ftrace-stress-test 1 TINFO: Start pid2=2720 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_ftrace_enabled.sh
ftrace-stress-test 1 TINFO: Start pid3=2721 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_function_profile_enabled.sh
ftrace-stress-test 1 TINFO: Start pid4=2723 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_set_event.sh
ftrace-stress-test 1 TINFO: Start pid5=2726 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_set_ftrace_pid.sh
ftrace-stress-test 1 TINFO: Start pid6=2727 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_stack_max_size.sh
ftrace-stress-test 1 TINFO: Start pid7=2728 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_stack_trace.sh
ftrace-stress-test 1 TINFO: Start pid8=2729 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_trace.sh
ftrace-stress-test 1 TINFO: Start pid9=2730 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_trace_clock.sh
ftrace-stress-test 1 TINFO: Start pid10=2731 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_trace_options.sh
ftrace-stress-test 1 TINFO: Start pid11=2732 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_trace_stat.sh
ftrace-stress-test 1 TINFO: Start pid12=2735 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_tracing_max_latency.sh
ftrace-stress-test 1 TINFO: Start pid13=2737 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_tracing_on.sh
ftrace-stress-test 1 TINFO: Start pid14=2743 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_function_profile_enabled.sh
ftrace-stress-test 1 TINFO: Start pid15=2749 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_buffer_size_kb.sh
ftrace-stress-test 1 TINFO: Start pid16=2750 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_tracing_cpumask.sh
ftrace-stress-test 1 TINFO: Start pid17=2751 /lkp/benchmarks/ltp/testcases/bin/ftrace_stress/ftrace_set_ftrace_filter.sh
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace-stress-test 1 TINFO: killing 2718
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_trace_pipe.sh: line 19: 25145 Killed                  cat "$TRACING_PATH"/trace_pipe > /dev/null
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace-stress-test 1 ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
TINFO: killing 2719
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2719 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2720
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 41: echo: write error: Cannot allocate memory
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2720 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2721
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2721 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2723
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
ftrace_buffer_size_kb.sh: line 33: echo: write error: Cannot allocate memory
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2723 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2726
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2726 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2727
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2727 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2728
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2728 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2729
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2729 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2730
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2730 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2731
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2731 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2732
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2732 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2735
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2735 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2737
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2737 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2743
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2743 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2749
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2749 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2750
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2750 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: killing 2751
/lkp/benchmarks/ltp/testcases/bin/ftrace_stress_test.sh: line 73:  2751 Killed                  sh ftrace_${target}.sh
ftrace-stress-test 1 TINFO: Finished running the test. Run dmesg to double-check for bugs
<<<execution_status>>>
initiation_status="ok"
duration=105 termination_type=exited termination_id=0 corefile=no
cutime=1201 cstime=24608
<<<test_end>>>
<<<test_start>>>
tag=dynamic_debug01 stime=1620391912
cmdline="dynamic_debug01.sh"
contacts=""
analysis=exit
<<<test_output>>>
dynamic_debug01 1 TINFO: timeout per run is 0h 5m 0s
dynamic_debug01 1 TINFO: debugfs already mounted at /sys/kernel/debug
dynamic_debug01 1 TPASS: Dynamic debug OK

Summary:
passed   1
failed   0
broken   0
skipped  0
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=31 termination_type=exited termination_id=0 corefile=no
cutime=223 cstime=2938
<<<test_end>>>
<<<test_start>>>
tag=pt_full_trace_basic stime=1620391943
cmdline="pt_test"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
pt_test.c:161: TCONF: Requires Intel Core 5th+ generation (Broadwell and newer) and CONFIG_PERF_EVENTS enabled

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=pt_snapshot_trace_basic stime=1620391943
cmdline="pt_test -m"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
pt_test.c:161: TCONF: Requires Intel Core 5th+ generation (Broadwell and newer) and CONFIG_PERF_EVENTS enabled

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=pt_ex_user stime=1620391943
cmdline="pt_test -e user"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
pt_test.c:161: TCONF: Requires Intel Core 5th+ generation (Broadwell and newer) and CONFIG_PERF_EVENTS enabled

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=pt_ex_kernel stime=1620391943
cmdline="pt_test -e kernel"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
pt_test.c:161: TCONF: Requires Intel Core 5th+ generation (Broadwell and newer) and CONFIG_PERF_EVENTS enabled

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=1
<<<test_end>>>
<<<test_start>>>
tag=pt_disable_branch stime=1620391943
cmdline="pt_test -b"
contacts=""
analysis=exit
<<<test_output>>>
tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
pt_test.c:161: TCONF: Requires Intel Core 5th+ generation (Broadwell and newer) and CONFIG_PERF_EVENTS enabled

Summary:
passed   0
failed   0
broken   0
skipped  1
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=0 termination_type=exited termination_id=32 corefile=no
cutime=0 cstime=1
<<<test_end>>>
INFO: ltp-pan reported all tests PASS
LTP Version: 20210121-303-gfad5cecb2

       ###############################################################

            Done executing testcases.
            LTP Version:  20210121-303-gfad5cecb2
       ###############################################################


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="job.yaml"

---

#! jobs/ltp-part3.yaml
suite: ltp
testcase: ltp
category: functional
need_modules: true
need_memory: 4G
ltp:
  test: tracing
job_origin: ltp-part3.yaml

#! queue options
queue_cmdline_keys:
- branch
- commit
queue: bisect
testbox: lkp-ivb-d02
tbox_group: lkp-ivb-d02
kconfig: x86_64-rhel-8.3
submit_id: 6094f7f56c5a406585321e6e
job_file: "/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-25989-qazpzv-0.yaml"
id: da0c328f1f82b9c8919f280c98b97f6b664b5907
queuer_version: "/lkp-src"

#! hosts/lkp-ivb-d02
model: Ivy Bridge
nr_node: 1
nr_cpu: 4
memory: 8G
nr_hdd_partitions: 4
nr_ssd_partitions: 1
ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BA400G4_BTHV634505W5400NGN-part1"
hdd_partitions: "/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part1 /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part2
  /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part3 /dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part4"
swap_partitions: "/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part6"
rootfs_partition: "/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC127QJQ-part5"
brand: Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz

#! include/category/functional
kmsg: 
heartbeat: 
meminfo: 

#! include/ltp
need_kconfig:
- CONFIG_BLK_DEV_LOOP
- CONFIG_CAN=m
- CONFIG_CAN_RAW=m
- CONFIG_CAN_VCAN=m
- CONFIG_IPV6_VTI=m
- CONFIG_MINIX_FS=m

#! include/queue/cyclic
commit: 9a6944fee68e25084130386c608c5ac8db487581

#! include/testbox/lkp-ivb-d02
netconsole_port: 6673
ucode: '0x21'
need_kconfig_hw:
- CONFIG_NET_VENDOR_REALTEK=y
- CONFIG_R8169=y
- CONFIG_SATA_AHCI
- CONFIG_DRM_I915
bisect_dmesg: true
enqueue_time: 2021-05-07 16:19:02.213168864 +08:00
_id: 6094f7f56c5a406585321e6e
_rt: "/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581"

#! schedule options
user: lkp
compiler: gcc-9
LKP_SERVER: internal-lkp-server
head_commit: 7390f3fa2cd2742a52d410df8bc98bac0abfb1df
base_commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
branch: linux-devel/devel-hourly-20210506-132928
rootfs: debian-10.4-x86_64-20200603.cgz
result_root: "/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/0"
scheduler_version: "/lkp/lkp/.src-20210506-110429"
arch: x86_64
max_uptime: 2100
initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
bootloader_append:
- root=/dev/ram0
- user=lkp
- job=/lkp/jobs/scheduled/lkp-ivb-d02/ltp-tracing-ucode=0x21-debian-10.4-x86_64-20200603.cgz-9a6944fee68e25084130386c608c5ac8db487581-20210507-25989-qazpzv-0.yaml
- ARCH=x86_64
- kconfig=x86_64-rhel-8.3
- branch=linux-devel/devel-hourly-20210506-132928
- commit=9a6944fee68e25084130386c608c5ac8db487581
- BOOT_IMAGE=/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e
- max_uptime=2100
- RESULT_ROOT=/result/ltp/tracing-ucode=0x21/lkp-ivb-d02/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/0
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
modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/modules.cgz"
bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/ltp_20210506.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/ltp-x86_64-14c1f76-1_20210506.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
site: inn

#! /lkp/lkp/.src-20210506-110429/include/site/inn
LKP_CGI_PORT: 80
LKP_CIFS_PORT: 139
oom-killer: 
watchdog: 

#! runtime status
last_kernel: 4.20.0

#! user overrides
kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/9a6944fee68e25084130386c608c5ac8db487581/vmlinuz-5.12.0-rc3-00014-g9a6944fee68e"
dequeue_time: 2021-05-07 16:56:12.112013094 +08:00
job_state: finished
loadavg: 11.94 5.20 1.95 1/217 2888
start_time: '1620377854'
end_time: '1620377964'
version: "/lkp/lkp/.src-20210506-110504:c8d5f8a8:89926580f"

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

ln -sf /usr/bin/genisoimage /usr/bin/mkisofs
./runltp -f tracing

--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--vGgW1X5XWziG23Ko--
