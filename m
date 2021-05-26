Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EAE391E13
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 19:25:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7219B3CA76B
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 19:25:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 267FC3CA4BD
 for <ltp@lists.linux.it>; Wed, 26 May 2021 19:25:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A532A60086A
 for <ltp@lists.linux.it>; Wed, 26 May 2021 19:25:11 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 09DE6218D6;
 Wed, 26 May 2021 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622049911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK1nOwApoB060hVZEHApU/oevSCROkupDp1uSU4WGFk=;
 b=eol3yfsPu1+ki1WlO3dEloXfMopIP7VeNBzybI9iOwNRwjiZpGF8uJIrMEZ6IaChBSP65f
 45Cz+88N1L9x6J/RacxdvF7iU4pfGnm6lJGSK5sS4jzAslHvGVGTFBRsxXrd5jbzEyML1R
 146B+67PF2ixneNqtMxqSWB92SEOsAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622049911;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK1nOwApoB060hVZEHApU/oevSCROkupDp1uSU4WGFk=;
 b=Ge4MWO6Pw33JbeSTrAQ0K8vWWMZDoq67pkE5E+ZPS45V8M/Qw1ThPImUxwb1Fe7juZFAqS
 v6yyCQEStlgYddBg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id C090811A98;
 Wed, 26 May 2021 17:25:10 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 May 2021 19:25:03 +0200
Message-Id: <20210526172503.18621-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526172503.18621-1-pvorel@suse.cz>
References: <20210526172503.18621-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [LTP PATCH v2 3/3] nfs_lib.sh: Check running rpc.mountd,
 rpc.statd
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

NOTE: we're not checking rpcbind/portmap which is required for NFSv3,
as it's rpc.mountd dependency.

Deliberately not add pgrep as required dependency.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* check for rpc.mountd, rpc.statd
(previsously checked for rpc.mountd, rpcbind/portmap)

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 26b670c35..9bef1b86a 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -27,7 +27,7 @@ TST_PARSE_ARGS=nfs_parse_args
 TST_USAGE=nfs_usage
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
+TST_NEEDS_CMDS="$TST_NEEDS_CMDS exportfs mount"
 TST_SETUP="${TST_SETUP:-nfs_setup}"
 TST_CLEANUP="${TST_CLEANUP:-nfs_cleanup}"
 TST_NEEDS_DRIVERS="nfsd"
@@ -110,11 +110,6 @@ nfs_mount()
 
 nfs_setup()
 {
-	# Check if current filesystem is NFS
-	if [ "$(stat -f . | grep "Type: nfs")" ]; then
-		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
-	fi
-
 	local i
 	local type
 	local n=0
@@ -123,6 +118,16 @@ nfs_setup()
 	local remote_dir
 	local mount_dir
 
+	if [ "$(stat -f . | grep "Type: nfs")" ]; then
+		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
+	fi
+
+	if tst_cmd_available pgrep; then
+		for i in rpc.mountd rpc.statd; do
+			pgrep $i > /dev/null || tst_brk TCONF "$i not running"
+		done
+	fi
+
 	for i in $VERSION; do
 		type=$(get_socket_type $n)
 		tst_res TINFO "setup NFSv$i, socket type $type"
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
