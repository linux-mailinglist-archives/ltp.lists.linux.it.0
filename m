Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661E175F00
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 16:59:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6956B3C6800
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 16:59:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 19DB73C67F2
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 16:59:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E51A10005FD
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 16:59:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01680AED7;
 Mon,  2 Mar 2020 15:59:05 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Mar 2020 16:58:57 +0100
Message-Id: <20200302155857.923-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] nfs: Add fsid=PID to exportfs
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

Following 0ccbcfc38 ("syscalls/statx07: add fsid= to exports"):

Not all filesystems are stored on devices, and not all filesystems
have UUIDs. tmpfs is one of them, which lead to test failing:
/tmp/XRzHSG/server requires fsid= for NFS export

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey,

simple fix, but better to check.
I'm working on more NFS related fixes.

Kind regards,
Petr

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index e4a0c7e27..66f2fb038 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -48,7 +48,7 @@ get_socket_type()
 
 nfs_setup_server()
 {
-	local export_cmd="exportfs -i -o no_root_squash,rw *:$remote_dir"
+	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
 
 	if [ -n "$LTP_NETNS" ]; then
 		if [ ! -d $remote_dir ]; then
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
