Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2923644289
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 12:53:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7702C3CC17D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 12:53:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A0B263CC168
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 12:53:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4AE38200FC0
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 12:53:44 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 42A8F1FDB0;
 Tue,  6 Dec 2022 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1670327623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lMevgDoIdOR9b6W8jr+i2ul6Ifg8BdzyXWQuFr6QAWw=;
 b=CV4xWU3cvRaTxPivuf1+dNCAwy42EB25ZIixmLmWPMukI+l+bc4I02MYFu+VSwlmhuVmL+
 0duo/VzbUMs9eP94yrSgZgd6sx1iThQKODwClkGCkin3q+id0OFL2qBTr9Jrwr6DID3nqw
 tsLIsyK3/wuwLKmdzWShQ5vXSRpu6oY=
Received: from g78.cable.virginm.net (unknown [10.163.17.14])
 by relay2.suse.de (Postfix) with ESMTP id DC2012C141;
 Tue,  6 Dec 2022 11:53:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  6 Dec 2022 11:53:29 +0000
Message-Id: <20221206115329.17760-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206115329.17760-1-rpalethorpe@suse.com>
References: <20221206115329.17760-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] fill_fs: Ensure written data is not easily
 compressed
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If the stack is auto initialized to zero, then we will write all
zeros. Some FS may treat this as a special case and just record the
number of zero bytes or sectors.

This could alter the test behaviour in unpredictable ways. For example
a large number of (slow) syscalls may be required to fill up the
drive, extending the required test time. Or we could overflow the file
size/offset causing EFBIG.

So this writes random data to the buffer if it is zero.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_fill_fs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/tst_fill_fs.c b/lib/tst_fill_fs.c
index 121dd2f20..ade0a52ba 100644
--- a/lib/tst_fill_fs.c
+++ b/lib/tst_fill_fs.c
@@ -16,13 +16,20 @@ void tst_fill_fs(const char *path, int verbose)
 {
 	int i = 0;
 	char file[PATH_MAX];
-	char buf[4096];
+	static char buf[4096];
 	size_t len;
 	ssize_t ret;
 	int fd;
 	struct statvfs fi;
+
 	statvfs(path, &fi);
 
+	if (!(buf[0] || buf[4095])) {
+		fd = SAFE_OPEN("/dev/urandom", O_RDONLY);
+		SAFE_READ(0, fd, buf, 4096);
+		SAFE_CLOSE(fd);
+	}
+
 	for (;;) {
 		len = random() % (1024 * 102400);
 
-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
