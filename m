Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3866248A8
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Nov 2022 18:52:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 536B03CDD83
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Nov 2022 18:52:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 484D83C8F97
 for <ltp@lists.linux.it>; Thu, 10 Nov 2022 18:52:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 87F7D100036F
 for <ltp@lists.linux.it>; Thu, 10 Nov 2022 18:52:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 893A1219E5;
 Thu, 10 Nov 2022 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668102761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DLEmHhZer3VWRbjypNXygvOKK5MyZPDmg6s68A2TJhE=;
 b=ZuT/xjEZRSqRnBv3eT/F84dC0McTfOi6wJlnWHqDF83jrvsFWSpMVkLPj8ri953wrhDJUN
 zQGHttxjKBlutQBEkCvatJzMRJrw/OFJi7fV2ijaCn3hQMe0uTsj+zuhccdTlz6ulWNl4K
 Cil2EPK6UEl9r0YbScy1VYasYftYBBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668102761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DLEmHhZer3VWRbjypNXygvOKK5MyZPDmg6s68A2TJhE=;
 b=/YO0SUjWMVZ9XdvgTVgiuYC2EAJRdKSHR8C33cuganvHT7F2IY/S72sNWR5xL+v+3RWrbq
 yy1Ys7aEI8UmaJCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE74613B58;
 Thu, 10 Nov 2022 17:52:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WkiKMGg6bWM0GgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 10 Nov 2022 17:52:40 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Nov 2022 18:52:34 +0100
Message-Id: <20221110175236.32094-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] tst_find_backing_dev() fixes
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
Cc: Alessandro Carminati <alessandro.carminati@gmail.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

"tst_find_backing_dev: fix stat fails /dev/root" patchset needs cleanup
of left unused function and strange wording in docs. Although fixes are
trivial, sending in case I overlooked something.

Also, the Btrfs part deserves putting into its own function;
code now has too long lines, too many indents, function is too long.

Kind regards,
Petr

https://lore.kernel.org/ltp/20221026140408.471609-1-alessandro.carminati@gmail.com/
https://patchwork.ozlabs.org/project/ltp/list/?series=327409&state=*

Petr Vorel (2):
  lib/tst_device: Remove unused count_match_len()
  doc/c-test-api.txt: Improve tst_find_backing_dev() doc

 doc/c-test-api.txt |  9 +++------
 lib/tst_device.c   | 10 ----------
 2 files changed, 3 insertions(+), 16 deletions(-)

-- 
2.38.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
