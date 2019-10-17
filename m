Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B7DA7C7
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:50:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 134603C22D8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:50:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9EE983C147F
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:50:48 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EEBCB601EF2
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:50:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 083CC30832C0;
 Thu, 17 Oct 2019 08:50:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2A8E5D70D;
 Thu, 17 Oct 2019 08:50:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7A1E4EDA5;
 Thu, 17 Oct 2019 08:50:45 +0000 (UTC)
Date: Thu, 17 Oct 2019 04:50:45 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1176394938.6589443.1571302245730.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191016211501.3777-1-petr.vorel@gmail.com>
References: <20191016211501.3777-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: fanotify: Fix missing __kernel_fsid_t definition
Thread-Index: b5utgLzD3Fs7fiPXbHvhlR3LY27mDA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 17 Oct 2019 08:50:46 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify: Fix missing __kernel_fsid_t
 definition
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
> which is missing at least on musl which doesn't have FAN_REPORT_FID
> support.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  testcases/kernel/syscalls/fanotify/fanotify.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h
> b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 1c7623d3b..01a2d52bd 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -35,6 +35,10 @@
>  #include <errno.h>
>  #include <fcntl.h>
>  
> +#if !defined(FAN_REPORT_FID) && defined(HAVE_NAME_TO_HANDLE_AT)

Will FAN_REPORT_FID ever be defined at this point, when include of
sys/fanotify.h is below?

> +#include <asm/posix_types.h> // __kernel_fsid_t
> +#endif
> +
>  #if defined(HAVE_SYS_FANOTIFY_H)
>  
>  #include <sys/fanotify.h>
> --
> 2.23.0
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
