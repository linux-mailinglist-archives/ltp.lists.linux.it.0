Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9EF2C84
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 11:33:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6402A3C207C
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 11:33:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0B1F23C1CF5
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 11:33:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CBD7D201681
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 11:33:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 663E9B554;
 Thu,  7 Nov 2019 10:33:11 +0000 (UTC)
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
 <87o8xpdw0l.fsf@rpws.prws.suse.cz>
 <2124877733.10763434.1573054117742.JavaMail.zimbra@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
In-reply-to: <2124877733.10763434.1573054117742.JavaMail.zimbra@redhat.com>
Date: Thu, 07 Nov 2019 11:33:11 +0100
Message-ID: <87lfssdli0.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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

Jan Stancek <jstancek@redhat.com> writes:

> ----- Original Message -----
>> > +static char *blacklist[] = {
>> > +	NULL, /* reserved for -e parameter */
>> > +	"/sys/power/wakeup_count",
>> > +};
>>
>> The problem with this is that it is only required if we are running as a
>> privileged user. If -p is specified then it would be a bug if nobody can
>> read from any of these files.
>>
>> So I guess we could disable the builtin blacklist if drop_privs (switch
>> to nobody) is specified
>
> Good point. I just saw your reply that you plan to send a patch, thank
> you.

Thanks!

>
>> and run this test twice on /sys with and without
>> -p.
>
> greg-kh wasn't very happy to hear about privileged runs in the other thread.
> He was suggesting whitelist approach, but I don't know how we would keep it
> up to date, deal with different configs, etc.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
