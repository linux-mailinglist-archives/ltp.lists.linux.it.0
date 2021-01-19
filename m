Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF42FB667
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:39:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8D753C309B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 14:39:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AEEDD3C2557
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:39:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 32B87200A1E
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 14:39:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77A69AB7F;
 Tue, 19 Jan 2021 13:39:33 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:39:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YAbhE9eB1AEM1BEk@pevik>
References: <20210118161308.30771-1-pvorel@suse.cz> <YAbfKSZhZ35peObS@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAbfKSZhZ35peObS@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > +	char buf[PATH_MAX], module[PATH_MAX], search[PATH_MAX] = "/";
...
> > +	strcat(search, driver);
> > +	strcat(search, ".ko");

> Why not just snprintf() or SAFE_ASPRINTF() here as well?
+1

> > +	f = SAFE_FOPEN(NULL, path, "r");
> > +
> > +	while (fgets(buf, sizeof(buf), f)) {
> > +		if (sscanf(buf, "%s", module) != 1)
> > +			continue;
> > +
> > +		if (strstr(module, search) != NULL) {

> And I'm not sure that this is safe either, what about the case that one
> module name is a substring of another.

> E.g. if we look for "foo.ko" and the file contains "this_is_not_foo.ko"
> it will still match here.
char search[PATH_MAX] = "/"; => we search for "/foo.ko"
But that will be more obvious when I use SAFE_ASPRINTF() for search.

> Also this seems to be rather distruptive change, so I guess it would be
> safer to apply after the release.

I'll send v3, but no problem to postpone it.

But I'll revert 305a78e4c ("tst_net.sh: Require veth for netns") with
explanation that it wait for this fix, ok?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
