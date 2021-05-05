Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EF374948
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 22:24:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C235B3C57C3
	for <lists+linux-ltp@lfdr.de>; Wed,  5 May 2021 22:24:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 98CB43C5758
 for <ltp@lists.linux.it>; Wed,  5 May 2021 22:24:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 63B6E200FDE
 for <ltp@lists.linux.it>; Wed,  5 May 2021 22:24:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12402B10B
 for <ltp@lists.linux.it>; Wed,  5 May 2021 20:24:14 +0000 (UTC)
Date: Wed, 5 May 2021 22:24:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YJL+6//cEZKGz3ke@pevik>
References: <20210505081845.7024-1-mdoucha@suse.cz>
 <20210505081845.7024-4-mdoucha@suse.cz> <YJKA9LQsiFDeuPUT@pevik>
 <3042e4a5-453a-80aa-be65-f606a7c4ed45@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3042e4a5-453a-80aa-be65-f606a7c4ed45@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/6] Add rtnetlink helper library
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 05. 05. 21 13:26, Petr Vorel wrote:
> >> diff --git a/include/tst_rtnetlink.h b/include/tst_rtnetlink.h
> >> new file mode 100644
> >> index 000000000..12ec258f2
> >> --- /dev/null
> >> +++ b/include/tst_rtnetlink.h
> >> @@ -0,0 +1,106 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later
> >> + * Copyright (c) 2021 Linux Test Project
> >> + */
> >> +
> >> +#ifndef TST_RTNETLINK_H
> >> +#define TST_RTNETLINK_H

> > I guess this header will always be internal, right?  (only tst_netdevice.h is
> > going to be used in tests) Otherwise it might need to include headers
> > (<linux/netlink.h>, and also <unistd.h> or <sys/types.h> for ssize_t which are
> > now only in C library sources).

> No, I expect that someone will use it for rtnetlink tests sooner or
> later. But I don't think those extra #includes matter all that much. If
> they get #included in the test itself in the right order, it'll work
> just fine.
Sure.

> > ...
> >> +int tst_rtnl_add_message(const char *file, const int lineno,
> >> +	struct tst_rtnl_context *ctx, const struct nlmsghdr *header,
> >> +	const void *payload, size_t payload_size)
> >> +{
> >> +	size_t size;
> >> +	unsigned int extra_flags = 0;
> >> +
> >> +	if (!tst_rtnl_grow_buffer(file, lineno, ctx, NLMSG_SPACE(payload_size)))
> > Shouldn't there be an error message?
> > Or maybe at tst_rtnl_grow_buffer() on if (!buf)

> As Cyril already pointed out, the only way this call can fail is when
> safe_realloc() fails and prints a TWARN because we're in cleanup().
> There's no need to print a second error message.
You're right, thanks for info.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
