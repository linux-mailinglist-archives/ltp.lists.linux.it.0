Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDhHOkPvgWlAMwMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 13:51:15 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 84093D95A2
	for <lists+linux-ltp@lfdr.de>; Tue, 03 Feb 2026 13:51:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 467893CD216
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Feb 2026 13:51:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BEB03CCD85
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 13:50:37 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 907AD1400BD2
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 13:50:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D39593E6C1
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770123030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dj4Yx/84FBlGa4K2c1UJcCRYXlMVf18Cw9W7QYW5wH4=;
 b=DlZ3pOeqzgc3BH6ipXOq1WIJDZHfgHNdnsjgw850Q/oc7N9+HkWswmeOQAgLrqWhRvq0KJ
 F48ITL7O2H4Yz+WBfnceYkds4XgfV69qpS9i41o1bAMEcyL+JpCeKHSBDxZn60rgQEh+ez
 ghozOybFalqKbmnK24xW0Yz9KbtAt08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770123030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dj4Yx/84FBlGa4K2c1UJcCRYXlMVf18Cw9W7QYW5wH4=;
 b=WZGbh1B4sI1pYrTD0t+9iqLcLM7CzJ+uphPiz/hUgQM2rF5FMMkgPUkLAMclPpnWkbCOZW
 V/VduwfmC/JggBBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770123029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dj4Yx/84FBlGa4K2c1UJcCRYXlMVf18Cw9W7QYW5wH4=;
 b=fx1qAeTKswpRyZEHkrNis2w8eQxHnWPqWCPde+FkR4Aj+BDJ5cUoQFJOYMkXUUAzfUjnhT
 TvFtkd6TqpzDCcDNkPKQpfz7YULr7NqmdDqHiuSn7fHDnCgcBFUjhKeIjP0fyriOlWOlKd
 w1KBUM1clr4zb6iNAQwuDGhk3ge4Xv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770123029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dj4Yx/84FBlGa4K2c1UJcCRYXlMVf18Cw9W7QYW5wH4=;
 b=wdVeb9Ters2T5JXPFZnaFqM8ZtWJv3kWyfpptzO5q+VFsbI1yj+OTkjbxsdO90rQ0rM5wf
 G+EQohrTiotZsUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF9DF3EA65
 for <ltp@lists.linux.it>; Tue,  3 Feb 2026 12:50:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2OW3KhXvgWkNcgAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 03 Feb 2026 12:50:29 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Feb 2026 13:50:26 +0100
Message-ID: <20260203125029.15413-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203125029.15413-1-mdoucha@suse.cz>
References: <20260203125029.15413-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 3/3] aio_cancel_2-1: Rewrite test
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mdoucha@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:mid,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 84093D95A2
X-Rspamd-Action: no action

The test schedules multiple async writes into a file and then hopes that
at least one will block long enough that it can be canceled
before completion. Use a socket pair instead of a file to force async
writes to block indefinitely and make sure at least one can be canceled.
Then cancel all requests on the input socket and check that all writes
after the blocked one have been canceled. This fixes a race condition
where aio_cancel() could be delayed until after all writes have already
completed, making the test unreliable.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Tested on kernels v4.4 and v6.12.

 .../conformance/interfaces/aio_cancel/2-1.c   | 86 ++++++++++---------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/2-1.c
index 63dc6b0ec..6b5a2137b 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/2-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel/2-1.c
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2004, Bull SA. All rights reserved.
+ * Copyright (c) 2025 SUSE LLC
  * Created by:  Laurent.Vivier@bull.net
  * This file is licensed under the GPL license.  For the full content
  * of this license, see the COPYING file at the top level of this
@@ -14,77 +15,82 @@
  *
  * method:
  *
- *	open a file and queue a write to it with aio_write()
- *	execute aio_cancel() on this file
- *	check aio_cancel() is not -1
+ *	open a pair of sockets and queue writes to them with aio_write()
+ *	execute aio_cancel() on the socket
+ *	check aio_cancel() returns zero or AIO_NOTCANCELED
+ *	check that aio_error() returns ECANCELED for cancelable requests
  *	-> aio_cancel() works on fildes used with an aio command
  *
