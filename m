Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396E192739
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 12:35:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB26E3C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 12:35:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CD6723C2312
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 12:35:21 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 49284601B11
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 12:35:20 +0100 (CET)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1jH4Jb-00008A-V2
 for ltp@lists.linux.it; Wed, 25 Mar 2020 11:35:20 +0000
Received: by mail-pg1-f199.google.com with SMTP id g8so1527473pgr.6
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 04:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=md3UWaiMcXcETbhhQfvbciALyAQxNxOwJqVfeUnCjDw=;
 b=qMCw5D7Xi/8Dql5iSLIx3CWC4FMmTQHNkcBKCkWdSWUcrMq6d1c4Zx564TxHF8ohMc
 T7pFru302AZD/yxMsQAkikiTP1w3g2dzBzgtI/JEeWObBYhWY/nIOCQ7cCbC8CjTogiO
 /74ldKvncHxj40+4id5e3mlu533igKocZSFs3Tf6lhiC2WJuSD1rjDWnAB5X5/8efj+U
 Y2ie9yIgUhWoa0gG3kEwZkSQyKyRrHE4uYhixQwhW8pFKEfjcynycvf0kvnFHuJSGWfx
 JyacL9T2H6Vv4JUPRPD3uKCKKnBKFvjacIC4UzjdJE6WnNeWdOMmdbjA8w+RvWrn0Bax
 vtaQ==
X-Gm-Message-State: ANhLgQ0hfLfFRWjlPmYE5AAoUKclCzJUqfAyQyeaEOv4iyOdfLn/gQla
 iSYmGi5R6SkVvff1FCpLt3Fnq/10V/d51N9opg8nGjl5pmi66LsbuobT+i3VtHUtKiHgymyUglJ
 qVIE1Q6PFIFIA6MRS4p7VY5jXrLg=
X-Received: by 2002:a17:902:a407:: with SMTP id
 p7mr2797221plq.257.1585136118410; 
 Wed, 25 Mar 2020 04:35:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuGuZ8V+i91hbrfGTuhr8SyuSmKmFHg3THKWKy0b6ydZQl5Y7Nm2vaubNfbtGAFeunSX5eMuQ==
X-Received: by 2002:a17:902:a407:: with SMTP id
 p7mr2797194plq.257.1585136118031; 
 Wed, 25 Mar 2020 04:35:18 -0700 (PDT)
Received: from localhost.localdomain (223-136-97-141.emome-ip.hinet.net.
 [223.136.97.141])
 by smtp.gmail.com with ESMTPSA id x4sm1814400pgr.9.2020.03.25.04.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 04:35:17 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: xuyang2018.jy@cn.fujitsu.com,
	ltp@lists.linux.it
Date: Wed, 25 Mar 2020 19:35:06 +0800
Message-Id: <20200325113507.22086-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com
References: 1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] ltp_tpci.c: fix a null pointer
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

We have encountered this null pointer dereference issue too, with this
fix the test can be executed properly.

Tested-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
