Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A65603C7F22
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:12:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3013D3C7525
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:12:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D60BB3C60E0
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:13 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5DDE9200C62
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:13 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0F5D3229A1;
 Wed, 14 Jul 2021 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626246733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=scSa1c/bTQcjnfxjjZ0qdnX2LI2vnZ0YAX/Z0F7zeVw=;
 b=PRCBGFUpk08+nZHSItLCDhgz8Oj1rG14Zb/+kE+wl6evia6z9vi8anfAw+8sBVrRVcqvUH
 vcDV5qXQwZgnaZAmKA57MFqNeeQo9KiR55GRlKGL/HfaRIcXFzFIF31DgfdmJmz3r9QwgZ
 Wmpq0H4fqziPsqXVGnLf6o7aFZZYrNE=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id B2767A3B8E;
 Wed, 14 Jul 2021 07:12:12 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 08:11:55 +0100
Message-Id: <20210714071158.15868-6-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714071158.15868-1-rpalethorpe@suse.com>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/8] doc: Document TEST macro and state TST_RET/ERR
 rule LTP-002
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

There are cases where these variables can be safely used by the
library. However it is a difficult problem to identify these cases
automatically.

Identifying any library code which uses them is relatively easy. In
fact it is easier to automate it than by code review. Because it is
such a boring thing to repeatedly look for and comment on.

If a test library function needs these variables it can recreate its
own private copies.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/c-test-api.txt                     | 47 ++++++++++++++++++++++++++
 doc/library-api-writing-guidelines.txt | 14 ++++++++
 2 files changed, 61 insertions(+)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 45784195b..b47728f60 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -767,6 +767,53 @@ LTP_ALIGN(x, a)
 
 Aligns the x to be next multiple of a. The a must be power of 2.
 
+[source,c]
+-------------------------------------------------------------------------------
+TEST(socket(AF_INET, SOCK_RAW, 1));
+if (TST_RET > -1) {
+	tst_res(TFAIL, "Created raw socket");
+	SAFE_CLOSE(TST_RET);
+} else if (TST_ERR != EPERM) {
+	tst_res(TFAIL | TTERRNO,
+		"Failed to create socket for wrong reason");
+} else {
+	tst_res(TPASS | TTERRNO, "Didn't create raw socket");
+}
+-------------------------------------------------------------------------------
+
+The +TEST+ macro sets +TST_RET+ to its argument's return value and
++TST_ERR+ to +errno+. The +TTERNO+ flag can be used to print the error
+number's symbolic value.
+
+No LTP library function or macro, except those in 'tst_test_macros.h',
+will write to these variables (rule 'LTP-002'). So their values will
+not be changed unexpectedly.
+
+[source,c]
+-------------------------------------------------------------------------------
+TST_EXP_POSITIVE(wait(&status));
+
+if (!TST_PASS)
+	return;
+-------------------------------------------------------------------------------
+
+If the return value of 'wait' is positive. This macro will print a
+pass result and set +TST_PASS+ appropriately. If the return value is
+zero or negative, then it will print fail.
+
+This and similar macros take optional variadic arguments. These begin
+with a format string and then appropriate values to be formatted.
+
+[source,c]
+-------------------------------------------------------------------------------
+TST_EXP_PASS(chown("a/file", uid, gid), "chown(%s,%d,%d)",
+	     "a/file", uid, gid);
+-------------------------------------------------------------------------------
+
+Expects +chown+ to return 0 and emits a pass or a fail. The arguments
+to +chown+ will be printed in either case. There are many similar
+macros, please see 'tst_test_macros.h'.
+
 1.13 Filesystem type detection and skiplist
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/doc/library-api-writing-guidelines.txt b/doc/library-api-writing-guidelines.txt
index a4393fc54..2819d4177 100644
--- a/doc/library-api-writing-guidelines.txt
+++ b/doc/library-api-writing-guidelines.txt
@@ -21,10 +21,24 @@ Don't forget to update docs when you change the API.
 2. C API
 --------
 
+2.1 LTP-001: Sources have tst_ prefix
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 API source code is in headers `include/*.h`, `include/lapi/*.h` (backward
 compatibility for old kernel and libc) and C sources in `lib/*.c`. Files have
 'tst_' prefix.
 
+2.2 LTP-002: TST_RET and TST_ERR are not modified
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The test author is guaranteed that the test API will not modify these
+variables. This prevents silent errors where the return value and
+errno are overwritten before the test has chance to check them.
+
+The macros which are clearly intended to update these variables. That
+is +TEST+ and those in 'tst_test_macros.h'. Are of course allowed to
+update these variables.
+
 3. Shell API
 ------------
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
