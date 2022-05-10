Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604D520E1F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 08:51:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06FF93CA946
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 08:51:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E91273CA8F1
 for <ltp@lists.linux.it>; Tue, 10 May 2022 08:51:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB96F600710
 for <ltp@lists.linux.it>; Tue, 10 May 2022 08:51:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B87921C47;
 Tue, 10 May 2022 06:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652165473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p2NoYY5XbbiF/HiyEq9NxAO5JF9pOCQKDmCt5zMJwc8=;
 b=JdYf5ksksocjrIsppvTd1StDRjeouelR1CIoJEPXGcLgNJrrpu+ul1d4AOtRRWx9GUHg9I
 J4zD0AxHGnjwdzp949P7vs9SHmUsUQpwvkVzs5SeBBdu0lLq3gE6r/wJRr/nzHO88ue7E1
 lktCfKKoRqz7BxJr3SCHrVtAWQidb0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652165473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=p2NoYY5XbbiF/HiyEq9NxAO5JF9pOCQKDmCt5zMJwc8=;
 b=PTnnRkFj1FwCyAAe0rBuQ8Ocw79WlHj4TuO7j0b6IlKQRr6J1KoI3Wz5Zz8JEhP4dTc+3U
 dwjM/ppNNIhfibBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E237113AA5;
 Tue, 10 May 2022 06:51:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F2DuNWALemIOZgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 10 May 2022 06:51:12 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 10 May 2022 08:51:01 +0200
Message-Id: <20220510065104.1199-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/3] shell: Fixes for disabled IPv6
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v2->v3:
* removed commit "broken_ip-nexthdr.sh: Check IPv6 support before
  forcing it" (not needed after 04021637f ("tst_test.sh: Cleanup getopts
  usage")
* rebased "netns: Rewrite to use tst_net.sh"
* new commit "netns: Rename netns_helper.sh -> netns_lib.sh"

NOTE: network shell tests which use legacy API (i.e.
TST_USE_LEGACY_API=1) are still broken. But I'd prefer to fix them by
converting to new API (i.e. tcpdump01.sh, mc_*.sh). Some of them we
might consider to delete instead of rewrite (telnet01.sh,
ftp-{download,upload}-stress.sh, {dns,http}-stress.sh, ... rup01.sh and
rusers01.sh has already been asked to delete [1]).

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=297407

Petr Vorel (3):
  tst_net.sh: Fix for disabled IPv6
  netns: Rewrite to use tst_net.sh
  netns: Rename netns_helper.sh -> netns_lib.sh

 runtest/containers                            |  32 +-
 .../kernel/containers/netns/netns_breakns.sh  |  33 +--
 .../kernel/containers/netns/netns_comm.sh     |  57 +---
 .../kernel/containers/netns/netns_helper.sh   | 279 ------------------
 .../kernel/containers/netns/netns_lib.sh      | 227 ++++++++++++++
 testcases/lib/tst_net.sh                      |  69 ++++-
 6 files changed, 317 insertions(+), 380 deletions(-)
 delete mode 100755 testcases/kernel/containers/netns/netns_helper.sh
 create mode 100755 testcases/kernel/containers/netns/netns_lib.sh

-- 
2.36.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
