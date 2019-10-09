Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ABED09F9
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 10:36:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F75E3C207C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 10:36:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9E0DA3C134D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 10:36:19 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B9338200074
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 10:36:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B37A87F07;
 Wed,  9 Oct 2019 08:36:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 320B319C69;
 Wed,  9 Oct 2019 08:36:17 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 297674E589;
 Wed,  9 Oct 2019 08:36:17 +0000 (UTC)
Date: Wed, 9 Oct 2019 04:36:16 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1365327078.5308904.1570610176976.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191008151624.19815-1-chrubis@suse.cz>
References: <20191008151624.19815-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.157, 10.4.195.27]
Thread-Topic: syscalls/copy_file_range02: Add check for pipe
Thread-Index: 8KItfruFCk5/nnABLtsZTih7dGVZUA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 09 Oct 2019 08:36:17 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
> From: "Cyril Hrubis" <chrubis@suse.cz>
> To: ltp@lists.linux.it
> Sent: Tuesday, 8 October, 2019 5:16:24 PM
> Subject: [LTP] [PATCH] syscalls/copy_file_range02: Add check for pipe
> 
> The original patch that was adding this fell under a table:
> 
> http://patchwork.ozlabs.org/patch/1112976/
> 
> I guess there is no harm checking that we get EINVAL for pipe as well,
> or does anyone disagree?

Do you know what is kernel behaviour prior to commit 11cbfb10775a ?
Does it pass/fail/crash/different errno?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
