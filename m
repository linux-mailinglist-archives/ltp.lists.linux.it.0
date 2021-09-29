Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683C41C12C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Sep 2021 10:59:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AA0B3C6F36
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Sep 2021 10:59:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AD763C17A1
 for <ltp@lists.linux.it>; Wed, 29 Sep 2021 10:59:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1B046008C7
 for <ltp@lists.linux.it>; Wed, 29 Sep 2021 10:59:13 +0200 (CEST)
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5481622525;
 Wed, 29 Sep 2021 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1632905953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvVxPg0AIhJCK8UX7BYnKmW0jxwoqtTsxgRsqy1EDxo=;
 b=fEYxbeQU4S7inNyzWGBPRmIC8PvSidLG//YbV2eOgy1TjT6cDwjq6tCThO6re0CjeQy5K4
 Z9MME0oBC7Ky3r+tgGu90R5atyxkxHTzXiU9+9SO+EzB7UjZ+WTvOXUt4mOcIh8/Ctkzgk
 ut39bGBnefyRZ8fs94h8j6D68Vm1aeo=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay1.suse.de (Postfix) with ESMTP id 1DA0025D8B;
 Wed, 29 Sep 2021 08:59:13 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 29 Sep 2021 09:59:10 +0100
Message-Id: <20210929085910.23073-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929085910.23073-1-rpalethorpe@suse.com>
References: <20210929085910.23073-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] clock_nanosleep01: Add space to make make-check
 happy
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 7dc5a043d..d7b14fd94 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -200,7 +200,7 @@ static void do_test(unsigned int i)
 		}
 
 		if (remain_ms > expect_ms) {
-			tst_res(TFAIL| TTERRNO,
+			tst_res(TFAIL | TTERRNO,
 				"remaining time > requested time (%lld > %lld)",
 				remain_ms, expect_ms);
 			return;
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
