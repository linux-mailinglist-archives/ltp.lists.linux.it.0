Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E36F1C20
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 18:00:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5CB93CDA1F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 18:00:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8E093CB32D
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 18:00:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1FF982001AF
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 18:00:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9E9B21F11;
 Fri, 28 Apr 2023 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682697631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eArH7PdFvvavwtKQoM+rHGjXGGAWvEMO23tgmGyhmN8=;
 b=0SSh89UZfBnFaCZlsPGJfoAa4DMoNJhsev+5m0QFtetch73UtANxC5NMtir/ZY5Z4sKAos
 pgueAr02KfocnNOTry4AyX/RWUxVXcmYPcekr+39d8Xxytz2GVnpJ5Jtb/dzPSwi0OrMNa
 kdXVQVYzqrGglbNxyUIvklNAZEPnOY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682697631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eArH7PdFvvavwtKQoM+rHGjXGGAWvEMO23tgmGyhmN8=;
 b=EqgGemjePAD9ryz0Td69lnUqCAFoBWJ9H2ZLYh0MTkOmNDYqXdFuvPop1lWk7+zdP9g+BM
 h+3s3CYaLTRR8jCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 68AEF138FA;
 Fri, 28 Apr 2023 16:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WGu2F5/tS2SRbQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 28 Apr 2023 16:00:31 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 Apr 2023 18:00:37 +0200
Message-Id: <20230428160038.3534905-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428160038.3534905-1-pvorel@suse.cz>
References: <20230428160038.3534905-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] nfs05.sh: Lower down the default values
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
Cc: NeilBrown <neilb@suse.de>, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

nfs05_make_tree.c runs make which needs on Btrfs quite a lot of
temporary space. This is a preparation for the next commit which
start using all filesystems via TST_ALL_FILESYSTEMS=1. Currently we use
300 MB, which was not enough for Btrfs:

Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/loop0     btrfs     300M   62M   20K 100% /tmp/LTP_nfs05.Vau10kcszO/mntpoint

After lowering the default values 96% (58M) is being used.

Proper solution would be to detect available size in nfs05_make_tree.c
and lower down values based on free space.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v4.

 testcases/network/nfs/nfs_stress/nfs05.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs05.sh b/testcases/network/nfs/nfs_stress/nfs05.sh
index c18ef1ab4..34151b67a 100755
--- a/testcases/network/nfs/nfs_stress/nfs05.sh
+++ b/testcases/network/nfs/nfs_stress/nfs05.sh
@@ -8,8 +8,8 @@
 #
 # Created by: Robbie Williamson (robbiew@us.ibm.com)
 
-DIR_NUM=${DIR_NUM:-"10"}
-FILE_NUM=${FILE_NUM:-"30"}
+DIR_NUM=${DIR_NUM:-"8"}
+FILE_NUM=${FILE_NUM:-"28"}
 THREAD_NUM=${THREAD_NUM:-"8"}
 TST_NEEDS_CMDS="make gcc"
 TST_TESTFUNC="do_test"
-- 
2.40.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
