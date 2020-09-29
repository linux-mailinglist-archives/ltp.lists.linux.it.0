Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B2D27D1CC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 16:50:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAFAF3C2A9F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 16:50:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0BDDF3C04C3
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 16:50:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BBE641A00E72
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 16:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601391048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3OkE3uzAcdJp8Pq3MD0xbqqvKguxk8vIaFCvAY+VE+M=;
 b=EMhVRMzsaT4xcRPU6R0gER41VUnTJMjvPJERCF1w6NL2JeumTeTqqhWmcPka9pJnYwBJan
 0fyf+n5dDXsUNrig1HkOzltXKG+nSZDIDXt2RLbLbqQC5/kc6+C+FF6v4Tlilnk5mINq8c
 Gh/xVsvZlnHd5jXAiCM7o87N6GvEQR8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C91CAD0F;
 Tue, 29 Sep 2020 14:50:48 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 15:50:41 +0100
Message-Id: <20200929145041.29948-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] io_submit01: Handle missing AIO support
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
Cc: pvorel@suse.com, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/io_submit/io_submit01.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/io_submit/io_submit01.c b/testcases/kernel/syscalls/io_submit/io_submit01.c
index afa077c59..bbbbc9101 100644
--- a/testcases/kernel/syscalls/io_submit/io_submit01.c
+++ b/testcases/kernel/syscalls/io_submit/io_submit01.c
@@ -66,11 +66,11 @@ static struct tcase {
 
 static void setup(void)
 {
-	int rval;
-
-	rval = io_setup(1, &ctx);
-	if (rval)
-		tst_brk(TBROK | TERRNO, "io_setup() returned %d", rval);
+	TEST(io_setup(1, &ctx));
+	if (TST_RET == -ENOSYS)
+		tst_brk(TCONF | TRERRNO, "io_setup(): AIO not supported by kernel");
+	else if (TST_RET)
+		tst_brk(TBROK | TRERRNO, "io_setup() failed");
 
 	io_prep_pread(&inv_fd_iocb, -1, buf, sizeof(buf), 0);
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
