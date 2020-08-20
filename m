Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3B24C536
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB4C73C5817
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 20:21:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A69DB3C12A1
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:20 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 57BAC1000663
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 20:21:20 +0200 (CEST)
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90F7E208E4;
 Thu, 20 Aug 2020 18:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597947677;
 bh=3aYHNG2HuqdhvavloLqNptJ3Ruqd8JnmWbP5SYLc6Wc=;
 h=From:To:Cc:Subject:Date:From;
 b=uLbZnRzDri2ck4cV0adxN47EiNtKH10LxcAg+L4o3DpW8Kj/NijZd/jZBa4UlZ3Pi
 zIZOJpTBqilKf/I5oe3iMvRIjevANsfw8V7byWoGUax55oZnyunjrzxGfhfaazdRYr
 PHUdbhdPuhePfCOfOvHnT06KrjkBV3QCFAhSZV+o=
From: Eric Biggers <ebiggers@kernel.org>
To: ltp@lists.linux.it
Date: Thu, 20 Aug 2020 11:19:16 -0700
Message-Id: <20200820181918.404758-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [LTP PATCH 0/2] ltp: fix af_alg02 to specify control data
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
Cc: linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

It isn't clearly defined what happens if you read from an AF_ALG request
socket without previously sending the control data to begin an
encryption or decryption operation.  On some kernels the read will
return 0, while on others it will block.

Testing this corner case isn't the purpose of af_alg02; it just wants to
try to encrypt a zero-length message.  So, change it to explicitly send
a zero-length message with control data.

This fixes the test failure reported at
https://lkml.kernel.org/r/CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com

Fixing the test in this way was also previously suggested at
https://lkml.kernel.org/r/20200702033221.GA19367@gondor.apana.org.au

Note, this patch doesn't change the fact that the read() still blocks on
pre-4.14 kernels (which is a kernel bug), and thus the timeout logic in
the test is still needed.

Eric Biggers (2):
  lib/tst_af_alg: add tst_alg_sendmsg()
  crypto/af_alg02: send message with control data before reading

 include/tst_af_alg.h               | 32 +++++++++++++++
 lib/tst_af_alg.c                   | 64 ++++++++++++++++++++++++++++++
 testcases/kernel/crypto/af_alg02.c | 21 ++++++++--
 3 files changed, 114 insertions(+), 3 deletions(-)

-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
