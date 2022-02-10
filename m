Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC34B12B4
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 17:27:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 982493C9EA0
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Feb 2022 17:27:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 14DF53C9C2E
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 17:27:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 61747200935
 for <ltp@lists.linux.it>; Thu, 10 Feb 2022 17:27:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9108E1F391;
 Thu, 10 Feb 2022 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644510463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KJcG9JVDK5f69rnkhMYcMjpNX4I6dZYJvMst/3n62Jo=;
 b=NnG+nO60nDzMrcDI2Vr0VAArmZd2tkqDbqcej5rm1nhMOmEUVy6hAmiGVo7QJXt41VXaxB
 szqkSMinKxHoWXKVMTsnVxSnXxtk7BsNLl2yOiT+D0u2tobt+tJOQKPjFB0zPWQi8YyLZ9
 /F8orp/IbLz7puZVfJVaYM1ZUQPUrHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644510463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KJcG9JVDK5f69rnkhMYcMjpNX4I6dZYJvMst/3n62Jo=;
 b=rYPqZ0scxYg3ZHXRO6FyR0YViN6AvFTY/E/8z8uoWxbZWeuhk1CqJ5t1OsR58/3LbpRsLn
 MCM205rC4tsMwrAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D79F13BC1;
 Thu, 10 Feb 2022 16:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B4CdEP88BWJAMgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 10 Feb 2022 16:27:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Feb 2022 17:27:33 +0100
Message-Id: <20220210162739.30159-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/6] Add TST_FORMAT_DEVICE support
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

changes v1->v2:
* Replace $TST_DEFAULT_FS_TYPE with proper $TST_FS_TYPE initialization
  (Cyril)
* Redesing tst_mkfs() API (Cyril)
  We now parse only fs_type, the rest we pass to mkfs.* the same way we
  end up passing them on a command line.

Petr Vorel (6):
  tst_test.sh: Properly init $TST_FS_TYPE
  tst_test.sh: Redesing tst_mkfs() API
  tst_test.sh: Add $TST_FORMAT_DEVICE and related vars
  df01.sh: Use TST_FORMAT_DEVICE=1
  shell: Add test for TST_FORMAT_DEVICE=1
  doc: Add missing shell variables

 doc/shell-test-api.txt                      | 37 +++++++++++++++++++--
 lib/newlib_tests/shell/tst_format_device.sh | 24 +++++++++++++
 testcases/commands/df/df01.sh               |  5 +--
 testcases/commands/mkfs/mkfs01.sh           |  2 +-
 testcases/lib/tst_test.sh                   | 28 ++++++++++------
 5 files changed, 79 insertions(+), 17 deletions(-)
 create mode 100755 lib/newlib_tests/shell/tst_format_device.sh

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
