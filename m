Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE140C8A8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:47:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D6A53C8A94
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:47:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41CB63C234D
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:47:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 52A5A6010F8
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:47:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CA2E222B1
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631720821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e/6ZFl0Xb1YIOwI1AMYh3g1++jGh/c29zJF+N5gEDs4=;
 b=gThJM1QlZAmo9TFYYpdfm88YF5lnPriFckftYZ2nHd8+wQCYPwxZcGRrQy54cZs66kpYf7
 XC4KQJdxVASmoPwam+TRTpIvq2QUhEJ5y6JUYWaOYZUzSyHBa/btXZVlBy9RM0AJCq+7bV
 /5RRdeTfzUlZoKMhZ58M+ldCIlvtRk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631720821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=e/6ZFl0Xb1YIOwI1AMYh3g1++jGh/c29zJF+N5gEDs4=;
 b=oI+Q+GytVMXhrydK2boC5/pPo3RMlbVqg1h25mdF0eZoMe75urVjxAtle4TZLe/JJu7NJb
 lSBbHjWGu60LJ5DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4744713C37
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 15:47:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TOj+D3UVQmEuKwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 15:47:01 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Sep 2021 17:46:59 +0200
Message-Id: <20210915154659.26931-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] misc/crash02: Update syscall blacklist
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

- fork() and vfork() are not mutually exclusive, blacklist both
- read() will sleep indefinitely if the first argument is 0

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/misc/crash/crash02.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/misc/crash/crash02.c b/testcases/misc/crash/crash02.c
index 66f308b70..c68f580ef 100644
--- a/testcases/misc/crash/crash02.c
+++ b/testcases/misc/crash/crash02.c
@@ -464,7 +464,8 @@ int in_blacklist(int sysno)
 		 */
 #if defined(__NR_vfork) && __NR_vfork
 		SYS_vfork,
-#elif defined(__NR_fork) && __NR_fork
+#endif
+#if defined(__NR_fork) && __NR_fork
 		SYS_fork,
 #endif
 #endif /* __ia64__ */
@@ -476,6 +477,13 @@ int in_blacklist(int sysno)
 #endif
 #if defined(__NR_pause) && __NR_pause
 		__NR_pause,	/* int pause(void); - sleep indefinitely */
+#endif
+#if defined(__NR_read) && __NR_read
+		/*
+		 * ssize_t read(int fd, void *buf, size_t count); - will sleep
+		 * indefinitely if the first argument is 0
+		 */
+		__NR_read,
 #endif
 		-1
 	};
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
