Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50172395E17
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:53:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C67863C9099
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 15:53:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF18D3C805F
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:53:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90F6E600565
 for <ltp@lists.linux.it>; Mon, 31 May 2021 15:53:16 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4177D2191F
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622469196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJW+cGjjmwOzV0lGl52BaddmLzfdTaXMBOhtsTOAV7E=;
 b=DTIBm3kHIUKb6Gjr0HAVZtuAYtD+80hNnpb7INpnVYgIAcWZDf2oxIwt37luJ7fBNKYcsq
 g+C/QRJ1uY4ECIgpq9SPW8uKyB7srPYYBtnKiepQov1fNwlAIQepOdc5WqyDttaYXA6tWd
 613wiP40ggsqYVSZPUOmQDGjUoAVtdI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622469196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJW+cGjjmwOzV0lGl52BaddmLzfdTaXMBOhtsTOAV7E=;
 b=jFeRw3My+5hOB706ivdmx9MZ1z+ZliQzOjV93ZzfaRKyF/bUAIZGuWbaMUSg+v2Q0nh9T6
 NTzXsBB63sh1NHCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3109411A98
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622469195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJW+cGjjmwOzV0lGl52BaddmLzfdTaXMBOhtsTOAV7E=;
 b=1R2PZU8O9hQrikm9CmYF+YC3PTo6I44CoCnrQ+tpMsVWj+jXfmL92+RPyFhFwF/DsL0JyS
 OU3fZjSkmdmwpBZ+M/zr3RQsUfqjtOhC09vLROYvTav+K0NGuvN7ByqelinoNv2AS90ie1
 HaIewP51DOZAO7B4X9uENI/ZU3jDvXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622469195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJW+cGjjmwOzV0lGl52BaddmLzfdTaXMBOhtsTOAV7E=;
 b=HfQ1/s+aVbsDxmbgxekQoRAZJEcV3h0KgCKAUSGSIoEReC48AdiFCmfYb8ZiIn2KiF0uh6
 qE37dbJ7pzPv9qBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0BM5C0vqtGAkagAALh3uQQ (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:53:15 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 31 May 2021 15:53:14 +0200
Message-Id: <20210531135314.5067-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531135314.5067-1-mdoucha@suse.cz>
References: <20210531135314.5067-1-mdoucha@suse.cz>
MIME-Version: 1.0
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 4.00
X-Spamd-Result: default: False [4.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_NONE(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCPT_COUNT_ONE(0.00)[1];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] network/busy_poll: Remove unnecessary driver check
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

Kernel v4.5 extended the busy_poll functionality to all network drivers.
Limiting the test only to drivers which implemented busy_poll as internal
feature on older kernels does not make sense.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/network/busy_poll/busy_poll_lib.sh | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/testcases/network/busy_poll/busy_poll_lib.sh b/testcases/network/busy_poll/busy_poll_lib.sh
index 5270a1bbd..d17504466 100755
--- a/testcases/network/busy_poll/busy_poll_lib.sh
+++ b/testcases/network/busy_poll/busy_poll_lib.sh
@@ -25,9 +25,5 @@ busy_poll_check_config()
 		ethtool --show-features $(tst_iface) | \
 			grep -q 'busy-poll.*on' || \
 			tst_brk TCONF "busy poll not supported by driver"
-	else
-		drvs="bnx2x|bnxt|cxgb4|enic|benet|ixgbe|ixgbevf|mlx4|mlx5|myri10ge|sfc|virtio"
-		ethtool -i $(tst_iface) | grep -qE "driver: ($drvs)" || \
-			tst_brk TCONF "busy poll not supported"
 	fi
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
