Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A33E2960
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 13:19:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89F203C8701
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 13:19:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE4D43C1882
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 13:19:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B89AC60080C
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 13:19:45 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 25A3E1FECA;
 Fri,  6 Aug 2021 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628248785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=08IbGskok1jQiUgtksvAOOuXF04yX891qpI8XgE5LDs=;
 b=vXVXXZ5xmawrUBDPVVwQHTCzQHTN+VjX9vuhBnyxs5qBhR7KWJhnyjLI5qXnZIvPv8xMcB
 Bo6VwwHrZayBzHbK9Fc8FuRIOCnaP8XWyQanBeIBYJsgrlh/i4ZqcwSB26aO3D1KYC5B2p
 Q0xwBDRKMtgtKEMfkVchLxjy2JISM20=
Received: from g78.suse.de (rpalethorpe.tcp.ovpn1.nue.suse.de [10.163.17.14])
 by relay2.suse.de (Postfix) with ESMTP id D3B1CA3B83;
 Fri,  6 Aug 2021 11:19:44 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 12:19:38 +0100
Message-Id: <20210806111938.12007-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] setsockopt08: Handle ENOPROTOOPT even with compatible
 config
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
 .../kernel/syscalls/setsockopt/setsockopt08.c | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
index 33892f9b1..d3cd5b5b2 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -110,6 +110,7 @@ void run(void)
 	struct xt_entry_target *xt_entry_tgt =
 		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
 	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+	int result;
 
 	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
 	strcpy(xt_entry_match->u.user.name, "state");
@@ -126,10 +127,25 @@ void run(void)
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
+			result = TCONF;
+			break;
+		default:
+			result = TFAIL;
+		}
+	} else {
+		result = TFAIL;
+	}
+
+	tst_res(result | TERRNO,
+		"setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
+		fd, buffer);
 
 	SAFE_CLOSE(fd);
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
