Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FFBA8F93
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Sep 2025 13:09:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5034C3CE1E8
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Sep 2025 13:09:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 140BB3CAB73
 for <ltp@lists.linux.it>; Mon, 29 Sep 2025 13:09:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 74D621000232
 for <ltp@lists.linux.it>; Mon, 29 Sep 2025 13:09:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 874EC32651;
 Mon, 29 Sep 2025 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759144168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZUoUYx1wtqcHLZRhhpgCNPcGwDKgu0VHJd18d0cl6Z0=;
 b=peC17ra2kDJ+4fhjcNKWNnq3AWPqzm4ktlW1HdtpQM2aCWbvQTD9HV+Abk7zQMoZhhDC7C
 KHSyMn7d5/Qk8jGad7+BcbBuzmxm+E+fv7VN5ZDivI2B5LaOHgooqj6LiAlIi/zDQCFM03
 jxHQ0Ay2lnTCWsmSLCfknbAQkxOpj2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759144168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZUoUYx1wtqcHLZRhhpgCNPcGwDKgu0VHJd18d0cl6Z0=;
 b=BipzMTDCevX+1qzvO8KR3h2x4RyMMLdygKrWY6AITKpVxqDMf8q8d8Jz57A7dItDW62Ddp
 yQPD3e8OSUbp0tAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1759144168; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZUoUYx1wtqcHLZRhhpgCNPcGwDKgu0VHJd18d0cl6Z0=;
 b=peC17ra2kDJ+4fhjcNKWNnq3AWPqzm4ktlW1HdtpQM2aCWbvQTD9HV+Abk7zQMoZhhDC7C
 KHSyMn7d5/Qk8jGad7+BcbBuzmxm+E+fv7VN5ZDivI2B5LaOHgooqj6LiAlIi/zDQCFM03
 jxHQ0Ay2lnTCWsmSLCfknbAQkxOpj2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1759144168;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZUoUYx1wtqcHLZRhhpgCNPcGwDKgu0VHJd18d0cl6Z0=;
 b=BipzMTDCevX+1qzvO8KR3h2x4RyMMLdygKrWY6AITKpVxqDMf8q8d8Jz57A7dItDW62Ddp
 yQPD3e8OSUbp0tAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A7A613782;
 Mon, 29 Sep 2025 11:09:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id u5xhHeho2miFaQAAD6G6ig
 (envelope-from <mdoucha@suse.cz>); Mon, 29 Sep 2025 11:09:28 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: andrea.cervesato@suse.de,
	ltp@lists.linux.it
Date: Mon, 29 Sep 2025 13:08:58 +0200
Message-ID: <20250929110922.13506-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWO(0.00)[2];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.cz:email,
 suse.cz:mid]
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] file_attr02: Reduce extent size block count
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

Reduce test extent size to 128 blocks. Otherwise the FS_IOC_FSSETXATTR
ioctl may exceed extent size limit and fail on archs with 64K blocksize.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/file_attr/file_attr02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/file_attr/file_attr02.c b/testcases/kernel/syscalls/file_attr/file_attr02.c
index d0cb47696..f6625985a 100644
--- a/testcases/kernel/syscalls/file_attr/file_attr02.c
+++ b/testcases/kernel/syscalls/file_attr/file_attr02.c
@@ -15,7 +15,7 @@
 
 #define MNTPOINT "mntpoint"
 #define FILENAME "ltp_file"
-#define BLOCKS 1024
+#define BLOCKS 128
 #define PROJID 16
 
 static int fd = -1;
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
