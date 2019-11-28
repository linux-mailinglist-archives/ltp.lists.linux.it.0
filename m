Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69210C534
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:35:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CB053C22CB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 09:35:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 74B8D3C1815
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:35:12 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A96011004571
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 09:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574930110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Veynm+T0ZWAMdD5dKNih9Kua0g+JYygN7US81GdKjbY=;
 b=dOhlcmweT6cRRHCfpxW9aB3IMR7sXvvU7ggHWyxmIs3QIr37V8RtYafnNDeSrMsfOv+HmY
 Cfc23i1YLMnluADqmP9qIG3wstubdf0Xk7YWLLmVC5JHRC6rmCH3ZIrSlmhEQVMw2gGyhg
 fA+OrU1jxwZYVDSgq0v3DywFICiO0+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-pKH_CfDJMMKFvKUwT9JLGQ-1; Thu, 28 Nov 2019 03:35:07 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DA66107ACC9
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:35:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 340C760C80
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 08:35:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2577518095FF;
 Thu, 28 Nov 2019 08:35:06 +0000 (UTC)
Date: Thu, 28 Nov 2019 03:35:05 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1766813779.14211710.1574930105928.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191128082945.6495-1-liwang@redhat.com>
References: <20191128082945.6495-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.5]
Thread-Topic: mmap1: include lapi/abisize.h header file
Thread-Index: ZYZwsvJT2i8GYa4QJYyIlTVgJnU4FQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pKH_CfDJMMKFvKUwT9JLGQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED PATCH] mmap1: include lapi/abisize.h header
 file
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
Cc: zhijwang@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> To get rid of this BROK on i686:
>  mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOMEM (12)
> 
> Reported-by: Zhijun Wang <zhijwang@redhat.com>
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/mem/mtest06/mmap1.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/kernel/mem/mtest06/mmap1.c
> b/testcases/kernel/mem/mtest06/mmap1.c
> index c5417444f..5c7d3df2f 100644
> --- a/testcases/kernel/mem/mtest06/mmap1.c
> +++ b/testcases/kernel/mem/mtest06/mmap1.c
> @@ -30,6 +30,7 @@
>  #include <stdlib.h>
>  #include "lapi/abisize.h"
>  #include "tst_test.h"
> +#include "lapi/abisize.h"

This sounds familiar:
  74d9fe32fda9 ("mtest06/mmap1: add missing lapi/abisize.h include")


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
