Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEAD182005
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 18:50:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBBCA3C721B
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 18:50:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C24663C7082
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 18:50:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E639F6006D4
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 18:50:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73B7CAEED;
 Wed, 11 Mar 2020 17:50:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 11 Mar 2020 18:50:11 +0100
Message-Id: <20200311175011.12171-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311175011.12171-1-pvorel@suse.cz>
References: <20200311175011.12171-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] nfs_lib: Add option to run traffic via lo on
 netns
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

When $LTP_NFS_NETNS_USE_LO set and test is using netns ($TST_USE_NETNS
set) NFS traffic will go through lo interface instead of ltp_ns_veth*
netns interfaces. This can be useful for debugging whether test failures
are related to veth/netns.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1-v2:
* new commit

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 3d447783d..b7c372afb 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -31,6 +31,11 @@ TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
 TST_SETUP="${TST_SETUP:-nfs_setup}"
 TST_CLEANUP="${TST_CLEANUP:-nfs_cleanup}"
 
+# When set and test is using netns ($TST_USE_NETNS set) NFS traffic will go
+# through lo interface instead of ltp_ns_veth* netns interfaces (useful for
+# debugging whether test failures are related to veth/netns).
+LTP_NFS_NETNS_USE_LO=
+
 . tst_net.sh
 
 get_socket_type()
@@ -52,6 +57,7 @@ nfs_server_udp_enabled()
 
 	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
 	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ] && printf "$f "; done')
+
 	tst_rhost_run -c "grep -q '^[# ]*udp *= *y' /etc/nfs.conf $config"
 }
 
@@ -80,7 +86,7 @@ nfs_mount()
 	local mnt_cmd="mount -t nfs $opts $mount_dir $local_dir"
 
 	tst_res TINFO "Mounting NFS: $mnt_cmd"
-	if [ -n "$LTP_NETNS" ]; then
+	if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
 		tst_rhost_run -s -c "$mnt_cmd"
 		return
 	fi
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
