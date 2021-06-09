Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFA3A13E2
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:12:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 472543C8FC9
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 14:12:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5BFEC3C2672
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D37321A01128
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 14:12:48 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 201061FD60;
 Wed,  9 Jun 2021 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0GkCv3nfqon1Gs5iTXSS9hxahlJvaUvwXn+IJlUQOfk=;
 b=uAnRzzQ32Qqd79yVINVY3h1ljCQAErqtFWDAzqdlM3FFPZFnWgk8/s7FEFNIoTpdp2zRJA
 aw3ZcNzC079pWnpEToVt8UEnsdPnlx43ZkMVrOpN2C7QuqXyfzuO45fv4pU5P4GHcOc+dO
 xzGpYljKXpjayxROdKANR3dL9Y3L2BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0GkCv3nfqon1Gs5iTXSS9hxahlJvaUvwXn+IJlUQOfk=;
 b=65MQqEqdoF3lQks4ZcJgqIdi7jpnSc6o6r5V0ngOvMpF44aRxSXENAP7zLMuZjmBktJ/Au
 ZYzQ2WZ8IfP9W4AQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 03477118DD;
 Wed,  9 Jun 2021 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623240768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0GkCv3nfqon1Gs5iTXSS9hxahlJvaUvwXn+IJlUQOfk=;
 b=uAnRzzQ32Qqd79yVINVY3h1ljCQAErqtFWDAzqdlM3FFPZFnWgk8/s7FEFNIoTpdp2zRJA
 aw3ZcNzC079pWnpEToVt8UEnsdPnlx43ZkMVrOpN2C7QuqXyfzuO45fv4pU5P4GHcOc+dO
 xzGpYljKXpjayxROdKANR3dL9Y3L2BU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623240768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0GkCv3nfqon1Gs5iTXSS9hxahlJvaUvwXn+IJlUQOfk=;
 b=65MQqEqdoF3lQks4ZcJgqIdi7jpnSc6o6r5V0ngOvMpF44aRxSXENAP7zLMuZjmBktJ/Au
 ZYzQ2WZ8IfP9W4AQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DFRCOz+wwGD2cwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 12:12:47 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  9 Jun 2021 13:46:55 +0200
Message-Id: <20210609114659.2445-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] Introduce a concept of test runtime cap
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Recently we had a problem with tests that use .all_filesystems and
tst_timeout_remaining().

The problem is that the tst_timeout_remaining() function wasn't aware of
the loop over fork_testrun() that executes a testrun for each supported
filesystem, which caused such test, e.g. writev03, to run for
unpredictable and long periods.

This is an attempt how to solve this properly by uncoupling timeouts
from test runtime so that test never runs for longer than its timeout.

Cyril Hrubis (4):
  lib: tst_supported_fs_types: Add tst_fs_max_types()
  lib: tst_test: Move timeout scaling out of fork_testrun()
  lib: Introduce concept of max_test_runtime
  syscalls/writev03: Adjust test runtime

 include/tst_fs.h                              |  5 ++
 include/tst_fuzzy_sync.h                      |  4 +-
 include/tst_test.h                            |  7 +-
 lib/newlib_tests/.gitignore                   |  3 +-
 .../{test18.c => test_runtime01.c}            |  7 +-
 lib/newlib_tests/test_runtime02.c             | 31 +++++++
 lib/tst_supported_fs_types.c                  |  5 ++
 lib/tst_test.c                                | 87 ++++++++++++++++---
 testcases/kernel/crypto/af_alg02.c            |  2 +-
 testcases/kernel/crypto/pcrypt_aead01.c       |  2 +-
 testcases/kernel/mem/mtest01/mtest01.c        |  6 +-
 testcases/kernel/mem/mtest06/mmap1.c          | 13 ++-
 .../kernel/syscalls/move_pages/move_pages12.c |  4 +-
 testcases/kernel/syscalls/writev/writev03.c   |  1 +
 14 files changed, 141 insertions(+), 36 deletions(-)
 rename lib/newlib_tests/{test18.c => test_runtime01.c} (59%)
 create mode 100644 lib/newlib_tests/test_runtime02.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
