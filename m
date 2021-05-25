Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98C390503
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 17:17:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 380D93C587F
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 17:17:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 66DF13C008F
 for <ltp@lists.linux.it>; Tue, 25 May 2021 17:17:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E1ED41A007FD
 for <ltp@lists.linux.it>; Tue, 25 May 2021 17:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621955832;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EW8a0m6K+TT78pXnAfeg3GguwdmDUJdb2K4JxB50V34=;
 b=3M/TQi+7RED6fCf+pTS6VebFpwkmGJA0rp/yZi4AwVcTKYdfkaQKJXR5OzSCxYJt16foGx
 +J7pU5Aqadv98D4yPmn2Vp73H4j7sc1HM/oYF6CyKZI6xfuXSVuXS4NCnHCY9WNbIQVstk
 WNndOnXlYKd/iyvjh8rajtlXmhLgXZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621955832;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EW8a0m6K+TT78pXnAfeg3GguwdmDUJdb2K4JxB50V34=;
 b=veaoucIk38aMSo/DJcWIuSBeB86qYwHVN0rkWhVd1SkoaZfCKnVr6Z+P3COy7zx6wAiuCJ
 jBBR9kgaVHZ0B0Dg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53064AEAB;
 Tue, 25 May 2021 15:17:12 +0000 (UTC)
Date: Tue, 25 May 2021 17:17:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YK0U9hubBBXDEEkL@pevik>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com>
 <YKTcWhMGotujEYLK@yuki>
 <e17ffbb2-2c2a-bd15-9e8c-cd2795e566cd@huawei.com>
 <YKY+y/KgdpeppaYx@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKY+y/KgdpeppaYx@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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

> Hi!
> > >> + * Testcase copied from sendfile02.c to test the basic functionality of
> > >> + * the sendfile(2) system call on large file. There is a kernel bug which
> > >> + * introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
> > >                              ^
> > > 	Here as well the commit that introduced the bug should go to
> > > 	.tags.

> And I made a mistake here, we put the commit that fixes the bug into the
> tags, so the second one should be in the metadata, but I can fix that
> before the patches are applied. Sorry for the confusion.
Yep I noticed that and discussed that and fixed it.
But I haven't noticed you reviewed v1, thus didn't put your tags.
Anyway, I merged fixed v1 version. Now I noticed v2, which was still including
some headers which were not needed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
