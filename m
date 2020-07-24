Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE922C864
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 16:50:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64AE93C4D04
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 16:50:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1CBFC3C094C
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 16:50:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 794D81A01C86
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 16:50:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13E15B032;
 Fri, 24 Jul 2020 14:50:47 +0000 (UTC)
Date: Fri, 24 Jul 2020 16:51:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200724145103.GA10254@yuki.lan>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <bcade4d3066ea789f590267b402277b78e86dd8d.1593152309.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcade4d3066ea789f590267b402277b78e86dd8d.1593152309.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 11/19] syscalls/mq_timed{send|receive}: Add
 support for time64 tests
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
I've put the variant definition to the common header, since we have one
already it's pointless to keep two copies and pushed, thanks.

I've also pushed a patch on the top of that one that modifies the
timeous so that the test runs reasonably fast.

Also I'm starting to think that it may be easier to add all the syscall
variants into a single structure into an header that would be then
included by various tests, something as:

struct variant {
	int (*gettime)(clockid_t clk_id, void *ts);
	int (*settime)(clockid_t clk_id, void *ts);
	int (*getres)(clockid_t, void *ts);
	int (*tfd_gettime)(int fd, void *ts);
	int (*tfd_settime)(int fd, int flags, void *new_ts, void *old_ts);

	...

	enum tst_ts_type type;
	char desc;
} variants[] = {
...
};

Then we can include this to each test that needs it and be done with
it...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
