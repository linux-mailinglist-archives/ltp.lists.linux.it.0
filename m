Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1456B02F7
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Mar 2023 10:32:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23D953CB850
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Mar 2023 10:32:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF14B3CB84F
 for <ltp@lists.linux.it>; Wed,  8 Mar 2023 10:32:26 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0B0BC1000953
 for <ltp@lists.linux.it>; Wed,  8 Mar 2023 10:32:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D253A1FE35;
 Wed,  8 Mar 2023 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1678267944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRhdTGy8y0mlk09gSPT93wAiMveQGGRXusxFPfT1hT0=;
 b=CeBh1ZhqhwcuADIEkC6pGKFdtocBhhWIfvPuLZAeS7rbgpGyCevyx6l0JI6qSGiQMq5TPO
 2gk5AWdx1Mj4a6SNMsHhBg2+im+mu7T3Z/dQtagrwub+BnoZhpuYZDkQ6i8iZciFfgBH15
 rKat0Jlp70l/xA5B6l4kvQzQdenNdBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1678267944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRhdTGy8y0mlk09gSPT93wAiMveQGGRXusxFPfT1hT0=;
 b=n1g4oJvmYmFgk0cKJEHa54A0xmLzhK66Vzl6PWpDYDCmwDsMfnEuA2/FRufs+aR2vBrLA/
 CeyCPshFQk85KzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF01E1391B;
 Wed,  8 Mar 2023 09:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YKN+KChWCGTFPAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 08 Mar 2023 09:32:24 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  8 Mar 2023 10:32:19 +0100
Message-Id: <20230308093219.27090-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308093219.27090-1-pvorel@suse.cz>
References: <20230308093219.27090-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] insmod01.sh: Skip test on enabled lockdown
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

Lockdown patchset does not allow to install LTP kernel module:

insmod: ERROR: could not insert module ltp_insmod01.ko: Operation not permitted
insmod01 1 TFAIL: insmod failed

Therefore skip the test on enabled lockdown.

Link: https://bugzilla.opensuse.org/show_bug.cgi?id=1208920
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/commands/insmod/insmod01.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/commands/insmod/insmod01.sh b/testcases/commands/insmod/insmod01.sh
index 1881ba389..fb1e56459 100755
--- a/testcases/commands/insmod/insmod01.sh
+++ b/testcases/commands/insmod/insmod01.sh
@@ -1,6 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2016 Fujitsu Ltd.
+# Copyright (c) Linux Test Project, 2016-2023
 # Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
 #
 # Test basic functionality of insmod command.
@@ -10,6 +11,7 @@ TST_TESTFUNC=do_test
 TST_NEEDS_ROOT=1
 TST_NEEDS_CMDS="rmmod insmod"
 TST_NEEDS_MODULE="ltp_insmod01.ko"
+TST_SKIP_IN_LOCKDOWN=1
 
 inserted=0
 
-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
