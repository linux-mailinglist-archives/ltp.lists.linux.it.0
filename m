Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11079797589
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Sep 2023 17:52:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7AAB3CE9BD
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Sep 2023 17:52:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 258393CCB88
 for <ltp@lists.linux.it>; Thu,  7 Sep 2023 17:51:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8AF05600C33
 for <ltp@lists.linux.it>; Thu,  7 Sep 2023 17:51:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 877411F74D;
 Thu,  7 Sep 2023 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694101908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhVVQigEhQSe2puyInDcrktnCbEf06JLtfbWnyCl/co=;
 b=sh3shq3mjYgBf6OcZrzPsRqFvOAwoemU0rOF1OfeIk9MHwZQgtonV2NuGh1uSvQ8eiShZr
 PQSakyWBxJxuoW0dpWBowZfZmTqbBsIpXVY+RLtNYJRvplqgWz7eU8s/R3WiqUzD7o+y/+
 93WpP8R68dTj1jRjKS8HP2HlKYscr6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694101908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JhVVQigEhQSe2puyInDcrktnCbEf06JLtfbWnyCl/co=;
 b=qVinUpLCO80Xpfy123iRnxWMHzHjNMZL960swvoGJ0Bg1XhXYhMksjd63bjhT7yqwaUYK7
 7jhAhV8bnDRcUDAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6736D138FA;
 Thu,  7 Sep 2023 15:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1xkzGJTx+WReCwAAMHmgww
 (envelope-from <mkittler@suse.de>); Thu, 07 Sep 2023 15:51:48 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Thu,  7 Sep 2023 17:51:40 +0200
Message-ID: <20230907155144.21697-1-mkittler@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/4] Improve ioctl02.c
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

Improve ioctl02.c

Marius Kittler (4):
  Refactor ioctl02.c to use the new test API
  Use correct binary operand in ioctl02.c
  Make checks for termio flags more strict
  Simplify ioctl02.c further

 testcases/kernel/syscalls/ioctl/ioctl02.c | 396 ++++++----------------
 1 file changed, 106 insertions(+), 290 deletions(-)

-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
