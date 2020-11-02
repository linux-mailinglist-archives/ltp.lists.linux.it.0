Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8BA2A232C
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 03:49:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 349593C2888
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 03:49:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5CD0B3C25AA
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 03:49:55 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0D4E2600487
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 03:49:54 +0100 (CET)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kZPus-0003z3-2t
 for ltp@lists.linux.it; Mon, 02 Nov 2020 02:49:54 +0000
Received: by mail-pf1-f200.google.com with SMTP id m64so8838068pfm.0
 for <ltp@lists.linux.it>; Sun, 01 Nov 2020 18:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=c4dHjkRa8NtPHyHRubymCcPHVTU+HCw6v0mgekpCAHw=;
 b=NFcnE3tfn+ValsRGnq0qfm57OXk7Rwx+EJm6tXZcp+8u/oqHcI9Yn21g2Sr8HQkYCH
 qYbh9pMXZVK6iw87IJ77W71o8Q5Ao/cGx1TW3cMThgoUNDpDKlCLAPNngJahlXtLvfas
 QLWt9Y6jioIoHInBdKVbnBCWeomdb7YzwiXNTn7j2bA/7PFWaTrwqEBzwEn88/iOhroW
 cbwOyQsIhXB26PL0LX7CZtchKqLlJE5lfoRIalaTP6pzoXsdfnk1uhfucawjsnQfkTMk
 EuQbPmHqS5mppmmS0QXCc9bHxnmQQikwNIcV2m3JKee3jtK3D63B65TmudkCCJ9a7Lei
 lrqw==
X-Gm-Message-State: AOAM533zT5kdDDu+DyXiOp54/nyjfUzaljREKR890WuR4BFIE4C0PKQs
 78jCTom1UtbXQKMZfULL2LW9bAL7xLYw4v/IbzugpeTrzyEs3Fs/SnMgRg2nQHPbbLe+Fyl9gj7
 +Pt34I/HFwuFVQWHSOgn6VnUIRvM=
X-Received: by 2002:a62:7c09:0:b029:152:60c9:43b2 with SMTP id
 x9-20020a627c090000b029015260c943b2mr19588719pfc.79.1604285392175; 
 Sun, 01 Nov 2020 18:49:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcI0VAFMRXdOF8TV9SMDkWNTle5ecrC9kLbnfiZTzBD0cGiZB52nYasUGsq9zBfslX0EXLJA==
X-Received: by 2002:a62:7c09:0:b029:152:60c9:43b2 with SMTP id
 x9-20020a627c090000b029015260c943b2mr19588704pfc.79.1604285391721; 
 Sun, 01 Nov 2020 18:49:51 -0800 (PST)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id j11sm11860001pfh.143.2020.11.01.18.49.50
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 18:49:51 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Mon,  2 Nov 2020 10:49:45 +0800
Message-Id: <20201102024945.6605-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCHv2] syscalls/statx05: add mkfs.ext4 package version
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
index 77684e1ed..d7ac24418 100644
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
+	f = SAFE_POPEN("mkfs.ext4 -V 2>&1", "r");
+	rc = fscanf(f, "mke2fs %d.%d.%d", &major, &minor, &patch);
+	if (rc != 3)
+		tst_res(TWARN, "Unable parse version number");
+	else if (major * 10000 + minor * 100 + patch < 14300)
+		tst_brk(TCONF, "Test needs mkfs.ext4 >= 1.43 for encrypt option, test skipped");
+	pclose(f);
 
 	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