- *	we have no way to assert we generate "cancelable" AIO and thus to check
- *	if it has been really canceled
+ *	we queue enough writes to ensure that one of them will block
+ *	on full socket buffer and the last one will be cancelable
  *
  */
 
-#include <stdio.h>
 #include <sys/types.h>
 #include <unistd.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <string.h>
-#include <errno.h>
-#include <stdlib.h>
-#include <aio.h>
 #include <time.h>
 
 #include "posixtest.h"
-#include "tempfile.h"
+#include "aio_test.h"
 
 #define TNAME "aio_cancel/2-1.c"
 
+#define WRITE_COUNT	8
+#define BLOCKED_TASK	2
+
+static int fds[2];
+static struct aiocb aiocb[WRITE_COUNT];
+
 int main(void)
 {
-	char tmpfname[PATH_MAX];
-#define BUF_SIZE 1024
-	char buf[BUF_SIZE];
-	int fd, err;
-	struct aiocb aiocb;
+	int i;
+	int ret;
 
 	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
 		return PTS_UNSUPPORTED;
 
-	PTS_GET_TMP_FILENAME(tmpfname, "pts_aio_cancel_2_1");
-	unlink(tmpfname);
-	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
-	if (fd == -1) {
-		printf(TNAME " Error at open(): %s\n", strerror(errno));
+	if (setup_aio(TNAME, fds, aiocb, WRITE_COUNT))
 		return PTS_UNRESOLVED;
-	}
 
-	unlink(tmpfname);
+	/* submit AIO req */
+	for (i = 0; i < WRITE_COUNT; i++) {
+		if (aio_write(&aiocb[i]) == -1) {
+			printf(TNAME " loop %d: Error at aio_write(): %s\n",
+			       i, strerror(errno));
+			cleanup_aio(fds, aiocb, WRITE_COUNT);
+			return PTS_FAIL;
+		}
+	}
 
-	memset(buf, 0xaa, BUF_SIZE);
-	memset(&aiocb, 0, sizeof(struct aiocb));
-	aiocb.aio_fildes = fd;
-	aiocb.aio_buf = buf;
-	aiocb.aio_nbytes = BUF_SIZE;
+	ret = aio_cancel(fds[0], NULL);
 
-	if (aio_write(&aiocb) == -1) {
-		printf(TNAME " Error at aio_write(): %s\n", strerror(errno));
+	if (ret == -1) {
+		printf(TNAME " Error at aio_cancel(): %s\n", strerror(errno));
+		cleanup_aio(fds, aiocb, WRITE_COUNT);
 		return PTS_FAIL;
 	}
 
-	switch (aio_cancel(fd, NULL)) {
-	case -1:
-		printf(TNAME " Error at aio_cancel(): %s\n", strerror(errno));
+	if (ret != 0 && ret != AIO_NOTCANCELED) {
+		printf(TNAME " Unexpected aio_cancel() return value: %d\n",
+			ret);
+		cleanup_aio(fds, aiocb, WRITE_COUNT);
 		return PTS_FAIL;
-	case AIO_NOTCANCELED:
-		do {
-			struct timespec completion_wait_ts = {0, 10000000};
-			nanosleep(&completion_wait_ts, NULL);
-			err = aio_error(&aiocb);
-		} while (err == EINPROGRESS);
 	}
 
-	close(fd);
+	for (i = BLOCKED_TASK + 1; i < WRITE_COUNT; i++) {
+		ret = aio_error(&aiocb[i]);
+
+		if (ret != ECANCELED) {
+			printf(TNAME " AIO request %d was not canceled: %s\n",
+				i, strerror(ret));
+			cleanup_aio(fds, aiocb, WRITE_COUNT);
+			return PTS_FAIL;
+		}
+	}
+
+	cleanup_aio(fds, aiocb, WRITE_COUNT);
 	printf("Test PASSED\n");
 	return PTS_PASS;
 }
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
