Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217435DE24
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:59:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F8CF3C71F7
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 13:59:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E56E73C1C44
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:59:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 07D6F1A006B1
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 13:59:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E694AFAB
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 11:59:53 +0000 (UTC)
Date: Tue, 13 Apr 2021 13:51:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YHWFwWeT7IsJKsFf@yuki>
References: <20210317105318.32017-1-chrubis@suse.cz>
 <20210317105318.32017-4-chrubis@suse.cz>
 <b2d54281-2893-2dc1-e2a8-ff789dc1c1f2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2d54281-2893-2dc1-e2a8-ff789dc1c1f2@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: Apply the skip_filesystems to rest of
 test as well
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
> > +		if (tst_fs_in_skiplist(fs_name, tst_test->skip_filesystems)) {
> > +			tst_brk(TCONF, "Skipping %s as requested by the test",
> > +				fs_name);
> 
> This message might be a little confusing when the test didn't ask for
> all filesystems. I'd recommend something like "Test does not support %s
> workdir, skipping". The else clause below is probably unnecessary.

I've adjusted the message to "%s is not supported by the test" and fixed
the enum name as reported by Li and pushed the patchset.

Thanks a lot for the reviews.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
