Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F77400297
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 137683C98D2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B07D93C2820
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 932D160106E
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDD141FDB2
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yc1kq11rG4GgNaF+I48CbpLZy7XT8DrJ/oBd0dCEAGI=;
 b=bxG4YecRP9bKobEln5/0hlepQHM/WT4jYE/kKah6o5+fYaaz+YokNMIW+qq69CdYgedJb3
 8j15FBl54gDiXzjSogIojKm8SCL3Dy4iOmz6KsMhkF4yoXLkhXciRqmKXi2uGPIQvsF6k4
 AeM8sferyKSc0wW8li0wnpjAD+O1gSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yc1kq11rG4GgNaF+I48CbpLZy7XT8DrJ/oBd0dCEAGI=;
 b=aKdivL6pz6sWujmhXRQguenzRPwf+pqq8YoKmHXPaUvcYHbNNd9fv487XeXeOTKDkJ0Xzs
 0uRaP9suNANmwKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF2FC13B08
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFSPKOFDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:49 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:41 +0200
Message-Id: <20210903154848.18705-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] UID/GID lookup fixes
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

Some LTP tests assume that certain user/group names exist on all systems.
That is not true and those tests fail as a result.

This patchset replaces lookups of specific named users/groups with either
some unused group ID or any existing user/group IDs, depending on test
scenario. There are more tests with the same issue but they also require
porting to the new LTP API. I'll submit those later one by one.

Martin Doucha (7):
  chmod05, fchmod05: Use free GID instead of "bin" group
  Simplify syscalls/mkdir02
  Add user/group ID lookup helper functions
  syscalls/kill05: Use any two unprivileged users
  syscalls/mkdir04: Simplify test and use any existing users
  syscalls/setregid02-04: Simplify GID handling
  syscalls/setregid02-04: Eliminate named group lookups

 include/tst_safe_macros.h                     |   6 ++
 include/tst_uid.h                             |  17 +++
 lib/tst_uid.c                                 | 100 ++++++++++++++++++
 testcases/kernel/syscalls/chmod/chmod05.c     |   7 +-
 testcases/kernel/syscalls/fchmod/fchmod05.c   |   7 +-
 testcases/kernel/syscalls/kill/kill05.c       |  23 ++--
 testcases/kernel/syscalls/mkdir/mkdir02.c     |  77 +++++---------
 testcases/kernel/syscalls/mkdir/mkdir04.c     |  30 ++----
 .../kernel/syscalls/setregid/setregid02.c     |  75 ++++++-------
 .../kernel/syscalls/setregid/setregid03.c     |  92 +++++++---------
 .../kernel/syscalls/setregid/setregid04.c     |  58 +++++-----
 11 files changed, 279 insertions(+), 213 deletions(-)

-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
