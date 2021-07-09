Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645F3C257A
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 16:01:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DB4B3C8997
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 16:01:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5F643C6E46
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 16:01:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C17CE200C9D
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 16:01:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7A592217D;
 Fri,  9 Jul 2021 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625839309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oIAFWNBhafjPwtl7l9AyWqqrJkBkj3TfAxLpuDZV0aw=;
 b=xlTCcGx3mtlBkydFDJUB6LmXjfipaJJIOyucvwGOneJ08ORG1j/NFje0d5z8qo7+ua2Aok
 FFqLRbdy0pRmkBBu4Ec+sbyPpOm9rF0ug+fKcICwcYnEp4A5eVxkEGxqHg1tOqjD7OcAjH
 SHNdyXQNjPtsWrKDa2XvLbnsrGci2h4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625839309;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oIAFWNBhafjPwtl7l9AyWqqrJkBkj3TfAxLpuDZV0aw=;
 b=LXIdTK6BOG00HlNNZ1QNQxCOZDHawmA55uvtCjab6gyYDRvvE/oyC4TAI183uDMY92HqJr
 LSPiF+N6+nfBFHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC79B13A2C;
 Fri,  9 Jul 2021 14:01:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a0N7Lc1W6GAgKAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 09 Jul 2021 14:01:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  9 Jul 2021 16:01:43 +0200
Message-Id: <20210709140143.9180-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_net.sh: Declare prefix variable as empty
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

From: Petr Vorel <petr.vorel@gmail.com>

in tst_ipaddr_un(). This is required to fix problem on dash, which
(unlike bash and busybox ash implementation) takes value of previously
defined variable, i.e.  guarding with local does not work:

$ foo=ee; bar() { local foo; echo "foo: '$foo'"; }; bar
foo: 'ee'

It requires declare it as empty:
$ foo=ee; bar() { local foo=; echo "foo: '$foo'"; }; bar
foo: ''

This problem seems to be on various dash versions from 0.5.8 to
0.5.11+git20200708+dd9ef66-5 (on Debian oldstable, stable, testing).
It'd require to set all variables, but now fix just prefix, which is
used in build.sh and it's quite common name.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index db1db4790..52975f37b 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -408,7 +408,7 @@ tst_ipaddr_un()
 	local max_net_id=$default_max
 	local min_net_id=0
 
-	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix tmp type
+	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix= tmp type
 
 	local OPTIND
 	while getopts "c:h:n:p" opt; do
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
