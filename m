Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372053A0E65
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:03:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A12103C4D92
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:03:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF3F73C2616
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:03:20 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6C898140115E
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:03:19 +0200 (CEST)
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lqtBG-0003rY-7T
 for ltp@lists.linux.it; Wed, 09 Jun 2021 08:03:18 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so10325165wre.9
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 01:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qXOAu50GEX/PA1j0RcFdwzuFyjDrIGyvXC+N0WfL5Vk=;
 b=JzJx3hkzxJnWqfpGGzCLfAkUfaokTfpF9P8RSFdf/H7O1uoe7FvLTMa93nMxlYat9E
 j7HpuHwAlxa2gzt9ZZER/XeOiPYsKntQN+AnEOCU2Pb+VtZb5ayFAJQFSyQuvWvDeCIO
 c5SSmz5mOY758nPb7Uxtp7SDWMzpIOPQV6ocsl55Bf1+AEC1niYa9IhN1oYuTi2erLOG
 h0ywaaX+/zB+lzfxND3zgenq77IRO4u2ESvua8hnwhdfw9nEaczmu7oQMBH/D7lsQURY
 2XlhFsYzd4vd98R8tkpJyugGtPc2ZT0VfIu0YoKxbW0jE5XzAUzWP97/K7brXzut9vLJ
 EaTw==
X-Gm-Message-State: AOAM530+PQOI+Txc1o1Ohz5ax7U2HrMwLbRu5sfHLG4DbRnoCG5Zx0kx
 Wj7tI0eovHUnZmh60WTI9p4U+d4rN4e1NjXD9qlCQNsf1cnmVNFp/UE0MNdi1zeEzO6SyZM3yPA
 9szeSg2rhJXTy0Sgab+uHHMGHNaGz
X-Received: by 2002:a7b:c110:: with SMTP id w16mr26564113wmi.4.1623225797689; 
 Wed, 09 Jun 2021 01:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHM3ORXcggm0Re30N3ChySs5K1nRVknpv5x908FX7uC4E0+Ro6eZlVnPsgOeGM91w6gE5uGQ==
X-Received: by 2002:a7b:c110:: with SMTP id w16mr26564087wmi.4.1623225797485; 
 Wed, 09 Jun 2021 01:03:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id k5sm24316653wrv.85.2021.06.09.01.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 01:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 10:03:13 +0200
Message-Id: <20210609080313.15359-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] hotplug/cpu_hotplug: skip unsupported Microsoft
 Hyper-V
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

Detect the Hyper-V with systemd and if it succeeds, skip the test.
This of course does not support all possible cases, e.g. running tests
under Hyper-V without systemd will still fail, but it's a easy way to
avoid test failure in common configuration.

Ideally the newly introduced tst_virt_hyperv should be added to
testcases/lib but first the CPU hotplug tests would have to be converted
to newlib.

[1] https://bugs.launchpad.net/ubuntu/+source/linux-azure/+bug/1776293

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../cpu_hotplug/functional/cpuhotplug01.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug02.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug03.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug04.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug05.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug06.sh        |  4 ++++
 .../cpu_hotplug/functional/cpuhotplug07.sh        |  4 ++++
 .../cpu_hotplug/include/cpuhotplug_testsuite.sh   | 15 +++++++++++++++
 8 files changed, 43 insertions(+)

diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
index 1ba937cc763b..1dc26e9d484f 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
@@ -111,6 +111,10 @@ LOOP_COUNT=1
 
 tst_require_cmds perl
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
index 792f8cd730a6..8b57b4f4039f 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
@@ -54,6 +54,10 @@ done
 
 LOOP_COUNT=1
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
index 9ea49f0e1646..bd2221d46c7f 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
@@ -63,6 +63,10 @@ done
 
 LOOP_COUNT=1
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 cpus_num=$(get_present_cpus_num)
 if [ $cpus_num -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
index fa4e247f96b2..ca8a94496bb3 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug04.sh
@@ -48,6 +48,10 @@ done
 
 LOOP_COUNT=1
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 cpus_num=$(get_present_cpus_num)
 if [ $cpus_num -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
index 95a8f4a2dd83..95ff413dc3a5 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
@@ -61,6 +61,10 @@ LOOP_COUNT=1
 
 tst_require_cmds sar
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
index 2a62225c76dd..074fb15dd5a7 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug06.sh
@@ -49,6 +49,10 @@ done
 
 LOOP_COUNT=1
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 if top -v | grep -q htop; then
 	tst_brkm TCONF "htop is used instead of top (workaround: alias top='/path/to/real/top')"
 fi
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
index 2783046189fa..b07d4dc0c073 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
@@ -55,6 +55,10 @@ done
 
 LOOP_COUNT=1
 
+if tst_virt_hyperv ; then
+	tst_brkm TCONF "Microsoft Hyper-V detected, no support for CPU hotplug"
+fi
+
 if [ $(get_present_cpus_num) -lt 2 ]; then
 	tst_brkm TCONF "system doesn't have required CPU hotplug support"
 fi
diff --git a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
index 7dd0ebaae069..291dc5ab2b7e 100644
--- a/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/include/cpuhotplug_testsuite.sh
@@ -50,6 +50,21 @@ assert ()                 #  If condition false,
   fi
 }
 
+# Detect whether running under hypervisor: Microsoft Hyper-V
+# Return 0: running under Hyper-V
+# Return 1: not running under Hyper-V (bare metal, other hypervisor or
+#           failure of detection)
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
 ############################################################
 ## Process management                                     ##
 ############################################################
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
