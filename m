Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C5339AA2E
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:38:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B17243C53EA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 20:38:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE2EF3C283C
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:36 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CDA2C1A007AA
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 20:38:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E307621A07;
 Thu,  3 Jun 2021 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GxvrPlcFwDnvDezFxmpm/VeLbd6PGVRQ3jJuuIkBAug=;
 b=k9tFqTD3AollnFwuVXAphRTieQc2tFdP3xR7t4dCp8/2s65WKE7ObbINDZV/C23Fa1ypfu
 C3WoPObA/p9FNZMYBHRmB2rhf2YWOzPYJNnR823zjAWSkVqVIONc6XfSFuEHrHki3xLnGY
 6RFGylZaGAR3lYkYyPoSgRSgwCU33TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GxvrPlcFwDnvDezFxmpm/VeLbd6PGVRQ3jJuuIkBAug=;
 b=I5Cw2XyK7ofogyEUaIk1nuyLfBEl9J72IqFss1UmXNLUaoYiU6iDdvqHPQFaBxi20kq4OA
 /z9Ad1sHYKugH4BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7C51D118DD;
 Thu,  3 Jun 2021 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622745513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GxvrPlcFwDnvDezFxmpm/VeLbd6PGVRQ3jJuuIkBAug=;
 b=k9tFqTD3AollnFwuVXAphRTieQc2tFdP3xR7t4dCp8/2s65WKE7ObbINDZV/C23Fa1ypfu
 C3WoPObA/p9FNZMYBHRmB2rhf2YWOzPYJNnR823zjAWSkVqVIONc6XfSFuEHrHki3xLnGY
 6RFGylZaGAR3lYkYyPoSgRSgwCU33TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622745513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GxvrPlcFwDnvDezFxmpm/VeLbd6PGVRQ3jJuuIkBAug=;
 b=I5Cw2XyK7ofogyEUaIk1nuyLfBEl9J72IqFss1UmXNLUaoYiU6iDdvqHPQFaBxi20kq4OA
 /z9Ad1sHYKugH4BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mRYPG6khuWASMQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 03 Jun 2021 18:38:33 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Jun 2021 20:38:24 +0200
Message-Id: <20210603183827.24339-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 0/3] build: make check target
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

actually, there are 3 targets: check, check-c, check-shell.

Previous attempt: make: Add make check target + run.sh [1].
This is built on the top of patchset tst_net.sh: Allow to skip
initialization [2]. Hope this time library check will made it :).

I plan to wrap tests with a script in the future, which will parse
expected output, i.e. approach from #312 [3].

It's not ready due several problems, but for curious here is a test run:
https://github.com/pevik/ltp/runs/2739826773

1) I made something wrong, I have no idea how to fix this error:
make[1]: Entering directory 'ltp/lib'
../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-c'
../include/mk/generic_leaf_target.inc:110: warning: ignoring old recipe for target 'check-c'
../include/mk/generic_trunk_target.inc:105: warning: overriding recipe for target 'check-shell'
../include/mk/generic_leaf_target.inc:118: warning: ignoring old recipe for target 'check-shell'

2) I obviously have problem with out-of-tree build
https://github.com/pevik/ltp/runs/2739826612?check_suite_focus=true
where path of shell tests (which are in src directory only) is obviously
broken:
make[2]: *** No rule to make target 'shell/tst_check_driver.sh', needed by 'check-shell'.  Stop.
20
make[1]: *** [/__w/ltp/ltp/include/mk/generic_trunk_target.inc:105: check-shell] Error 2
21
make[1]: Leaving directory '/__w/ltp/ltp-build/lib'

3)  tst_bool_expr fails on some systems when run via make check:
https://github.com/pevik/ltp/runs/2739826773?check_suite_focus=true
But it runs ok when running normally. It might be dash issue
(it's on Debian).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20190924182841.4528-1-pvorel@suse.cz/
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=247078
[3] https://github.com/linux-test-project/ltp/issues/312

Petr Vorel (3):
  make: Add make check{,-c,-shell} targets
  build.sh: Add support for make check
  CI: Run also make check

 .github/workflows/ci.yml            |  3 +++
 Makefile                            | 21 ++++++++++++++++++++-
 build.sh                            | 18 +++++++++++++++++-
 include/mk/generic_leaf_target.inc  | 25 ++++++++++++++++++++++---
 include/mk/generic_trunk_target.inc |  4 ++--
 lib/newlib_tests/Makefile           |  8 ++++++++
 6 files changed, 72 insertions(+), 7 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
