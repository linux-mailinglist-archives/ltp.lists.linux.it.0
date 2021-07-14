Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B24213C85C3
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:07:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D5773C7572
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:07:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0A5A3C5580
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:07:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2736B200D36
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:07:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6FDD3202BE;
 Wed, 14 Jul 2021 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626271647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bbw75OTg6d8Xoq5SjUR1muC7mQIdo3+ukU3kedrlXn0=;
 b=GCqXQwDP3rnxJVCCpeNwAcUoL092xCuDBTG1uP5ZkUYEjquPuln6eSGy1/17iCHqV19HOq
 6tiNKb7d0C+S8ZjpczwJcEmHFzMnihTT5A/kdNNswkHYMJi1qwrp3WObY8rOXF6b3+FLn+
 0CPIbxg4FI9/Ec4SuPreRdmZWi6JLpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626271647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Bbw75OTg6d8Xoq5SjUR1muC7mQIdo3+ukU3kedrlXn0=;
 b=WXFaMrFMlF6jwyAWCULGZqr2Oi0e5hZ7idlFDg36BFKGvfDP2Rh1lk+v7uN3c9DyN2UPMt
 LPbs0BGh4L9TWgBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A94713C05;
 Wed, 14 Jul 2021 14:07:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AdvoC5/v7mC/cgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:07:27 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 16:07:14 +0200
Message-Id: <20210714140716.1568-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Add TST_NET_IPV{4,6}_ONLY and use on broken_ip
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

Hi Alexey,

https://github.com/linux-test-project/ltp/issues/843

does it make sense to run it on IPv4 and broken_ip-totlen on IPv6?
Both don't break but not in runtest file.

Kind regards,
Petr

Petr Vorel (2):
  tst_net.sh: Add variable for supported protocol
  broken_ip: TCONF when test run on unsupported protocol

 testcases/lib/tst_net.sh                              | 8 ++++++++
 testcases/lib/tst_test.sh                             | 2 +-
 testcases/network/stress/broken_ip/broken_ip-checksum | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-fragment | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-ihl      | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-nexthdr  | 3 ++-
 testcases/network/stress/broken_ip/broken_ip-protcol  | 3 ++-
 7 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
