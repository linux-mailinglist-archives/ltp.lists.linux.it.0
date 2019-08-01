Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E657DA6D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454BC3C2016
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Aug 2019 13:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 20EA53C1E06
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:38:42 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8CEDC201578
 for <ltp@lists.linux.it>; Thu,  1 Aug 2019 13:38:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA71813A82;
 Thu,  1 Aug 2019 11:38:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE84A19C6A;
 Thu,  1 Aug 2019 11:38:39 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6C471800204;
 Thu,  1 Aug 2019 11:38:39 +0000 (UTC)
Date: Thu, 1 Aug 2019 07:38:39 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1893379100.3999075.1564659519585.JavaMail.zimbra@redhat.com>
In-Reply-To: <5D42AEE8.2000801@cn.fujitsu.com>
References: <1561110806-2734-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1766730430.29482900.1561112032870.JavaMail.zimbra@redhat.com>
 <5D42AEE8.2000801@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.26]
Thread-Topic: daemonlib.sh: call tty before executing service
Thread-Index: fAmoflHbX87A6eH8XGwfAbX47M7Q2g==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 01 Aug 2019 11:38:39 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] daemonlib.sh: call tty before executing service
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
> 
> > Bug 1711536 - polkit-0.112-22.el7 breaks restarting services from
> > background process
> > https://bugzilla.redhat.com/show_bug.cgi?id=1711536
> >
> > Not sure though we should be adding workarounds for what seems like a bug.
> Hi Jan
> 
> This bug has been sloved on gitlab after commit 75c8b8afaa ("pkttyagent:
> process stopped by SIGTTOU if run in background job") ,as below:
> 
> https://gitlab.freedesktop.org/polkit/polkit/issues/85
> https://gitlab.freedesktop.org/polkit/polkit/commit/75c8b8afaa8e1fba0efb63c3c7b66b5b5f713a35

Thanks for info, good to see there's a fix.

> 
> I think my patch was meaningless.
> 
> Thanks
> Yang Xu
> 
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
