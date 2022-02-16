Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 114424B839A
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:07:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA13E3CA073
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:07:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0807F3C9564
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:07:12 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 357591000947
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:07:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 64D401F383;
 Wed, 16 Feb 2022 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645002431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kHucTTzQSfyAnoB5BxZuEsXweg7lQr+r3nVxwZ0622c=;
 b=RmRvmiIzDDk23LLDqFzAS6h36+zYtm4/Y4i/cRMyW5j5c13Zy+6vWbgoDPhxD024OIqGjx
 iUgbMaXbutonMflOTKIkKkTa/FgVmyOZ8fdCfQ72UkRz3vpK7dEMtvhYbVDA+u61veA9w2
 8GpP9NwJt7FWOH9vkgwdbnx07Leudt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645002431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kHucTTzQSfyAnoB5BxZuEsXweg7lQr+r3nVxwZ0622c=;
 b=D9E/j16/rET+MnCvu2v5SJKpCZPgMFMr/fSrr1kDR3YcV1SMT2JdR+SCSYow4AHocfr5BV
 qFMs9JDm9p2pisCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E0A213A95;
 Wed, 16 Feb 2022 09:07:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C/yyBL++DGJXYwAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 16 Feb 2022 09:07:11 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Wed, 16 Feb 2022 11:07:08 +0200
Message-Id: <20220216090708.29588-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] ltpfs/main.c: Initialize return variable
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

LTP_fs_open_block_device returned initialized local
variable, when device handler is occupied.

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 testcases/kernel/fs/scsi/ltpfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/scsi/ltpfs/main.c b/testcases/kernel/fs/scsi/ltpfs/main.c
index dc3e8f30c..2c67c7a47 100644
--- a/testcases/kernel/fs/scsi/ltpfs/main.c
+++ b/testcases/kernel/fs/scsi/ltpfs/main.c
@@ -391,7 +391,7 @@ int LTP_fs_open_block_device()
 {
 	dev_t devt;
 	struct stat statbuf;
-	int rc;
+	int rc = 0;
 
 	if (ltp_block_dev_handle == 0) {
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
