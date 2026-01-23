Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKh0O+qfc2muxgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:58 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CDB78652
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FA7E3CB964
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 17:20:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CFD63CB86D
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:19:21 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A8B231A00245
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 17:19:20 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E17733830;
 Fri, 23 Jan 2026 16:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjzbfuX8cTOfpuNPkeCtTLHBHg9lxK38SqAvn0Ci5JY=;
 b=RFDLTkD1bcg0zVBQqS5U4JZsgIJZKiqPtQCGsVap8fUAUc/W8aOtTjnAy9WUI7tyGTmm0A
 YWVWBlmt1/Moz3BG2FkZuzccJb86USIBMIo07GboB53PQV2u9h64Gkmt3XjU5NReLJp7Z6
 DVQCsaEp4Dm3fUPRJOyHN164bAY6Pts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjzbfuX8cTOfpuNPkeCtTLHBHg9lxK38SqAvn0Ci5JY=;
 b=5nIpDVgWY3KYZRa6g4hdEu0ATJPWJXuztqDQwbh/nMonuLipjN8F1vLD+0BI3CtdR6x/sA
 MYWR9bYIWWPYE9Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769185134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjzbfuX8cTOfpuNPkeCtTLHBHg9lxK38SqAvn0Ci5JY=;
 b=RFDLTkD1bcg0zVBQqS5U4JZsgIJZKiqPtQCGsVap8fUAUc/W8aOtTjnAy9WUI7tyGTmm0A
 YWVWBlmt1/Moz3BG2FkZuzccJb86USIBMIo07GboB53PQV2u9h64Gkmt3XjU5NReLJp7Z6
 DVQCsaEp4Dm3fUPRJOyHN164bAY6Pts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769185134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjzbfuX8cTOfpuNPkeCtTLHBHg9lxK38SqAvn0Ci5JY=;
 b=5nIpDVgWY3KYZRa6g4hdEu0ATJPWJXuztqDQwbh/nMonuLipjN8F1vLD+0BI3CtdR6x/sA
 MYWR9bYIWWPYE9Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC54B139ED;
 Fri, 23 Jan 2026 16:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ALYPMG2fc2n1GQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 23 Jan 2026 16:18:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 23 Jan 2026 17:18:56 +0100
MIME-Version: 1.0
Message-Id: <20260123-stream_refactoring-v1-6-281b85f6ab02@suse.com>
References: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
In-Reply-To: <20260123-stream_refactoring-v1-0-281b85f6ab02@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769185132; l=8570;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=16J934S+t0cJXGWpozyP1YW+hPgCqp4RZ3uDqeJDnt0=;
 b=WexXxNxPSJLAk0NDbRrXYe9XfAbvHCK0Vmrb7BXFhDkyzPTu/Nv2l2BTrcaLXow5LWHkr6GCa
 KjBVWc1J/O7DmvH9l/PHFQ0UWLB5d2SMAemRdN71+E1qy4S799c6bW+
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 6/6] fs: rewrite stream05 test using new API
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
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	NEURAL_HAM(-0.00)[-0.363];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.com:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: 93CDB78652
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/fs/stream/stream05.c | 256 ++++++----------------------------
 1 file changed, 44 insertions(+), 212 deletions(-)

diff --git a/testcases/kernel/fs/stream/stream05.c b/testcases/kernel/fs/stream/stream05.c
index f561744c3da86cc5d80b97c9707f5583059d21f0..33262e9afac895e0727581e6c66e3dde7658e427 100644
--- a/testcases/kernel/fs/stream/stream05.c
+++ b/testcases/kernel/fs/stream/stream05.c
@@ -1,230 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *
- *   Copyright (c) International Business Machines  Corp., 2002
- *
- *   This program is free software;  you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- *   the GNU General Public License for more details.
- *
- *   You should have received a copy of the GNU General Public License
- *   along with this program;  if not, write to the Free Software
- *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ * Copyright (c) 2026 Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/* ported from SPIE, section2/filesuite/stream.c, by Airong Zhang */
-
-/*======================================================================
-	=================== TESTPLAN SEGMENT ===================
->KEYS:  < ferror() feof() clearerr() fileno()
->WHAT:  < 1) check that ferror returns zero
-	< 2) check fileno returns valid file descriptor
-	< 3) check that feof returns zero (nonzero) appropriately
-	< 4) check that clearerr resets EOF indicator.
->HOW:   < 1) open a stream and immediately execute ferror
-	< 2) use the file des returned from fileno to read a file
-	<    written with stream - compare actual vs expected.
-	< 3) open stream and ensure feof returns zero, read to end of
-	<    file and ensure feof returns non-zero.
-	< 4) after 3) above use clearerr and then use feof to ensure
-	<    clearerr worked
->BUGS:  <
-======================================================================*/
-
-#include <unistd.h>
-#include <stdio.h>
-#include <errno.h>
-#include "test.h"
+/*\
+ * Verify that it's possible to read/write on a file descriptor returned by
+ * `fileno()` and to close it, leaving `fclose()` to raise EBADF error.
+ */
 
