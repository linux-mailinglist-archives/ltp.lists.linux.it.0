Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E179D3F6
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Sep 2023 16:44:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D774C3CDEDF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Sep 2023 16:44:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0E973CB34B
 for <ltp@lists.linux.it>; Tue, 12 Sep 2023 16:43:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CFFD601E9A
 for <ltp@lists.linux.it>; Tue, 12 Sep 2023 16:43:55 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8D0EC1F45F;
 Tue, 12 Sep 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694529834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JgLB4fBpjHdjYz1sRC8ZAwfIvVf3uRf8uPiGdmW2Nrk=;
 b=KsqCgidCIV40gaQB+AMDugnZ+Jd0C2CYduWPCpiGlbGlzGVuLIgzQVbrFjQ3n2Wl9OiKz4
 YRRu0RxnMpXuezXf6CqQFAYLRmXFmomoUkCdIxCZcnvI2wG+NyfcDI2m2ijwl/FkE/I0GI
 J2kUaBNNbAYM7eoyGgAg6/lsGKPaSzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694529834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JgLB4fBpjHdjYz1sRC8ZAwfIvVf3uRf8uPiGdmW2Nrk=;
 b=x/3XfZZGyZ/tPt6gSxI/eaVlVPPX6gh50aJoLL5D6GzZhetxQFTfBzWTZ8UCMJWG2AmXby
 WVEANSDulMvBgtBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CC5113A39;
 Tue, 12 Sep 2023 14:43:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ThF4GSp5AGUXYAAAMHmgww
 (envelope-from <mkittler@suse.de>); Tue, 12 Sep 2023 14:43:54 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Tue, 12 Sep 2023 16:43:49 +0200
Message-ID: <20230912144351.13494-1-mkittler@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/2] Fix most severe problems with `rt-migrate.c`
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

This set of patches fixes the most severe problems with
`rt-migrate.c`. I can do further improvements and refactorings if
that is wanted.

Marius Kittler (2):
  Ensure prio is within valid range in `rt-migrate.c`
  Prevent segmentation fault when negative task count specified

 .../realtime/func/rt-migrate/rt-migrate.c     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
