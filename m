Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 071673342F4
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:22:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 895DC3C6A3E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 17:22:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0BF1D3C2FBF
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:22:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9D24114011AE
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 17:22:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 194F8ABD7
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 16:22:01 +0000 (UTC)
Date: Wed, 10 Mar 2021 17:22:04 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YEjyLBZQ+D1CHqnq@rei.lan>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz>
 <30fec758-5e18-fceb-ec23-646253ba0e46@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30fec758-5e18-fceb-ec23-646253ba0e46@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: Add proper filesystem skiplist
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
> > +static int has_kernel_support(const char *fs_type, const char *const *skiplist)
> >  {
> >  	static int fuse_supported = -1;
> >  	const char *tmpdir = getenv("TMPDIR");
> >  	char buf[128];
> >  	int ret;
> >  
> > +	if (tst_fs_in_skiplist(fs_type, skiplist))
> > +		return 0;
> > +
> >  	if (!tmpdir)
> >  		tmpdir = "/tmp";
> >  
> > @@ -84,26 +105,24 @@ static int has_kernel_support(const char *fs_type, int flags)
> >  		return 0;
> >  	}
> >  
> > -	if (flags & TST_FS_SKIP_FUSE) {
> > -		tst_res(TINFO, "Skipping FUSE as requested by the test");
> > +	if (tst_fs_in_skiplist("fuse", skiplist))
> >  		return 0;
> > -	}
> >  
> >  	tst_res(TINFO, "FUSE does support %s", fs_type);
> >  	return 1;
> >  }
> 
> I don't think that has_kernel_support() should look at the skiplist at
> all. The entire skiplist logic should be handled in
> tst_get_supported_fs_types(). But has_kernel_support() could return
> different (non-zero) values for native support and for FUSE support.

I do not agree, that would add more complexity to an internal function
that is not exported outside the library.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
