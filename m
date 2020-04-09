Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF3F1A3558
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 16:04:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8B263C2CD0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 16:04:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AD7723C1115
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 16:04:24 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CD86B1400345
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 16:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586441062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JL4iE/VictfTnRepdCiPXJUIf7z/Hzgyzyr5RIZmLE8=;
 b=CqyEy2+NjkfqGzI7JDyuoQgwbREEYH7iLf6/6PnHdSpuKpFa6bmjbAQG3/uah10KgSV7f8
 3ClE8C3Kkywl9hWybQYIn/Go3OuII3TiYXweZPSJKPeX4A7fX3G5QooUeIY992gJVjeg2x
 zzsc+JNTHcqUQBSvbr2Qeyo/E3Z3qTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-7PTpOhC5NmyjwD0PhG3V1w-1; Thu, 09 Apr 2020 10:04:20 -0400
X-MC-Unique: 7PTpOhC5NmyjwD0PhG3V1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8370018B5F6C;
 Thu,  9 Apr 2020 14:04:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A0DC0DB6;
 Thu,  9 Apr 2020 14:04:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A52B18089C8;
 Thu,  9 Apr 2020 14:04:19 +0000 (UTC)
Date: Thu, 9 Apr 2020 10:04:19 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <1033986999.7818590.1586441059205.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200409112645.643-1-rpalethorpe@suse.com>
References: <20200409112645.643-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.27]
Thread-Topic: add_key05: Avoid race with key garbage collection
Thread-Index: 8p1kPFhA95zAPUkDJi+jIdIFL1SfAQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] add_key05: Avoid race with key garbage
 collection
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
> --- a/testcases/kernel/syscalls/add_key/add_key05.c
> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> @@ -10,6 +10,10 @@
>   * This is also a regression test for
>   * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
>   * commit 2e356101e72a ("KEYS: reaching the keys quotas correctly")
> + *
> + * If you run this test with -i > 10 then expect to see some sporadic
> failures

Since test is using 2 users per iteration, should above say -i > 5?

> + * where add_key fails with EDQUOT. Keys are freed asynchronously and we
> only
> + * create up to 10 users to avoid race conditions.
>   */
>  
>  #include <stdio.h>
> @@ -18,47 +22,53 @@
>  #include "tst_test.h"
>  #include "lapi/keyctl.h"
>  
> +#define MAX_USERS 10
> +
>  static char *user_buf;
> -static const char *username = "ltp_add_key05";
> -static int user_added;
> -struct passwd *ltpuser;
> -static char fmt[1024];
> +static uid_t ltpuser[MAX_USERS];
> +
> +static unsigned int usern;
> +static volatile unsigned int useri;

I don't see why volatile is needed here. Other than that rest looks
reasonable to me. 

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
