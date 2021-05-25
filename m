Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53D3904CC
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 17:13:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 980CD3C58BB
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 17:13:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B16873C1E14
 for <ltp@lists.linux.it>; Tue, 25 May 2021 17:13:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CE713600C7D
 for <ltp@lists.linux.it>; Tue, 25 May 2021 17:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621955590;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrFNGvfxYI/7vcsw+axg+h7yiwb/gQAobOrWeDx2tbs=;
 b=vNtaJGvxrD9CgISXuNbXzlRW56gdxqrZXgzAKdNgtaWv9C24FrdfAAmPhx918tqBJAGSDb
 ZzLqzobyE7fp4jHc6MOOHG6VWg2mvJjmOaPdruqldPbdb6ybVDIF9qmaUa/lFQciKxK5A2
 FDJtLQiYAL6LcUeXqgP5OCdKKM8iA8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621955590;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrFNGvfxYI/7vcsw+axg+h7yiwb/gQAobOrWeDx2tbs=;
 b=9FnY9PmdFsuxmGNVTMNezbctxzJ77rviKjQiDdcagmemTJ2f656AYv+6D0YLzIbvMhaNTF
 yNiLPmWm6h/KsJBA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16E87AB71;
 Tue, 25 May 2021 15:13:10 +0000 (UTC)
Date: Tue, 25 May 2021 17:13:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>, ltp@lists.linux.it
Message-ID: <YK0UA1wzaROqJDD7@pevik>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com>
 <YKbbCLUlaICqSIK5@pevik>
 <88d2297a-58f1-2ee3-0db4-6686ffbf4de2@huawei.com>
 <YKeXHtPOexQr8Iic@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKeXHtPOexQr8Iic@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,
> Hi Ziyao,

> > > > +++ b/testcases/kernel/syscalls/sendfile/sendfile09.c
> > > ...
> > > > + * Copyright (c) International Business Machines  Corp., 2014
> > > Again, missing copyright.
> > I wonder if I should add copyright without changing the code logic.
> IMHO yes. You significantly changed the code. At least we do that.

> ...
> > > > -static void cleanup(void);
> > > > -static void setup(void);
> > > > +#ifndef OFF_T
> > > > +#define OFF_T off_t
> > > > +#endif
> > > I wonder where OFF_T comes from and if we can just simply use off_t.
> > Not sure about this.
> @metan any idea?

> It looks like nothing needs it:
> https://travis-ci.org/github/pevik/ltp/builds/771843061

I see it must stay, it's for non- "_64" versions, which have it defined in
Makefile.

Merged with changes below. Thanks!

BTW I wonder if test could be run with less than 5GB, which is quite a lot.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/sendfile/sendfile08.c testcases/kernel/syscalls/sendfile/sendfile08.c
index ddb8f1dd2..48a971bfb 100644
--- testcases/kernel/syscalls/sendfile/sendfile08.c
+++ testcases/kernel/syscalls/sendfile/sendfile08.c
@@ -14,11 +14,7 @@
  */
 
 #include <stdio.h>
-#include <fcntl.h>
 #include <string.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include <sys/sendfile.h>
 
 #include "tst_test.h"
@@ -40,15 +36,17 @@ static void run(void)
 		tst_brk(TBROK | TTERRNO, "sendfile() failed");
 
 	char buf[BUFSIZ];
+
 	SAFE_LSEEK(out_fd, 0, SEEK_SET);
 	SAFE_READ(0, out_fd, buf, BUFSIZ);
 
-	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL)))
-		tst_res(TPASS, "sendfile(2) copies data correctly");
-	else
-		tst_res(TFAIL, "sendfile(2) copies data incorrectly. "
-			       "Expect \"%s%s\", got \"%s\"",
-			TEST_MSG_OUT, TEST_MSG_IN, buf);
+	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL))) {
+		tst_res(TPASS, "sendfile() copies data correctly");
+		return;
+	}
+
+	tst_res(TFAIL, "sendfile() copies data incorrectly: '%s' expected: '%s%s'",
+			buf, TEST_MSG_OUT, TEST_MSG_IN);
 }
 
 static void setup(void)
