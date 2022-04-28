Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5051372A
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 16:43:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C2453CA6DA
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 16:43:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 22EE13CA6D4
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 16:43:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AC68F6022B6
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 16:43:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 470591F88E;
 Thu, 28 Apr 2022 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651157002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d66W1bznWVrmDrs7mLytKWIjqMvNAuENttiazNRUNxY=;
 b=x1jM30wVat1/6FBVv3LiTfelV3trx2j1R8Ruh9+FnI1V1qb71GadqxCy8VeXm+UOODkGE5
 nCncWYTKl9BzDxjdQG89f3r0coGH/Y0HxghswbJFyVyYBdYB58XdiqzVosklWGp3PooQEd
 DwikNH9nE5HwtZk4PD0Yjp4e8aFuhkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651157002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d66W1bznWVrmDrs7mLytKWIjqMvNAuENttiazNRUNxY=;
 b=T6tob+2gL/Iv9cCWE/9W7Z4ithefvlryg3EiirYnT57I3QL9pbR5DlE5iY+To2qzflu3tV
 Ip+uZ1D68ON9OmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FAB513AF8;
 Thu, 28 Apr 2022 14:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CB0oIQmoamK9bwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 28 Apr 2022 14:43:21 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Apr 2022 16:43:08 +0200
Message-Id: <20220428144308.32639-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220428144308.32639-1-pvorel@suse.cz>
References: <20220428144308.32639-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 3/3] rpc: Move rest of RPC tests to
 runtest/net.rpc_tests
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
Cc: "J . Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org,
 Steve Dickson <steved@redhat.com>, Chuck Lever <chuck.lever@oracle.com>,
 automated-testing@yoctoproject.org, Trond Myklebust <trondmy@hammerspace.com>,
 libtirpc-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It does not make much sense to keep just 2 tests in separate
runtest file.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/net.rpc         | 6 ------
 runtest/net.rpc_tests   | 3 +++
 scenario_groups/network | 1 -
 testscripts/network.sh  | 4 +---
 4 files changed, 4 insertions(+), 10 deletions(-)
 delete mode 100644 runtest/net.rpc

diff --git a/runtest/net.rpc b/runtest/net.rpc
deleted file mode 100644
index d2cec5b93..000000000
--- a/runtest/net.rpc
+++ /dev/null
@@ -1,6 +0,0 @@
-#DESCRIPTION:Remote Procedure Call
-#
-# PLEASE READ THE README FILE IN /rpc BEFORE RUNNING THESE.
-#
-rpc01 rpc01.sh
-rpcinfo rpcinfo01.sh
diff --git a/runtest/net.rpc_tests b/runtest/net.rpc_tests
index 84c296027..25d219dce 100644
--- a/runtest/net.rpc_tests
+++ b/runtest/net.rpc_tests
@@ -1,3 +1,6 @@
+rpc01 rpc01.sh
+rpcinfo rpcinfo01.sh
+
 rpc_pmap_set rpc_test.sh -c rpc_pmap_set
 rpc_pmap_unset rpc_test.sh -c rpc_pmap_unset
 rpc_pmap_getport rpc_test.sh -s rpc_svc_1 -c rpc_pmap_getport
diff --git a/scenario_groups/network b/scenario_groups/network
index 46829501f..974b9fc58 100644
--- a/scenario_groups/network
+++ b/scenario_groups/network
@@ -4,7 +4,6 @@ net.ipv6
 net.ipv6_lib
 net.tcp_cmds
 net.multicast
-net.rpc
 net.nfs
 net.rpc_tests
 net.tirpc_tests
diff --git a/testscripts/network.sh b/testscripts/network.sh
index 5cfeee844..15a4cc1c7 100755
--- a/testscripts/network.sh
+++ b/testscripts/network.sh
@@ -26,10 +26,9 @@ usage()
 	echo "  -6    IPv6 tests"
 	echo "  -m    multicast tests"
 	echo "  -n    NFS tests"
-	echo "  -r    RPC tests"
 	echo "  -s    SCTP tests"
 	echo "  -t    TCP/IP command tests"
-	echo "  -c    TI-RPC tests"
+	echo "  -c    RPC and TI-RPC tests"
 	echo "  -d    TS-RPC tests"
 	echo "  -a    Application stress tests (HTTP, SSH, DNS)"
 	echo "  -e    Interface stress tests"
@@ -56,7 +55,6 @@ do
 	6) TEST_CASES="$TEST_CASES net.ipv6 net.ipv6_lib";;
 	m) TEST_CASES="$TEST_CASES net.multicast";;
 	n) TEST_CASES="$TEST_CASES net.nfs";;
-	r) TEST_CASES="$TEST_CASES net.rpc";;
 	s) TEST_CASES="$TEST_CASES net.sctp";;
 	t) TEST_CASES="$TEST_CASES net.tcp_cmds";;
 	c) TEST_CASES="$TEST_CASES net.rpc_tests";;
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
