Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CED653F0013
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:12:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 975B13C5675
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:12:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF1463C248D
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 45E6B1000BEA
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:48 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 14F471FF8F;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629277968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LbbO4Z7sAX3y7bVX8Qji5kapPlC0HH6Tp7X5z84SXIM=;
 b=PuiNZRcW35fr3PzVNSJdFSOld+zoZ9YhHa6/aETUPhcyjvSEQDie1V+QBlj0USBMd1uGiL
 EhaEtWeTNPdeukcRFbOjJ9HFjkcVy/aaTnpd5rcuS3zUPyKAJyNmgYpaghGhR9jSvJuJUO
 9gUn5/rAdqYyOpmcBsFGW2vaSasOnf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629277968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LbbO4Z7sAX3y7bVX8Qji5kapPlC0HH6Tp7X5z84SXIM=;
 b=v5h9fJrPN50iIdp4f9y4HYv0CJ+E+jjRNB9lERGHQBTs1GnoLK6HtAUrNFPEDoNEtFKPZp
 ThlrPBDeNuEGtZCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B97A7133D0;
 Wed, 18 Aug 2021 09:12:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6+RBKw/PHGFKFwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:12:47 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 11:12:21 +0200
Message-Id: <20210818091224.27578-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] shell: remove which, use type or command -v
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

Petr Vorel (3):
  tst_test.sh: Simplify tst_cmd_available()
  binfmt_misc02.sh: Use "command -v" instead of "which"
  commands: Drop which01.sh

 runtest/commands                              |   1 -
 testcases/commands/which/Makefile             |  11 --
 testcases/commands/which/which01.sh           | 107 ------------------
 .../kernel/fs/binfmt_misc/binfmt_misc02.sh    |  14 +--
 testcases/lib/tst_test.sh                     |  13 +--
 5 files changed, 8 insertions(+), 138 deletions(-)
 delete mode 100644 testcases/commands/which/Makefile
 delete mode 100755 testcases/commands/which/which01.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
