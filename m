Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F78FBAEF5
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 10:11:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AB053C1D02
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 10:11:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DF0623C1C7E
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 10:11:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C0FF21401724
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 10:11:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D323EAC3E;
 Mon, 23 Sep 2019 08:11:40 +0000 (UTC)
References: <20190923003846.GB15734@shao2-debian>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190923003846.GB15734@shao2-debian>
Date: Mon, 23 Sep 2019 10:11:40 +0200
Message-ID: <871rw7l9dv.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 12abeb544d: ltp.read_all_dev.fail
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
Cc: lkp@01.org, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

kernel test robot <rong.a.chen@intel.com> writes:

> FYI, we noticed the following commit (built with gcc-7):
>
> commit: 12abeb544d548f55f56323fc6e5e6c0fb74f58e1 ("horrible test hack")
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/luto/linux.git random/kill-it
>
> in testcase: ltp
> with following parameters:
>
> 	disk: 1HDD
> 	fs: ext4
> 	test: fs-02
>
> test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
> <<<test_start>>>
> tag=read_all_dev stime=1569106866
> cmdline="read_all -d /dev -p -q -r 10"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
> Test timeouted, sending SIGKILL!
> tst_test.c:1148: INFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> tst_test.c:1149: BROK: Test killed! (timeout?)

So perhaps this is caused by reads of /dev/random hanging? At any rate,
I suppose this is intended to deliberately break something, so we can
ignore it.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
