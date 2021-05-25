Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B33902C2
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C10F93C5885
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DEE133C5855
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4EEE31400B8E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621950626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfdx4se0Oqz1frof5c9V0UQx6V4XFXyduHJlsFcXcLw=;
 b=pW/8/D8nBvAuJ/XQImoLrOJ9WjqReYucwYO662/fMnEU2zl3VZYJ4z32K6/b9FJaaKpSCz
 QlXVLB74lAz0D5Xj7+CY0mq0p0qv6950dMPjWTQMjOWe40hOw7VmychtNU68RFnZSWysId
 tF4TIb4uVuBZTQJeqt2CVGE1/qvQ4+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621950626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfdx4se0Oqz1frof5c9V0UQx6V4XFXyduHJlsFcXcLw=;
 b=Iaf+zUnVwvd3e94fmCSb5geE6OaDTVS9R2ggorGGJNi3Hg51VAPuwJHK0/dJ9QfiO53X73
 aHnVRowivqj5kHAQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B56C5AE99;
 Tue, 25 May 2021 13:50:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 May 2021 15:50:11 +0200
Message-Id: <20210525135012.877-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525135012.877-1-pvorel@suse.cz>
References: <20210525135012.877-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] nfs_lib.sh: Check running rpc.mountd,
 rpcbind/portmap
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

Both are required to be running for NFS tests.

This requires to add pgrep dependency, as we don't have custom LTP C
based tool for searching in processes.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 1bd057717..25fe67bda 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -27,7 +27,7 @@ TST_PARSE_ARGS=nfs_parse_args
 TST_USAGE=nfs_usage
 TST_NEEDS_TMPDIR=1
 TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="$TST_NEEDS_CMDS mount exportfs"
+TST_NEEDS_CMDS="$TST_NEEDS_CMDS exportfs mount pgrep"
 TST_SETUP="${TST_SETUP:-nfs_setup}"
 TST_CLEANUP="${TST_CLEANUP:-nfs_cleanup}"
 
@@ -107,6 +107,11 @@ nfs_setup()
 		tst_brk TCONF "Cannot run nfs-stress test on mounted NFS"
 	fi
 
+	pgrep rpc.mountd > /dev/null || \
+		tst_brk TCONF "rpc.mountd not running"
+
+	check_portmap_rpcbind
+
 	local i
 	local type
 	local n=0
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
