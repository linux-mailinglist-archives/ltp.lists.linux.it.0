Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58072792236
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:42:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3194D3CEB80
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Sep 2023 13:42:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E722D3CB1B7
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:41:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2ECBD1400077
 for <ltp@lists.linux.it>; Tue,  5 Sep 2023 13:41:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CE391F8C4;
 Tue,  5 Sep 2023 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693914118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zoGTWVorYdarql7OoAWMmthJGt4vWAhtyWfe7w+do6A=;
 b=0biwyilYSFMtR3Q+zKNNIVb2FfJ2Zj7TubGDefmmyg5QZL9zi1viLNNoZBrBPrNfgbHPEU
 TpVXxvjn8iWQHmhgyNCmZdqv1MQE1HJ4MSH8LTelTFhAh8Q40Wi+FjjuskFSMSU46RYdb1
 nXwmN86qqhp7cwOZQbS3CQLten96Wf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693914118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zoGTWVorYdarql7OoAWMmthJGt4vWAhtyWfe7w+do6A=;
 b=lAP3FhGDpj/MGsrpg6J+mhtLXu4pqjcpVJ8pF0SNld/cU1rWAYZoe8BI1eU9YoNCgykm7C
 YFD7c39nQ065cwAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 546C813911;
 Tue,  5 Sep 2023 11:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WtEMEwYU92TGeQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Tue, 05 Sep 2023 11:41:58 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Tue,  5 Sep 2023 13:41:55 +0200
Message-Id: <20230905114157.4190-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 0/2] Rewrite the gettid() testing suite
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Rewrite gettid01 and create a new gettid02 test in order to check all
gettid() basic functionalities, according with its manual.

Andrea Cervesato (2):
  Rewrite gettid01 test
  Add gettid02 test

 runtest/syscalls                            |   1 +
 testcases/kernel/syscalls/gettid/.gitignore |   1 +
 testcases/kernel/syscalls/gettid/Makefile   |   4 +-
 testcases/kernel/syscalls/gettid/gettid01.c | 102 +++-----------------
 testcases/kernel/syscalls/gettid/gettid02.c |  68 +++++++++++++
 5 files changed, 87 insertions(+), 89 deletions(-)
 create mode 100644 testcases/kernel/syscalls/gettid/gettid02.c

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
