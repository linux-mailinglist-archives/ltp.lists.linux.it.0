Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qxgULUm6eGmcsgEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:14:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213B94B8F
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:14:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE0623CACFD
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jan 2026 14:14:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 045153CAC2E
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 14:14:38 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 696E610009B6
 for <ltp@lists.linux.it>; Tue, 27 Jan 2026 14:14:38 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8BC25BCC2;
 Tue, 27 Jan 2026 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769519677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGUa67E37/IbP/DdZGCmNducjr5ArOxWMrq5MAclV/o=;
 b=m1BhqRtx28gc0ys0hJcIN9aKYOVA7UxbPLrR8aQ4C5++znGZhmoDPByZo58q2nXeaAcwUt
 jvJKjQdCotU+l4ObfcpMUaAD5PHBxk4hmShW/LQMlwxgHKhIyyOt/DGzqjL+zKQ9efxfIh
 crRL7Ijr6/PP6gUC9dvfWb31VHljpZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769519677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGUa67E37/IbP/DdZGCmNducjr5ArOxWMrq5MAclV/o=;
 b=Ps63FXTlafAtVRVnQT8Ye6nufJxK6g1+PayWFxTJhP4qjq17/qhZbfBWF4V5d3KN49RgTp
 ySLmAO6nQcdmY/Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769519676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGUa67E37/IbP/DdZGCmNducjr5ArOxWMrq5MAclV/o=;
 b=TlJZveBpncLV85b2m76+HRWsT7wBXXiWrtA/5x8d7y9mFfpktshM2DDY3p76mzG2VIiqJ1
 /SyMRy5JN0YgibRcX+tQ7WyBlzyIhmmYuyJZg/i+QjbanabOyF3klmWs7fLFH9d2Q028Ag
 zlkPdwA+P/hTj544I9jQ3b9Ulu9ylqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769519676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGUa67E37/IbP/DdZGCmNducjr5ArOxWMrq5MAclV/o=;
 b=haquyeXaL/vGJ4cppD+pxsmVufUX2UVP3Z4KmMEvvMbDlShsgXLXjpE2jxlEcLeL6pMmvq
 sp/RWKLpOVz0caBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B3273EA62;
 Tue, 27 Jan 2026 13:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Dj/JDy6eGnbewAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jan 2026 13:14:36 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 27 Jan 2026 14:14:26 +0100
Message-ID: <20260127131427.146592-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127131427.146592-1-pvorel@suse.cz>
References: <20260127131427.146592-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] tst_net.sh: Fix tst_brk() use in tst_netload_brk()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.cz:mid,suse.cz:email]
X-Rspamd-Queue-Id: 5213B94B8F
X-Rspamd-Action: no action

Since 1878502f63 ("tst_test.sh/tst_brk(): Allow only TBROK and TCONF")
it's not possible to use tst_brk() with TFAIL. Call tst_res() followed
by tst_brk() for TFAIL/TWARN.

Also convert failure on missing file to TBROK.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Alternative would be to revert 1878502f63.

 testcases/lib/tst_net.sh | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 20f669f56e..76f6b20e31 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -741,7 +741,12 @@ tst_netload_print_log()
 tst_netload_brk()
 {
 	tst_netload_print_log
-	tst_brk_ $1 $2
+	if [ "$1" != TBROK -a "$1" != TCONF ]; then
+		tst_res_ $1 $2
+		tst_brk_ TBROK "quit due previous failures"
+	else
+		tst_brk_ $1 $2
+	fi
 }
 
 # Run network load test, see 'netstress -h' for option description
@@ -863,8 +868,7 @@ tst_netload()
 			continue
 		fi
 
-		[ ! -f $rfile ] && \
-			tst_netload_brk TFAIL "can't read $rfile"
+		[ ! -f $rfile ] && tst_netload_brk TBROK "can't read $rfile"
 
 		results="$results $(cat $rfile)"
 		passed=$((passed + 1))
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
