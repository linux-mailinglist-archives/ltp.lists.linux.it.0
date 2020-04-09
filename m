Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FCF1A3BBE
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 23:13:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 954363C2D02
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 23:13:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id CED9A3C0639
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 23:13:45 +0200 (CEST)
Received: from latitanza.investici.org (latitanza.investici.org
 [IPv6:2001:888:2000:56::19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BC789200C65
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 23:13:43 +0200 (CEST)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 7915E121A21;
 Thu,  9 Apr 2020 21:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586466822;
 bh=EB6iWAMjMImDhfRH121FYgruWsZ6Tmu+RzFm1adqo/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bJCGYlECKDZJn47BSG4+hdBPaCuXCKn+n6RyyvTIlEVhJlD5aiyY84kr+QbiisbgT
 qWfEuNIpDuI+FvzwbND/NIv14+h5CtfhJDsPzqCh1VA1IuZsFI+grPaN0YZy7NgWvt
 nviMaDzmK2S1ZjuOp2wWI+57hdJIqZAUTYiG1bns=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 431FC121A23; 
 Thu,  9 Apr 2020 21:13:42 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Thu,  9 Apr 2020 23:12:54 +0200
Message-Id: <20200409211255.1357-1-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
References: <67fdc846a8cd8616c9eb13cf89463b9d637e6849>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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

Hi.


I added a new test file (pipe2_03.c) to test pipe2 system call with and without
O_NONBLOCK enabled.
This test uses the macro SAFE_PIPE2 that I added, this macro is just the
equivalent of SAFE_PIPE for pipe2.

I do not know if it is correct to do that but at the end of the test function we
need to set the pipe in the same state as it was at the end of setup function:
1. Set the O_NONBLOCK flag to the pipe.
2. Read the pipe to empty it.
3. We do not set its size to default because we do not care of it.
If we do not do that, there will be problem when this test is run multiple time
(this problem was found when running ./pipe2_03 -i 10).

The diff --stat output is the following:
 include/old/safe_macros.h                  |   3 +++
 include/tst_safe_macros.h                  |   6 ++++++
 lib/safe_macros.c                          |  15 ++++++++++++++
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/pipe2/.gitignore |   1 +
 testcases/kernel/syscalls/pipe2/pipe2_03.c | 135 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 161 insertions(+)


Best regards.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
