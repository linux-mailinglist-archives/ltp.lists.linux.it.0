Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BdPOkozqGl2pwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 14:27:38 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE7200683
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 14:27:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336063DB1FD
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 14:27:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E7A693DB2CD
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:26:04 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 380E36002DE
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 14:26:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5DCE43F859;
 Wed,  4 Mar 2026 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772630755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEfy+S8pOBDigYgHcr4GWaujjFJTNmBIwZfBp2S0rTQ=;
 b=ETEqwUePkOUiV3liR2aByRdFGjUw4NdgBxpzV1pa76263wk3H0QRvY0j2hVLSc4xuhRzcH
 QyfWywBnZ+HHyYd4NtmCBkUFyaWnuJfEdY9VHsS3ru1BcVJ03HjsY1Lbzzl5u8DtSnbA6G
 wixqlKsa/VypUjmsis7TpZDBdtOIWyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772630755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEfy+S8pOBDigYgHcr4GWaujjFJTNmBIwZfBp2S0rTQ=;
 b=Au4x38aczqW8MW/NxY+IXdTIKamwIbNh4s3dYLKTnCvK+JdJ4mATFiCfVfsr2mr2H/7WZm
 NPA7CQQ2Jr9bxUBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ETEqwUeP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Au4x38ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772630755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEfy+S8pOBDigYgHcr4GWaujjFJTNmBIwZfBp2S0rTQ=;
 b=ETEqwUePkOUiV3liR2aByRdFGjUw4NdgBxpzV1pa76263wk3H0QRvY0j2hVLSc4xuhRzcH
 QyfWywBnZ+HHyYd4NtmCBkUFyaWnuJfEdY9VHsS3ru1BcVJ03HjsY1Lbzzl5u8DtSnbA6G
 wixqlKsa/VypUjmsis7TpZDBdtOIWyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772630755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bEfy+S8pOBDigYgHcr4GWaujjFJTNmBIwZfBp2S0rTQ=;
 b=Au4x38aczqW8MW/NxY+IXdTIKamwIbNh4s3dYLKTnCvK+JdJ4mATFiCfVfsr2mr2H/7WZm
 NPA7CQQ2Jr9bxUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34DE93EA6C;
 Wed,  4 Mar 2026 13:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCTSCuMyqGlBTgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Wed, 04 Mar 2026 13:25:55 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 04 Mar 2026 14:25:43 +0100
MIME-Version: 1.0
Message-Id: <20260304-stream_refactoring-v2-5-3e48ada8ff1a@suse.com>
References: <20260304-stream_refactoring-v2-0-3e48ada8ff1a@suse.com>
In-Reply-To: <20260304-stream_refactoring-v2-0-3e48ada8ff1a@suse.com>
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772630754; l=5649;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=mZ07EP3ekQ3jRSN65SnG8TCwNcO8TqMteiOcUhVfM28=;
 b=xSFEsCvFpqWGBjtt2yD0H4Hr4dLuENp/8Eh5FDkI1kbjg/pSusIc3YSEe1wp1d5yKvGLaGxHB
 L+hlH+z2amuCgO7gCkaT38prpow86fFHpdwXJJqH9/e3OCcTJS2Dj5P
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.51
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 5/6] fs: rewrite stream04 test using new API
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
X-Rspamd-Queue-Id: 95BE7200683
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
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	NEURAL_SPAM(0.00)[0.194];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:mid,suse.com:email,linux.it:url,picard.linux.it:rdns,picard.linux.it:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	TAGGED_RCPT(0.00)[linux-ltp];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/fs/stream/stream04.c | 147 +++++++++-------------------------
 1 file changed, 40 insertions(+), 107 deletions(-)

diff --git a/testcases/kernel/fs/stream/stream04.c b/testcases/kernel/fs/stream/stream04.c
index 3dc679151a6a81aab8c713605c258fae2c2b3adf..560792f062f3bbb0fcb9164ffd9095803fe6c4fe 100644
--- a/testcases/kernel/fs/stream/stream04.c
+++ b/testcases/kernel/fs/stream/stream04.c
@@ -1,124 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) International Business Machines  Corp., 2002
+ *	ported from SPIE, section2/filesuite/stream4.c, by Airong Zhang
  *
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
 
