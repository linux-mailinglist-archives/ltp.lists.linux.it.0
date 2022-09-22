Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B6F5E6DB4
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 23:10:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0ACA3CAD7C
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 23:10:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D4513C93EF
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 23:09:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DCE186005CF
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 23:09:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65015219F9;
 Thu, 22 Sep 2022 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663880980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4r2tWmYqDC0sC9tn1XAQwQtE4z05Iaqpkc1LILFZhpo=;
 b=Pz+LNSL16xM7A/Rirf9bPt6BHODrJVT6uyNEQFX4sac7mcAKOa0pvxEFQty/i2LTIhmguW
 qTdZuEuHp5hhADcsopmhWtvf5uutrJ0XxA4N3/kKResj9mejPo0J4nCewXfCdvZraRY3K3
 oTkHUCpbm61cuWulez11mOUva3Oxzjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663880980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4r2tWmYqDC0sC9tn1XAQwQtE4z05Iaqpkc1LILFZhpo=;
 b=OBquSpD03zwQVWFDT+D0ycw5pryymyf/4jA8piC7dfXje6NsK6fC3FIKw8wNgT8edM8FiC
 uoyOkOVWFmiuV2Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2061A13AF0;
 Thu, 22 Sep 2022 21:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sD8ZBhTPLGMYKQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 22 Sep 2022 21:09:40 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 22 Sep 2022 23:09:30 +0200
Message-Id: <20220922210931.23982-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922210931.23982-1-pvorel@suse.cz>
References: <20220922210931.23982-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3 v2] tst_supported_fs: Fix return codes
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

exit code 2 is for errors not related to filesystem detection.

Fixes: eb47b4497 ("tst_supported_fs: Support skip list when query single fs")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_supported_fs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_supported_fs.c b/testcases/lib/tst_supported_fs.c
index 947aa4dae..f644bbd3f 100644
--- a/testcases/lib/tst_supported_fs.c
+++ b/testcases/lib/tst_supported_fs.c
@@ -93,7 +93,7 @@ int main(int argc, char *argv[])
 		switch (ret) {
 		case '?':
 			usage();
-			return 1;
+			return 2;
 
 		case 'h':
 			usage();
@@ -102,7 +102,7 @@ int main(int argc, char *argv[])
 		case 's':
 			skiplist = parse_skiplist(optarg);
 			if (!skiplist)
-				return 1;
+				return 2;
 			break;
 
 		case 'd':
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
