Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9429D472C19
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Dec 2021 13:14:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF5513C8B2B
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Dec 2021 13:14:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB3E83C8867
 for <ltp@lists.linux.it>; Mon, 13 Dec 2021 13:14:20 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EADC61000411
 for <ltp@lists.linux.it>; Mon, 13 Dec 2021 13:14:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB4CF1F3BA;
 Mon, 13 Dec 2021 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1639397658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yUpF0npxPCWd6Rsjl5HRchZ8GHPqqz7EKrGV3wKzySg=;
 b=PpJmyQ2gMOWukuYx4dfZJ03/pdMA0TwGNpBIUmg1NYyIRtsCY3z5rUgr2jzGAAhf77my9X
 mHMNusALoroyhyi2d+D6nBh+HU5U9dkvmHWWrsv1Sw+jDy5AtWbVl+v1In7hKAyJuYoomu
 VeRZpg0Fj330BXobTHWprtjoXRHtzj4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C29D913D27;
 Mon, 13 Dec 2021 12:14:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8TpoLRo5t2EbbgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Mon, 13 Dec 2021 12:14:18 +0000
To: ltp@lists.linux.it
Date: Mon, 13 Dec 2021 13:14:17 +0100
Message-Id: <20211213121417.21825-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] Add io_read_eof in common.h utilities
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/io/ltp-aiodio/common.h | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/testcases/kernel/io/ltp-aiodio/common.h b/testcases/kernel/io/ltp-aiodio/common.h
index c9fd0bbaa..c27c3a0ad 100644
--- a/testcases/kernel/io/ltp-aiodio/common.h
+++ b/testcases/kernel/io/ltp-aiodio/common.h
@@ -86,6 +86,36 @@ static inline void io_read(const char *filename, int filesize, volatile int *run
 	SAFE_CLOSE(fd);
 }
 
+static inline void io_read_eof(const char *filename, volatile int *run_child)
+{
+	char buff[4096];
+	int fd;
+	int r;
+
+	while ((fd = open(filename, O_RDONLY, 0666)) < 0)
+		usleep(100);
+
+	tst_res(TINFO, "child %i reading file", getpid());
+
+	while (*run_child) {
+		off_t offset;
+		char *bufoff;
+
+		offset = SAFE_LSEEK(fd, SEEK_END, 0);
+
+		r = SAFE_READ(0, fd, buff, sizeof(buff));
+		if (r > 0) {
+			bufoff = check_zero(buff, r);
+			if (bufoff) {
+				tst_res(TINFO, "non-zero read at offset %p", offset + bufoff);
+				break;
+			}
+		}
+	}
+
+	SAFE_CLOSE(fd);
+}
+
 /*
  * This code tries to create dirty free blocks on
  * the HDD so there is a chance that blocks to be allocated
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
