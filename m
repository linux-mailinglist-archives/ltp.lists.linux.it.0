Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E162A5E85
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:04:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F95D3C5434
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 08:04:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 88FBB3C2507
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:04:17 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 111D61401100
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 08:04:16 +0100 (CET)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kaCq8-0002l5-3r
 for ltp@lists.linux.it; Wed, 04 Nov 2020 07:04:16 +0000
Received: by mail-pl1-f200.google.com with SMTP id q19so6844371pls.17
 for <ltp@lists.linux.it>; Tue, 03 Nov 2020 23:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=nbSEZXEynRz9YVHL03XU8Fu+4GcxrT4OC7LDKiMbGhM=;
 b=Z6benTwtfmvjhDq7WY0QckMpl2EBDbEVkNir2swnbf9loJjOUMwAGOn3oN0kv8QRvN
 JulUYWuWMVJS6fgDMtUP9QX/700o+CMk+FcLK2CzRsBmg/OjCQnCdEXLPOfioszfU4bq
 1YHf8y+eDbtU10UqD47pkl5dmsmKNA53wiO4mEK7f07ywB/1/sVxfEPi6VH/YanTE9LG
 MxpygY5R1AhPek9tTOUhdD3dlqdjru+QI6G87WsgH37+WaIjMvXgj/dd4iR6D9lewbOk
 21H+VwE7G/GnnF4WaeIRB9znHoksNLPjJFxABYDeqj6z+WdOlH2OV7XPUiNBcgOuQpmA
 s4Jg==
X-Gm-Message-State: AOAM531Jw0HbHEKI5BPhboNYJy3nF1YuzAL12f6UwXIDhb+WBOCXP0di
 QWH50V+guCaa3KQbby9HdsgqVOCDGy2U6B1VyicZ9Q3Dve7BlAi2Q4XOFVHvhFm3Pxm1MBCZZbe
 RMypijM4evJDheNC4E+Kfc2W92yc=
X-Received: by 2002:a63:b10:: with SMTP id 16mr1167323pgl.309.1604473454211;
 Tue, 03 Nov 2020 23:04:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzimLLHqbqrtMnRHFEaozbVyssCbwm/TbbBHCZd6a80ld21NihsdKr/4E3GdVJlh8v1ArZZ0Q==
X-Received: by 2002:a63:b10:: with SMTP id 16mr1167296pgl.309.1604473453786;
 Tue, 03 Nov 2020 23:04:13 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-38.HINET-IP.hinet.net.
 [61.220.137.38])
 by smtp.gmail.com with ESMTPSA id y8sm844485pfe.33.2020.11.03.23.04.12
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 23:04:13 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  4 Nov 2020 15:04:05 +0800
Message-Id: <20201104070405.24044-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCHv2] syscalls/quotactl04: add mkfs.ext4 package version
 check
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The project quota feature was added in e2fsprogs 1.43 [1]:
  E2fsprogs 1.43 (May 17, 2016)
    Add support for the ext4 metadata checksum, checksum seed, inline
    data, encryption, project quota, and read-only features.

The test should be skipped when running with older package, otherwise
it will fail with:
  Invalid filesystem option set: quota,project

Use popen and fscanf to get mkfs.ext4 -V output for version
comparison. This version checking by adding digits together does not
work with alphabets in the number like rc1, but in that case the test
will still be tested.

It will now be skipped with (Tested with Ubuntu Xenial + 4.15 kernel):
  quotactl04.c:118: TCONF: Test needs mkfs.ext4 >= 1.43 for encrypt
  option, test skipped

[1] http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.42.13

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/quotactl/quotactl04.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index 73980d7e9..3cc2b974f 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -19,6 +19,8 @@
  * 7) quotactl(2) succeeds to get disk quota limit greater than or equal to
  *    ID with Q_GETNEXTQUOTA flag for project.
  * 8) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
+ *
+ * Minimum e2fsprogs version required is 1.43.
  */
 
 #include <errno.h>
@@ -28,6 +30,7 @@
 #include <sys/stat.h>
 #include "config.h"
 #include "lapi/quotactl.h"
+#include "tst_safe_stdio.h"
 #include "tst_test.h"
 
 #ifndef QFMT_VFS_V1
@@ -102,9 +105,18 @@ static struct tcase {
 
 static void setup(void)
 {
+	FILE *f;
 	const char *const fs_opts[] = {"-I 256", "-O quota,project", NULL};
+	int rc, major, minor, patch;
 
 	test_id = geteuid();
+	f = SAFE_POPEN("mkfs.ext4 -V 2>&1", "r");
+	rc = fscanf(f, "mke2fs %d.%d.%d", &major, &minor, &patch);
+	if (rc != 3)
+		tst_res(TWARN, "Unable parse version number");
+	else if (major * 10000 + minor * 100 + patch < 14300)
+		tst_brk(TCONF, "Test needs mkfs.ext4 >= 1.43 for quota,project option, test skipped");
+	pclose(f);
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
 	mount_flag = 1;
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
