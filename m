Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6F518B7E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 May 2022 19:49:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 580653CAD29
	for <lists+linux-ltp@lfdr.de>; Tue,  3 May 2022 19:49:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D394C3CA996
 for <ltp@lists.linux.it>; Tue,  3 May 2022 19:45:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 62DD0600454
 for <ltp@lists.linux.it>; Tue,  3 May 2022 19:45:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12BC71F74B;
 Tue,  3 May 2022 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651599917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7M6VVpL5cAG9IhGs4ori93XimJJNg0fANX8//D6rYQ=;
 b=0ZOUsZue4zumw2SZmrEMaf2VqRpYEirtBIPrycT+weNCu3y5V20Y21v+NQ+myR/0k9GMFM
 c+mZkJ7t86NOij0lRVJlZZlFSPeMS23xxMQ5yenX5xuHst36KIUmQr24YdRWelKsv9ILVJ
 6njUlp4FQ/IDbHRxtSiX2ghRNylEAKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651599917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7M6VVpL5cAG9IhGs4ori93XimJJNg0fANX8//D6rYQ=;
 b=pV7nkq7hiytG+oE899ToURv7O3iAJgH7galHW/ZSThqyuEKfN8Vwzy4OGQnWbZTgO4ujQv
 qZ158TBm/ZbilrBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F334A13ABE;
 Tue,  3 May 2022 17:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Obn1OSxqcWIpPgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 03 May 2022 17:45:16 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 May 2022 19:47:15 +0200
Message-Id: <20220503174718.21205-28-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503174718.21205-1-chrubis@suse.cz>
References: <20220503174718.21205-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 27/30] ltp-aiodio/dio_read: Convert to runtime
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
Cc: automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

And cap the runtime on 30 minutes by default.

CC: Andrea Cervesato <andrea.cervesato@suse.de>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/io/ltp-aiodio/dio_read.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
index f6ed59782..8a16307a7 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_read.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
@@ -51,6 +51,9 @@ static void do_buffered_writes(int fd, char *bufptr, long long fsize, long long
 			tst_brk(TBROK, "pwrite: wrote %lld bytes out of %lld", w, wsize);
 
 		SAFE_FSYNC(fd);
+
+		if (!tst_remaining_runtime())
+			return;
 	}
 }
 
@@ -75,6 +78,11 @@ static int do_direct_reads(char *filename, char *bufptr, long long fsize, long l
 				goto exit;
 			}
 
+			if (!tst_remaining_runtime()) {
+				tst_res(TINFO, "Test out of runtime, exitting");
+				goto exit;
+			}
+
 			w = pread(fd, bufptr, rsize, offset);
 			if (w < 0)
 				tst_brk(TBROK, "pread: %s", tst_strerrno(-w));
@@ -170,6 +178,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
 	.forks_child = 1,
+	.max_iteration_runtime = 1800,
 	.options = (struct tst_option[]) {
 		{"n:", &str_numchildren, "Number of threads (default 8)"},
 		{"w:", &str_writesize, "Size of writing blocks (default 32M)"},
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
