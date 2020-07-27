Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C522F3EB
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 17:34:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A54A73C26BD
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 17:34:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A956D3C089D
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 17:34:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E1C50600CE0
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 17:34:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9944AAEC1;
 Mon, 27 Jul 2020 15:34:50 +0000 (UTC)
Date: Mon, 27 Jul 2020 17:35:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200727153501.GD7863@yuki.lan>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <f0df00dd69cf02791a99883db1fd6fd7a1462074.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0df00dd69cf02791a99883db1fd6fd7a1462074.1593152309.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 17/19] syscalls/utimensat: Migrate to new test
 framework
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
> This gets rid of the test script and updates the utimensat01.c file to
> handle most of the tests covered earlier (apart from testing the same
> for files owned by root, as the test is run as root right now).

We also lost a check if atime and mtime was modified or not.

The original script did set both to 0 and then depending on what have
been passed as the times and if the call succeeded checked if the value
stayed zero or was modified. Can we add this back as well?

Also the modification for the makefile and runtest file is part of the
patch that adds the time64 variant while it should have been part of
this patch.

Other than this there are a few minor things, for instance I do not see
the reason for double indirection in the struct mytime. And I would have
done some of the initialization in the test setup, e.g. why do we call
update_error(), re-create TEST_DIR, etc. on each run.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
