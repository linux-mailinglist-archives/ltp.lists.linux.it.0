Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1054B8403
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:25:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D9AD3CA078
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:25:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3FEAC3C9564
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:25:57 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9328A1A014DE
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:25:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3E7D210EF;
 Wed, 16 Feb 2022 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645003555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o6h4lNWsgO1OOCLnYUg9By6oh+vVvsbMdvKXWNHOD4E=;
 b=wy6sBnrjrFPSPCevOub80yozndPSpZvZQ3qgGun+S6KecdzwsEm6RZOsrnDNVD1Gnf1eZ0
 WTV7dhexCXL1yUh1w1qQV20pMLrHi4kC0MYnxovR5P0O7XkCjkAgEdiY3AmqfqhMLJK2UQ
 N0FVhtziEv83kWjkWLcWwSTMj6DJMeE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645003555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o6h4lNWsgO1OOCLnYUg9By6oh+vVvsbMdvKXWNHOD4E=;
 b=fohWXu8Nu4ReaDw7lv7ne3oQrVRNoqA8n9UNUMHD7u6WVB34SQS8i3XgGMoHoicf4hLw3S
 /Yo5AvZDrzm4ouCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6805F13A5E;
 Wed, 16 Feb 2022 09:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WEd+FiPDDGLubAAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 16 Feb 2022 09:25:55 +0000
From: Bogdan Lezhepekov <blezhepekov@suse.de>
To: ltp@lists.linux.it
Date: Wed, 16 Feb 2022 11:25:53 +0200
Message-Id: <20220216092553.32091-1-blezhepekov@suse.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] mc_opts/mc_verify_opts.c: Initialize local variable
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

In some cases uninitialized array was used
when comparing strings in main().

Signed-off-by: Bogdan Lezhepekov <blezhepekov@suse.de>
---
 testcases/network/multicast/mc_opts/mc_verify_opts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/multicast/mc_opts/mc_verify_opts.c b/testcases/network/multicast/mc_opts/mc_verify_opts.c
index 679b81777..8946324bd 100644
--- a/testcases/network/multicast/mc_opts/mc_verify_opts.c
+++ b/testcases/network/multicast/mc_opts/mc_verify_opts.c
@@ -22,7 +22,7 @@ int main(int argc, char *argv[])
 	unsigned i1, i2, i3, i4;
 	struct hostent *hp, *gethostbyname();
 
-	char sintf[20], gintf[20];
+	char sintf[20], gintf[20] = {0};
 	unsigned char ttl;
 	char loop = 0;
 	unsigned int len = 0;
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
