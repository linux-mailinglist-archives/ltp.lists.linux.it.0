Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623E27EB5A
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 059E03C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 394813C297B
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D417B1A002E6
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601477427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6rYgcG4udaWwa/c/n3JgzKGuBde/RREZBYqQs7xy/I=;
 b=ogI+dgNw2BCxnUSsTOAEPKDv6+DHbD43wUvFXMuyoUJVmEL2fnwP6g/jwRP/qHgX6YD8U8
 nu6ahahIgXsckYIDQh4FaTuN1MObdkFqR9G1kVR8czkkXtl8R7X7VKQbkkgBTSDsOVmmy7
 RElEoiKyJjpHttqf4wE9riYYRTJWw8A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61156AB8F;
 Wed, 30 Sep 2020 14:50:27 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 15:50:08 +0100
Message-Id: <20200930145009.16260-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930145009.16260-1-rpalethorpe@suse.com>
References: <20200930145009.16260-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] io_pgetevents{01,02}: Handle no AIO support
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c | 8 +++++---
 testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
index 2a1aad8d9..a0b56d814 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents01.c
@@ -51,9 +51,11 @@ static void run(void)
 	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT, 0644);
 	io_prep_pwrite(&cb, fd, data, 4096, 0);
 
-	ret = io_setup(1, &ctx);
-	if (ret < 0)
-		tst_brk(TBROK | TERRNO, "io_setup() failed");
+	TEST(io_setup(1, &ctx));
+	if (TST_RET == -ENOSYS)
+		tst_brk(TCONF | TRERRNO, "io_setup(): AIO not supported by kernel");
+	if (TST_RET < 0)
+		tst_brk(TBROK | TRERRNO, "io_setup() failed");
 
 	ret = io_submit(ctx, 1, cbs);
 	if (ret != 1)
diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index 28afdb4a0..af71e17fe 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -65,9 +65,11 @@ static void setup(void)
 	fd = SAFE_OPEN("io_pgetevents_file", O_RDWR | O_CREAT, 0644);
 	io_prep_pwrite(&cb, fd, data, 4096, 0);
 
-	ret = io_setup(1, &ctx);
-	if (ret < 0)
-		tst_brk(TBROK | TERRNO, "io_setup() failed");
+	TEST(io_setup(1, &ctx));
+	if (TST_RET == -ENOSYS)
+		tst_brk(TCONF | TRERRNO, "io_setup(): AIO not supported by kernel");
+	if (TST_RET < 0)
+		tst_brk(TBROK | TRERRNO, "io_setup() failed");
 
 	ctx_initialized = 1;
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
