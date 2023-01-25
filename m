Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D967AF34
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 11:03:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C702B3CC73E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Jan 2023 11:03:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 24E863CC757
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 11:02:38 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3AD2C2009D9
 for <ltp@lists.linux.it>; Wed, 25 Jan 2023 11:02:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 546BA21CE6;
 Wed, 25 Jan 2023 10:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674640956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uIIaGYCFhpQySf021Oo/twX+qsde8oC7NplUm3QNR8o=;
 b=nj4qRBSBUtD3T0goVX7WHe5FgtwyxhGZGEu2M1E5dDRhczffCin3jbtYwJgsCahl3COsrO
 W1YXN2oFuEmncGwlNSwkc4CmvGUmLHIppC0Xay+J8uNUpCGuUGWWgjCQVaXVC2DNwDmjjn
 SJwW74cHBQ0/+BgS7rmKw3vbOwbR7r8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B5A21358F;
 Wed, 25 Jan 2023 10:02:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s9b2Azz+0GOJLQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Wed, 25 Jan 2023 10:02:36 +0000
To: ltp@lists.linux.it
Date: Wed, 25 Jan 2023 11:00:41 +0100
Message-Id: <20230125100043.32349-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/2] Rewrite utstest suite
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

Added new tests and removed utstest which looked broken.

Andrea Cervesato (2):
  Add SAFE_SETHOSTNAME macro
  Rewrite utsname testing suite

 include/safe_net_fn.h                         |   3 +
 include/tst_safe_net.h                        |   3 +
 lib/safe_net.c                                |  17 +
 runtest/containers                            |   7 +
 .../kernel/containers/utsname/.gitignore      |   5 +-
 testcases/kernel/containers/utsname/Makefile  |  23 +-
 .../containers/utsname/runutstests_noltp.sh   |  41 --
 testcases/kernel/containers/utsname/utsname.h | 116 ++++++
 .../kernel/containers/utsname/utsname01.c     |  71 ++++
 .../kernel/containers/utsname/utsname02.c     |  96 +++++
 .../kernel/containers/utsname/utsname03.c     | 110 ++++++
 .../kernel/containers/utsname/utsname04.c     |  66 ++++
 testcases/kernel/containers/utsname/utstest.c | 353 ------------------
 13 files changed, 496 insertions(+), 415 deletions(-)
 delete mode 100755 testcases/kernel/containers/utsname/runutstests_noltp.sh
 create mode 100644 testcases/kernel/containers/utsname/utsname.h
 create mode 100644 testcases/kernel/containers/utsname/utsname01.c
 create mode 100644 testcases/kernel/containers/utsname/utsname02.c
 create mode 100644 testcases/kernel/containers/utsname/utsname03.c
 create mode 100644 testcases/kernel/containers/utsname/utsname04.c
 delete mode 100644 testcases/kernel/containers/utsname/utstest.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
