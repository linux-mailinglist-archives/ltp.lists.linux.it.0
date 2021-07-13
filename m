Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A023C6E43
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:13:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A92493C8767
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:13:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11DA33C6756
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 85B6C600871
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 445E82008E;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=982sInqm9UCajpGAz5LYlDISlgckIUbp8EOfRnbrYHA=;
 b=z/It52pqOZgaYWR1kUrKO36xuemwSPHjxTKNyelvW+vPX1uRLm9GdHZptXXISDqIymYnE2
 nr7l1jqdZI4wxLgAs4dbtuylkhauvvrN2XPTujUEOdaxbFXqy7+Z2rGSkPFh8konSSxyvG
 vqxhBk/jKkaO6CEPi3p2yYd7fMuXywU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=982sInqm9UCajpGAz5LYlDISlgckIUbp8EOfRnbrYHA=;
 b=5v06qmpK89Y1ZSzvBDLlhqRplSllzAYjrFCQt3K0InCHBlTZwMTT6zwDfzItAnRHYu4JE6
 WmN8gj/gCy2Jh1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 013F413BD3;
 Tue, 13 Jul 2021 10:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2HwqOlhn7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:33 +0200
Message-Id: <20210713101338.6985-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/7] tst_net.sh: Declare prefix variable as empty
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

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

Reviewed-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v4.

 testcases/lib/tst_net.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index db1db4790..511fb7eb1 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2016-2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2016-2021 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 
 [ -n "$TST_LIB_NET_LOADED" ] && return 0
@@ -408,7 +408,7 @@ tst_ipaddr_un()
 	local max_net_id=$default_max
 	local min_net_id=0
 
-	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix tmp type
+	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix= tmp type
 
 	local OPTIND
 	while getopts "c:h:n:p" opt; do
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
