Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B331557FCFC
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jul 2022 12:07:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52AF53C9481
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jul 2022 12:07:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8F09E3C0756
 for <ltp@lists.linux.it>; Mon, 25 Jul 2022 12:06:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 17CD16000E2
 for <ltp@lists.linux.it>; Mon, 25 Jul 2022 12:06:47 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 805971FE93;
 Mon, 25 Jul 2022 10:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1658743607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3a+WywNf/2q4IHlJfTOCkUvNPVDO+P1tjbGiQfIPZ4=;
 b=Ym6DIlyCytSodEkuWrbod93Mg0+rJEUxK7XN4tEcB567yvHEbmqVExUNSpctlJJFHPyuU4
 oMfhFMTdVmF9HuCW/3q2IZSLFto4GFvYT5Mi+Zzg2SjBslSJPHDUak9cUdxkPgs6ee3tQk
 Vqwv9Sbf9JIoqpEDckTxIzMb7mKeo5Y=
Received: from g78.suse.de (unknown [10.163.24.226])
 by relay2.suse.de (Postfix) with ESMTP id 46D002C14F;
 Mon, 25 Jul 2022 10:06:47 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 25 Jul 2022 11:06:40 +0100
Message-Id: <20220725100641.11625-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725100641.11625-1-rpalethorpe@suse.com>
References: <20220725100641.11625-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] read_all: Allow /sys/power/wakeup_count
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

This was filtered because it could block at certain times. However we
will now kill the worker and continue.

This could still result in a TBROK test failure if the process can't
be killed (quick enough). Possibly this can be considered a kernel bug
because reading this file should not make an unprivileged process
unkillable. Or else the tester needs to increase LTP_RUNTIME_MUL.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

IMO debug is the only legitimate blacklist item. There's nothing
special about cpu, eeprom or nvmem, any hardware could cause these
issues.

 testcases/kernel/fs/read_all/read_all.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 02c8f1754..c36203846 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -95,7 +95,6 @@ static int timeout_warnings_left = 15;
 
 static char *blacklist[] = {
 	NULL, /* reserved for -e parameter */
-	"/sys/power/wakeup_count",
 	"/sys/kernel/debug/*",
 	"/sys/devices/platform/*/eeprom",
 	"/sys/devices/platform/*/nvmem",
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
