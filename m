Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEE60FA23
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Oct 2022 16:10:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45DDB3CA925
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Oct 2022 16:10:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C3BEA3C0895
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 16:10:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8D1B6600C75
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 16:09:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 81A5721C97
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666879797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FeqUqVwCvoAHmIeQk0iNPc+qAZnE9+4Ii6DLXG+ObD4=;
 b=yjfMUkoJ/xfNZG2lupJS9+5EJL8ixTagTIXHpnEtDGBtOot8KZvKO70QPjLj87ejHVVo2y
 g9rq0ZrV5Qtd2ZvwBwYBzFt6hXfSnJ0Ww/DFc3ZAFQ4SwyNWpiFcvXT88qddnN5thKBBhD
 0awnL+qvOATt7gPt2ovLjaf2MyzvJY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666879797;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FeqUqVwCvoAHmIeQk0iNPc+qAZnE9+4Ii6DLXG+ObD4=;
 b=WYu0DBPasljWoJWWn1V/1v38aBUQ+KYV50KrHoBN+ZqyP63E4WV/b87pZf6VyoAz0ztb6c
 Xn7Z3GGbYRbv/AAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0439313357
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 14:09:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sEccLjSRWmNEBgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Thu, 27 Oct 2022 14:09:56 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu, 27 Oct 2022 19:39:54 +0530
Message-Id: <20221027140954.4094-1-akumar@suse.de>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] setfsuid02: using -1 as invalid fsuid for setfsuid()
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

a uid which does not have an entry in the /etc/passwd
file is not really an invalid fsuid for setfsuid(), so changing
the test to use -1 as an invalid fsuid.
And second setfsuid(-1) call is to verify that preceding call has
actually failed and there is no change in the fsuid.

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/setfsuid/setfsuid02.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/setfsuid/setfsuid02.c b/testcases/kernel/syscalls/setfsuid/setfsuid02.c
index 850f17834..f5aa1c004 100644
--- a/testcases/kernel/syscalls/setfsuid/setfsuid02.c
+++ b/testcases/kernel/syscalls/setfsuid/setfsuid02.c
@@ -21,9 +21,7 @@ static void run(void)
 	uid_t invalid_uid, current_uid;
 
 	current_uid = geteuid();
-	invalid_uid = 1;
-	while (getpwuid(invalid_uid))
-		invalid_uid++;
+	invalid_uid = -1;
 
 	UID16_CHECK(invalid_uid, setfsuid);
 
-- 
2.38.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
