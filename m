Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B816F775
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:41:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0376A3C253A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 06:41:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D84C73C1C41
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:41:05 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 84C3B1A00CD0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 06:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582695662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QO5ZO13XTMv0zslkB7ePjEccOClnpRbT4Wrd+ahKhCw=;
 b=YlLkkpolIHkPoXDZB0S/4Ertxq8JvolKQKxi6odpROdJbHNdzYvKQetyiEO5yINU6s6qF3
 O4kriSDnsEp9KvdSfnaAQpSiBbYpI+0cOWBaF4kX9gvI8EhIL2a4wBUntWSII0VOy3HPLx
 Z5sJviQxeywJxjt/747gkPFyhXff6Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-BYovplPoOymjaz6CahamMQ-1; Wed, 26 Feb 2020 00:41:00 -0500
X-MC-Unique: BYovplPoOymjaz6CahamMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E73B2800D48;
 Wed, 26 Feb 2020 05:40:59 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B85505C28C;
 Wed, 26 Feb 2020 05:40:58 +0000 (UTC)
Date: Wed, 26 Feb 2020 13:51:33 +0800
From: Zorro Lang <zlang@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200226055133.GR14282@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Viresh Kumar <viresh.kumar@linaro.org>,
	ltp@lists.linux.it
References: <cover.1582612624.git.viresh.kumar@linaro.org>
 <655d948e27dbbc03f6cef038e339ec0269d11140.1582612624.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <655d948e27dbbc03f6cef038e339ec0269d11140.1582612624.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 03/10] lapi/fsmount.h: Include "lapi/fcntl.h"
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

On Tue, Feb 25, 2020 at 12:10:41PM +0530, Viresh Kumar wrote:
> All the files that include (and that will include it in future) are most
> probably going to need the definitions from "lapi/fcntl.h", include it
> directly instead of <fcntl.h>, which will break it for old RHL distros.
> 
> Acked-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

Good to me

>  include/lapi/fsmount.h                        | 2 +-
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
> index a6a24904e66d..5e5eaca7e6ff 100644
> --- a/include/lapi/fsmount.h
> +++ b/include/lapi/fsmount.h
> @@ -7,12 +7,12 @@
>  #ifndef FSMOUNT_H__
>  #define FSMOUNT_H__
>  
> -#include <fcntl.h>
>  #include <sys/mount.h>
>  #include <sys/syscall.h>
>  #include <sys/types.h>
>  
>  #include "config.h"
> +#include "lapi/fcntl.h"
>  #include "lapi/syscalls.h"
>  
>  #ifndef HAVE_FSOPEN
> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
> index 8e29a1537334..514d3b0b38f8 100644
> --- a/testcases/kernel/syscalls/fsmount/fsmount01.c
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -10,7 +10,6 @@
>  #include <sys/mount.h>
>  
>  #include "tst_test.h"
> -#include "lapi/fcntl.h"
>  #include "lapi/fsmount.h"
>  
>  #define MNTPOINT "newmount_point"
> -- 
> 2.21.0.rc0.269.g1a574e7a288b
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
