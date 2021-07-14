Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E40363C85F4
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:20:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E023C756D
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:20:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 591603C5580
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:20:09 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C6E7C200C23
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:20:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05079202BE;
 Wed, 14 Jul 2021 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626272408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vD2RSUH+Kw3wy9n7bUTEmo4BDDpPrqGWV4/xhkBpa4=;
 b=iqrQWhc95NXOEeEdCZGw7knxVl+woPfti3UB0x6Mu3CGHGS65eI1Z6cCtIehzwKkwOY+uN
 m7qeUaoTD9wE/pn+N79kI9JQpO8cPxLhWBEzTHbhuR1Pj1ExBqLxqAmdyEWIrjiVh4rp8m
 o2czK5bX1rdABSa+izHCzW5bghKLg0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626272408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/vD2RSUH+Kw3wy9n7bUTEmo4BDDpPrqGWV4/xhkBpa4=;
 b=iYggFRAGkyDmKbA9IqQuYRPOBSwi7s8tade0VP+Dv02uX0NTJeek3I/4z1lD1RqW4/to9G
 SnpUvAzOAfuj2xDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C10D513C05;
 Wed, 14 Jul 2021 14:20:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mrVELZfy7mCOdgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:20:07 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 16:19:57 +0200
Message-Id: <20210714142001.20566-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/4] Run tests in CI
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v4->v5:
* don't exit on test failure, but continue testing (Cyril)
* rename tst_{brk,res}() to runtest_{brk,res}() (Cyril)
* rewritten summary, put everything to the end
* merged 3 already acked commits

$ make test
...

runtest TINFO: === C TEST RESULTS ===
runtest TINFO: 13x TPASS: test05 test07 test09 test12 test15 test18 tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02 tst_fuzzy_sync03
runtest TINFO: 0x TFAIL:
runtest TINFO: 0x TBROK:
runtest TINFO: 0x TWARN:
runtest TINFO: 0x TCONF:

...

runtest TINFO: === SHELL TEST RESULTS ===
runtest TINFO: 2x TPASS: shell/tst_check_driver.sh shell/net/tst_ipaddr_un.sh
runtest TINFO: 0x TFAIL:
runtest TINFO: 0x TBROK:
runtest TINFO: 0x TWARN:
runtest TINFO: 1x TCONF: shell/net/tst_rhost_run.sh

runtest TINFO: === FINAL TEST RESULTS ===
runtest TPASS: All C tests TCONF/TPASS
runtest TPASS: All shell tests TCONF/TPASS

Petr Vorel (4):
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test
  CI: Run also make test

 .github/workflows/ci.yml    |   5 ++
 Makefile                    |  23 +++++
 build.sh                    |  22 ++++-
 lib/newlib_tests/runtest.sh | 175 ++++++++++++++++++++++++++++++++++++
 4 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
