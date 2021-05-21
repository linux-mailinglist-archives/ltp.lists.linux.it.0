Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55F38C315
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 11:29:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36AAA3C5DC4
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 11:29:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B03B13C1B5C
 for <ltp@lists.linux.it>; Fri, 21 May 2021 11:29:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D87EA100134D
 for <ltp@lists.linux.it>; Fri, 21 May 2021 11:29:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2967CAAA6
 for <ltp@lists.linux.it>; Fri, 21 May 2021 09:29:30 +0000 (UTC)
References: <20210513152125.25766-1-rpalethorpe@suse.com>
 <20210513152125.25766-7-rpalethorpe@suse.com> <YKT7xfzaUD7nNPzX@yuki>
 <871ra1lrf3.fsf@suse.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <871ra1lrf3.fsf@suse.de>
Date: Fri, 21 May 2021 10:29:29 +0100
Message-ID: <87y2c8juyu.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] sched/cgroup: Add cfs_bandwidth01
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

>>> +
>>> +static void cleanup(void)
>>> +{
>>> +	size_t i;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(cg_workers); i++) {
>>> +		if (cg_workers[i])
>>> +			cg_workers[i] = tst_cgroup_group_rm(cg_workers[i]);
>>> +	}
>>> +
>>> +	if (cg_level3a)
>>> +		cg_level3a = tst_cgroup_group_rm(cg_level3a);
>>> +	if (cg_level3b)
>>> +		cg_level3b = tst_cgroup_group_rm(cg_level3b);
>>> +	if (cg_level2)
>>> +		cg_level2 = tst_cgroup_group_rm(cg_level2);
>>
>> Hmm, I wonder if we can move this part of the cleanup to the test
>> library as well. If we add all cgroups the user has created into a FIFO
>> linked list then this could be implemented as a single loop in the
>> tst_cgroup_clean().
>>
>> We would have to loop over the list in the tst_cgroup_group_rm() in
>> order to remove the about to be removed group from the list as well, but
>> I guess that this is still worth the trouble.
>
> This sounds good. We probably need to check if the groups have processes
> in them to print a nice error message. My main concern with automatic
> cleanup is confusing errors from deep in the lib.
>

I think maybe this API makes a fundamental mistake of mixing memory/object
management with actual creation and deletion of CGroups. OTOH that is
not really clear either.

But if a child process starts deleting CGroups, which might be a
reasonable thing to do, then we will get a mismatch between child and
parent. Then the cleanup will be wrong.

Also any kind of linked list or array implementation uses more lines of
code than the cleanup function and more complex for sure... even if we
have 10 test cases like this is it really work saving a few lines in
each case?

I don't know. But I think we need to see a few more cases.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
