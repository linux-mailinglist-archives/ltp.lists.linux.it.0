Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791627C6B0
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:47:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CB5B3C2A9F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 13:47:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BA8633C0596
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:47:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5E7EC600B37
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 13:47:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A88B3ADA8;
 Tue, 29 Sep 2020 11:47:50 +0000 (UTC)
References: <20200929073501.4598-1-pvorel@suse.cz>
 <5F72E52E.40609@cn.fujitsu.com> <20200929084114.GA7482@dell5510>
 <5F730501.7050505@cn.fujitsu.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
In-reply-to: <5F730501.7050505@cn.fujitsu.com>
Date: Tue, 29 Sep 2020 12:47:49 +0100
Message-ID: <87v9fwx0re.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] io_destroy01: TCONF when unsupported
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

Yang Xu <xuyang2018.jy@cn.fujitsu.com> writes:

> Hi Petr
>
>> Hi Yang,
>>
>>> Hi Petr
>>> Why not using kconfig in tst_test struct.
>>
>> We should probably use tst_syscall().
>> But using kconfig is not 1) needed (tst_syscall() most reliable way) 2) kconfig
>> requires having kernel config available, which is not on some platforms.
> I see. At the first, I prefer to like to use kconfig because it only 
> tests io_destory one time on kernel without CONFIG_AIO  when we use -i 
> parameters,  but using libaio wrapper is stable. So it is ok.

Kconfig can even be wrong (most likely with out-of-tree patches) or we
might look at the wrong option as things are moved around
sometimes. This is another instance of us trying to guess if something
can be done without trying it.

I guess there are some things where it is not as simple as trying a
system call, but in cases where ENOSYS will be returned there is no need
to look at the config except maybe for diagnostic purposes. If you are
concerned about '-i' then you can even just make in invalid syscall in
setup to see what error it returns.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
