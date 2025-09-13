Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C869B55C13
	for <lists+linux-ltp@lfdr.de>; Sat, 13 Sep 2025 02:58:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E13D3C9AC9
	for <lists+linux-ltp@lfdr.de>; Sat, 13 Sep 2025 02:58:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A41363CD514
 for <ltp@lists.linux.it>; Sat, 13 Sep 2025 02:58:26 +0200 (CEST)
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch
 [79.135.106.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C7D0B6009CA
 for <ltp@lists.linux.it>; Sat, 13 Sep 2025 02:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=naotchy.com;
 s=protonmail; t=1757725103; x=1757984303;
 bh=icWAlEpPjQWfTuYmp+tI6LReIZBzLYqlR+MgHW1yRv8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ontLjYQFHTKpbJw0kX5j3pFnL0LfEtMDdp1a3z6Xpx61nx7IZM1GbXF6sr4b2/E81
 DS42cZy3a4fFq8+fPc18KY9T2f2hZ7rdqPhw7Vm/soxdh8vw1174UmcgyUIvkWQoXg
 h/tQB4hTcQhgY9KVYH+d97x2Ra1F81KIA/wBoQoUfyyfxbDf+LWYIROTixVQTguKv6
 a23NhGmLj+uD2iBwU+ilUm/BtMrxOqscjySMrEKF6/6ircgwX1Ti+n1uSdUO62yoyP
 IF2Eq0cXY3EZ5SGYNQSUXsIb3TdI2YnJEMrN8WfJVsrUiSXekGekVQBDwhJefmXvCj
 lLsxeSSP8vC/Q==
Date: Sat, 13 Sep 2025 00:58:20 +0000
To: ltp@lists.linux.it
From: Jack Morgan <jmorgan@naotchy.com>
Message-ID: <20250913005759.2946000-2-jmorgan@naotchy.com>
In-Reply-To: <20250913005759.2946000-1-jmorgan@naotchy.com>
References: <20250913005759.2946000-1-jmorgan@naotchy.com>
Feedback-ID: 96944049:user:proton
X-Pm-Message-ID: 0d807a0b7cbeaed7b26de4557b87b6d61dff16bc
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] statmount09.c: Enable mnt_ns_id for
 STATMOUNT_MNT_NS_ID
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

When LTP_HAVE_STATMOUNT_MNT_NS_ID is defined, use mnt_ns_id
for statmount09 test case. Otherswise, use mnt_id.

Fixes: #1260

Signed-off-by: Jack Morgan <jmorgan@naotchy.com>
---
 testcases/kernel/syscalls/statmount/statmount09.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/statmount/statmount09.c b/testcases/kernel/syscalls/statmount/statmount09.c
index 20c76ba24..1894a0672 100644
--- a/testcases/kernel/syscalls/statmount/statmount09.c
+++ b/testcases/kernel/syscalls/statmount/statmount09.c
@@ -39,7 +39,11 @@ static void run(void)
 		return;
 
 	TST_EXP_EQ_LI(st_mount->mask, STATMOUNT_MNT_NS_ID);
+#ifdef LTP_HAVE_STATMOUNT_MNT_NS_ID
 	TST_EXP_EQ_LI(st_mount->mnt_ns_id, mnt_ns_id);
+#else
+	tst_res(TCONF, "statmount.mnt_ns_id not available in current headers, skipping check");
+#endif
 }
 
 static void setup(void)
-- 
2.51.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
