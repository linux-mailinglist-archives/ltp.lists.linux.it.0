Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF13C9AA6
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BA783C84B1
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56E993C2E33
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:31:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A21AF2009DB
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:30:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1754D1FD3E;
 Thu, 15 Jul 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626337859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=toTU7X0xBt4FrUBQsOibrV2i+kpGuADwQr/IPfUtc6s=;
 b=oSrQrcSXbfXNcZEXB/Nlya5GV4Ao8dpI8iNHCmQu6pCilQCFjky+lQOtpPYzmeUJWIflZX
 S5RlmSkuoUeAmf/wmCNi8xPWWM7kuV0+OYxKI15J820whLnllUHJVn2Cic+E4UnTUHpGNb
 fL0Qn+42nOYSBGknrbmSfISzxIx1CuA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626337859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=toTU7X0xBt4FrUBQsOibrV2i+kpGuADwQr/IPfUtc6s=;
 b=GL6W134w2V+oiK/+M8BU0nV0zfYkSiO9wECdWTEOtfFouqvmZffHDnf1PH5ktoRTLMnvOc
 YK/JiKyPcV/f4sCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D73A713C2E;
 Thu, 15 Jul 2021 08:30:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ugRLL0Ly72BhdAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 08:30:58 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Jul 2021 10:30:47 +0200
Message-Id: <20210715083052.7138-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/5] 	Run tests in CI
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

Hi,

changes v5->v6:
* add new commit suggested by Cyril: "lib: Print Summary: into stderr"
* fix final error evaluation for C tests in runtest.sh
* run C and shell test separately (test-c and test-shell instead of
  test). Having them separate helps to easily navigate in CI. This
  required to add support to build.sh.

Hope this is a final version.

Kind regards,
Petr

Petr Vorel (5):
  lib: Print Summary: into stderr
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test{,-c,-shell}
  CI: Run also make test-c, test-shell

 .github/workflows/ci.yml    |  10 ++
 Makefile                    |  23 +++++
 build.sh                    |  24 ++++-
 lib/newlib_tests/runtest.sh | 182 ++++++++++++++++++++++++++++++++++++
 lib/tst_test.c              |  12 +--
 5 files changed, 244 insertions(+), 7 deletions(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
