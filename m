Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6344AB3F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Nov 2021 11:11:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03EE13C08DA
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Nov 2021 11:11:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D7A93C03B1
 for <ltp@lists.linux.it>; Tue,  9 Nov 2021 11:11:54 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B82CE2000F0
 for <ltp@lists.linux.it>; Tue,  9 Nov 2021 11:11:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAFA91FDB7;
 Tue,  9 Nov 2021 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636452712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9w4AMYyckxWKsJN2G+AG1jqjtGgClaXqfqWAAAmd8FY=;
 b=hED/3BFWin3+d1byQgESVB2hbPhP4UbjKyt1iXEdERP1Lb8KdWrjglw6RMA+ujiFcpJEQy
 3MfPSGOb8ONp/2a/yfNlt2TLBnK5GWunYO7084CHowvl4OFgkj/sFYtd22NVci2bwYKpQp
 2fCsXqpMc26OjtFMpcMx2ROMq6TBKD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636452712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9w4AMYyckxWKsJN2G+AG1jqjtGgClaXqfqWAAAmd8FY=;
 b=2L0xuRTiePuTG88NoqnBCetlnIwxV85h2C+q8XLRLxN5YvFyTDGljGcpUo5ERS/D1HPBun
 H0vARHuLdjwru+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A86B813481;
 Tue,  9 Nov 2021 10:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Gu8MJ2hJimHWagAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 09 Nov 2021 10:11:52 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  9 Nov 2021 11:11:45 +0100
Message-Id: <20211109101145.20092-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] test_zero_hugepage.sh: Lower hpages to 4
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

which is enough

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Yang Xu <xuyang2018.jy@fujitsu.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested on various distros, working.

Kind regards,
Petr

 lib/newlib_tests/test_zero_hugepage.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/newlib_tests/test_zero_hugepage.sh b/lib/newlib_tests/test_zero_hugepage.sh
index eed0a96f9..92bd7e331 100755
--- a/lib/newlib_tests/test_zero_hugepage.sh
+++ b/lib/newlib_tests/test_zero_hugepage.sh
@@ -25,7 +25,7 @@ if [ ! -w /proc/sys/vm/nr_hugepages ]; then
 	tconf "no write permission to /proc/sys/vm/nr_hugepages (run as root)"
 fi
 
-echo "128" > /proc/sys/vm/nr_hugepages
+echo 4 > /proc/sys/vm/nr_hugepages
 
 ./test_zero_hugepage
 
-- 
2.33.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
