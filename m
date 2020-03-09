Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9717E140
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 14:33:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 267473C6121
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 14:33:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B9EC73C6107
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 14:33:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3C071100117C
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 14:33:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8ED91AFF3
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 13:33:02 +0000 (UTC)
Date: Mon, 9 Mar 2020 14:33:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200309133301.GC29747@rei.lan>
References: <20200305134834.16736-1-chrubis@suse.cz>
 <20200305134834.16736-5-chrubis@suse.cz>
 <87k13tg13f.fsf@our.domain.is.not.set>
 <20200309124844.GB29747@rei.lan>
 <87h7yxfylj.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7yxfylj.fsf@our.domain.is.not.set>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> > +static struct tst_test test = {
> >> > +	.tcnt = ARRAY_SIZE(offsets),
> >> > +	.test = verify_sysinfo,
> >> > +	.needs_root = 1,
> >> > +	.forks_child = 1,
> >> > +	.needs_kconfigs = (const char *[]) {
> >> > +		"CONFIG_TIME_NS=y"
> >> > +	}
> >> > +};
> >>
> >> Will you add a git ref when the fix is in mainline/for-next?
> >>
> >> Should be safe to add it as soon as it is in the for-next tree.
> >
> > I'm not sure how usefull that will be because the fix should get in
> > during the RC phase the functionality was introduced, so technically the
> > missing support of sysinfo() in time namespaces should not reach any
> > officially released kernel.
> 
> What is the downside to including it?
> 
> Also, I can imagine some people will try backporting this and may miss
> something not in the original patch set.

Okay, that's a valid reason to include the hash.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
