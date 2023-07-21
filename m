Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19E75C6F7
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jul 2023 14:39:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 696343CDC8E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jul 2023 14:39:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C4AD3C941F
 for <ltp@lists.linux.it>; Fri, 21 Jul 2023 14:39:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4286E1400076
 for <ltp@lists.linux.it>; Fri, 21 Jul 2023 14:38:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 77FCF1F897;
 Fri, 21 Jul 2023 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689943138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Q6321VdtsaFyz231nyTF10eoGD8o/cIKY3P6vG38TKc=;
 b=D2BNZun4zA0U5Rq5bIGsvk0l3KerkRL0BwW3BULY2XzCJwW58O1oe/2w5xX9NCAsiM+pq1
 +9yrtyuiQvtYHkBE9kcRPmyI47hPpzCn2B54vKn2gYZtUWd6Ie+vMkPoBhBECPhP47aPvU
 XpTxMexvZK0P4oKOLu3xRr66FSXtVls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689943138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Q6321VdtsaFyz231nyTF10eoGD8o/cIKY3P6vG38TKc=;
 b=j7ps4kKQ1pxX3MUkWZJvjBFn7CWa0rDLrF0fbK9CG1lqr2qgRiqmJPHShkfHArKICLSjWC
 KzFODzkBa0XajHCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0ECF0134BA;
 Fri, 21 Jul 2023 12:38:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 02v6AGJ8umSpUgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Jul 2023 12:38:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Jul 2023 14:38:52 +0200
Message-Id: <20230721123852.1420080-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] nfs_lib.sh: Set NFS 4.2 on TCP as the default
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
Cc: Olga Kornievskaia <olga.kornievskaia@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Chuck Lever <chuck.lever@oracle.com>,
 Anna Schumaker <Anna.Schumaker@Netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Previously NFS 3 on UDP was the default, which leaded to test being
skipped when tests run without parameters:

TCONF: UDP support disabled on NFS server

This does not have an effect when tests run properly via
runtest/net.nfs, which specify parameters. It just safes typing
-t tcp (and optionally -v 4.2) when one runs single test manually.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I'm pretty sure, we don't want to have UDP as the default (besides
skipped with TCONF it was acked by Jeff [1]). But I wonder if NFS 4.2 is
the best as the default version. Maybe just 4 or 4.1?

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/e4d22ae6cefb34463ed7d04287ca9e81cd0949d8.camel@kernel.org/

 testcases/network/nfs/nfs_stress/nfs_lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index abf7ba5a2..dae15a2e1 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -4,9 +4,9 @@
 # Copyright (c) 2015-2018 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2001
 
-VERSION=${VERSION:=3}
+VERSION=${VERSION:=4.2}
 NFILES=${NFILES:=1000}
-SOCKET_TYPE="${SOCKET_TYPE:-udp}"
+SOCKET_TYPE="${SOCKET_TYPE:-tcp}"
 NFS_TYPE=${NFS_TYPE:=nfs}
 
 nfs_usage()
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