-char *TCID = "stream05";
-int TST_TOTAL = 1;
-int local_flag;
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+#include "tst_rand_data.h"
 
-#define PASSED 1
-#define FAILED 0
+#define FILENAME "ltp_file"
+#define DATASIZE 3
+#define BUFFSIZE (2 * DATASIZE)
 
-char progname[] = "stream05()";
-char tempfile[40] = "";
+static char *data;
+static char *buff;
 
-/*--------------------------------------------------------------------*/
-int main(int ac, char *av[])
+static void run(void)
 {
+	int fd;
 	FILE *stream;
-	char buf[10];
-	int nr, fd;
-
-	int lc;
-
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-	tst_tmpdir();
-	local_flag = PASSED;
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-		local_flag = PASSED;
-
-		sprintf(tempfile, "stream05.%d", getpid());
-	/*--------------------------------------------------------------------*/
-		//block0:
-		if ((stream = fopen(tempfile, "a+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) a+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		fprintf(stream, "a");
-		fclose(stream);
-
-		if ((stream = fopen(tempfile, "r+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) r+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-
-		/* check that ferror returns zero */
-		if (ferror(stream) != 0) {
-			tst_resm(TFAIL, "ferror did not return zero: %s",
-				 strerror(errno));
-			local_flag = FAILED;
-		}
-
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block0.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block0.");
-		}
-
-		local_flag = PASSED;
 
-	/*--------------------------------------------------------------------*/
-		//block1:
+	memset(buff, 0, BUFFSIZE);
 
-		/* check that fileno returns valid file descriptor */
-		fd = fileno(stream);
-		if ((nr = read(fd, buf, 1)) < 0) {
-			tst_brkm(TFAIL, NULL, "read failed: %s",
-				 strerror(errno));
-		}
-		if (nr != 1) {
-			tst_resm(TFAIL, "read did not read right number");
-			local_flag = FAILED;
-		}
-		if (buf[0] != 'a') {
-			tst_resm(TFAIL, "read returned bad values");
-			local_flag = FAILED;
-		}
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block1.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block1.");
-		}
+	stream = SAFE_FOPEN(FILENAME, "a+");
+	SAFE_FWRITE(data, 1, DATASIZE, stream);
 
-		local_flag = PASSED;
-	/*--------------------------------------------------------------------*/
-		//block2:
+	fd = TST_EXP_FD(SAFE_FILENO(stream));
+	SAFE_WRITE(SAFE_WRITE_ALL, fd, data, DATASIZE);
 
-		/* read to EOF and ensure feof returns non-zero */
-		fclose(stream);
+	fsync(fd);
+	SAFE_FSEEK(stream, 0, SEEK_SET);
+	SAFE_READ(1, fd, buff, BUFFSIZE);
 
-		if ((stream = fopen(tempfile, "r+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) r+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		if (feof(stream) != 0) {
-			tst_resm(TFAIL,
-				 "feof returned non-zero when it should not: %s",
-				 strerror(errno));
-			local_flag = FAILED;
-		}
-		fread(buf, 1, 2, stream);	/* read to EOF */
-		if (feof(stream) == 0) {
-			tst_resm(TFAIL,
-				 "feof returned zero when it should not: %s",
-				 strerror(errno));
-			local_flag = FAILED;
-		}
+	TST_EXP_EQ_STRN(data, buff, DATASIZE);
+	TST_EXP_EQ_STRN(data, buff + 3, DATASIZE);
 
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block2.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block2.");
-		}
+	SAFE_CLOSE(fd);
+	TST_EXP_FAIL(fclose(stream), EBADF);
 
-		local_flag = PASSED;
-	/*--------------------------------------------------------------------*/
-		//block3:
-		/* ensure clearerr works */
-		clearerr(stream);
-		if (feof(stream) != 0) {
-			tst_resm(TFAIL, "clearerr failed: %s", strerror(errno));
-			local_flag = FAILED;
-		}
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed in block3.");
-		} else {
-			tst_resm(TFAIL, "Test failed in block3.");
-		}
-
-		local_flag = PASSED;
-	/*--------------------------------------------------------------------*/
-		//block4:
-
-		/* test fopen "b" flags -- should be allowed but ignored */
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "rb")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) rb failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "wb")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) wb failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "ab")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) ab failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "rb+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) rb+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "wb+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) wb+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
-
-		if ((stream = fopen(tempfile, "ab+")) == NULL) {
-			tst_brkm(TFAIL, NULL, "fopen(%s) ab+ failed: %s",
-				 tempfile,
-				 strerror(errno));
-		}
-		(void)fclose(stream);
+	SAFE_UNLINK(FILENAME);
+}
 
-		tst_resm(TPASS, "Test passed in block4.");
-	/*--------------------------------------------------------------------*/
-		unlink(tempfile);
-	}			/* end for */
-	tst_rmdir();
-	tst_exit();
+static void setup(void)
+{
+	memcpy(data, tst_rand_data, DATASIZE);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.bufs = (struct tst_buffers []) {
+		{&data, .size = DATASIZE},
+		{&buff, .size = BUFFSIZE},
+		{},
+	},
+};

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
