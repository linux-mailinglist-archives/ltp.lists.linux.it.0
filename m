Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BC39195E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 15:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1ACE13CA11A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 15:59:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3AC1F3C1AD6
 for <ltp@lists.linux.it>; Wed, 26 May 2021 15:59:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0CE9C200D58
 for <ltp@lists.linux.it>; Wed, 26 May 2021 15:59:07 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2BA1B1FD29;
 Wed, 26 May 2021 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622037547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sl6GeoHBEpSoTVIbddT1C3/JbYVXzatKueox0wQTIIU=;
 b=K9P1nME7gjQrJeZKTb+VeKLFMy6PTsh3tKHLoXz7YH2Jnj5Kgb3+fDTmMCZtKsRxn/o5tQ
 MlkN+n88jAvskAUg1NDRAbeCX6H/bNd06jsVbLYWIN34XT1VnF7Huc70Qa2zALXzJrx5pK
 e4QECHeABQBoA5MEzBQhUAQUeyIsS3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622037547;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sl6GeoHBEpSoTVIbddT1C3/JbYVXzatKueox0wQTIIU=;
 b=dNFmmg+bMH4t9S0wm5iCNIwLopH/JjWI+WpqvaOC2YxJHDArLO0ydHs7sgg5DE3+nhwBfi
 gczkwskC165mVXAQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id F363911A98;
 Wed, 26 May 2021 13:59:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 May 2021 15:59:00 +0200
Message-Id: <20210526135900.19042-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Remove README.kernel_config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It's not up-to-day nor important enough to maintain it.

Acked-by: Yang Xu <xuyang2018.jy@fujitsu.com>
Acked-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

already asked before release
https://lists.linux.it/pipermail/ltp/2021-May/022616.html

Kind regards,
Petr

 README.kernel_config | 301 -------------------------------------------
 1 file changed, 301 deletions(-)
 delete mode 100644 README.kernel_config

