Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBAD0F1A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:48:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC6E03C2271
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:48:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 46ACB3C207C
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:48:04 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EA4C2601A63
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:48:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1CCE18CB8E0;
 Wed,  9 Oct 2019 12:48:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D515D71C;
 Wed,  9 Oct 2019 12:48:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF27D1808878;
 Wed,  9 Oct 2019 12:48:00 +0000 (UTC)
Date: Wed, 9 Oct 2019 08:48:00 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <335049795.5352699.1570625280674.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191009091145.GA7561@rei.lan>
References: <20191008151624.19815-1-chrubis@suse.cz>
 <1365327078.5308904.1570610176976.JavaMail.zimbra@redhat.com>
 <20191009091145.GA7561@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.157, 10.4.195.3]
Thread-Topic: syscalls/copy_file_range02: Add check for pipe
Thread-Index: fm/B5qSol1jCQKfJ97ggh8ZYUdAPCw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 09 Oct 2019 12:48:01 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Add check for pipe
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



----- Original Message -----
> Hi!
> > > The original patch that was adding this fell under a table:
> > > 
> > > http://patchwork.ozlabs.org/patch/1112976/
> > > 
> > > I guess there is no harm checking that we get EINVAL for pipe as well,
> > > or does anyone disagree?
> > 
> > Do you know what is kernel behaviour prior to commit 11cbfb10775a ?
> > Does it pass/fail/crash/different errno?
> 
> The test is disabled unless cross FS copy support is implemented in
> kernel, so the test is disabled for anything older than v5.3 anyways.

Thanks, I don't see any potential issues then, ACK.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
