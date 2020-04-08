Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2D1A2AE9
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:17:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAE5D3C2D32
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 23:17:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B10B53C0358
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:17:53 +0200 (CEST)
Received: from confino.investici.org (confino.investici.org [212.103.72.250])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0F3A41400DC6
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 23:17:52 +0200 (CEST)
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 1BD4C21722;
 Wed,  8 Apr 2020 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1586380672;
 bh=7myV2qi5d0908XZihg5hJx0F+cGC/Omccogg+ZPA2f0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UbJysa+ZSvWwFhDbbtSyB+nSYYPBxXoinb1UaHxpRoYCzMqakyZjyty2fAN6vOLCD
 /d8MaE2kzns2U61kS2ig9BYeQyMj7iqCIXO0/kfbHGKVtS0f/qltE6+bSWD6Xqxlfy
 tVS4XqtEOoDnkOuArtx68tjvjJRR4VclAPefYYPo=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id EB97420EB7; 
 Wed,  8 Apr 2020 21:17:51 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 23:16:59 +0200
Message-Id: <20200408211700.7958-1-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
References: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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


I added a new test file (pipe2_03.c) to test pipe2 system call with and without
O_NONBLOCK enabled.
This test uses the macro SAFE_PIPE2 that I added, this macro is just the
equivalent of SAFE_PIPE for pipe2.

The diff --stat output is the following:
include/safe_macros_fn.h                   |   3 +++
include/tst_safe_macros.h                  |   3 +++
lib/safe_macros.c                          |  15 ++++++++++++++
testcases/kernel/syscalls/pipe2/.gitignore |   1 +
testcases/kernel/syscalls/pipe2/pipe2_03.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
5 files changed, 152 insertions(+)


Best regards.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