diff --git a/README.kernel_config b/README.kernel_config
deleted file mode 100644
index 547dd4f33..000000000
--- a/README.kernel_config
+++ /dev/null
@@ -1,301 +0,0 @@
----------------------------------
-Enable CODE COVERAGE for your Kernel:
----------------------------------
-1) Apply kernel-gcov patch(s) against the corresponding Kernel. They are available here:
-http://ltp.cvs.sourceforge.net/viewvc/ltp/utils/analysis/gcov-kernel/linux-2.*.*-gcov.patch?view=log,
-2) Also enable the following options in your .config file before building the kernel
-CONFIG_GCOV_PROFILE=y
-CONFIG_GCOV_ALL=y
-CONFIG_GCOV_PROC=m
-CONFIG_GCOV_HAMMER=y
-
----------------------------------
-Enabling Kernel Configuration to test Containers/Namespaces
----------------------------------
-CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
-CONFIG_USER_NS=y
-CONFIG_PID_NS=y
-CONFIG_NET_NS=y
-CONFIG_VETH=y
-CONFIG_MACVLAN=y
-
-The IPC namespaces do not automatically enable IPC, so you may
-also want to have:
-
-CONFIG_SYSVIPC=y
-CONFIG_SYSVIPC_SYSCTL=y
-CONFIG_POSIX_MQUEUE=y
-
----------------------------------
-Enabling Kernel Configuration to test Controllers
----------------------------------
-CONFIG_CGROUPS=y
-CONFIG_CGROUP_DEBUG=y
-CONFIG_CGROUP_NS=y
-CONFIG_GROUP_SCHED=y
-CONFIG_FAIR_GROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_CGROUP_MEM_RES_CTLR=y
-CONFIG_LOCKDEP=y
----------------------------------
-Enabling Kernel Configuration to test Power Management features
----------------------------------
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_TABLE=y
-CONFIG_CPU_FREQ_DEBUG=y
-CONFIG_CPU_FREQ_STAT=y
-CONFIG_CPU_FREQ_STAT_DETAILS=y
-CONFIG_CPU_IDLE=y
-CONFIG_CPU_IDLE_GOV_LADDER=y
-CONFIG_CPU_IDLE_GOV_MENU=y
-CONFIG_SCHED_MC=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
-CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
----------------------------------
-Enabling Kernel Configuration to test filecaps security feature
----------------------------------
-CONFIG_SECURITY_FILE_CAPABILITIES=y
----------------------------------
-Enabling Kernel Configuration to test SELinux security feature
----------------------------------
-Your Kernel should have been built with the following options to
-test SELinux:
-
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK=y
-CONFIG_SECURITY_NETWORK_XFRM=y
-
-CONFIG_SECURITY_DEFAULT_MMAP_MIN_ADDR=0
-This has to be set to a positive value if you want to test this check.
-Fedora kernels set it to 65536.
-
-CONFIG_SECURITY_SELINUX=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM=y
-CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=1
-CONFIG_SECURITY_SELINUX_DEVELOP=y
-CONFIG_SECURITY_SELINUX_AVC_STATS=y
-CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
-CONFIG_SECURITY_SELINUX_ENABLE_SECMARK_DEFAULT=y
-
-CONFIG_SECURITY_SELINUX_POLICYDB_VERSION_MAX=y
-You don't want this one unless you are running Fedora 3 or 4.
-On anything newer, it will cause unnecessary policy expansion.
-
-CONFIG_SECURITY_SMACK=y
-CONFIG_SECURITY_SELINUX=y
-
-By default, if you boot with multiple LSMs compiled into the kernel, the
-kernel won't boot succesfully - there can be only one (aside from
-explicit internal "stacking" e.g. as is done for combining SELinux or
-Smack with capabilities).  Unless you use the security= option to select
-one at boot.  SELinux and Smack will honor the security= option.
----------------------------------
----------------------------------
-Enabling Kernel Configuration to test SMACK security feature
----------------------------------
-CONFIG_NETLABEL=y
-CONFIG_SECURITY=y
-CONFIG_SECURITY_NETWORK=y
-CONFIG_SECURITY_SMACK=y
-CONFIG_SECURITY_SELINUX should not be set
-
-For more information to build/install/run these tests, look through:
-ltp/testcases/kernel/security/smack/README
----------------------------------
----------------------------------
-Enablement for Enhancement to kexec/kdump for implementing the following features:
-- Backup/restore memory used by the original kernel before/after kexec.
-- Save/restore CPU state before/after kexec.
-Now, only the i386 architecture is supported. More from the following git logs:
-http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=3ab83521378268044a448113c6aa9a9e245f4d2f,
-http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=89081d17f7bb81d89fa1aa9b70f821c5cf4d39e9,
----------------------------------
-CONFIG_X86_32=y
-CONFIG_RELOCATABLE=y
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
-CONFIG_PM=y
-CONFIG_HIBERNATION=y
-CONFIG_KEXEC_JUMP=y
----------------------------------
-Enabling HOTPLUG for your Kernels
----------------------------------
-CONFIG_HOTPLUG_CPU=y
-CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
-CONFIG_ACPI_HOTPLUG_CPU=y
-CONFIG_HOTPLUG_PCI_PCIE=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_FAKE=y
-CONFIG_HOTPLUG_PCI_COMPAQ=y
-CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM=y
-CONFIG_HOTPLUG_PCI_IBM=y
-CONFIG_HOTPLUG_PCI_ACPI=y
-CONFIG_HOTPLUG_PCI_ACPI_IBM=y
-CONFIG_HOTPLUG_PCI_CPCI=y
-CONFIG_HOTPLUG_PCI_CPCI_ZT5550=y
-CONFIG_HOTPLUG_PCI_CPCI_GENERIC=y
-CONFIG_HOTPLUG_PCI_SHPC=y
----------------------------------
-Video For Linux Two API testing Requirements:
-You need to have a video device (i.e. webcam, tuner card, etc.) connected to your system and available under /dev/video0. If you don't have any hardware device available, you can still test the "Virtual Video Driver". To compile this you need to compile your kernel with CONFIG_VIDEO_VIVI=m under:
-  -> Device Drivers
-    -> Multimedia devices
-      -> Video For Linux
-        -> Video capture adapters
-         -> Virtual Video Driver
-
-The tests also require CUnit Framework to be installed before compiling the tests. Download & Install the same from:
-http://sourceforge.net/projects/cunit/
----------------------------------
----------------------------------
-Native language support (nls) testsuite requirements
-----------------------------------------------------
-CONFIG_NLS=m
-CONFIG_BLOCK=y
----------------------------------
-Enabling Controller area network (CAN) protocol support for your Kernels
----------------------------------
-CONFIG_NET=y
-CONFIG_CAN=m
-CONFIG_CAN_RAW=m
-CONFIG_CAN_BCM=m
-# CAN Device Drivers
-CONFIG_CAN_VCAN=m
----------------------------------
-Enabling Fault Injection Support for your kernel (version 2.6.29).
-Please check with the original kernel for the fault injection
-types it supports. Following supports will be available:
-
-/sys/kernel/debug/fail_io_timeout/interval
-/sys/kernel/debug/fail_io_timeout/probability
-/sys/kernel/debug/fail_io_timeout/reject-end
-/sys/kernel/debug/fail_io_timeout/reject-start
-/sys/kernel/debug/fail_io_timeout/require-end
-/sys/kernel/debug/fail_io_timeout/require-start
-/sys/kernel/debug/fail_io_timeout/space
-/sys/kernel/debug/fail_io_timeout/stacktrace-depth
-/sys/kernel/debug/fail_io_timeout/task-filter
-/sys/kernel/debug/fail_io_timeout/times
-/sys/kernel/debug/fail_io_timeout/verbose
-
-/sys/kernel/debug/fail_make_request/interval
-/sys/kernel/debug/fail_make_request/probability
-/sys/kernel/debug/fail_make_request/reject-end
-/sys/kernel/debug/fail_make_request/reject-start
-/sys/kernel/debug/fail_make_request/require-end
-/sys/kernel/debug/fail_make_request/require-start
-/sys/kernel/debug/fail_make_request/space
-/sys/kernel/debug/fail_make_request/stacktrace-depth
-/sys/kernel/debug/fail_make_request/task-filter
-/sys/kernel/debug/fail_make_request/times
-/sys/kernel/debug/fail_make_request/verbose
-
-/sys/kernel/debug/fail_page_alloc/ignore-gfp-highmem
-/sys/kernel/debug/fail_page_alloc/ignore-gfp-wait
-/sys/kernel/debug/fail_page_alloc/interval
-/sys/kernel/debug/fail_page_alloc/min-order
-/sys/kernel/debug/fail_page_alloc/probability
-/sys/kernel/debug/fail_page_alloc/reject-end
-/sys/kernel/debug/fail_page_alloc/reject-start
-/sys/kernel/debug/fail_page_alloc/require-end
-/sys/kernel/debug/fail_page_alloc/require-start
-/sys/kernel/debug/fail_page_alloc/space
-/sys/kernel/debug/fail_page_alloc/stacktrace-depth
-/sys/kernel/debug/fail_page_alloc/task-filter
-/sys/kernel/debug/fail_page_alloc/times
-/sys/kernel/debug/fail_page_alloc/verbose
-
-/sys/kernel/debug/failslab/ignore-gfp-wait
-/sys/kernel/debug/failslab/interval
-/sys/kernel/debug/failslab/probability
-/sys/kernel/debug/failslab/reject-end
-/sys/kernel/debug/failslab/reject-start
-/sys/kernel/debug/failslab/require-end
-/sys/kernel/debug/failslab/require-start
-/sys/kernel/debug/failslab/space
-/sys/kernel/debug/failslab/stacktrace-depth
-/sys/kernel/debug/failslab/task-filter
-/sys/kernel/debug/failslab/times
-/sys/kernel/debug/failslab/verbose
-
-when the below kernel config options are set:
-
-CONFIG_FAULT_INJECTION=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_FAILSLAB=y (Fault-injection capability for kmalloc)
-(CONFIG_SLAB=y || CONFIG_SLUB=y) if CONFIG_FAILSLAB=y
-CONFIG_FAIL_PAGE_ALLOC=y (Fault-injection capabilitiy for alloc_pages())
-CONFIG_FAIL_MAKE_REQUEST=y (Fault-injection capability for disk IO)
-CONFIG_BLOCK=y if CONFIG_FAIL_MAKE_REQUEST=y
-CONFIG_FAIL_IO_TIMEOUT=y (Faul-injection capability for faking disk interrupts)
-CONFIG_BLOCK=y if CONFIG_FAIL_IO_TIMEOUT=y
-CONFIG_FAULT_INJECTION_DEBUG_FS=y (Debugfs entries for fault-injection capabilities)
-(CONFIG_SYSFS=y && CONFIG_DEBUG_FS=y) if CONFIG_FAULT_INJECTION_DEBUG_FS=y
-CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y (stacktrace filter for fault-injection capabilities)
-(CONFIG_FAULT_INJECTION_DEBUG_FS=y && CONFIG_STACKTRACE_SUPPORT=y && !CONFIG_X86_64) if
-	CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
-
-For more information on Fault injection, please refer to:
-linux-2.6/Documentation/fault-injection/fault-injection.txt,
-
-You should also have made the following entries in your /etc/fstab file
-once the kernel is booted with the above CONFIG options set:
-
-debugfs		/sys/kernel/debug/		debugfs
-
-# How the Kernel Fault Injection works for LTP ?
-
-1) Build Kernel with all the above possible kernel CONFIG Options,
-2) Create the above entry in /etc/fstab file,
-3) Reboot in the new kernel,
-4) Goto LTPROOT. Build and Install LTP as per ltp/INSTALL file,
-5) Choose your own test(or default) to run with fault injection as follows:
-	./runltp -f <command_file> -F <LOOPS>,<FAULT_PROBABILITY>
-
-The algorithm functions like:
-loop (for each testcase)
-begin
-	execute_testcase(inside_stable_kernel)
-	begin
-		insert_fault_into_kernel()
-		loop X Times
-		begin
-			execute_testcase(inside_fault_kernel)
-		end
-		restore_kernel_to_normal()
-	end
-end
-
-# External TODOs:
-1) Add or modify testcases when relevant kernel functionality changes.
----------------------------------
-
----------------------------------
-Enabling Kernel Configuration to test ext4 new features
----------------------------------
-CONFIG_EXT4_FS=y
-CONFIG_EXT4DEV_COMPAT=y
-CONFIG_EXT4_FS_XATTR=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-
-Beside that, the following packages are necessary.
-  e2fsprogs
-  e2fsprogs-devel
-  e2fsprogs-libs
-And the version of packages must be 1.41.4 or above.
-
-For more information to build/install/run these tests, look through:
-ltp/testcases/kernel/fs/ext4-new-features/README
----------------------------------
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
