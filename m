Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACD5B73DB
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 17:19:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F4EC3CAAD5
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 17:19:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC13B3CAAD5
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 17:19:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E5162600D34
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 17:19:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7B534BEA
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663082348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yxnroM/501W3ImaFc4lINlqB6+DCtka+b+6jwyCgjnw=;
 b=Qgp+X+2t30oabwEXnFh+P83NRy3XgrJ2/leFU7LSCq9PYUU/l6JLA/6FxbsnWCOl+kKe4Z
 6XZxFzfP1y+wfmgksNYpzJ5Sh/5S+rAbjDvg86x1JgCNA0mhq26pQodi8XCXVO2/+5YHx8
 ALePAeFbh0gZ+QWOOQms15AQJB5AmS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663082348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yxnroM/501W3ImaFc4lINlqB6+DCtka+b+6jwyCgjnw=;
 b=QNcGViIJWkFOcz/TJGYskp6fcFYfwRemH7rZ7B+u7BOrgH/wzJ6uk75vXebmb9lsqOJ7NE
 /QYGvzw0xXFmKdCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00C29139B3
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 15:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u3z3OmufIGPtUQAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 15:19:07 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Sep 2022 17:19:04 +0200
Message-Id: <20220913151907.26763-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] Fix ADSP074 timeouts
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

ADSP074 runs dio_sparse with extreme number of children which can result
in severe system overload and random test timeouts simply because
the main test process gets blocked by scheduler for 30+ seconds. Make
io_read() aware of max_runtime and redesign child failure detection to fix
the timeouts.

Also fixes a bug in io_read() which could have caused false negatives.

Martin Doucha (3):
  Add tst_validate_children() helper function
  Make io_read() runtime-aware
  dio_sparse: Fix child exit code

 include/tst_test.h                            |  8 ++++
 lib/tst_res.c                                 | 37 +++++++++++++++++++
 .../kernel/io/ltp-aiodio/aiodio_sparse.c      |  9 ++---
 testcases/kernel/io/ltp-aiodio/common.h       |  6 +--
 testcases/kernel/io/ltp-aiodio/dio_sparse.c   |  8 +---
 5 files changed, 53 insertions(+), 15 deletions(-)

-- 
2.37.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
