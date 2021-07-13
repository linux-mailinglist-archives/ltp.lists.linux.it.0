Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA73C6E48
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F6993C8765
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7FF643C876A
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B78F1A00888
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A17D02008D;
 Tue, 13 Jul 2021 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=91coNBJXxk21+sgr+vsNfRV13xTN9/yc4IUiUHTIHv0=;
 b=AxDYQzRxpM3uUa6l6h1m7uheQQB+2S4xdUabpP0YAhtFwae82Gl0BTGQUIrjUb+UoigVjs
 EDP4626BzkCAs88Tls2yvNgCDB1qJ8dnFvZkt7WHCg0qOUqIsR1smqUxZHNMrD0NB7RPqg
 RtUUUcio1usFzc/SXEDSiUMn6Lwn9Qo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171224;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=91coNBJXxk21+sgr+vsNfRV13xTN9/yc4IUiUHTIHv0=;
 b=kaOHN0g4Diz8PjgRGI3ld59zemw27tsxZhiCRndYoX2vbJcvNtBZnsps1oCPelh0MGwGjJ
 XpTmm6vIVXfdKwDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6378A13AE3;
 Tue, 13 Jul 2021 10:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p84dF1hn7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:31 +0200
Message-Id: <20210713101338.6985-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/7] Run tests in CI
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

changes v3->v4:
* don't run on cross compile build
* add 2 commits to fix tests on (tst_net.sh on dash and tst_strstatus.c
  on alpine)
* partly rewrite runtest.sh

tested
https://github.com/pevik/ltp/actions/runs/1026124767

Kind regards,
Petr

Petr Vorel (7):
  tst_device: Require root
  tst_net.sh: Declare prefix variable as empty
  tst_strstatus.c: Use musl compatible status number
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test
  CI: Run also make test

 .github/workflows/ci.yml         |   5 ++
 Makefile                         |  23 +++++
 build.sh                         |  22 ++++-
 lib/newlib_tests/runtest.sh      | 148 +++++++++++++++++++++++++++++++
 lib/newlib_tests/tst_device.c    |   1 +
 lib/newlib_tests/tst_strstatus.c |   3 +-
 testcases/lib/tst_net.sh         |   2 +-
 7 files changed, 201 insertions(+), 3 deletions(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
