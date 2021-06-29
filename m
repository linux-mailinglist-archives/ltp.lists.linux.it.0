Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C93B7A0E
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 993F43C9398
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:48:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D39BE3C6CB6
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E826A60075F
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F0D222176;
 Tue, 29 Jun 2021 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+zozmRRmphr4cAQ3dkdOpTc/fPXOYsE09h2wVxjoHw=;
 b=z8zxIPXiw6fvUfYcMUwpkdkrXH7bVByUvw9wCYV+aaSAvqYXju/A0+27X3PZKv3TssuZVN
 WhyBzPSbCjwXSUeQtrWDf28VC5+ICyPrTdbEu5bbAAe5HwDnM/2eBR9LVIAjo1D92vR0zi
 kf4cY5ktoHq+cMHMEEEWTiE0VLfF6dQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+zozmRRmphr4cAQ3dkdOpTc/fPXOYsE09h2wVxjoHw=;
 b=s4gG7KCohgBTx+92cuvdMEuD8YyRB+PJmXvQvOH+NQfBQP62H2bONXhIgrVZ80x4I+Dg3b
 T7acviDSbB2gubCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F303111906;
 Tue, 29 Jun 2021 21:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+zozmRRmphr4cAQ3dkdOpTc/fPXOYsE09h2wVxjoHw=;
 b=z8zxIPXiw6fvUfYcMUwpkdkrXH7bVByUvw9wCYV+aaSAvqYXju/A0+27X3PZKv3TssuZVN
 WhyBzPSbCjwXSUeQtrWDf28VC5+ICyPrTdbEu5bbAAe5HwDnM/2eBR9LVIAjo1D92vR0zi
 kf4cY5ktoHq+cMHMEEEWTiE0VLfF6dQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003294;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=u+zozmRRmphr4cAQ3dkdOpTc/fPXOYsE09h2wVxjoHw=;
 b=s4gG7KCohgBTx+92cuvdMEuD8YyRB+PJmXvQvOH+NQfBQP62H2bONXhIgrVZ80x4I+Dg3b
 T7acviDSbB2gubCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Rl7jOR2V22AcSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 21:48:13 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 23:48:03 +0200
Message-Id: <20210629214808.18760-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] Run tests in CI
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

Hi all,

changes v2->v3:
* going back to simplest changes in make
* adding lib/newlib_tests/runtest.sh (instead fighting with our build
  system I concentrated on runtest.sh)
* removing tst_fuzzy_sync01 as it sporadically fails

Tested:
https://github.com/pevik/ltp/actions/runs/984224611

TODO: Not what's wrong with PATH on CentOS 7:
/__w/ltp/ltp/lib/newlib_tests/runtest.sh: line 78: ./test05: No such file or directory
./shell/net/../../../../testcases/lib/tst_test.sh: line 149: tst_rod: command not found

Maybe it's in different directory?
It uses old make 3.82, there is something incompatible.

Kind regards,
Petr

Petr Vorel (5):
  tst_device: Require root
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test
  CI: Run also make test

 .github/workflows/ci.yml      |   3 +
 Makefile                      |  10 +++
 build.sh                      |  18 ++++-
 lib/newlib_tests/runtest.sh   | 120 ++++++++++++++++++++++++++++++++++
 lib/newlib_tests/tst_device.c |   1 +
 5 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
