Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A974AC180
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 15:42:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08A123C9AD4
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 15:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B30753C9B09
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 15:41:54 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 111992009AB
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 15:41:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E92321101;
 Mon,  7 Feb 2022 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644244910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tdVCDkf86ddaiGhb6c+Lx5KjC76YHvYPktNlgkP54So=;
 b=TjVQrsCouOm1wJzVLEdlCX5UfkKSC/Sy6/khlCkBJgSZEEA5ZP8eirWgxsld+ujtoHODjL
 i4qOCYUFhUWLGcU7Bun90hTAE0EIDVinPseqiBpIqexwUrmmWYhjh3t648K7mYGCf+OLyU
 +Ffc+zsgp5YtHi1LM13hc9il3t+sbCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644244910;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tdVCDkf86ddaiGhb6c+Lx5KjC76YHvYPktNlgkP54So=;
 b=BvlT2CsqxIq1L8KGhh0giuD8KUgFtY+ZwxtT1jQ78ihHbftd7Uvans14J5E4F8CwfpRQ+c
 V25tgLDY90BqjyCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 379C813C28;
 Mon,  7 Feb 2022 14:41:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p9iaC64vAWJwSwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 07 Feb 2022 14:41:50 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon,  7 Feb 2022 15:41:45 +0100
Message-Id: <20220207144148.27033-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/3] Add futex_wait testing suite
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

futex_waitv tests have been inspired by
tools/testing/selftests/futex/functional/futex_waitv.c that can be found
in the Linux kernel official repository.

Andrea Cervesato (3):
  Add TST_THREAD_STATE_WAIT macro
  Update lapi/futex.h fallback
  Add futex_waitv testing suite

 configure.ac                                  |   3 +
 include/lapi/futex.h                          | 180 ++++++++++++++++++
 include/lapi/syscalls/aarch64.in              |   1 +
 include/lapi/syscalls/arc.in                  |   1 +
 include/lapi/syscalls/arm.in                  |   1 +
 include/lapi/syscalls/hppa.in                 |   1 +
 include/lapi/syscalls/i386.in                 |   1 +
 include/lapi/syscalls/ia64.in                 |   1 +
 include/lapi/syscalls/mips_n32.in             |   1 +
 include/lapi/syscalls/mips_n64.in             |   1 +
 include/lapi/syscalls/mips_o32.in             |   1 +
 include/lapi/syscalls/powerpc.in              |   1 +
 include/lapi/syscalls/powerpc64.in            |   1 +
 include/lapi/syscalls/s390.in                 |   1 +
 include/lapi/syscalls/s390x.in                |   1 +
 include/lapi/syscalls/sh.in                   |   1 +
 include/lapi/syscalls/sparc.in                |   1 +
 include/lapi/syscalls/sparc64.in              |   1 +
 include/lapi/syscalls/x86_64.in               |   1 +
 include/tst_test.h                            |   1 +
 include/tst_thread_state.h                    |  33 ++++
 lib/tst_checkpoint.c                          |   1 -
 lib/tst_thread_state.c                        |  37 ++++
 testcases/kernel/syscalls/clone/clone08.c     |   1 -
 testcases/kernel/syscalls/futex/.gitignore    |   3 +
 testcases/kernel/syscalls/futex/Makefile      |  14 +-
 testcases/kernel/syscalls/futex/futex2test.h  |  30 +++
 .../syscalls/futex/futex_cmp_requeue01.c      |   2 +-
 .../syscalls/futex/futex_cmp_requeue02.c      |   2 +-
 .../kernel/syscalls/futex/futex_waitv01.c     | 162 ++++++++++++++++
 .../kernel/syscalls/futex/futex_waitv02.c     | 111 +++++++++++
 .../kernel/syscalls/futex/futex_waitv03.c     | 122 ++++++++++++
 testcases/kernel/syscalls/futex/futextest.h   |  58 ++----
 33 files changed, 729 insertions(+), 48 deletions(-)
 create mode 100644 include/tst_thread_state.h
 create mode 100644 lib/tst_thread_state.c
 create mode 100644 testcases/kernel/syscalls/futex/futex2test.h
 create mode 100644 testcases/kernel/syscalls/futex/futex_waitv01.c
 create mode 100644 testcases/kernel/syscalls/futex/futex_waitv02.c
 create mode 100644 testcases/kernel/syscalls/futex/futex_waitv03.c

-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
