Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993FDA7DE
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:56:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19E793C22A8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 10:56:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E5E9B3C2298
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:56:49 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5903F1A00E2D
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 10:56:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE4EE8AC6FB;
 Thu, 17 Oct 2019 08:56:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C45E15C1B5;
 Thu, 17 Oct 2019 08:56:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCC751803517;
 Thu, 17 Oct 2019 08:56:47 +0000 (UTC)
Date: Thu, 17 Oct 2019 04:56:47 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1170755640.6589868.1571302607540.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191016211501.3777-1-petr.vorel@gmail.com>
References: <20191016211501.3777-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.18]
Thread-Topic: fanotify: Fix missing __kernel_fsid_t definition
Thread-Index: XbGQGxbDk/Db934LYb5jvtowTliiTQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 17 Oct 2019 08:56:47 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
> +#include <asm/posix_types.h> // __kernel_fsid_t
> +#endif

Would an alternative that adds this type to lapi work?
(just looking if we can avoid extra kernel include)

typedef struct {
        int     val[2];
} lapi_fsid_t;

#define __kernel_fsid_t lapi_fsid_t

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
