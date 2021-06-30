Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F1D3B83DB
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 15:48:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66A4E3C9370
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 15:48:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D9EB3C6C4A
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 15:48:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0BAB660042A
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 15:48:41 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 462CF21D0F
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625060921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/YlQJ0WbMVNsO5IQ82OxoOgTVBbwRjOjqMZdMf8/xA=;
 b=DK72OGbhFzk8f+Q4/XKbqS7YLJZ+ppRgEYl/hVT49ukPdYbk7p496eovFMEI/CfuSxPdeH
 onF1I6quK0Hj4lebP91bWgIO0mJLmkTZIoqJmp9dxyBtRcg78JcZaQO/ZZD3We00eemJWq
 2+SN30mv8zy5ZhxVm+bnz3dpLiLPO0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625060921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/YlQJ0WbMVNsO5IQ82OxoOgTVBbwRjOjqMZdMf8/xA=;
 b=+Afrw4PXKWPLfmvZdDiCRluDHuhvEB2eJxI88XeSYYtgBycb41rDv/Da7O/ynBP0wIFSaC
 g7Gf2SJwBfppwFAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E6DE9118DD
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625060921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/YlQJ0WbMVNsO5IQ82OxoOgTVBbwRjOjqMZdMf8/xA=;
 b=DK72OGbhFzk8f+Q4/XKbqS7YLJZ+ppRgEYl/hVT49ukPdYbk7p496eovFMEI/CfuSxPdeH
 onF1I6quK0Hj4lebP91bWgIO0mJLmkTZIoqJmp9dxyBtRcg78JcZaQO/ZZD3We00eemJWq
 2+SN30mv8zy5ZhxVm+bnz3dpLiLPO0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625060921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=R/YlQJ0WbMVNsO5IQ82OxoOgTVBbwRjOjqMZdMf8/xA=;
 b=+Afrw4PXKWPLfmvZdDiCRluDHuhvEB2eJxI88XeSYYtgBycb41rDv/Da7O/ynBP0wIFSaC
 g7Gf2SJwBfppwFAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id JZAgNzh23GA9AQAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 13:48:40 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 30 Jun 2021 15:23:08 +0200
Message-Id: <20210630132308.31016-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/sendfile06: Fix format string
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

There cannot be any characters between "%" and PRId64 since these two
when concatenated produce the format string for the 64bit integer that
follows.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/sendfile/sendfile06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/sendfile/sendfile06.c b/testcases/kernel/syscalls/sendfile/sendfile06.c
index b504f1805..6133be4d0 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile06.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile06.c
@@ -54,7 +54,7 @@ static void run(void)
 			sb.st_size, TST_RET);
 	else if (after_pos != sb.st_size)
 		tst_res(TFAIL, "sendfile() updated the file position of in_fd unexpectedly,"
-			" expected file position: %," PRId64
+			" expected file position: %" PRId64
 			" actual file position %" PRId64,
 			(int64_t)(sb.st_size), (int64_t)(after_pos));
 	else
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
