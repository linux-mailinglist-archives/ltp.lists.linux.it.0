Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D724BC33
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:43:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A91543C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:43:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 054953C26C8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:43:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 525D4600742
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:43:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1343AF0F;
 Thu, 20 Aug 2020 12:44:03 +0000 (UTC)
Date: Thu, 20 Aug 2020 14:43:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200820124335.GA5065@dell5510>
References: <20200820120051.331-1-pvorel@suse.cz>
 <20200820122538.GC9000@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820122538.GC9000@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] tst_kvcmp: Strip double quotes when
 parsing /etc/os-release
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
> > index 185a5c39c..dfd81ac83 100644
> > --- a/lib/tst_kvercmp.c
> > +++ b/lib/tst_kvercmp.c
> > @@ -148,6 +148,12 @@ const char *tst_kvcmp_distname(const char *kver)
> >  	if (access(OSRELEASE_PATH, F_OK) != -1) {
> >  		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);

> > +		if (p[0] == '"')
> > +			memmove(p, p + 1, strlen(p));

> Why can't we just do distname++ and move the p = distname after this
> condition?
Sure.

> > +		if (p[strlen(p) - 1] == '"')
> > +			p[strlen(p) - 1] = '\0';

> I guess that we can move this to the while loop with:

> 	while (*p) {
> 		if (*p == '"') {
> 			*p = 0;
> 			break;
> 		}

> 		*p = ....
> 		p++;
> 	}
OK, " shouldn't be in the middle of the character, thus safe

Thanks for the suggestions.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
