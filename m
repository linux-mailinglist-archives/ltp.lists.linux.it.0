Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0224BCBC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:52:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E16D3C2FA2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 14:52:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0EAA23C26C8
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:52:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A9A591400DB0
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 14:52:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41BCFB0BA;
 Thu, 20 Aug 2020 12:53:09 +0000 (UTC)
Date: Thu, 20 Aug 2020 14:53:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200820125312.GD9000@yuki.lan>
References: <20200820120051.331-1-pvorel@suse.cz>
 <20200820122538.GC9000@yuki.lan> <20200820124959.GB5065@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820124959.GB5065@dell5510>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > diff --git a/lib/tst_kvercmp.c b/lib/tst_kvercmp.c
> > > index 185a5c39c..dfd81ac83 100644
> > > --- a/lib/tst_kvercmp.c
> > > +++ b/lib/tst_kvercmp.c
> > > @@ -148,6 +148,12 @@ const char *tst_kvcmp_distname(const char *kver)
> > >  	if (access(OSRELEASE_PATH, F_OK) != -1) {
> > >  		SAFE_FILE_LINES_SCANF(NULL, OSRELEASE_PATH, "ID=%s", distname);
> 
> > > +		if (p[0] == '"')
> > > +			memmove(p, p + 1, strlen(p));
> 
> > Why can't we just do distname++ and move the p = distname after this
> > condition?
> OK, distname is char[], not a pointer, I guess I have to use memmove().

In that case you just need to do char *ret = distname + 1; p = ret; ....
return ret;

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
