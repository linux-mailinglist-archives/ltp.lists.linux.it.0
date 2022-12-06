Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B2644288
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 12:53:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE6F43CC189
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Dec 2022 12:53:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 513F33CA9B6
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 12:53:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8970B1001182
 for <ltp@lists.linux.it>; Tue,  6 Dec 2022 12:53:43 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BF0CF21BF9;
 Tue,  6 Dec 2022 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1670327622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dqt4jCrJ/A+H0/tzHVMo0OVJ2D3AlleayIXlfn/suPU=;
 b=IAlthZOEve1/5V7pqqDfyGBRZckkXUzwM8n9DwwMLQ4D3B0uMkXzuZk2Po8lSwduTj308i
 2vPq3oWJkYP5f2gozzw0/An1hMQ4+Msb0rSU/ynaMQ8tYI1qYt/5KYxQoS82DzZugUoVqW
 nnsDNKb0uQYla6Rw5dH26njQqsQ2dSk=
Received: from g78.cable.virginm.net (unknown [10.163.17.14])
 by relay2.suse.de (Postfix) with ESMTP id 88AD52C141;
 Tue,  6 Dec 2022 11:53:42 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  6 Dec 2022 11:53:28 +0000
Message-Id: <20221206115329.17760-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] fs_fill: Add max_runtime = 60
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Usually it takes a few seconds (3-6) to fill up the device with
default settings. Which is too close to the default runtime.

This sets the max_runtime to 10x that to avoid random failures caused
by rare events.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Petr Cervinka <pcervinka@suse.com>
---
 testcases/kernel/fs/fs_fill/fs_fill.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/fs/fs_fill/fs_fill.c b/testcases/kernel/fs/fs_fill/fs_fill.c
index 66b3974fc..95dfc2cb6 100644
--- a/testcases/kernel/fs/fs_fill/fs_fill.c
+++ b/testcases/kernel/fs/fs_fill/fs_fill.c
@@ -109,6 +109,7 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
+	.max_runtime = 60,
 	.needs_root = 1,
 	.mount_device = 1,
 	.mntpoint = MNTPOINT,
-- 
2.38.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
