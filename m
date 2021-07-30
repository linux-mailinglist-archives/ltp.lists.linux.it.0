Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109F3DB95A
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 15:31:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B7B83C8F02
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jul 2021 15:31:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9D363C22F1
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 15:31:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5A9991A014D3
 for <ltp@lists.linux.it>; Fri, 30 Jul 2021 15:31:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97AFF20249;
 Fri, 30 Jul 2021 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627651912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/mDqxUCLAEa2Kq8h7jUJKK3q+Yw78arrijH8LE5NnHA=;
 b=J/1mYB4Oyh2WGjVDsVwTlC9by7lM7/eRLK3q2B1l4TWP9V9IEPE4kpOOzqsR+mJEp+dXfo
 1z9f8uuZHhiUgpBTx69N8j1ZbR75u7Mh/DcHF3zawzvnzPpcRyM831ldTEaC/pw40hmhsu
 cPsmJ12SEWfCUnxUo5IJHBuUywM4Yck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627651912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/mDqxUCLAEa2Kq8h7jUJKK3q+Yw78arrijH8LE5NnHA=;
 b=nwUhOrtE3vWxjopVw0CL4u8IlFadjrxoJCy7azWJdlQMRyGPS58mXeyrPRDQ18y4tX0raU
 1adY26Ak+9FYXABQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 846D313C2E;
 Fri, 30 Jul 2021 13:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YapFH0j/A2FXfgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 30 Jul 2021 13:31:52 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 30 Jul 2021 15:31:55 +0200
Message-Id: <20210730133155.31284-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: tst_device: Allow more control over the device
 size
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
 lib/tst_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index c91c6cd55..4ef802c41 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
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