diff --git testcases/kernel/syscalls/sendfile/sendfile09.c testcases/kernel/syscalls/sendfile/sendfile09.c
index 667e314bb..297b3e212 100644
--- testcases/kernel/syscalls/sendfile/sendfile09.c
+++ testcases/kernel/syscalls/sendfile/sendfile09.c
@@ -7,23 +7,19 @@
  * [Description]
  *
  * Testcase copied from sendfile02.c to test the basic functionality of
- * the sendfile(2) system call on large file. There is a kernel bug which
+ * the sendfile() system call on large file. There is a kernel bug which
  * introduced by commit 8f9c0119d7ba9 and fixed by commit 5d73320a96fcc.
  *
  * Only supports 64bit systems.
  *
  * [Algorithm]
  *
- * 1. Call sendfile(2) with offset at 0;
- * 2. Call sendfile(2) with offset at 3GB.
+ * 1. Call sendfile() with offset at 0.
+ * 2. Call sendfile() with offset at 3GB.
  */
 
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/sendfile.h>
-#include <sys/types.h>
-#include <unistd.h>
 #include <inttypes.h>
+#include <sys/sendfile.h>
 
 #include "tst_test.h"
 #include "lapi/abisize.h"
@@ -51,11 +47,13 @@ static struct test_case_t {
 
 static void setup(void)
 {
+	int i, fd;
+
 	if (!tst_fs_has_free(".", 5, TST_GB))
 		tst_brk(TCONF, "Test on large file needs 5G free space");
 
-	int fd = SAFE_CREAT(IN_FILE, 00700);
-	for (int i = 1; i <= (4 * 1024); ++i) {
+	fd = SAFE_CREAT(IN_FILE, 00700);
+	for (i = 1; i <= (4 * 1024); ++i) {
 		SAFE_LSEEK(fd, 1024 * 1024 - 1, SEEK_CUR);
 		SAFE_WRITE(1, fd, "C", 1);
 	}
@@ -71,27 +69,27 @@ static void run(unsigned int i)
 	int out_fd = SAFE_OPEN(OUT_FILE, O_WRONLY);
 	OFF_T offset = tc[i].offset;
 
-	off_t before_pos, after_pos;
+	OFF_T before_pos, after_pos;
 	before_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
 
 	TEST(sendfile(out_fd, in_fd, &offset, tc[i].count));
 	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
 
 	if (TST_RET != tc[i].exp_retval)
-		tst_res(TFAIL, "sendfile(2) failed to return expected value, "
+		tst_res(TFAIL, "sendfile() failed to return expected value, "
 			       "expected: %" PRId64 ", got: %ld",
 			tc[i].exp_retval, TST_RET);
 	else if (offset != tc[i].exp_updated_offset)
-		tst_res(TFAIL, "sendfile(2) failed to update OFFSET parameter to "
+		tst_res(TFAIL, "sendfile() failed to update OFFSET parameter to "
 			       "expected value, expected: %" PRId64 ", got: %" PRId64,
 			tc[i].exp_updated_offset, (int64_t)(offset));
 	else if (before_pos != after_pos)
-		tst_res(TFAIL, "sendfile(2) updated the file position of in_fd "
+		tst_res(TFAIL, "sendfile() updated the file position of in_fd "
 			       "unexpectedly, expected file position: %" PRId64
 			       ", actual file position %" PRId64,
 			(int64_t)(before_pos), (int64_t)(after_pos));
 	else
-		tst_res(TPASS, "sendfile(2) with %s", tc[i].desc);
+		tst_res(TPASS, "sendfile() with %s", tc[i].desc);
 
 	SAFE_CLOSE(in_fd);
 	SAFE_CLOSE(out_fd);
@@ -104,7 +102,6 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tc),
 	.min_kver = "2.6.33",
 	.tags = (const struct tst_tag[]) {
-		{"linux-git", "8f9c0119d7ba9"},
 		{"linux-git", "5d73320a96fcc"},
 		{}
 	}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
