Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E704C59814D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 12:09:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1D853CA1A2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Aug 2022 12:09:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED4723CA15B
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 12:09:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 61D271A006F1
 for <ltp@lists.linux.it>; Thu, 18 Aug 2022 12:09:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A5B3B5BCEC;
 Thu, 18 Aug 2022 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660817390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EFZJ5oOr6nkXMYM7VdlGxsT5PrvuqgBbuF7dNpzh87c=;
 b=rQaqNdX8uVWKMLmbizw3y7x+uvbFCQPC/d7yTgCEJJK8xOtVdG8mpGmDn0hP4oBIvp5ioG
 5LmZ7B8g0hyGZR5TUkYtHPxpFnA2ihxYHO99umVEtLxYZdZA65iKgcPbC3nsaBkO3/uZwR
 SY4unzW6Lx0iOnGvRirgc1NML2FGitI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660817390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EFZJ5oOr6nkXMYM7VdlGxsT5PrvuqgBbuF7dNpzh87c=;
 b=5/bE+g5ufSCH/YFChqxNcDE7aI5XzW0JD6ah7ZlbYuXIUSzohc/BUboKOBTVjZs5ErvSGK
 VzreLNsyTGNfoUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1636A139B7;
 Thu, 18 Aug 2022 10:09:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NXXjAu4P/mIBDAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 18 Aug 2022 10:09:50 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Aug 2022 12:09:43 +0200
Message-Id: <20220818100945.7935-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Fix mkfs.xfs 300MB min size requirement
 (v5.19.0)
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
Cc: automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Changes v1->v2:
* bump min size to 300 MB instead using workaround (export TEST_DIR=1
  TEST_DEV=1 QA_CHECK_FS=1)
* increase test for .dev_min_size (so that we don't test for the default
  value)

Kind regards,
Petr

Petr Vorel (2):
  tst_device: Increase DEV_MIN_SIZE to 300 MB
  lib/tests: Increase .dev_min_size

 lib/newlib_tests/tst_device.c | 2 +-
 lib/tst_device.c              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
