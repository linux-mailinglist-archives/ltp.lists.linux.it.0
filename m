Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FE29EDC2
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 15:00:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45F243C3138
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 15:00:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2F7E33C23B8
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 15:00:41 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6BBB9100036A
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 15:00:41 +0100 (CET)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kY8To-0002u8-Fq
 for ltp@lists.linux.it; Thu, 29 Oct 2020 14:00:40 +0000
Received: by mail-pf1-f197.google.com with SMTP id 62so2265598pfv.3
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 07:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z7nEBTBWVrxDjo8cv/1XpmU4QATpZD/amJsOpLCEFLo=;
 b=TYUeeAO+CK8ZRZVP75rFoMeHSXpx7uH0PKRUl2OMR3S/1JBuZlABWTcOoUXhww/oGW
 +EdiShUlMEI16oWH1dosVMpNwFwvMbcxjWfCNqU1gKtboarPwk1MGuSBzlY52ysTz1IA
 09pet5CTAV3/nR9XGXD2tOQ/zrK7YsxwV7bKXQdapYcKuBE/1oLWNrAKqi662Vfjnrd7
 jU+I/6il6Z06dkmorSNXTlEqlWF2s8itCWvU2WeBQjA4x+9YQmPAWXnd/FYTgYG+fCKK
 Cfee1PuDO3KvhmrwRB4oxwjGrmLbr8KR8Me4pWXySCi19do0PB1nkJ3mYhBQ7kWSmC+L
 W5VA==
X-Gm-Message-State: AOAM5310k3l+Jvplp4b4ySoeNATJZooh8wrw8b73Ac/YSSTiCHHi5JeT
 wJebZ9aCJ9zLC0u5TlXSgyY123imIWvo44E8pdTEA10qKqASrvjQzAgGUvblYELwtNS8fqBOvY1
 zyj0Jye39FmdTstmOcN+kDoLJTHM=
X-Received: by 2002:a62:2ce:0:b029:160:77b1:8d60 with SMTP id
 197-20020a6202ce0000b029016077b18d60mr4702054pfc.9.1603980038789; 
 Thu, 29 Oct 2020 07:00:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUKbv/ZkRS4hL9mYT3GNidwvIrYd2kjHkw4AaTdmSEHwCPUbWLmaqaWH2g/2SINd1+vwkLjQ==
X-Received: by 2002:a62:2ce:0:b029:160:77b1:8d60 with SMTP id
 197-20020a6202ce0000b029016077b18d60mr4702016pfc.9.1603980038281; 
 Thu, 29 Oct 2020 07:00:38 -0700 (PDT)
Received: from localhost.localdomain (223-140-218-205.emome-ip.hinet.net.
 [223.140.218.205])
 by smtp.gmail.com with ESMTPSA id q13sm3012445pfg.3.2020.10.29.07.00.36
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 07:00:37 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 29 Oct 2020 22:00:31 +0800
Message-Id: <20201029140031.40968-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/statx05: add mkfs.ext4 package version check
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

The encryption feature was added in e2fsprogs 1.43:
  e2fsprogs (1.43~WIP.2015.05.18-1) unstable; urgency=low
    * Add support for file encryption feature

The test should be skipped when running with older package, otherwise
it will fail with:
  Invalid filesystem option set: encrypt

Use popen and fscanf to get mkfs.ext4 -V output for version
comparison. This version checking by adding digits together does not
work with alphabets in the number like rc1, but in that case the test
will still be tested.

It will now be skipped with (Tested with Ubuntu Xenial + 4.15 kernel):
  statx05.c:102: TCONF: Test needs mkfs.ext4 >= 1.43 for encrypt option, test skipped

Fixes: #542
Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/statx/statx05.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
index 77684e1ed..fef848863 100644
--- a/testcases/kernel/syscalls/statx/statx05.c
+++ b/testcases/kernel/syscalls/statx/statx05.c
@@ -17,6 +17,7 @@
  * Second directory has no flags set.
  *
  * Minimum kernel version required is 4.11.
+ * Minimum e2fsprogs version required is 1.43.
  */
 
 #define _GNU_SOURCE
@@ -24,6 +25,7 @@
 #include <stdio.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include "tst_safe_stdio.h"
 #include "tst_test.h"
 #include "lapi/fs.h"
 #include "lapi/stat.h"
@@ -86,9 +88,18 @@ static void run(unsigned int i)
 
 static void setup(void)
 {
+	FILE *f;
 	char opt_bsize[32];
 	const char *const fs_opts[] = {"-O encrypt", opt_bsize, NULL};
-	int ret;
+	int ret, rc, major, minor, patch;
+
+	f = SAFE_POPEN("mkfs.ext4 -V 2>&1 | awk '/mke2fs/ {print $2}'", "r");
+	rc = fscanf(f, "%d.%d.%d", &major, &minor, &patch);
+	if (rc != 3)
+		tst_res(TWARN, "Unable parse version number");
+	else if (major * 10000 + minor * 100 + patch < 14300)
+		tst_brk(TCONF, "Test needs mkfs.ext4 >= 1.43 for encrypt option, test skipped");
+	pclose(f);
 
 	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
