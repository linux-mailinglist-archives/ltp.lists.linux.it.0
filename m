Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 759763B0819
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:59:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85C213C9473
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:59:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 18E533C2192
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:59:44 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5A2AB10007C1
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:59:44 +0200 (CEST)
Received: from mail-ej1-f71.google.com ([209.85.218.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvhsN-0008An-At
 for ltp@lists.linux.it; Tue, 22 Jun 2021 14:59:43 +0000
Received: by mail-ej1-f71.google.com with SMTP id
 q14-20020a1709066aceb029049fa6bee56fso2129509ejs.21
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 07:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P42eB/sFy8V3a+UJL+uq+taWti67QY6llBLSyvXEjxk=;
 b=GFm1VTsw5KJDKHenDlJYrHp0d/hLVGsCQDsSmdIPU+i8Y/QGKUxt8NJljZdypNfcc1
 q5xCbO+5dvSB1MhxQhacC4YqL7+tU/oFlF0HaxJdk/EZjGLgRmr4sJp5WDR2ksRB+Llg
 JBwDACuKcNxl+bQm0rn4z7wIQ+47c0YdIs/UmFoKF52QcGDYTvQyF0HjDEt52Hs4Bq3O
 9PToktM3kHU7X4RXSRGXwH/Hd3vEmLY/uMpbzQ6LVhBk3mVRurybQdS33l6sSQ7zsbEv
 Mkagk+AALeLhRrTlhOWyGjhBLAwLvBXSivg2AQ10lVz0P/Yc+lnnH9zGIs1r2w8snDU9
 XWyw==
X-Gm-Message-State: AOAM5328hPOLBc8DK8OE4XBEqEs4WpMtXDdNUmtZC9cKLlqjxDP7926d
 Hdmi2HJL9lJfGpMzNIQYqm1zWis5HaVitlyDjCdIB6q6Y0tJinWwOZHj4wU9x3sfRBloVso8ahc
 tDhGtUI6yiDqx/BhxcZxDn781kpcJ
X-Received: by 2002:a50:ed8e:: with SMTP id h14mr5722313edr.272.1624373982850; 
 Tue, 22 Jun 2021 07:59:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz0bYtu58MC2+K5qEKJA27CE1McWiqLb2V4FHLSbiN2Wo0uLBDoEt8ZAWZrSEL+BHNOBPMhg==
X-Received: by 2002:a50:ed8e:: with SMTP id h14mr5722294edr.272.1624373982678; 
 Tue, 22 Jun 2021 07:59:42 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n10sm10174455edw.70.2021.06.22.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 07:59:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 16:59:38 +0200
Message-Id: <20210622145938.106477-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/cpuset_hotplug: skip unsupported
 Microsoft Hyper-V
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

Microsoft Hyper-V with Linux guests does not support CPU hotplug, even
if enabled in kernel configuration.  Quoting Ubuntu bug report from
June 2018: "While Hyper-V may present all potential CPUs via ACPI MADT,
CPU add/remove is not supported.". [1]

The test fails on Azure clouds with:

    cpuset_hotplug 1 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 1 TFAIL:  CPU#1 failed.
    cpuset_hotplug 3 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 3 TFAIL: setup test environment(offline CPU#1) failed
    cpuset_hotplug 5 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 5 TFAIL:  CPU#1 failed.
    cpuset_hotplug 7 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 7 TFAIL:  CPU#1 failed.
    cpuset_hotplug 9 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 9 TFAIL:  CPU#1 failed.
    cpuset_hotplug 11 TINFO: /bin/echo: write error: Device or resource busy
    cpuset_hotplug 11 TFAIL: setup test environment(offline CPU#1) failed

Detect the Hyper-V with systemd and if it succeeds, skip the test.
This of course does not support all possible cases, e.g. running tests
under Hyper-V without systemd will still fail, but it's a easy way to
avoid test failure in common configuration.

Ideally the newly introduced tst_virt_hyperv should be added to
testcases/lib but first the tests would have to be converted to newlib.

[1] https://bugs.launchpad.net/ubuntu/+source/linux-azure/+bug/1776293

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../kernel/controllers/cpuset/cpuset_funcs.sh | 25 +++++++++++++++++++
 .../include/cpuhotplug_testsuite.sh           |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index f3ba1d5ca931..397784a3f2ac 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -63,6 +63,23 @@ HOTPLUG_CPU="1"
 SCHED_LB="/dev/cpuset/cpuset.sched_load_balance"
 SCHED_LB_VALUE="0"
 
+# Detect whether running under hypervisor: Microsoft Hyper-V
+# Return 0: running under Hyper-V
+# Return 1: not running under Hyper-V (bare metal, other hypervisor or
+#           failure of detection)
+# TODO: move to newlib and remove duplication with:
+#       testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
+tst_virt_hyperv()
+{
+	local v="$(systemd-detect-virt)"
+	# TODO: once converted to newlib, use tst_cmd_available
+
+	[ $? -eq 0 ] || return 1
+	[ "$v" = "microsoft" ] || return 1
+
+	return 0
+}
+
 cpuset_log()
 {
 	tst_resm TINFO "$*"
@@ -134,6 +151,13 @@ cpuset_check()
 	tst_brkm TCONF "Cpuset is not supported"
 }
 
+machine_check()
+{
+	if tst_virt_hyperv; then
+		tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+	fi
+}
+
 # optional parameters (pass both or none of them):
 # $1 - required number of cpus (default 2)
 # $2 - required number of memory nodes (default 2)
@@ -149,6 +173,7 @@ check()
 
 	nnodes_check ${2:-2}
 
+	machine_check
 }
 
 # Create /dev/cpuset & mount the cgroup file system with cpuset
diff --git a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
index 291dc5ab2b7e..561b7cf85370 100644
--- a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
@@ -54,6 +54,8 @@ assert ()                 #  If condition false,
 # Return 0: running under Hyper-V
 # Return 1: not running under Hyper-V (bare metal, other hypervisor or
 #           failure of detection)
+# TODO: move to newlib and remove duplication with:
+#       testcases/kernel/controllers/cpuset/cpuset_funcs.sh
 tst_virt_hyperv()
 {
 	local v="$(systemd-detect-virt)"
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
