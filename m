Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEFC6DECBC
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Apr 2023 09:40:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 424B93CC47B
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Apr 2023 09:40:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF7EB3CC46E
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 09:40:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F20A10006AA
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 09:40:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D87B218F6;
 Wed, 12 Apr 2023 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1681285203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rRlWazforyt3kozFxdj37Cz47WafMtsNUkz892zOj9M=;
 b=IAOJcoGtiXPSSy1aMm0M03RIgPy4kmPui3C1FLTe6IF78BUvMBEMwcxys1vj3KJxWDbDtm
 mhV8bDvrfLvz2hK/I/KH+aXiaM4LD+t3m6aB1pStgWY3uChE0/VauOm9ph0cI8M9ZH8hRt
 x+4Wsp6HxPs4XpkKzWqu2jMWaMuWJJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1681285203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rRlWazforyt3kozFxdj37Cz47WafMtsNUkz892zOj9M=;
 b=hbjpVN9/PYLP41u/jc8pEJv88OmiRyguIsYl2LlgiHBaBT4St2vQs2WdLOEVbpi9JUvPQU
 40YQsXbqt9EYaOBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 395F2132C7;
 Wed, 12 Apr 2023 07:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 76/6DFNgNmRzQAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 12 Apr 2023 07:40:03 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 Apr 2023 09:39:53 +0200
Message-Id: <20230412073953.1983857-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Remove possible double/trailing
 slashes from TMPDIR
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

NFS tests have problem when TMPDIR path contains double slashes,
because they grep exportfs output which is normalized.

Problem is either trailing slash:

$ TMPDIR=/var/tmp/ nfs01.sh -t tcp
...
nfs01 1 TINFO: Mounting NFS: mount -v -t nfs -o proto=tcp,vers=3 10.0.0.2:/var/tmp//LTP_nfs01.sIqm4LLS4u/3/tcp /var/tmp//LTP_nfs01.sIqm4LLS4u/3/0
nfs01 1 TINFO: starting 'nfs01_open_files 1000'
nfs01 1 TPASS: test finished successfully
nfs01 2 TINFO: Cleaning up testcase
nfs01 2 TINFO: remote_dir: '/var/tmp//LTP_nfs01.sIqm4LLS4u/3/tcp'
exportfs: Could not find '*:/var/tmp//LTP_nfs01.sIqm4LLS4u/3/tcp' to unexport.
rm: cannot remove '/var/tmp//LTP_nfs01.sIqm4LLS4u/3/0': Device or resource busy
rm: cannot remove '/var/tmp//LTP_nfs01.sIqm4LLS4u/3/0': Is a directory

or double (or more) slashes (anywhere in $TMPDIR):

$ TMPDIR=/var//tmp nfs01.sh -t tcp
nfs01 1 TINFO: Mounting NFS: mount -v -t nfs -o proto=tcp,vers=3 10.0.0.2:/var//tmp/LTP_nfs01.qNjSsopVbY/3/tcp /var//tmp/LTP_nfs01.qNjSsopVbY/3/0
nfs01 1 TINFO: starting 'nfs01_open_files 1000'
nfs01 1 TPASS: test finished successfully
nfs01 2 TINFO: Cleaning up testcase
nfs01 2 TINFO: remote_dir: '/var//tmp/LTP_nfs01.qNjSsopVbY/3/tcp'
exportfs: Could not find '*:/var//tmp/LTP_nfs01.qNjSsopVbY/3/tcp' to unexport.
rm: cannot remove '/var//tmp/LTP_nfs01.qNjSsopVbY/3/0': Device or resource busy
rm: cannot remove '/var//tmp/LTP_nfs01.qNjSsopVbY/3/0': Is a directory

While this could be handled in nfs_lib.sh, it's better to save it for
all tests. It's easier to modify $TST_TMPDIR, because the problem
narrows down to double slash.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c817eec77..42f60ab58 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -722,6 +722,8 @@ tst_run()
 		fi
 
 		TST_TMPDIR=$(mktemp -d "$TMPDIR/LTP_$TST_ID.XXXXXXXXXX")
+		# remove possible trailing slash or double slashes from TMPDIR
+		TST_TMPDIR=$(echo "$TST_TMPDIR" | sed 's~/\+~/~g')
 
 		chmod 777 "$TST_TMPDIR"
 
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
