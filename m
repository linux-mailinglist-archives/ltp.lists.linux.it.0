Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFF39A3FE
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:10:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA81A3C87FD
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:10:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79EE43C2873
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:10:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B060D600C89
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:10:19 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C63FB219FA;
 Thu,  3 Jun 2021 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622733018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dONBbZo7u1cDAS80iOGrHn8qDA2snnUMqx4O0x8/iCs=;
 b=aTSVeUd3CoatAoCAS4jkS9u7WFpZPt6XeW1pE5sGUZ3JShpNx8qewvZHPPr3kvKK2R0kcd
 9NuBcfCT6HW91Cl4Z3ucCM7Nyb8VAzm9vEmIT1OGlc2oDncGYGHdgmQSkUlkHttriG99St
 bSLsKhpa3XtkNm6C2Pi4LOlgSsx22sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622733018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dONBbZo7u1cDAS80iOGrHn8qDA2snnUMqx4O0x8/iCs=;
 b=mQ6telwDUMURb3gxPMaAVilvh6gim+MAghQtJ0F6o9voPC6r35cKTYLlY5Q2utaig04wSw
 03rUtEkkP2d2VsBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 94256118DD;
 Thu,  3 Jun 2021 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622733018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dONBbZo7u1cDAS80iOGrHn8qDA2snnUMqx4O0x8/iCs=;
 b=aTSVeUd3CoatAoCAS4jkS9u7WFpZPt6XeW1pE5sGUZ3JShpNx8qewvZHPPr3kvKK2R0kcd
 9NuBcfCT6HW91Cl4Z3ucCM7Nyb8VAzm9vEmIT1OGlc2oDncGYGHdgmQSkUlkHttriG99St
 bSLsKhpa3XtkNm6C2Pi4LOlgSsx22sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622733018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dONBbZo7u1cDAS80iOGrHn8qDA2snnUMqx4O0x8/iCs=;
 b=mQ6telwDUMURb3gxPMaAVilvh6gim+MAghQtJ0F6o9voPC6r35cKTYLlY5Q2utaig04wSw
 03rUtEkkP2d2VsBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id lVprItrwuGAoXQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 15:10:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 17:10:11 +0200
Message-Id: <20210603151012.14760-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_net.sh: Allow to skip initialization
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

with TST_NET_SKIP_VARIABLE_INIT=1.
Useful for testing the library itself.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh  | 2 ++
 testcases/lib/tst_test.sh | 1 +
 2 files changed, 3 insertions(+)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index fc5719057..db1db4790 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -933,6 +933,8 @@ tst_default_max_pkt()
 	echo "$((mtu + mtu / 10))"
 }
 
+[ -n "$TST_NET_SKIP_VARIABLE_INIT" ] && return 0
+
 # Management Link
 [ -z "$RHOST" ] && TST_USE_NETNS="yes"
 export RHOST="$RHOST"
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 66ffde4eb..8b4e9cb60 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -559,6 +559,7 @@ tst_run()
 			IPV6|IPV6_FLAG|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
 			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG|NETLOAD_CLN_NUMBER);;
+			NET_SKIP_VARIABLE_INIT);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
