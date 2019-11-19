Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6A101B87
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 09:13:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 263E33C22A3
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 09:13:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CCD203C220E
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 09:13:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4CA16201673
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 09:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574151218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fa6ZW381PvcCckYG6ZEC3LiraKSH5NPZyr7ngYuCB+w=;
 b=VMC6503gWrPONi5dxwyCxX17MnUWk5ZaaEXyXAXkTgZFGeOZ/4YGfzzd9rUq7Vvt3q/PL7
 u4dc3RP9Rg9lczy+7TcSuGS27NgXjDy1W23WSwId6NpvvSgemPsYjvfXL8LTbcFvc81MEP
 8UJt86yi1c3YmP4FNLm34VFw4fRD8YQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-5UcZlPwSOTidbHYmPcob2Q-1; Tue, 19 Nov 2019 03:13:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFBD800686;
 Tue, 19 Nov 2019 08:13:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 805025E24D;
 Tue, 19 Nov 2019 08:13:33 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7B524BB5C;
 Tue, 19 Nov 2019 08:13:32 +0000 (UTC)
Date: Tue, 19 Nov 2019 03:13:32 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1824199572.12930798.1574151212869.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2eu8HcQ90+BxUL0Hu+No6P5je4xC3oqVSU_ZnwMXEG=7Q@mail.gmail.com>
References: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
 <CAEemH2eu8HcQ90+BxUL0Hu+No6P5je4xC3oqVSU_ZnwMXEG=7Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.103, 10.4.195.5]
Thread-Topic: fallocate05: increase FALLOCATE_SIZE
Thread-Index: RRljs9Vb+OfqOw5K0Pjb0t3uyQe08g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 5UcZlPwSOTidbHYmPcob2Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fallocate05: increase FALLOCATE_SIZE
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Another patch I was thinking is to enhance the tst_fill_fs routine, which
> as Eric suggested, makes more reliably to get to a full filesystem.
> Something like what xfstest does to cut the trial write size in half and
> try again until the size is less than the filesystem block size.
> 
> Comments?

fallocate05 seems to be the only test using it, but in general I think we
can do that too. Assuming this alone would be reliable, is there any
advantage of running test with small FALLOCATE_SIZE?

> 
> --- a/lib/tst_fill_fs.c
> +++ b/lib/tst_fill_fs.c
> @@ -6,6 +6,7 @@
>  #include <errno.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include <sys/statvfs.h>
> 
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
> @@ -19,6 +20,8 @@ void tst_fill_fs(const char *path, int verbose)
>         size_t len;
>         ssize_t ret;
>         int fd;
> +       struct statvfs fi;
> +       statvfs(path, &fi);
> 
>         for (;;) {
>                 len = random() % (1024 * 102400);
> @@ -41,6 +44,12 @@ void tst_fill_fs(const char *path, int verbose)
>                         ret = write(fd, buf, MIN(len, sizeof(buf)));
> 
>                         if (ret < 0) {
> +                               if (errno == ENOSPC) {
> +                                       len /= 2;
> +                                       if (len >= fi.f_bsize)
> +                                               continue;
> +                               }
> +
>                                 SAFE_CLOSE(fd);
> 
>                                 if (errno != ENOSPC)
> 
> 
> 
> >
> > Increase FALLOCATE_SIZE to minimize chance of hitting sporadic
> > failures when that happens.
> >
> > Thanks to Carlos Maiolino and Eric Sandeen for their comments
> > and suggestions.
> >
> > Fixes #610
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> >
> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks, I pushed this patch for now. 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
