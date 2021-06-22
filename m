Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DDC3B02DE
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23BEE3C7006
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 13:36:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 933943C229B
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6FC53200388
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 13:35:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DEE512197E;
 Tue, 22 Jun 2021 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624361739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xxk/Bhcre29HNHlyafsh+ol9KPX7evfgWj5YzzjB78Q=;
 b=rgyPxAIYFPs1GlemLT0KwX+8UNyvtjC5plLmdsb87tGu8ApmrnLZY1bMOQQI/gp0nNmsoa
 n4ibSxrfYCa7ADk99uZa/Gm/nitJbWpT4OW0AUtAalqWza2BDRg2JhHz5eHyq/+8a2KmEt
 LA4BxK9eGx8hVa69IvP5N9qypNvLktU=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id B09C5A3B84;
 Tue, 22 Jun 2021 11:35:39 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 22 Jun 2021 12:35:06 +0100
Message-Id: <20210622113514.22284-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/8] Fix uninitialized var errors
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

It would be nice if we could set --Werror=uninitialized by
default. Uninitialized variables can result in nasty compiler
behaviour. You may expect it just to result in garbage data being
used. The result being a crash. However as we compile with -O2 this is
not the case. Often the compiler chooses values for the variable which
will eliminate code. This often means the values are valid. The result
being a program which appears to execute correctly on the
surface. Meanwhile underneath it is doing very little.

In a lot of cases the compiler is simply confused and gives an error,
but there is no undefined behaviour. This is often caused by tst_brk
which is the source of much confusion. Most likely there should be two
versions of tst_brk. One which never returns and is used by test
authors and one which can return, but is usually only used in library
functions which may be called from cleanup.

Richard Palethorpe (8):
  ipc: Fix uninitialized var error by removing useless arg
  ftest: Fix uninitialized var error
  hotplug: Fix uninitialized var
  dio: Fix uninitialized var error
  ksmg01: Fix uninitialized var error
  shmat01: Fix uninitialized var error
  crash02: Save actual child PID instead of uninitialized variable
  locktests: Fix uninitialized var error

 libs/libltpipc/libipc.c                            | 4 +---
 testcases/kernel/fs/ftest/ftest01.c                | 3 +--
 testcases/kernel/fs/ftest/ftest05.c                | 3 +--
 testcases/kernel/hotplug/memory_hotplug/commands.c | 7 +------
 testcases/kernel/io/ltp-aiodio/dio_append.c        | 2 +-
 testcases/kernel/io/ltp-aiodio/dio_sparse.c        | 2 +-
 testcases/kernel/io/ltp-aiodio/dio_truncate.c      | 4 ++--
 testcases/kernel/logging/kmsg/kmsg01.c             | 2 +-
 testcases/kernel/syscalls/ipc/semctl/semctl01.c    | 4 +---
 testcases/kernel/syscalls/ipc/shmat/shmat01.c      | 2 +-
 testcases/misc/crash/crash02.c                     | 6 +++---
 testcases/network/nfsv4/locks/locktests.c          | 2 +-
 12 files changed, 15 insertions(+), 26 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
