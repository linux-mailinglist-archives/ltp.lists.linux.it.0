Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD47273E0
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jun 2023 02:53:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C0AB3CCB1B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jun 2023 02:53:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2799D3CC9C8
 for <ltp@lists.linux.it>; Thu,  8 Jun 2023 02:53:20 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C41301400E63
 for <ltp@lists.linux.it>; Thu,  8 Jun 2023 02:53:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7752263A37;
 Thu,  8 Jun 2023 00:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7522CC433D2;
 Thu,  8 Jun 2023 00:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686185596;
 bh=B3D1dPWm4UC18gCOOgRi+9jxWAB8ZniQXbeTCwBL3nk=;
 h=From:To:Cc:Subject:Date:From;
 b=T/HMSuxTOPCIa1PlW5r5/TRWcv/L9tQkRkXJMD+A1EYqUjbdcQ8XLqridC0t4GHEo
 zGKSNO3MfxlU1TYHq54eAs3VpOEIxtbbydcd+lOtXxBDJi/d9gdh9wecTk6ECHzX/W
 E/QwuRB80sOHd8U34ayHrlSAZPOaU/kg0yrtTEow81d6PxylGD00SIyAubsKnA+s1l
 kXfW6cJqEnZu8divUQybDPFkLGficyRgWogsOxwOF3kj5SqoJjzmw3OuMDNTIbadOu
 1xU7Zz4JLmMJ1BOobqFQYA3beXZYJKZP4FzZfdRNk6Z45blsya34X71uWuaczTRA4t
 +ljJA0sqTuIsA==
From: Damien Le Moal <dlemoal@kernel.org>
To: ltp <ltp@lists.linux.it>,
	Linus Walleij <linus.walleij@linaro.org>
Date: Thu,  8 Jun 2023 09:53:13 +0900
Message-Id: <20230608005315.3703446-1-dlemoal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/2] Improve ioprio tests
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The ioprio syscall tests rely on ltp internal definitions of the
IOPRIO_XXX() macro defining priority classes and levels. With changes
to the ioprio API to support command duration limits, these internal
definitions are incomplete, causing test case ioprio_set03 to fail.

Avoid this issue by having the iprio tests use the kernel header file
definitions if that header exists. This enables additional checks in
the header file [1] which restores the expected results with test
ioprio_set03.

[1] https://lore.kernel.org/linux-block/20230530061307.525644-1-dlemoal@kernel.org/

Note: a review of this patch on the kernel block mailing list would be
very appreciated.

Changes from v1:
 - Added Linus's review tag
 - Resend with being subscribed to ltp list this time :)

Damien Le Moal (2):
  ioprio: use ioprio.h kernel header if it exists
  ioprio: Use IOPRIO_PRIO_NUM to check prio range

 configure.ac                                  |  1 +
 testcases/kernel/syscalls/ioprio/ioprio.h     | 33 ++++++++++++++-----
 .../kernel/syscalls/ioprio/ioprio_set03.c     |  2 +-
 3 files changed, 26 insertions(+), 10 deletions(-)

-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
