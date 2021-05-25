Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A53902C0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE4F03C77D0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:50:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D8CE93C2B2E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 56C8E10009E0
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621950627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pu108ebAZrTelctPJpgj7lLNeI/b8sjxhcEY7d16aE=;
 b=vCjUaCvp54zGbhcRW4gPF8N4V6G7l6EsH5i0O7HSvmyNStqLvfsAk/4vNinGRNvf2cT4Pl
 gKEEoYSf34IY5/rQ0nlMGbHrSjLp0b7x9zdYD+eERGzSBLRhbPXT+SLP3jlzoZGRefAKJa
 Czgj1btCKQvf2FCjh+l/Yo/gnjg7+No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621950627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pu108ebAZrTelctPJpgj7lLNeI/b8sjxhcEY7d16aE=;
 b=6RGh1qTLUtRrj974bgwXcyrFLduWXovpM58cFTLcYt5zeZZkluJyAvMQEuwnYFLs+7WJoj
 ve6kIH7hgtL4BDAw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF100AEAB;
 Tue, 25 May 2021 13:50:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 May 2021 15:50:12 +0200
Message-Id: <20210525135012.877-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525135012.877-1-pvorel@suse.cz>
References: <20210525135012.877-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] nfs_lib.sh: Print verbose mount info on error
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
Cc: NeilBrown <neilb@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Suggested-by: NeilBrown <neilb@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index 25fe67bda..fb0f10020 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -83,16 +83,17 @@ nfs_mount()
 		mount_dir="$(tst_ipaddr $host_type):$remote_dir"
 	fi
 
-	local mnt_cmd="mount -t nfs $opts $mount_dir $local_dir"
+	local mnt_cmd="mount -v -t nfs $opts $mount_dir $local_dir"
 
 	tst_res TINFO "Mounting NFS: $mnt_cmd"
 	if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
-		tst_rhost_run -c "$mnt_cmd"
+		tst_rhost_run -c "$mnt_cmd" > mount.log
 	else
-		$mnt_cmd > /dev/null
+		$mnt_cmd > mount.log
 	fi
 
 	if [ $? -ne 0 ]; then
+		cat mount.log
 		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
 			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
 		fi
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
