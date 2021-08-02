Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB43DD580
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:17:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A56193C8A79
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:17:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6188B3C4E18
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:17:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DFF181400BEF
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:17:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D8A91FF7A;
 Mon,  2 Aug 2021 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627906629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XxZbwBse1O/D+Gwn3XsOYVTb6+upZBm/YMVKf78VJq4=;
 b=fmV8u1MMUXLqqkgeAO9bLD1MqBfq18QJMLDT09DfHhmBK5QfDoM4tWo2RBM4eFgxWs/uO9
 KLVyFdsz7RYgbF4yGdUFW7vDyzcL1Jct3sH3xgIpFdwcmGfP44Y+jIjcGcgl1fgi6QOqbJ
 YyVBQhkxHK+GUDK3hrRKKIJ+3eEj3TQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627906629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XxZbwBse1O/D+Gwn3XsOYVTb6+upZBm/YMVKf78VJq4=;
 b=sNKg6od3Rpas4luexwM0FpJV5xoyfWgLbBpdhQycD/5eO9ErrdleN+2SZLnbkwWRLmzLNE
 v+MO47TI664ijuCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7557413C68;
 Mon,  2 Aug 2021 12:17:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0q/1JkLiB2GzZAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 02 Aug 2021 12:17:06 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 14:17:02 +0200
Message-Id: <20210802121702.3905-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib: tst_device: Allow more control over the
 device size
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

There is actually no reason for lower limit on the device size, and we
can safely allow the tests to request smaller device than the default
hardcoded in the library. The backing file is preallocated without
actually writing to it as long as the underlying filesystem supports it
so the speedup will be minimal if measurable but we will at least spare
some space which needs to be reserved on the filesystem which is still a
good thing.

The test may end up with a device that is bigger than the requsted size
in a case that a real device was passed to the LTP for the testrun.  So
tests should be able to cope with that and that's also the reason why
the turning knob is still called dev_min_size.

Also currently we use the dev_min_size only to increase the device size
for a few tests so this change is safe and cannot break anything.

CC: Joerg Vehlow <lkml@jv-coder.de>
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---

v2: Updated both places where we compute the device size as pointed out
    by Joerg

 lib/tst_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index c91c6cd55..73e70d26e 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -278,7 +278,7 @@ int tst_dev_sync(int fd)
 
 const char *tst_acquire_loop_device(unsigned int size, const char *filename)
 {
-	unsigned int acq_dev_size = MAX(size, DEV_SIZE_MB);
+	unsigned int acq_dev_size = size ? size : DEV_SIZE_MB;
 
 	if (tst_prealloc_file(filename, 1024 * 1024, acq_dev_size)) {
 		tst_resm(TWARN | TERRNO, "Failed to create %s", filename);
@@ -300,7 +300,7 @@ const char *tst_acquire_device__(unsigned int size)
 	unsigned int acq_dev_size;
 	uint64_t ltp_dev_size;
 
-	acq_dev_size = MAX(size, DEV_SIZE_MB);
+	acq_dev_size = size ? size : DEV_SIZE_MB;
 
 	dev = getenv("LTP_DEV");
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
