Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJHKI+yMhGl43QMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:28:28 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212ABF2793
	for <lists+linux-ltp@lfdr.de>; Thu, 05 Feb 2026 13:28:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74FFE3CE440
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Feb 2026 13:28:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 241AB3CD31E
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:28:17 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8932B1A000B9
 for <ltp@lists.linux.it>; Thu,  5 Feb 2026 13:28:17 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so9835955ad.2
 for <ltp@lists.linux.it>; Thu, 05 Feb 2026 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770294496; x=1770899296; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=K10a2ka+554glinrMvDajMto+0adMCSyhVPtTwbV6Is=;
 b=V7GQYwh1HosFbHV5GEU1AGNfzr1InKunCPJR5DYAyWHlahAASngIalWxiKzNCM90jJ
 L+6hOw/1XEHYB0hsgpzWOHpvJ+AtUh0jxsMxWaQCY7RXy6bI875yxGYshrOqTnDXfmrk
 QcizPOWQU1UxjTstbiocMqrHPo8rEdx3keQylbbW2vKhoBdcyBsTzBwBmoKzBbEY6dcA
 ZM4qPk6lLVNNBHf6xqJ7o/Xa7PSfhty73t5VB4VCnGOXkS30BsAQbYOcl+9brTZ+DMEr
 /c2pvyaHtdbByEGUKMwAAD79C2GkOOM4vqUMt7U+PVGFtwVGwp6qnEeAotAtPLhbg6S6
 JRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770294496; x=1770899296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K10a2ka+554glinrMvDajMto+0adMCSyhVPtTwbV6Is=;
 b=EVhu2zUkaPKT30efszJ0MuGfTcqT0vs2ENAYTU4LqiSQnS7kR4z/IzYaASi+8E2py4
 qq939vREVWeAr1YBSt3Fmeq6ev+SgtrzHB73WluggE4CdCN0Lml/z5SahQFTlj0SNXE5
 KEsMk3iKFcrlGCk8MukfGbotT3fQMRL7mcGFaA8yZj5KyBwdUQKtiKf2tXCZM7wTSZkf
 CXIFERXNTKz5zEC2h+pm1hFtDo75ZjSvopuV5t5BLG04ecuRRZqTMsylN65O9hednQkA
 cWXq6IeWJRgH4fLh+EtVuEpZDl0+agfA9plpJxcVNbF8LbZMPPeLaYusF9tP+3tJzvpq
 lEbg==
X-Gm-Message-State: AOJu0YyOYa1Op6a4uQ8bnb4/TQKn96kBKP3Z2PUAgrIA7L/0JKTlKAvO
 XnfSPGVbD6xYIcta2cpvN05OckHU+PvzyiWmpfmui5DC5Nv13fpd44nbskjtNN4Stg==
X-Gm-Gg: AZuq6aLif3akXR1J9E1JPb9GU9rS1VHiFaHgJIHGWI+UbAaoM56W+rKGJ4xL5dJlvlI
 zpbjbwAjU6fP/kZ7USu6pUcnLMLE3iv/ZjucXKiFs5eO5jx3r5/GhKMA8BHNglqjUQWQi2A+tT+
 BFq1FlngTzhdcIkZ3ZZaatiRibWrMgxyIgI9slKYN/9f0ehgUbQ7w9NmdqB8UbkWY7e0t+jxInm
 mKeA6lALby3/hkKb9X1GLNjZv1grgZkzsr9fZ1eu1P5Zy39qHLDpKdsDMKEGA0a3YNtXwiIDH5I
 bGlcphVqcOxUNx38DS4DV8QgBiWZ8HM3YjKHJ1W5qVsLJOMlY+G8lR0QM2feOUOdUhHPJIX518w
 LZnxpRpna51UYwRtNM/jIh4z8vurQIQCt/OFLtvDKRJj7C9i7int52AkMHOEPph7LulauL6kaIB
 yGRguMB58ywFwoJNEh10v/aD3FFZob7A==
X-Received: by 2002:a17:903:f85:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a933fdd4edmr56110665ad.48.1770294495641; 
 Thu, 05 Feb 2026 04:28:15 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a933851690sm51858845ad.19.2026.02.05.04.28.14
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 04:28:15 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  5 Feb 2026 21:27:51 +0900
Message-ID: <20260205122753.3163-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] inotify: fix typo in write() error message (1 ->
 BUF_SIZE)
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alwaysstarving0@gmail.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 212ABF2793
X-Rspamd-Action: no action

The error message in the write() failure check uses a hardcoded '1'
instead of BUF_SIZE, leading to misleading logs when write() fails.

This patch fixes the format string to show the actual size.

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 testcases/kernel/syscalls/inotify/inotify01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/inotify/inotify01.c b/testcases/kernel/syscalls/inotify/inotify01.c
index 4f7fa70e9..8671b594a 100644
--- a/testcases/kernel/syscalls/inotify/inotify01.c
+++ b/testcases/kernel/syscalls/inotify/inotify01.c
@@ -72,7 +72,7 @@ void verify_inotify(void)

 	if (write(fd, buf, BUF_SIZE) == -1) {
 		tst_brk(TBROK,
-			"write(%d, %s, 1) failed", fd, fname);
+			"write(%d, %s, %d) failed", fd, fname, BUF_SIZE);
 	}
 	event_set[test_cnt] = IN_MODIFY;
 	test_cnt++;
--
2.43.0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
