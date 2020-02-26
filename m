Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3816FAA1
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:22:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCF0A3C2555
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:22:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 75E963C251E
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:22:52 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D16E31000ADA
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582708970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdFbH9QztIf3k1hcPyK1mL+cWfWKnBjjnSxglyqtYtQ=;
 b=S8miA4L0m0LB1gAGptEo7yg7uf127ehSSiHdPY/EmQaJAjlZYymRewDTTIYBAN6O2qky6Z
 vC0Wsojv1qyjVuVkbLneuK/lY2L69a/XIwPhlwX/IiMo+lIfo+FekPBLGJgMpVLATd+zXI
 Fkd/cznQ/Ul2jJoc806AU8l5iGK2qGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-fa7xT54bMv-s19d-rM6z0Q-1; Wed, 26 Feb 2020 04:22:47 -0500
X-MC-Unique: fa7xT54bMv-s19d-rM6z0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A078E1005512;
 Wed, 26 Feb 2020 09:22:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 962B260C88;
 Wed, 26 Feb 2020 09:22:46 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6486118089C8;
 Wed, 26 Feb 2020 09:22:46 +0000 (UTC)
Date: Wed, 26 Feb 2020 04:22:46 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <793226027.9074640.1582708966090.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200226084249.29561-1-pvorel@suse.cz>
References: <20200226084249.29561-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.27]
Thread-Topic: request_key04: Use TFAIL instead of TBROK
Thread-Index: P7fs9l4K3r1j9jilL+bbW4UNCDhDWQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
> To fix unreported results error:
> tst_test.c:1036: BROK: Test haven't reported results!
> 
> which also prevents to display kernel commit fix and CVE.
> 
> Fixes: 8ac26843e ("syscalls/request_key04: new test for request_key()
> permission check bug")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> obvious fix which I'd normally merge without sending to ML.
> But there are 19 tests which use tst_res(TBROK, and at least some of
> them are affected by this (i.e. don't unconditionally report any result
> before tst_res(TBROK), so we might want to fix it different way.
> 
> Kind regards,
> Petr
> 
>  testcases/kernel/syscalls/request_key/request_key04.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/request_key/request_key04.c
> b/testcases/kernel/syscalls/request_key/request_key04.c
> index da036bf3a..c125f4261 100644
> --- a/testcases/kernel/syscalls/request_key/request_key04.c
> +++ b/testcases/kernel/syscalls/request_key/request_key04.c
> @@ -65,7 +65,7 @@ static void do_test(void)
>  	if (TST_ERR == EACCES) {
>  		tst_res(TPASS, "request_key() failed with EACCES as expected");
>  	} else {
> -		tst_res(TBROK | TTERRNO,
> +		tst_res(TFAIL | TTERRNO,
>  			"request_key() failed with unexpected error code");
>  	}
>  }
> --
> 2.25.1

Ack


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
