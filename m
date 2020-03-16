Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C2187015
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 17:34:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F9483C5696
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 17:34:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B75E3C5689
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 17:33:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B78021A00889
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 17:33:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8B72AC9D
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 16:33:56 +0000 (UTC)
Date: Mon, 16 Mar 2020 17:33:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200316163355.GA8204@dell5510>
References: <20200312125545.3976-1-mdoucha@suse.cz>
 <20200312125545.3976-2-mdoucha@suse.cz>
 <20200313125742.GA5232@rei.lan>
 <dcac6d42-dff5-53ed-34eb-5aed3e184896@suse.cz>
 <20200316141842.GB26750@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316141842.GB26750@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] Create separate .c file for
 include/tst_net.h
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

Hi Martin, Cyril,

> > >> +int tst_bit_count(uint32_t i);
> > >> +int tst_mask2prefix(struct in_addr mask);
> > >> +int tst_ipv4_mask_to_int(const char *prefix);
> > >> +int tst_safe_atoi(const char *s, int *ret_i);
> > >> +int tst_get_prefix(const char *ip_str, int is_ipv6);
> > >> +void tst_get_in_addr(const char *ip_str, struct in_addr *ip);
> > >> +void tst_get_in6_addr(const char *ip_str, struct in6_addr *ip6);

> > > Do we need all of these exported in the public API?

> > > It looks to me like most of these shouldn't be exported at all.

> > I guess that's a question for Petr. I'll be happy to drop the functions
> > meant to be private from the .h file and make them static in the .c file.

> Let's do that, there is no point in exporting unused functions.
When I created tst_net.h, I thought functions would be used in other tests, as
they're general network functions. This is not true for tst_{brk,res}_comment()
macro, MAX_IPV{4,6}_PREFIX defintions and tst_safe_atoi() which are specific
tst_net_{iface,ip}_prefix.c and tst_net_vars.c. We should probably have separate
header (and probably source file) for these macros and for functions which
aren't needed (yet), which would be used just for tst_net_{iface,ip}_prefix.c
and tst_net_vars.c and not exported by API.

tst_safe_atoi() has confusing name, because this function does not lead to
tst_brk(), but uses tst_brk_comment() (it's a bit confusing, but not sure for
proper name).

But maybe you meant to have all of them as private (accessible by few C sources
which need them and export only these new functions Martin added in his second
commit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
