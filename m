Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE857D851C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Oct 2023 16:48:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E22073CEC17
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Oct 2023 16:48:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 726613CCB20
 for <ltp@lists.linux.it>; Thu, 26 Oct 2023 16:48:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6F6E6601575
 for <ltp@lists.linux.it>; Thu, 26 Oct 2023 16:48:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 750261F8AE;
 Thu, 26 Oct 2023 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1698331699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nLvUnNFhmS5/qCN0TPWZloWtzkeM+8Z/AMDn1QBE3Ho=;
 b=erBMZt+NEkRTwVpH+xDaZY3C7Cli6eA/VsEEwhYbqANDkXBwJRukOqTYfteP8iRXMCuhlH
 +QChpe+fI5SKYtUl9jIl/RYnQbLwDjcoF+uqN2Bjhs7dyhh4aKmH4XXjGZCnhuMIpgvl05
 qY4UXINuLbKdnHsG7YwGq3aAS0iGVq4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BA351358F;
 Thu, 26 Oct 2023 14:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DoGoCDJ8OmW2YQAAMHmgww
 (envelope-from <wegao@suse.com>); Thu, 26 Oct 2023 14:48:18 +0000
To: ltp@lists.linux.it
Date: Thu, 26 Oct 2023 10:48:12 -0400
Message-Id: <20231026144812.6786-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.34
X-Spamd-Result: default: False [-0.34 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 MID_CONTAINS_FROM(1.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-1.24)[89.55%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1] pwritev201: Add check for RWF_APPEND
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 .../kernel/syscalls/pwritev2/pwritev201.c      | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/pwritev2/pwritev201.c b/testcases/kernel/syscalls/pwritev2/pwritev201.c
index eba45b7d3..96572ba73 100644
--- a/testcases/kernel/syscalls/pwritev2/pwritev201.c
+++ b/testcases/kernel/syscalls/pwritev2/pwritev201.c
@@ -39,13 +39,15 @@ static struct tcase {
 	off_t write_off;
 	ssize_t size;
 	off_t exp_off;
+	int flag;
 } tcases[] = {
-	{0,     1, 0,          CHUNK, 0},
-	{CHUNK, 2, 0,          CHUNK, CHUNK},
-	{0,     1, CHUNK / 2,  CHUNK, 0},
-	{0,     1, -1,         CHUNK, CHUNK},
-	{0,     2, -1,         CHUNK, CHUNK},
-	{CHUNK, 1, -1,         CHUNK, CHUNK * 2},
+	{0,     1, 0,          CHUNK, 0, 0},
+	{CHUNK, 2, 0,          CHUNK, CHUNK, 0},
+	{0,     1, CHUNK / 2,  CHUNK, 0, 0},
+	{0,     1, -1,         CHUNK, CHUNK, 0},
+	{0,     2, -1,         CHUNK, CHUNK, 0},
+	{CHUNK, 1, -1,         CHUNK, CHUNK * 2, 0},
+	{CHUNK, 1, -1,         CHUNK, CHUNK * 3, RWF_APPEND},
 };
 
 static void verify_pwritev2(unsigned int n)
@@ -57,7 +59,7 @@ static void verify_pwritev2(unsigned int n)
 	SAFE_PWRITE(1, fd, initbuf, sizeof(initbuf), 0);
 	SAFE_LSEEK(fd, tc->seek_off, SEEK_SET);
 
-	TEST(pwritev2(fd, wr_iovec, tc->count, tc->write_off, 0));
+	TEST(pwritev2(fd, wr_iovec, tc->count, tc->write_off, tc->flag));
 	if (TST_RET < 0) {
 		tst_res(TFAIL | TTERRNO, "pwritev2() failed");
 		return;
@@ -78,6 +80,8 @@ static void verify_pwritev2(unsigned int n)
 
 	if (tc->write_off != -1)
 		SAFE_PREAD(1, fd, preadbuf, tc->size, tc->write_off);
+	else if (tc->flag == RWF_APPEND)
+		SAFE_PREAD(1, fd, preadbuf, tc->size, sizeof(initbuf));
 	else
 		SAFE_PREAD(1, fd, preadbuf, tc->size, tc->seek_off);
 
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
