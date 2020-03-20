Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB918CD6B
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 13:03:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78F7B3C53B2
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 13:03:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B7DB83C537D
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 13:03:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E6DBF201014
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 13:03:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35D32AF84;
 Fri, 20 Mar 2020 12:03:45 +0000 (UTC)
Date: Fri, 20 Mar 2020 20:59:30 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200320195930.GA4486@yuki.lan>
References: <6648a9106e367d370012c8ee1d0d81c369779ba8.1584014172.git.viresh.kumar@linaro.org>
 <928553e5fd3518fccb363fb8b6ad079ac3c75fd2.1584090119.git.viresh.kumar@linaro.org>
 <20200313124920.GC6597@rei.lan>
 <20200320043548.66orcumbq57wqyzt@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320043548.66orcumbq57wqyzt@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 10/10] syscalls/open_tree: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Here as well, shouldn't we just set the .mount_device flag instead?
> 
> Hi,
> 
> Sorry but I am not sure what will happen by .mount_device here. From
> what I see from tst_test.c, that flag will end up calling SAFE_MOUNT()
> automatically, but what we are calling here is fsmount() and
> move_mount() instead.
> 
> Can you please elaborate a bit on that ? Thanks.

My point here is that most of the code just mounts the device and since
we are testing open_tree() there is no point in mounting the device with
the new mount API in the first half of the run() function, it should
work fine with the device mounted with the plain old mount(). Also we do
OPEN_TREE_CLONE here, so there is no point in mounting the filesystem in
the run() fucntion, moreover it will probably fail with the -i
parameter.

So I'm suggesting to remove the part that mounts the device in the first
half of the test and set the .mount_device flag instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
