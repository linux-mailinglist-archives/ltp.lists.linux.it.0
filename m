Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A35B979B
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 11:37:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFA273CAC03
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 11:37:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EAB013CAC19
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 11:36:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6ED616001E7
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 11:36:48 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E04333744;
 Thu, 15 Sep 2022 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663234608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63FVmF3NFoWswl/iE/GD7+FoqaCfpwJm1RTJ5VAutgQ=;
 b=VRm4JJP7wf5wnM1mcWXKY5kdp0zm1UteHoCk3qw3dwidSZ4r6oywzjhwQUNVO/eNRt7LpG
 V9F7Mr8XfuohIIxUTkFH1mUldBG2WjSA5zUq8G34/PwOmBRRsarmnVox44KHQp3c4jBESO
 VDSvNtcAwQ6Zr+r4rH9nPkfRgAmfm+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663234608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63FVmF3NFoWswl/iE/GD7+FoqaCfpwJm1RTJ5VAutgQ=;
 b=gkg80GNHoZvKyLsSbh8vWtz546d4Nyoz4KyCFiA00+oRul3k/uPnkkJN+FNG6STEX42/Fy
 dLr3pIrVycbtiAAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AE69313310;
 Thu, 15 Sep 2022 09:36:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id AHhzKC/yImPGIgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 15 Sep 2022 09:36:47 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Sep 2022 11:36:37 +0200
Message-Id: <20220915093639.2261-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915093639.2261-1-pvorel@suse.cz>
References: <20220915093639.2261-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v6 6/8] tst_test.sh: Allow | after whitelisted variable
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

    Variable followed by other variable was not whitelisted:
    e.g.:
	TST_FS_TYPE|fuseblk
    TWARN: Reserved variable TST_FS_TYPE$ used!

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 55d96f17d..e92e0ce7f 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -643,7 +643,7 @@ tst_run()
 	local _tst_fs
 	local _tst_max
 	local _tst_name
-	local _tst_pattern='[='\''"} \t\/:`$\;].*'
+	local _tst_pattern='[='\''"} \t\/:`$\;|].*'
 	local ret
 
 	if [ -n "$TST_TEST_PATH" ]; then
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
