Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFisHYJ4nWmAQAQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:08:02 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C211851BE
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:08:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAEAB3D0F95
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Feb 2026 11:08:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 102303CA177
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:07:51 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 992BB200990
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 11:07:51 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso3194628b3a.0
 for <ltp@lists.linux.it>; Tue, 24 Feb 2026 02:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771927670; x=1772532470; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkhRyLTSAAxcM6QFq2pMISsnRZoSrEN96kd3jVifMrQ=;
 b=AhzvUoFch33OJBT1FL+8fEJbfaJFbMZBm7S2849vnR1I14wWQesu+o3JaBf8rtfHaX
 FW1WXLi/zqeIZ8vQQtifa9GDy6Wsk712uMq+ZaNBJvk6FON501F3h/faTWDs9P7vl+Ab
 cUMJhadVQcuqYv5yOLkFoSxxf5kmvT6kTN+SB8OIyJwhqiEUWVAiF2qT9UtZP8r51Wvx
 E081HomEMeAu4shuioLgVVuSil4bsKauJiHTEA5EpRw3fNtKPUjSX9TwIpcWYH1ipvKH
 +hJ2H4I+Xv6EckzV/7dBYQlgzjhGrZ9pOcFiflEnf8sxRTAGzFdTVMLbbadWULGBcdSD
 mDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771927670; x=1772532470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mkhRyLTSAAxcM6QFq2pMISsnRZoSrEN96kd3jVifMrQ=;
 b=SY+NmFfOJeUKzCi4eOwd7UvaFlFzjPnOgKu6AaQnLYNs9IxZjYqMO6YuzIj3eCbaqF
 yI/SK+qppRES2OScTCnwQn0yaF7xKAaeKIvTq12AJvmQQ+/JUxnp4NpVSiq+gYWwnjpu
 frLF4W0TbLPSu7R++/hJ6IGbveDFQZPOM/OpGGQTy9cCNmCwObLVILmMWippWPJLzp4q
 YbhYWrKAYzxtJIejfh9lbiiO4QKzcDuBCMbR5quE+Vgua/2Px+IRrBVi6+I6CURxDOeb
 gRP/reqpB9KSxDq772oOaKF8L9qgFHK4GOUFEHI5BlG7Y5Xn8llK1bEDLP0R1gsDpMsM
 gGyg==
X-Gm-Message-State: AOJu0Yzd5iECN10x2FLuNbsRrlrrnjG+U3gDfrsJSVtNJjzPYpBgYNoN
 Tb7f2qZYPIESsTfcWrMdbvxwc62M1b0948QgkOMVLJsBAXnMlUexQgZnj+x3Ug+VRw==
X-Gm-Gg: ATEYQzy+wk963O5y5dhwjlxyghYHH7M1p84jh4SfgQIshQ4q8UQ2uCydK8ld5dxbyGb
 72u2XhJt0pjPEfN5vX+yvFnqbyOpa3PKhuDsaT8Y5S88qK9JKqdjK16OZCKqeVbhpdyXkR6js3o
 mJ2yjCXyEqWcr7BJq+WYOTIi0JkMPn0vbnKUZfelHKVd7b9buR8YKdh1MF7vh3/Uqr9+/Y5FXFP
 HGISWHbs9gDrLpnkKWB13Wy+eaEDr0YpyQei6ARou1YTVnQTVhiNQZ9bPNy6Dqq263WxvC60rB3
 g0jVUkaZTWhU0Oh91pTLcth1zXYi+1Y0ZTNfE24FSGc45gIwyt6ELQ313QVj3AOK9fIOLStGtLS
 BKXUyiso3JvPgCbYqxTX6YJbytqJTrD8Pok/iTpMDECVScmhTQA/w5bYu5Zb8zg/QcP1cXBFcK0
 zz4GX8dFFWPDvnMAxSSdBv+d1c6rA0P5pTGY8JxP0ZCA==
X-Received: by 2002:a05:6a00:4ac9:b0:821:78ac:f197 with SMTP id
 d2e1a72fcca58-826badd8931mr12838332b3a.23.1771927669656; 
 Tue, 24 Feb 2026 02:07:49 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8bc6e8sm9922472b3a.49.2026.02.24.02.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 02:07:49 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 24 Feb 2026 19:07:17 +0900
Message-ID: <20260224100723.42877-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGN1LFH0ULK0.3D30H8MFVV9GM@suse.com>
References: <DGN1LFH0ULK0.3D30H8MFVV9GM@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] open: remove O_DIRECTORY case (move to fstat
 test)
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_ONE(0.00)[1]
X-Rspamd-Queue-Id: 13C211851BE
X-Rspamd-Action: no action

The O_DIRECTORY test case was mostly verifying fstat() behavior on an
existing directory rather than testing any specific open() behavior.

Following review suggestion, remove it from open01.c. A separate fstat
test will be added in a follow-up patch to cover file type checks
(S_ISDIR, etc.) more comprehensively.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/open/open01.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
index baf73ab11..329c52586 100644
--- a/testcases/kernel/syscalls/open/open01.c
+++ b/testcases/kernel/syscalls/open/open01.c
@@ -8,16 +8,12 @@
 /*
  * DESCRIPTION
  *	Open a file with oflag = O_CREAT set, does it set the sticky bit off?
- *	Open a dir with O_DIRECTORY, does it set the S_IFDIR bit on?
  *
  * ALGORITHM
  *	1. open a new file with O_CREAT, fstat.st_mode should not have the
  *	   01000 bit on. In Linux, the save text bit is *NOT* cleared.
- *	2. open a new dir with O_DIRECTORY, fstat.st_mode should have the
- *	   040000 bit on.
  */

-#define _GNU_SOURCE		/* for O_DIRECTORY */
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
@@ -25,7 +21,6 @@
 #include "tst_test.h"

 #define TEST_FILE	"testfile"
-#define TEST_DIR	"testdir"

 static int fd;

@@ -37,7 +32,6 @@ static struct tcase {
 	char *desc;
 } tcases[] = {
 	{TEST_FILE, O_RDWR | O_CREAT, 01444, S_ISVTX, "sticky bit"},
-	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "sirectory bit"}
 };

 static void verify_open(unsigned int n)
@@ -63,11 +57,6 @@ static void verify_open(unsigned int n)
 		SAFE_UNLINK(tc->filename);
 }

-static void setup(void)
-{
-	SAFE_MKDIR(TEST_DIR, 0755);
-}
-
 static void cleanup(void)
 {
 	if (fd > 0)
@@ -77,7 +66,6 @@ static void cleanup(void)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.needs_tmpdir = 1,
-	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_open,
 };
--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
