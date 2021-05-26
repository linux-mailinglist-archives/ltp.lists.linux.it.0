Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C173391E15
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 19:25:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B4933CA73E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 19:25:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7D8C13C2ADE
 for <ltp@lists.linux.it>; Wed, 26 May 2021 19:25:12 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2189F1000F65
 for <ltp@lists.linux.it>; Wed, 26 May 2021 19:25:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90C581FD2A;
 Wed, 26 May 2021 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622049910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TH5m+itfc3wszX6zdthSUNY7BimLXL7cWZygJJRHBR0=;
 b=RN3tFcMuIcqKlN9AOxzBvmYZAfpSKsenkVf8lyC47W9dl0QU0sO8HEns97Qbsc4HkkbU7o
 0hjKDqaqeZkfqRGX2YQ9ucKRFTfpt1okviTaKdldcYoi5uwWQ5/5NUQr6/LiNmoowFKBG3
 8cWIRDuzIjctoEOYk2znmISFLZjRPVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622049910;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TH5m+itfc3wszX6zdthSUNY7BimLXL7cWZygJJRHBR0=;
 b=IcV7JQauHTEfXp01mWLATdPGZuUGnn2vtuAuihYj+5VbJOvV/agEiyo4demwFvD2vUo70c
 2dIKS22GA8SRe8CA==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 6F33611A98;
 Wed, 26 May 2021 17:25:10 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 May 2021 19:25:01 +0200
Message-Id: <20210526172503.18621-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [LTP PATCH v2 1/3] nfs_lib.sh: Detect unsupported protocol
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

Caused by disabled CONFIG_NFSD_V[34] in kernel config.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
new in v2

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 3fad8778a..b80ee0e18 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -94,9 +94,15 @@ nfs_mount()
 
 	if [ $? -ne 0 ]; then
 		cat mount.log
+
 		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
 			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
 		fi
+
+		if grep -i "Protocol not supported" mount.log; then
+			tst_brk TCONF "Protocol not supported"
+		fi
+
 		tst_brk TBROK "mount command failed"
 	fi
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
