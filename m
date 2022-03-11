Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1989A4D61EE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 14:01:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D04763C8CBF
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Mar 2022 14:01:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01EA63C61C9
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 14:01:38 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 60FA860138B
 for <ltp@lists.linux.it>; Fri, 11 Mar 2022 14:01:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 602031F381;
 Fri, 11 Mar 2022 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647003697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5T/STXQeeIBdyupIP2VOuNFk95h3MUTMoLuQ2B6AiyI=;
 b=V98lF94QSiPMfAi8vkPwPfakn8FqeTFTXwAuyWF05+pt9y3qEwg8zzzOyzGbe3HOJQ6+vK
 pxqc0+/Q6WxIBUI3YEkfL08UoBPkyNEV1qugi8TkCs5fZ6OunjzXv85g4uQR3+lrZ63hW5
 sd7mDOOhyAqDArbC/gACbZLdhOVZQBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647003697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5T/STXQeeIBdyupIP2VOuNFk95h3MUTMoLuQ2B6AiyI=;
 b=6Uez62lTjNlk3rylubPDkw16Mt8IyynVWZQ0QKEeboUykE2sPhXDmNPOweUai8jDzQ4Hpx
 Y+OFpH5XE+2ltVDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C5D813A8E;
 Fri, 11 Mar 2022 13:01:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OmVJDTFIK2IXRgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 11 Mar 2022 13:01:37 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Mar 2022 14:01:33 +0100
Message-Id: <20220311130133.8085-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] nfs_lib: Cleanup parameters passing
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

shell function should not expect parameters are defined outside in other
function, directly passing is clearer solution.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index ad96bb4438..1bf31eed25 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -98,6 +98,7 @@ nfs_setup_server()
 
 nfs_mount()
 {
+	local opts="$1"
 	local host_type=rhost
 	local mount_dir
 
@@ -138,7 +139,6 @@ nfs_setup()
 	local i
 	local type
 	local n=0
-	local opts
 	local local_dir
 	local remote_dir
 	local mount_dir
@@ -167,8 +167,7 @@ nfs_setup()
 
 		nfs_setup_server $(($$ + n))
 
-		opts="-o proto=$type,vers=$i"
-		nfs_mount
+		nfs_mount "-o proto=$type,vers=$i"
 
 		n=$(( n + 1 ))
 	done
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
