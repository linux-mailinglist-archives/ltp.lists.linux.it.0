Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D542283C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Oct 2021 15:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E726B3C9F96
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Oct 2021 15:47:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56CF63C4DE9
 for <ltp@lists.linux.it>; Tue,  5 Oct 2021 15:46:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A29F41400C62
 for <ltp@lists.linux.it>; Tue,  5 Oct 2021 15:46:55 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 04569223FC;
 Tue,  5 Oct 2021 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1633441615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9qbTY+sqWcSEkrroNE3kJO+Z5agISD7EdTf8Hv0UXnQ=;
 b=MgIn+PIAEykGsYVlqy9P2jjr3ywmYeT9/l27UBC0vq4krz/acFbk6poIElXFapwcPWEHRU
 OkN3wz1NJ3uh6Nb5mvuLBPWBvgv39MlbD88lPny6bR6IMy2XrQ/pKWvQpFeOLRSES4G+IJ
 +v+puMhyetPQZDzPW6w8y4pRzyRDxSk=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id B2D94A3B9D;
 Tue,  5 Oct 2021 13:46:54 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  5 Oct 2021 14:46:39 +0100
Message-Id: <20211005134640.12565-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] clock_nanosleep01: Avoid dereferencing bad
 pointers in libc
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

In 32-bit (regardless of kernel bits) glibc and musl will usually
dereference the timespec pointers and try to read them. In some cases
this might be avoidable, but they must do it in others.

Passing invalid pointers is undefined in POSIX. In any case, AFAICT
libc would have to catch the signal in order to guarantee EFAULT is
returned.

It's also reported that some other libc implementations dereference
the pointers even in 64bit. If this happens then it blocks more useful
testing. So this avoids passing bad pointers to libc.

Also turn test_type into a bitmask to reduce if statement length.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Acked-by: Jan Stancek <jstancek@redhat.com>
---

V2:
* Also remove check on 64-bit
* Avoid pause waiting for child proc
* Use bitmask

 .../clock_nanosleep/clock_nanosleep01.c         | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 382497918..6d81151b6 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -27,10 +27,10 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 }
 
 enum test_type {
-	NORMAL,
-	SEND_SIGINT,
-	BAD_TS_ADDR_REQ,
-	BAD_TS_ADDR_REM,
+	NORMAL = 1,
+	SEND_SIGINT = 2,
+	BAD_TS_ADDR_REQ = 4,
+	BAD_TS_ADDR_REM = 8,
 };
 
 #define TYPE_NAME(x) .ttype = x, .desc = #x
@@ -138,7 +138,14 @@ static void do_test(unsigned int i)
 
 	tst_res(TINFO, "case %s", tc->desc);
 
-	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
+	if (tc->ttype & (BAD_TS_ADDR_REQ | BAD_TS_ADDR_REM) &&
+	    tv->clock_nanosleep == libc_clock_nanosleep) {
+		tst_res(TCONF,
+			"The libc wrapper may dereference req or rem");
+		return;
+	}
+
+	if (tc->ttype & (SEND_SIGINT | BAD_TS_ADDR_REM))
 		pid = create_sig_proc(SIGINT, 40, 500000);
 
 	tst_ts_set_sec(rq, tc->tv_sec);
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