-/* Ported from SPIE, section2/iosuite/stream4.c, by Airong Zhang */
-
-/*======================================================================
-	=================== TESTPLAN SEGMENT ===================
->KEYS:  < fwrite() fread()
->WHAT:  < 1) Ensure fwrite appends data to stream.
-	< 2) Ensure fread and fwrite return values are valid.
->HOW:   < 1) Open a file, write to it, and then check it.
-	< 2) Fwrite a know quanity, check return value.
-	<    Fread a know quanity, check return value.
->BUGS:  <
-======================================================================*/
-
-#include <stdio.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include "test.h"
-
-char *TCID = "stream04";
-int TST_TOTAL = 1;
-int local_flag;
+/*\
+ * Ensure that `fwrite()` is appending data to stream and `fread()`
+ * `fwrite()` are returning the right data.
+ */
 
-#define PASSED 1
-#define FAILED 0
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
 
-char progname[] = "stream04()";
-char tempfile1[40] = "";
-long ftell();
+#define FILENAME "ltp_file"
+#define DATA "abcdefghijklmnopqrstuvwxyz"
+#define DATASIZE sizeof(DATA)
 
-/* XXX: add setup and cleanup */
+static char *data;
+static char *buff;
 
-/*--------------------------------------------------------------------*/
-int main(int ac, char *av[])
+static void run(void)
 {
 	FILE *stream;
-	char *junk = "abcdefghijklmnopqrstuvwxyz";
-	char *inbuf;
-	int ret;
 
-	int lc;
+	memset(buff, 0, DATASIZE);
 
-	/*
-	 * parse standard options
-	 */
-	tst_parse_opts(ac, av, NULL, NULL);
-	tst_tmpdir();
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
+	stream = SAFE_FOPEN(FILENAME, "a+");
+	TST_EXP_EQ_LI(fwrite(data, 1, DATASIZE, stream), DATASIZE);
+	SAFE_FCLOSE(stream);
 
-		local_flag = PASSED;
+	stream = SAFE_FOPEN(FILENAME, "r+");
+	TST_EXP_EQ_LI(fread(buff, 1, DATASIZE, stream), DATASIZE);
+	SAFE_FCLOSE(stream);
 
-		sprintf(tempfile1, "stream04.%d", getpid());
-	/*--------------------------------------------------------------------*/
-		//block0:
-		if ((stream = fopen(tempfile1, "a+")) == NULL) {
-			tst_brkm(TFAIL | TERRNO, tst_rmdir, "fopen(%s) a+ failed",
-				 tempfile1);
-		}
-		/* write something and check */
-		if ((ret =
-		     fwrite(junk, sizeof(*junk), strlen(junk), stream)) == 0) {
-			tst_brkm(TFAIL, tst_rmdir, "fwrite failed: %s",
-				 strerror(errno));
-		}
+	SAFE_UNLINK(FILENAME);
 
-		if ((size_t) ret != strlen(junk)) {
-			tst_resm(TFAIL,
-				 "strlen(junk) = %zi != return value from fwrite = %zi",
-				 strlen(junk), ret);
-			local_flag = FAILED;
-		}
+	TST_EXP_EQ_STRN(data, buff, DATASIZE);
+}
 
-		fclose(stream);
-		if ((stream = fopen(tempfile1, "r+")) == NULL) {
-			tst_brkm(TFAIL, tst_rmdir, "fopen(%s) r+ failed: %s", tempfile1,
-				 strerror(errno));
-		}
-		if ((inbuf = malloc(strlen(junk))) == 0) {
-			tst_brkm(TBROK, tst_rmdir, "test failed because of malloc: %s",
-				 strerror(errno));
-		}
-		if ((ret =
-		     fread(inbuf, sizeof(*junk), strlen(junk), stream)) == 0) {
-			tst_brkm(TFAIL, tst_rmdir, "fread failed: %s",
-				 strerror(errno));
-		}
-		if ((size_t) ret != strlen(junk)) {
-			tst_resm(TFAIL,
-				 "strlen(junk) = %zi != return value from fread = %zi",
-				 strlen(junk), ret);
-			local_flag = FAILED;
-		}
-		fclose(stream);
-		if (local_flag == PASSED) {
-			tst_resm(TPASS, "Test passed.");
-		} else {
-			tst_resm(TFAIL, "Test failed.");
-		}
-	/*--------------------------------------------------------------------*/
-		unlink(tempfile1);
-	}			/* end for */
-	tst_rmdir();
-	tst_exit();
+static void setup(void)
+{
+	memcpy(data, DATA, DATASIZE);
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.bufs = (struct tst_buffers []) {
+		{&data, .size = DATASIZE},
+		{&buff, .size = DATASIZE},
+		{},
+	},
+};

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
