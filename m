Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6B57E13A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 14:05:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 819AA3CA0C5
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 14:05:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 74F023C9465
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 14:05:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 014061400F9C
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 14:05:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D48BC20329;
 Fri, 22 Jul 2022 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1658491534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=etTNNEAIVnYiG/wtFIm8ypO7izPFdSl0Kl8dWiZ1vLg=;
 b=VJ3WD/KztDwoTtwg3u1U9GUacbIVhgkx5y5A7lejBt5Wb0/CxmUMNFNl1kDsJjOwDIwPOQ
 m46ZiMHiSd5I0zlkWgmxUhD5mlo9w+wtEw7sANha8a2xqEr6tsee2UQ3MrVWz4v6zj5dE/
 o4mdKRC9CllzYVrlR54D4I6dwX3ZDis=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77481134A9;
 Fri, 22 Jul 2022 12:05:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JGBMGo6S2mJULwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 22 Jul 2022 12:05:34 +0000
To: ltp@lists.linux.it
Date: Fri, 22 Jul 2022 14:04:54 +0200
Message-Id: <20220722120501.28670-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/7] Refactor mqns testing suite
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

mqns testing suite has been refactored using new LTP API

Andrea Cervesato (7):
  Add more safe macros for mqueue API
  Refactor mqns_01 using new LTP API
  Refactor mqns_02 using new LTP API
  Refactor mqns_03 using new LTP API
  Refactor mqns_04 using new LTP API
  Delete deprecated mqns header files
  Rename common.h into mqns.h for mqns suite

 include/tst_safe_posix_ipc.h                  |  45 +++
 runtest/containers                            |  12 +-
 testcases/kernel/containers/mqns/Makefile     |  27 +-
 testcases/kernel/containers/mqns/mqns.h       | 108 ++++++-
 testcases/kernel/containers/mqns/mqns_01.c    | 185 ++++--------
 testcases/kernel/containers/mqns/mqns_02.c    | 217 ++++----------
 testcases/kernel/containers/mqns/mqns_03.c    | 269 +++++++-----------
 testcases/kernel/containers/mqns/mqns_04.c    | 263 ++++++++---------
 .../kernel/containers/mqns/mqns_helper.h      |  56 ----
 9 files changed, 485 insertions(+), 697 deletions(-)
 delete mode 100644 testcases/kernel/containers/mqns/mqns_helper.h

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
