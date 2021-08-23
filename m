Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACC3F4CFC
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BC1B3C9E95
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 338213C3235
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 83D001000953
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7A902000D
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629731113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dcK9uFUHOL8rlz3u8r3tEyvXU554wmzsjqDSSQsXryU=;
 b=fOnR6wXMSlo0oLZpWCqunvo6TOG6BWpBqEJBMyqHu8FLa1PYVcCOsmDl1ZZdwjwaKVDdnh
 yrOOMk5njfemHqxA8DyICitnVnVXT3BBDzuVetClUQtBimFDZCWP7ZQr17ATHbE4L5WKTy
 4DHIsy1p1fON5xwKenAKBZVUkYfFKew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629731113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dcK9uFUHOL8rlz3u8r3tEyvXU554wmzsjqDSSQsXryU=;
 b=WjWp0lN1Iv+1jGiyXfi8AnfSrIDPS5PGIrvu7nb6tPw8a/maDexVBN0qriT5EiEj6jJA7I
 h3K/F7sprEM4qyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB01B13BE0
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SfgYLCm5I2GyQgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:13 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Aug 2021 17:05:17 +0200
Message-Id: <20210823150520.25614-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] TST_EXP_*() macros fixes
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

Cyril Hrubis (3):
  tst_test_macros: Fix TST_EXP_*() default message
  tst_test_macros: Stringify early
  tst_test_macros: Add test_macros05 tests

 include/tst_test_macros.h        | 40 ++++++++++++++-------------
 lib/newlib_tests/.gitignore      |  1 +
 lib/newlib_tests/test_macros05.c | 46 ++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 19 deletions(-)
 create mode 100644 lib/newlib_tests/test_macros05.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
