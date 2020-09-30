Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A727EB5B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E07413C4C0B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 16:50:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 36B283C12A0
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CA8901000A27
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 16:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601477427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ciqkwu3aCaQoBTIBZInvhumH/9p3Bon7+dd2Wwmwlyg=;
 b=Ayg8gFWP0K7WW3luR6pVZ2KGsMflP4FZfr6rBhcM/nVYj43DCYn5hiR+Cgf7NKT4cp+zDb
 nBao1g4yH4qyQRzM3WblMF18ybJlaBFqwBoz5iCRv6w0poBNCyPnQYdsZXW2/DybQ5puH0
 kLp7ABAC8u4BNv8ZuI0xXtJokmOiqfE=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FD10AB92;
 Wed, 30 Sep 2020 14:50:27 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 15:50:07 +0100
Message-Id: <20200930145009.16260-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] io_setup01: Handle no AIO support in kernel
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

Here are 3 more tests modified to check for ENOSYS. There are other
tests which still don't check, but they appear to be only listed under
the AIO runtest files.

 testcases/kernel/syscalls/io_setup/io_setup01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/io_setup/io_setup01.c b/testcases/kernel/syscalls/io_setup/io_setup01.c
index 4693f8fbb..28aee7831 100644
--- a/testcases/kernel/syscalls/io_setup/io_setup01.c
+++ b/testcases/kernel/syscalls/io_setup/io_setup01.c
@@ -53,6 +53,8 @@ static void verify_success(unsigned int nr, io_context_t *ctx, int init_val)
 	memset(ctx, init_val, sizeof(*ctx));
 
 	TEST(io_setup(nr, ctx));
+	if (TST_RET == -ENOSYS)
+		tst_brk(TCONF | TRERRNO, "io_setup(): AIO not supported by kernel");
 	if (TST_RET != 0) {
 		tst_res(TFAIL, "io_setup() failed unexpectedly with %li (%s)",
 			TST_RET, tst_strerrno(-TST_RET));
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
