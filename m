Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC94B6D7A
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Feb 2022 14:31:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC1D13CA06B
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Feb 2022 14:31:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E8423CA00E
 for <ltp@lists.linux.it>; Tue, 15 Feb 2022 14:31:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C904B600783
 for <ltp@lists.linux.it>; Tue, 15 Feb 2022 14:31:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09B5C210EE;
 Tue, 15 Feb 2022 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644931873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rV0eY6QdLcuiXvwa1ZS27DeKR8Ue8flIus6e+fWZemU=;
 b=IfFzwBQlnvfdAz3noTEi6pRSES6vgjvciJ2F/+C/vMGu6nF7TbsGZb9NriS99Xllq4+VWu
 d/3CByRWC1nzpx4y+XtzgWWj04dBInbTYtYVEIUA07a1l3Oa6vx4kP8ah1dOdJ+Nvn0ymk
 1CGnRV+WkR8f+xCm/3qmIGmOz5lQ/oY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644931873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rV0eY6QdLcuiXvwa1ZS27DeKR8Ue8flIus6e+fWZemU=;
 b=btgY7tbL8CmYne5orycc5VPXbhf+tOaGLxavTPcQUiiuOZTdn2d/FgcKvxl51wfJ+zzdcs
 tfKb69xB62A8PHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B825313C63;
 Tue, 15 Feb 2022 13:31:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n3lzKiCrC2KrAwAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Tue, 15 Feb 2022 13:31:12 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Tue, 15 Feb 2022 15:31:10 +0200
Message-Id: <20220215133110.22021-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib/tst_memutils.c: Fix resource leak
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

File descriptor was not closed properly
before return.

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 lib/tst_memutils.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
index 4a4974761..3741d6e6f 100644
--- a/lib/tst_memutils.c
+++ b/lib/tst_memutils.c
@@ -121,8 +121,10 @@ static int write_score(const char *path, int score)
 	if (!f)
 		return 1;
 
-	if (fprintf(f, "%d", score) <= 0)
+	if (fprintf(f, "%d", score) <= 0) {
+		fclose(f);
 		return 1;
+	}
 
 	if (fclose(f))
 		return 1;
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
