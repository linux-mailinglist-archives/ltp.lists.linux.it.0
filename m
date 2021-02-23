Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B1322980
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 12:30:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C7BD3C5F5A
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 12:30:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 37B153C2AA4
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 12:30:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D533601231
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 12:30:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D06B4AC69;
 Tue, 23 Feb 2021 11:30:04 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:30:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YDTnO83+enCs5Wdn@pevik>
References: <20210222160243.507-1-pvorel@suse.cz>
 <20210222160243.507-2-pvorel@suse.cz> <YDTNtBH/9mz4I2OL@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDTNtBH/9mz4I2OL@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] lib: Add support for linux stable and glibc
 tags
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> >  #define LINUX_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id="
> > +#define LINUX_STABLE_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id="
> > +#define GLIBC_GIT_URL "https://sourceware.org/git/?p=glibc.git;a=commit;h="
> >  #define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-"

> >  struct tst_test *tst_test;
> > @@ -492,6 +495,8 @@ static void print_test_tags(void)
> >  			printf(CVE_DB_URL "%s\n", tags[i].value);
> >  		else if (!strcmp(tags[i].name, "linux-git"))
> >  			printf(LINUX_GIT_URL "%s\n", tags[i].value);
> > +		else if (!strcmp(tags[i].name, "linux-stable-git"))
> > +			printf(LINUX_STABLE_GIT_URL "%s\n", tags[i].value);

> Shouldn't we add GLIBC_GIT_URL handling here as well?
+1 thanks.

> The rest looks good.
Thanks! (counting your Reviewed-by: tag for this commit).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
