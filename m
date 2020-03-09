Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6217E109
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 14:26:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFFD63C611E
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 14:26:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5A9D23C60FA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 14:26:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0AD23201085
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 14:26:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5815EAF23
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 13:26:48 +0000 (UTC)
References: <20200305134834.16736-1-chrubis@suse.cz>
 <20200305134834.16736-5-chrubis@suse.cz>
 <87k13tg13f.fsf@our.domain.is.not.set> <20200309124844.GB29747@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20200309124844.GB29747@rei.lan>
Date: Mon, 09 Mar 2020 14:26:48 +0100
Message-ID: <87h7yxfylj.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/8] syscalls/sysinfo03: Add time namespace test
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

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > +static struct tst_test test = {
>> > +	.tcnt = ARRAY_SIZE(offsets),
>> > +	.test = verify_sysinfo,
>> > +	.needs_root = 1,
>> > +	.forks_child = 1,
>> > +	.needs_kconfigs = (const char *[]) {
>> > +		"CONFIG_TIME_NS=y"
>> > +	}
>> > +};
>>
>> Will you add a git ref when the fix is in mainline/for-next?
>>
>> Should be safe to add it as soon as it is in the for-next tree.
>
> I'm not sure how usefull that will be because the fix should get in
> during the RC phase the functionality was introduced, so technically the
> missing support of sysinfo() in time namespaces should not reach any
> officially released kernel.

What is the downside to including it?

Also, I can imagine some people will try backporting this and may miss
something not in the original patch set.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
