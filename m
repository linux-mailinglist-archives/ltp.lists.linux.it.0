Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77B6F851E
	for <lists+linux-ltp@lfdr.de>; Fri,  5 May 2023 16:56:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D895E3CB823
	for <lists+linux-ltp@lfdr.de>; Fri,  5 May 2023 16:56:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A825A3CB687
 for <ltp@lists.linux.it>; Fri,  5 May 2023 16:56:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9001C600F40
 for <ltp@lists.linux.it>; Fri,  5 May 2023 16:56:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5954229C1
 for <ltp@lists.linux.it>; Fri,  5 May 2023 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683298586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=krHbfuOB6gw+eUGqN+LB4O6QZsmSbOCbjrkqdYDJ1rU=;
 b=YVmJ0mFqqL+9rhCZKqg1O614FoTUVEekCru1MPX7izslIbP+No+JF0uxxG+JNRHnevfSt/
 6ajz9xbtzQKnYgiGBrEMD0ExiZ4Fer8gbQuIGXBWvrXYbb0dPMoK/sSI5gHaGrnwNXlpU4
 dwG1il0AEudxIah0LGTNsUFEi5vEcoM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683298586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=krHbfuOB6gw+eUGqN+LB4O6QZsmSbOCbjrkqdYDJ1rU=;
 b=z/HikY75MLhDBWa39AG/9VDsCvD6DEpqDTI9L4cgdZxBfpJRPAfn7/IOzcX661d4h4+8Iz
 w89nNMPHWsrZisAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACACE13513
 for <ltp@lists.linux.it>; Fri,  5 May 2023 14:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8P1DKRoZVWTXAQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 05 May 2023 14:56:26 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 May 2023 16:56:24 +0200
Message-Id: <20230505145626.2537-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] ipc/semget05: Fix .save_restore flags
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

The test can run without root privileges. Add TST_SR_SKIP_RO to ignore
read-only permissions on /proc/sys/kernel/sem.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/ipc/semget/semget05.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/semget/semget05.c b/testcases/kernel/syscalls/ipc/semget/semget05.c
index 38b0fad3c..d6810c11b 100644
--- a/testcases/kernel/syscalls/ipc/semget/semget05.c
+++ b/testcases/kernel/syscalls/ipc/semget/semget05.c
@@ -73,7 +73,8 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = verify_semget,
 	.save_restore = (const struct tst_path_val[]){
-		{"/proc/sys/kernel/sem", NULL, TST_SR_TCONF},
+		{"/proc/sys/kernel/sem", NULL,
+			TST_SR_TCONF_MISSING | TST_SR_SKIP_RO},
 		{}
 	}
 };
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
