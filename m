Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA22EBC96
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:43:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE4813C5841
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:43:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BBE863C06B6
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:43:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3189C1A0092C
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:43:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FEDCAD19;
 Wed,  6 Jan 2021 10:43:24 +0000 (UTC)
Date: Wed, 6 Jan 2021 11:44:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Luo Fenglin <luofenglin1@huawei.com>
Message-ID: <X/WUgOgHiWj1+9Nb@yuki.lan>
References: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
 <1602841876-91490-3-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602841876-91490-3-git-send-email-luofenglin1@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] sched/sched_stress:Bugfix for setting real
 time priority
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
Cc: qiangqiang.wangqiang@huawei.com, claire.chenyue@huawei.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> When real time flag is set, setpriority function is used for user-time
> policy setting, here use sched_setscheduler to set real time policy RR
> instead

This explains what has been changed, which is not useful, everyone can
see read the code diff.

What is missing here is why this has been changed, as when you change
the testcases to run with realtime priority the test behavior changes
and we do end up testing something different that the test originally
did.

The main problem with the testsuite is that it's missing high level
description what exactly is being tested and why. The README just says
run sched_stress.sh, that's not useful at all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
