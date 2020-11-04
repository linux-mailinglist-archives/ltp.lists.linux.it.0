Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6B32A5D49
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 05:16:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D639C3C5469
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 05:16:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 742923C3019
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 05:16:19 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AA777600824
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 05:16:18 +0100 (CET)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kaADZ-0006PU-Ct
 for ltp@lists.linux.it; Wed, 04 Nov 2020 04:16:17 +0000
Received: by mail-pf1-f198.google.com with SMTP id b139so13855727pfb.2
 for <ltp@lists.linux.it>; Tue, 03 Nov 2020 20:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=aU8FM4QHsAVCKdXhYtkcQIN9eAnn9f857mZRO6fjiHM=;
 b=o7tDR4Fh13yMzwCPug8Gvofs6VoxH4YJ4dIanrmPb1AJm9m1sOQRMCC+Q8fjPdW519
 GauB9R5FhQNoHXYXGnJHTzxCZRCQCN0KBvsIKs1NvLV2CL8p9wsSgGHYVLZyABp4yfs/
 g6Ny0MCE+Ks9aBc77Rdz3etCfmLVLaQrb/TBDoZLw46bV7YIjJrnUMnjW2mbvGRHmWsD
 9u7vAhAGGRasQ1Bq6nfu7elU3NmqYzhcDLwyAhiC4Ib40iSJc98zTC7vkpBNuuNe75yC
 CdA2+cdW8yXDm1uPATn8R8OdLyvpjnGSxT17q/3fJYglgveKO5aZ+iQGjzXPKIixsTiX
 zOvg==
X-Gm-Message-State: AOAM532i0xQOb7/HqZ8flH4bjGivGeZojVFvdw1/MujbqmWbZik9QimK
 Fe6JL6wg2CFavC/wtvg35K3E8ap/SzHa+Or9H8aQQQH+e/Ud25ezRy7lIiroDnfPdbvt68WT5iw
 U7PTxNmJ3PS3r5vEPvBTmxmTtzik=
X-Received: by 2002:a63:9d4d:: with SMTP id i74mr19405640pgd.182.1604463375512; 
 Tue, 03 Nov 2020 20:16:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzGI1za5rGbJtxBWJ3LvXM+x6xPXqIdOpTlW//efmaeQ+ft/FbV0DHkoUIGT11RA/Nh/PaWg==
X-Received: by 2002:a63:9d4d:: with SMTP id i74mr19405612pgd.182.1604463374831; 
 Tue, 03 Nov 2020 20:16:14 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-38.HINET-IP.hinet.net.
 [61.220.137.38])
 by smtp.gmail.com with ESMTPSA id d4sm630936pjj.45.2020.11.03.20.16.13
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 20:16:14 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  4 Nov 2020 12:15:44 +0800
Message-Id: <20201104041544.17048-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/quotactl04: add mkfs.ext4 package version
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
---
 testcases/kernel/syscalls/quotactl/quotactl04.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index 73980d7e9..1cef8fcf3 100644
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
+		tst_brk(TCONF, "Test needs mkfs.ext4 >= 1.43 for encrypt option, test skipped");
+	pclose(f);
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
 	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
 	mount_flag = 1;
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
