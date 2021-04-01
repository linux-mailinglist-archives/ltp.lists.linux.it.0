Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B035139E
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 12:30:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0EBC3C77D9
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 12:30:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C4203C229A
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 12:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB78B600F06
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 12:30:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B938CAEA6;
 Thu,  1 Apr 2021 10:30:38 +0000 (UTC)
Date: Thu, 1 Apr 2021 12:30:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>,
 alice.z.wang@runbox.com
Message-ID: <YGWgzMUqFZ4fgVbl@pevik>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
 <60546E24.9010601@fujitsu.com> <YFRvZ89AykS5ldJj@yuki.lan>
 <YFSGZ9YKo/JUHMtm@pevik> <YFSVbmQ7T0kPnlXs@yuki.lan>
 <CAEemH2cz20Xd_c-3WZW2sNY5fXXhXMg8XQjVee=nVUi5-hw4kg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cz20Xd_c-3WZW2sNY5fXXhXMg8XQjVee=nVUi5-hw4kg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> +Cc Alice Wang, who is a volunteer of the GNU lawyer team. I met her
> several years ago in Beijing, not sure if I remember the email-address
> correctly, so I just CC her in case she can read this and maybe help some
> side.

Alice haven't responded, thus I pushed patchset with other fixes and created
page [1]. It'd be great to get info from other lawyer.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/Maintainer-Patch-Review-Checklist

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
