Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 299DF58C619
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 12:10:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5121A3C94CC
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Aug 2022 12:10:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 578A63C9436
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 12:10:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1A0860017F
 for <ltp@lists.linux.it>; Mon,  8 Aug 2022 12:10:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2C87E37625;
 Mon,  8 Aug 2022 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659953425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00JkXsI797OwYYAwdQQAII3gmT3xMbk0JFHpvLD6lA0=;
 b=J27LQlFxmn70dAQwIdjWtooTkRbtNmHjtRXHVNw21Gsizga1nyYJIsSsjOuhmRwm+yILYH
 PNvWLmmzq98fy4mYY6KrLttvTTHd3pAsTgQHFhdOYVNi1xr/ZUq+dY/s9T35Gnyus7ZBcS
 Eo6Uu9C7cs4MVl1P5fs81YviCkOLoPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659953425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00JkXsI797OwYYAwdQQAII3gmT3xMbk0JFHpvLD6lA0=;
 b=ySZDQYxRWAYAwcWjTlVKHQjZPeSV17KMLcVQHEhNbUCCF2RaTPqrOWEHwxtfgLJfE6qJ37
 EJUEPrXz/Q58M3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06A8613ADE;
 Mon,  8 Aug 2022 10:10:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKs6ABHh8GKkAgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 08 Aug 2022 10:10:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  8 Aug 2022 12:10:18 +0200
Message-Id: <20220808101019.29892-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808101019.29892-1-pvorel@suse.cz>
References: <20220808101019.29892-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/4] tst_test.sh: Fix _tst_cleanup_timer() on set -e
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

If test exits on time (i.e. no timeout) kill in _tst_cleanup_timer()
have nothing to kill therefore following wait exits 143.

set -e (or #!/bin/sh -e or set -o errexit) quits on any non-zero exit code,
harden _tst_cleanup_timer() to be able to be used on scripts with it.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 356af0106..1d2bf06cc 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -518,7 +518,7 @@ _tst_cleanup_timer()
 {
 	if [ -n "$_tst_setup_timer_pid" ]; then
 		kill -TERM $_tst_setup_timer_pid 2>/dev/null
-		wait $_tst_setup_timer_pid 2>/dev/null
+		wait $_tst_setup_timer_pid 2>/dev/null || true
 	fi
 }
 
-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
