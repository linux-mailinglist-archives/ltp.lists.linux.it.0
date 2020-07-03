Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA2213765
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:14:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 821293C2A2B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 11:14:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0EF333C0EC0
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:14:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94619601DCB
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 11:14:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 969E4AD2C;
 Fri,  3 Jul 2020 09:14:51 +0000 (UTC)
Date: Fri, 3 Jul 2020 11:15:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200703091510.GA2308@yuki.lan>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <681915c7fbb224ffdd9acb5dba012cc7aadfbd46.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <681915c7fbb224ffdd9acb5dba012cc7aadfbd46.1593152309.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 06/19] syscalls/futex: Merge futex_wait_bitset
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> We can handle them easily in a single test, lets do it.

I guess that the original reason to keep them separate was due to
tst_timer_check() function that exits the test if particular timer is
not present.

However these days we expect that CLOCK_MONOTONIC is present in many
testcases so we can as well remove the function from the test, which I
did before applying, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
