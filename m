Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB13A868D
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADDCC3C71D6
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 18:33:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3013C3C2794
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C3E7A1400FA7
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 18:33:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5D10E1FD66;
 Tue, 15 Jun 2021 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrlxPQVUb5IIbjoES3awXRnyC1CtySKOZARCMOHCV+4=;
 b=x0arYgRVjBvzVsd4Rg059PMSiZWF9EiQcU/mj0TN34+E90CuokA2fI8NX6rZgBOIUsuRid
 EKpjnm+gc1LfSQJYy0F9VVOhkVdFf056vi1VvF/hNg3gsInZZQ57B8rF8zJ3L4jP34r14R
 vWNk+JQy1N2FOsdPRKSJDzrvL2zb978=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrlxPQVUb5IIbjoES3awXRnyC1CtySKOZARCMOHCV+4=;
 b=LWtLSo3Z55zOvf7hqS4POCf8enKRidH29kZs2Ew36K69NeIO2ZIMZjSjP2a9K13GZjL8m+
 oo+VkcdtP/svoXAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id EF7F1118DD;
 Tue, 15 Jun 2021 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623774795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrlxPQVUb5IIbjoES3awXRnyC1CtySKOZARCMOHCV+4=;
 b=x0arYgRVjBvzVsd4Rg059PMSiZWF9EiQcU/mj0TN34+E90CuokA2fI8NX6rZgBOIUsuRid
 EKpjnm+gc1LfSQJYy0F9VVOhkVdFf056vi1VvF/hNg3gsInZZQ57B8rF8zJ3L4jP34r14R
 vWNk+JQy1N2FOsdPRKSJDzrvL2zb978=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623774795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrlxPQVUb5IIbjoES3awXRnyC1CtySKOZARCMOHCV+4=;
 b=LWtLSo3Z55zOvf7hqS4POCf8enKRidH29kZs2Ew36K69NeIO2ZIMZjSjP2a9K13GZjL8m+
 oo+VkcdtP/svoXAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0IFsN0rWyGDdfQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 16:33:14 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 15 Jun 2021 18:33:05 +0200
Message-Id: <20210615163307.10755-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210615163307.10755-1-pvorel@suse.cz>
References: <20210615163307.10755-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/3] tst_test.sh: Add $LTPROOT/testcases/bin into
 PATH
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

when LTPROOT set. Also TWARN when directory does not exist.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 8b4e9cb60..970eca7d1 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -697,6 +697,10 @@ if [ -z "$LTPROOT" ]; then
 	export LTPROOT="$PWD"
 	export TST_DATAROOT="$LTPROOT/datafiles"
 else
+	if [ ! -d "$LTPROOT/testcases/bin" ]; then
+		tst_res TWARN "$LTPROOT/testcases/bin does not exist, is \$LTPROOT properly set?"
+	fi
+	export PATH="$LTPROOT/testcases/bin:$PATH"
 	export TST_DATAROOT="$LTPROOT/testcases/data/$TST_ID"
 fi
 
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
