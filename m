Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A233404C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:27:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B73F3C6A2C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 15:27:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2F5FC3C4BE4
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:27:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C44FF1A0122C
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 15:27:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21F8CAEB6
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 14:27:04 +0000 (UTC)
Date: Wed, 10 Mar 2021 15:28:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEjXn0FN25d6K0Lv@yuki.lan>
References: <20210310122625.25425-1-chrubis@suse.cz>
 <20210310122625.25425-2-chrubis@suse.cz> <YEjCfVLhoLPMDEgu@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEjCfVLhoLPMDEgu@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
> > -static int has_kernel_support(const char *fs_type, int flags)
> > +int tst_fs_in_skiplist(const char *fs_type, const char *const *skiplist)
> > +{
> > +	unsigned int i;
> > +
> > +	if (!skiplist)
> > +		return 0;
> > +
> > +	for (i = 0; skiplist[i]; i++) {
> > +		if (!strcmp(fs_type, skiplist[i])) {
> > +			tst_res(TINFO,
> It'd be nice if skipping message could be TCONF to avoid:
> tst_supported_fs_types.c:57: TINFO: Skipping tmpfs as requested by the test
> tst_test.c:1056: TCONF: Skipping due to unsupported filesystem
> 
> but understand why - it'd make code more complicated (has_kernel_support() which
> is used in tst_fs_is_supported() should not emit TCONF).

I can make a internal wrapper for the tst_fs_is_supported() that prints
the TINFO message and use that in the tst_supported_fs_types, which
would make it silent in the case it's called from the test library...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
