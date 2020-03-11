Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C6182003
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 18:50:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C0693C71FC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 18:50:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9C92D3C7080
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 18:50:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 06717601CBE
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 18:50:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 470EBAEC7;
 Wed, 11 Mar 2020 17:50:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 11 Mar 2020 18:50:09 +0100
Message-Id: <20200311175011.12171-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] nfs_lib: Unify remote directory creation
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

remote directory creation can be done by tst_rhost_run() also on netns.
This simplifies code a bit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1-v2:
* remove changes in nfs_mount() (to keep using netns)

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 66f2fb038..f233976c7 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -50,14 +50,6 @@ nfs_setup_server()
 {
 	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
 
-	if [ -n "$LTP_NETNS" ]; then
-		if [ ! -d $remote_dir ]; then
-			mkdir -p $remote_dir
-			ROD $export_cmd
-		fi
-		return
-	fi
-
 	if ! tst_rhost_run -c "test -d $remote_dir"; then
 		tst_rhost_run -s -c "mkdir -p $remote_dir; $export_cmd"
 	fi
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
