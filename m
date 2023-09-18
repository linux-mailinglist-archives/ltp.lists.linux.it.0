Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E92347A48EF
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 13:56:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7AA43CE4E4
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Sep 2023 13:56:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1C98F3CA983
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 13:56:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4B26D200D12
 for <ltp@lists.linux.it>; Mon, 18 Sep 2023 13:56:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 469DA21B44;
 Mon, 18 Sep 2023 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695038169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GOwJYmT+Q3KMKoN+bpVq/x3B2zVoCPYH8EPz8y5NBrA=;
 b=EgNgLLCNrfxHLdK7xZZK2Y42M/YlULecK8hSXapHj5S5eQam2bpu47DylEtFgbm4n3wxBQ
 ut/h5bSwuGa71Sd7Cnyez78y5DB0IrrWQBt9dQk48JcxAwcigIH6os6zE1rx3vMQtrmit9
 9y7KUutHqriwhRBSkqguXfgor4It4zA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695038169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GOwJYmT+Q3KMKoN+bpVq/x3B2zVoCPYH8EPz8y5NBrA=;
 b=hKoqrnptwfkO4RdWI8TY5gw3uomnzCNaypLhfqFm5knVTIU6NBarn1b601OrWAa1K95RTF
 vxBIbAu+jsz3aGBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 204D113480;
 Mon, 18 Sep 2023 11:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LpWKBtk6CGXpZQAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Mon, 18 Sep 2023 11:56:09 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Mon, 18 Sep 2023 13:56:06 +0200
Message-Id: <20230918115608.5630-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/2] Add kirk & ltx tools
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

Replaced runltp-ng with kirk and added ltx tool for parallel execution.

Andrea Cervesato (2):
  Replace runltp-ng with kirk framework
  Add Linux Test eXecutor inside tools

 .gitmodules        |  9 ++++++---
 tools/kirk         |  1 +
 tools/ltx/Makefile | 31 +++++++++++++++++++++++++++++++
 tools/runltp-ng    |  1 -
 4 files changed, 38 insertions(+), 4 deletions(-)
 create mode 160000 tools/kirk
 create mode 100644 tools/ltx/Makefile
 delete mode 160000 tools/runltp-ng

-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
