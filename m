Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564017AEF7
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 20:27:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39F8C3C653B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 20:27:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B12B03C6510
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 20:27:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 238EE600819
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 20:27:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62157AED7;
 Thu,  5 Mar 2020 19:27:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 20:27:16 +0100
Message-Id: <20200305192716.10313-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305192716.10313-1-pvorel@suse.cz>
References: <20200305192716.10313-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] nfs: Detect disabled UDP
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

nfs-utils disabled serving NFS over UDP in version 2.2.1,
which produce TBROK:

nfs01 1 TBROK: 'mount -t nfs -o proto=udp,vers=3
10.0.0.2:/tmp/LTP_nfs01.3pixnljzEv/3/udp /tmp/LTP_nfs01.3pixnljzEv/3/0'
failed on '': 'mount.nfs: requested NFS version or transport protocol is
not supported'

Detect UDP configuration (parsing all configs) and return TCONF when disabled.

NOTE: Debian based distros still use older version, once it upgrades, it
will might keep using current configuration files
(/etc/default/nfs-kernel-server, /etc/default/nfs-common), therefore
code might need to be adjusted.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 2d5535dc5..2ba79dfdd 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -46,6 +46,15 @@ get_socket_type()
 	done
 }
 
+nfs_server_udp_enabled()
+{
+	local config f
+
+	tst_rhost_run -c "[ -f /etc/nfs.conf ]" || return 0
+	config=$(tst_rhost_run -c 'for f in $(grep ^include.*= '/etc/nfs.conf' | cut -d = -f2); do [ -f $f ] && printf "$f "; done')
+	tst_rhost_run -c "grep -q '^[[:space:]]*udp[[:space:]]*=[[:space:]]*y' /etc/nfs.conf $config"
+}
+
 nfs_setup_server()
 {
 	local export_cmd="exportfs -i -o fsid=$$,no_root_squash,rw *:$remote_dir"
@@ -93,6 +102,10 @@ nfs_setup()
 		type=$(get_socket_type $n)
 		tst_res TINFO "setup NFSv$i, socket type $type"
 
+		if [ "$type" = "udp" ] && ! nfs_server_udp_enabled; then
+			tst_brk TCONF "UDP support disabled on NFS server"
+		fi
+
 		local_dir="$TST_TMPDIR/$i/$n"
 		remote_dir="$TST_TMPDIR/$i/$type"
 		mkdir -p $local_dir
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
