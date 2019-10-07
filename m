Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DDDCEC9D
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 21:19:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22FC43C1D3E
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 21:19:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 076883C04FC
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 21:19:33 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 02B501000955
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 21:18:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E49C430833A8;
 Mon,  7 Oct 2019 19:19:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7CCD60A9F;
 Mon,  7 Oct 2019 19:19:30 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A20B618089DC;
 Mon,  7 Oct 2019 19:19:30 +0000 (UTC)
Date: Mon, 7 Oct 2019 15:19:30 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, rasibley <rasibley@redhat.com>
Message-ID: <1688136841.4982944.1570475970464.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191007140321.GA23368@rei.lan>
References: <20191004184436.30922-1-rasibley@redhat.com>
 <20191007140321.GA23368@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.156, 10.4.195.3]
Thread-Topic: Update dynamic_debug grep check
Thread-Index: 3JZNj2l+0r3rnbYZGt+nN+m9j6ADpg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 07 Oct 2019 19:19:30 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Update dynamic_debug grep check
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
> To: "rasibley" <rasibley@redhat.com>
> Cc: ltp@lists.linux.it
> Sent: Monday, 7 October, 2019 4:03:21 PM
> Subject: Re: [LTP] [PATCH] Update dynamic_debug grep check
> 
> Hi!
> > If running on debug kernel this check will fail on EDAC DEBUG messages,
> > update grep to ignore such cases like this.
> 
> You are missing the Signed-off-by: line here, see:
> 
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

You can also use kernel scripts/checkpatch.pl.

> 
> Otherwise the patch is Ok.

Pushed with added Signed-off-by and tweaked commit message.

Thanks,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
