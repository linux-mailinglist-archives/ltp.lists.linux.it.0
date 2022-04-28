Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB89513728
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 16:43:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 610F23CA6DD
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Apr 2022 16:43:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1408A3CA6CB
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 16:43:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9088600BB5
 for <ltp@lists.linux.it>; Thu, 28 Apr 2022 16:43:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C53541F745;
 Thu, 28 Apr 2022 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651156999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4ogX/PVHTgBnVY9bfomFQYpJAsCgJeGa3J6Zuu0Pixg=;
 b=jG1HWlbSDWdfX+6R84Y9G/sWp9p+No76xWpG7nBI5WWBgMUmyG2E7Z6TTCD7/yXOKrW1yB
 +e15ck+H/kMGHQpbq1zW55hmCVfB4NPE3DWItZCMF/2DMul61AU/TGaGZuveJkrf00NhMY
 kNGGE01JAbNzdyDsGLExVF0f//4aQZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651156999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4ogX/PVHTgBnVY9bfomFQYpJAsCgJeGa3J6Zuu0Pixg=;
 b=Z0hsrR9HSvQkQWF8gN8tXOkvPKNHdEGRK0+RmtjovlTktCO75R9dyLd2Y/QS+5gLqkOe8s
 bN47/Wrm8s1csTCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0EE713AF8;
 Thu, 28 Apr 2022 14:43:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /jOLOAaoamK9bwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 28 Apr 2022 14:43:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 Apr 2022 16:43:05 +0200
Message-Id: <20220428144308.32639-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/3] Remove RPC rup and rusers tests
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

Hi all,

IMHO safe to remove these two tests, but sending to broad audience in
case anybody really want to have these 2 kept (they'd be rewritten to
new LTP shell API).

BTW in long term I'd prefer to remove all RPC tests
(testcases/network/rpc/ directory). IMHO they should be part of libtirpc
(which has no tests), but these tests are old, messy and I'm not sure
how relevant they are nowadays.

Kind regards,
Petr

Petr Vorel (3):
  rpc: Remove rup01.sh test
  rpc: Remove rusers01.sh test
  rpc: Move rest of RPC tests to runtest/net.rpc_tests

 runtest/net.rpc                               |  8 ---
 runtest/net.rpc_tests                         |  3 ++
 scenario_groups/network                       |  1 -
 .../network/rpc/basic_tests/rup/Makefile      | 29 -----------
 .../network/rpc/basic_tests/rup/rup01.sh      | 50 -------------------
 .../network/rpc/basic_tests/rusers/Makefile   | 29 -----------
 .../rpc/basic_tests/rusers/rusers01.sh        | 50 -------------------
 testscripts/network.sh                        |  4 +-
 8 files changed, 4 insertions(+), 170 deletions(-)
 delete mode 100644 runtest/net.rpc
 delete mode 100644 testcases/network/rpc/basic_tests/rup/Makefile
 delete mode 100755 testcases/network/rpc/basic_tests/rup/rup01.sh
 delete mode 100644 testcases/network/rpc/basic_tests/rusers/Makefile
 delete mode 100755 testcases/network/rpc/basic_tests/rusers/rusers01.sh

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
