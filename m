Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 031133E8B00
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 09:25:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD7B23C6F25
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 09:25:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 312AD3C29B4
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 09:25:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 715AC200C3F
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 09:25:27 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9FB381FE9A;
 Wed, 11 Aug 2021 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628666726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIgFqk9Tolss2SujL1B09lf5hxMw/VnVWOO4XI0qhkw=;
 b=A0+EFaCMK2H6u4zX4SHG5w3Nrg70uEKVG6CNVBgzHt3ywlFQjf/2G3w72iEBLBR9ifvxv2
 JxCxCgO1Xl7eqFJDEf9DOh4D1BcNO5tsvH1bpX6OeK8lpdS7NURowwWLuf3xBQ3GzESZdR
 MtTtmdrvf0esdZ+AWQxpbBSjwSSA1B0=
Received: from g78.suse.de (unknown [10.163.17.14])
 by relay2.suse.de (Postfix) with ESMTP id 5B37CA3B87;
 Wed, 11 Aug 2021 07:25:26 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 08:24:30 +0100
Message-Id: <20210811072430.13560-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806111938.12007-1-rpalethorpe@suse.com>
References: <20210806111938.12007-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] setsockopt08: Handle ENOPROTOOPT even with
 compatible config
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

One or more necessary modules can be missing even if they are present
in the config.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V2:
* Use tst_brk with TCONF

 .../kernel/syscalls/setsockopt/setsockopt08.c | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
index 33892f9b1..7afb98403 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -101,6 +101,8 @@ void setup(void)
 
 void run(void)
 {
+	const char *const res_fmt_str =
+		"setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)";
 	struct ipt_replace *ipt_replace = buffer;
 	struct ipt_entry *ipt_entry = &ipt_replace->entries[0];
 	struct xt_entry_match *xt_entry_match =
@@ -110,6 +112,7 @@ void run(void)
 	struct xt_entry_target *xt_entry_tgt =
 		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
 	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+	int result;
 
 	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
 	strcpy(xt_entry_match->u.user.name, "state");
@@ -126,10 +129,23 @@ void run(void)
 	ipt_replace->num_counters = 1;
 	ipt_replace->size = ipt_entry->next_offset;
 
-	TST_EXP_FAIL(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1),
-		     EINVAL,
-		     "setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
-		     fd, buffer);
+	errno = 0;
+	if (setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1) == -1) {
+		switch (errno) {
+		case EINVAL:
+			result = TPASS;
+			break;
+		case ENOPROTOOPT:
+			tst_brk(TCONF | TERRNO, res_fmt_str, fd, buffer);
+			return;
+		default:
+			result = TFAIL;
+		}
+	} else {
+		result = TFAIL;
+	}
+
+	tst_res(result | TERRNO, res_fmt_str, fd, buffer);
 
 	SAFE_CLOSE(fd);
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
