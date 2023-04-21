Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4A6EA0F8
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Apr 2023 03:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D18553CBFB2
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Apr 2023 03:27:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 040703CBF53
 for <ltp@lists.linux.it>; Fri, 21 Apr 2023 03:27:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0470420025A
 for <ltp@lists.linux.it>; Fri, 21 Apr 2023 03:27:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8819721A30;
 Fri, 21 Apr 2023 01:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1682040425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiF4DobEdQk8M6pfr6YL5wvnufQ1+l9OpLCS2YT4aNs=;
 b=uXEH7BB+XmDjRLZRpVJV3htIgUFTD5A+bke1Z9iKRDvDUNZgO5LiHhx00cVnbqG6G4AV3W
 MSvOJE0aPDJDUd3aMDXv4QY7/KSDwJ3F4jj1ri+eeH1htNLUhF6SGkHWmPMS2EnWNyqRON
 GV00MvR8IwOMGA+7SpoB1ntIKbUHNQY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DAC6713584;
 Fri, 21 Apr 2023 01:27:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eI8bLGjmQWT7eAAAMHmgww
 (envelope-from <wegao@suse.com>); Fri, 21 Apr 2023 01:27:04 +0000
To: ltp@lists.linux.it
Date: Thu, 20 Apr 2023 21:26:40 -0400
Message-Id: <20230421012642.16625-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230419151849.13152-1-wegao@suse.com>
References: <20230419151849.13152-1-wegao@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v8 0/2] kill01: New case cgroup kill
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Wei Gao (2):
  kill01: New case cgroup kill
  tst_cgroup.c: Add a cgroup pseudo controller

 lib/tst_cgroup.c                              |  55 ++++---
 runtest/controllers                           |   1 +
 .../kernel/controllers/cgroup/kill/.gitignore |   1 +
 .../kernel/controllers/cgroup/kill/Makefile   |   6 +
 .../kernel/controllers/cgroup/kill/kill01.c   | 144 ++++++++++++++++++
 5 files changed, 188 insertions(+), 19 deletions(-)
 create mode 100644 testcases/kernel/controllers/cgroup/kill/.gitignore
 create mode 100644 testcases/kernel/controllers/cgroup/kill/Makefile
 create mode 100644 testcases/kernel/controllers/cgroup/kill/kill01.c


base-commit: b67facdd9c3f0ef471d74dd59ac276139e63f4c4
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
