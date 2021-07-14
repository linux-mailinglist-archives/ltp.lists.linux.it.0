Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8D3C85C5
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAFA73C8651
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 344A63C9BF5
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:07:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 412721401167
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:07:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAC1422A29;
 Wed, 14 Jul 2021 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626271649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fMzTisR9VK9mIJi38e0/Y/b8YB83J2TvktR3CQIDks=;
 b=1ZQZi+0glQkxxUZBqGQYOfsuWP58twEyfpCqeBOX67gR5V5BtKt0fWY2/R82keOIr9h8NO
 Eqrwxi1xW165uIsxJHQpAZNzYEFtiQGIP4m+DBXB3TZRzWkkIXqroAewro4XytddPHlii7
 ATWs+tmp+igPiIPsC6pX/UJ6faziSFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626271649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fMzTisR9VK9mIJi38e0/Y/b8YB83J2TvktR3CQIDks=;
 b=VblSlsGaycTLTW8bTGYRiRx2luyhdDSVUre586OkKVFCWoqvPmjhpHSHmQb0ZbJ9gtXSrb
 PClAz3FHwVIHR4Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 84DA713C05;
 Wed, 14 Jul 2021 14:07:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +L7UHqHv7mC/cgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:07:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 16:07:16 +0200
Message-Id: <20210714140716.1568-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714140716.1568-1-pvorel@suse.cz>
References: <20210714140716.1568-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] broken_ip: TCONF when test run on unsupported
 protocol
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

net_stress.broken_ip runtest file is correct, but some users try to run
tests manually.

Fixes: #843

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/stress/broken_ip/broken_ip-checksum | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-fragment | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-ihl      | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-nexthdr  | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-protcol  | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/testcases/network/stress/broken_ip/broken_ip-checksum b/testcases/network/stress/broken_ip/broken_ip-checksum
index 78f00ce98..707ffcb29 100644
--- a/testcases/network/stress/broken_ip/broken_ip-checksum
+++ b/testcases/network/stress/broken_ip/broken_ip-checksum
@@ -1,11 +1,12 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2006
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
 TST_TESTFUNC="do_test"
+TST_NET_IPV4_ONLY=1
 . tst_net.sh
 
 do_test()
diff --git a/testcases/network/stress/broken_ip/broken_ip-fragment b/testcases/network/stress/broken_ip/broken_ip-fragment
index 1f5e5f713..7356bb523 100644
--- a/testcases/network/stress/broken_ip/broken_ip-fragment
+++ b/testcases/network/stress/broken_ip/broken_ip-fragment
@@ -1,11 +1,12 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2006
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
 TST_TESTFUNC="do_test"
+TST_NET_IPV4_ONLY=1
 . tst_net.sh
 
 do_test()
diff --git a/testcases/network/stress/broken_ip/broken_ip-ihl b/testcases/network/stress/broken_ip/broken_ip-ihl
index 9f2a42568..e5e41ee8e 100644
--- a/testcases/network/stress/broken_ip/broken_ip-ihl
+++ b/testcases/network/stress/broken_ip/broken_ip-ihl
@@ -1,11 +1,12 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2006
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
 TST_TESTFUNC="do_test"
+TST_NET_IPV4_ONLY=1
 . tst_net.sh
 
 do_test()
diff --git a/testcases/network/stress/broken_ip/broken_ip-nexthdr b/testcases/network/stress/broken_ip/broken_ip-nexthdr
index 475b92b16..2ab0601ac 100644
--- a/testcases/network/stress/broken_ip/broken_ip-nexthdr
+++ b/testcases/network/stress/broken_ip/broken_ip-nexthdr
@@ -1,11 +1,12 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2006
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
 TST_TESTFUNC="do_test"
+TST_NET_IPV6_ONLY=1
 . tst_net.sh
 
 do_test()
diff --git a/testcases/network/stress/broken_ip/broken_ip-protcol b/testcases/network/stress/broken_ip/broken_ip-protcol
index a91cdaaeb..9f9275f03 100644
--- a/testcases/network/stress/broken_ip/broken_ip-protcol
+++ b/testcases/network/stress/broken_ip/broken_ip-protcol
@@ -1,11 +1,12 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2006
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
 TST_TESTFUNC="do_test"
+TST_NET_IPV4_ONLY=1
 . tst_net.sh
 
 do_test()
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
