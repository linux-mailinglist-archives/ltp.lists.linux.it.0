Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB918BDEC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 18:24:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 661753C544D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 18:24:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 59BAC3C544D
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 18:24:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A4B401000C50
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 18:24:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED693ABE9;
 Thu, 19 Mar 2020 17:24:48 +0000 (UTC)
Date: Fri, 20 Mar 2020 02:20:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200320012033.GC1430@yuki.lan>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
 <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
 <20200319232426.GD29386@yuki.lan>
 <20200319161834.4hdz4q75yyk4cfy2@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319161834.4hdz4q75yyk4cfy2@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clone3: New tests
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
> What's happening is that parent is able to send the signal before the
> child calls pause() and so it hangs. If I simply remove pause() it all
> works fine for me, but is pidfd_send_signal() synchronous ? Does it
> wait until the time child signal is executed ? If yes, then we don't
> have a problem, else we may run into timing issue.
> 
> We can add a delay in parent before sending the signal, but that is
> still racy in worst cases.

In that case we can add a loop over a volatile varible changed from the
signal handler with a short usleep. Something as:

static volatile int wait_for_signal;

The do_child() would do:

	wait_for_signal = 1;

	TST_CHECKPOINT_WAKE(..);

	while (wait_for_signal)
		usleep(100);


And the handler would do:

	wait_for_signal = 0;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
