Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EEE39A400
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:10:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54E123C92BD
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 17:10:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEC7F3C2873
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:10:20 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6A1F1200778
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 17:10:19 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 087F71FD4D;
 Thu,  3 Jun 2021 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622733019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFc0gJ4k9cjLSzaoJqbCdB05X331QFUbtaF+1vemkXA=;
 b=14eZdbINUZqjZSRXLITENUUEhU7l6pS2U640FXpAyyV6lyA+ij3znKuSdgOHaxyWTgZNVF
 hmB1ItDxIFv7TCphUja2teKuv/hC/taa0mg0BojArw3g3C/qvf0r5/XgwF09tg+WjRx2LD
 E/lJWMJTcqNSEurYDIYXcp0/dr46zxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622733019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFc0gJ4k9cjLSzaoJqbCdB05X331QFUbtaF+1vemkXA=;
 b=+Ip978fcuy1fK1Zea9/H7HE9OqQ1IeHlv4DD0tRQljqEp3J7435CSmYLNRrujPqj4uHt99
 ClMEqDYGHfvS9aBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CCFF6118DD;
 Thu,  3 Jun 2021 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622733019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFc0gJ4k9cjLSzaoJqbCdB05X331QFUbtaF+1vemkXA=;
 b=14eZdbINUZqjZSRXLITENUUEhU7l6pS2U640FXpAyyV6lyA+ij3znKuSdgOHaxyWTgZNVF
 hmB1ItDxIFv7TCphUja2teKuv/hC/taa0mg0BojArw3g3C/qvf0r5/XgwF09tg+WjRx2LD
 E/lJWMJTcqNSEurYDIYXcp0/dr46zxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622733019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFc0gJ4k9cjLSzaoJqbCdB05X331QFUbtaF+1vemkXA=;
 b=+Ip978fcuy1fK1Zea9/H7HE9OqQ1IeHlv4DD0tRQljqEp3J7435CSmYLNRrujPqj4uHt99
 ClMEqDYGHfvS9aBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0B/QMNrwuGAoXQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 15:10:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 17:10:12 +0200
Message-Id: <20210603151012.14760-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603151012.14760-1-pvorel@suse.cz>
References: <20210603151012.14760-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_ipaddr_un.sh: Properly disable netns
 initialization
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

It stopped working due 40110018e, but even before there were issues:

tst_ipaddr_un 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
tst_ipaddr_un 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
cat: /sys/class/net/eth0/mtu: No such file or directory
cat: /sys/class/net/eth0/address: No such file or directory

Fixes: 807d60628 ("net: Add tst_ipaddr_un.sh test")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/net/tst_ipaddr_un.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/newlib_tests/shell/net/tst_ipaddr_un.sh b/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
index 512d6d880..e7730b8d0 100755
--- a/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
+++ b/lib/newlib_tests/shell/net/tst_ipaddr_un.sh
@@ -7,8 +7,11 @@ TST_CNT=2
 
 PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
 
-# workaround to disable netns initialization
-RHOST="foo"
+TST_NET_SKIP_VARIABLE_INIT=1
+
+# from tst_net_vars.c
+IPV4_NET16_UNUSED="10.23"
+IPV6_NET32_UNUSED="fd00:23"
 
 . tst_net.sh
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
