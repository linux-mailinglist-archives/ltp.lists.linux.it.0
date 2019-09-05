Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A9A9D1D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 10:36:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22A893C2151
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Sep 2019 10:36:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 391C53C20AC
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 10:35:57 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A247F1A01D1F
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 10:35:55 +0200 (CEST)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8C1C38535C
 for <ltp@lists.linux.it>; Thu,  5 Sep 2019 08:29:56 +0000 (UTC)
Received: by mail-oi1-f199.google.com with SMTP id l15so742747oic.13
 for <ltp@lists.linux.it>; Thu, 05 Sep 2019 01:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ue+5kZEl2lZxlYji2Lnqldp+UMA1wBhhYsKJpqi9kKs=;
 b=lokenWNvHigXp4XH/x+Z/NRGn1f9Y0ash6kpbKB//Ot137mLjn3CfHqbpEcYMNkKGj
 r1BVjNMG/QostaiA6z8zGMf8F27/+vs9zuJaCGcPyh2xf1HsunMGZMH4m+lKqPeHDKpI
 +tGZfiDCeNb0mJsxuNCo0XGGpHYq7B38KFtTw7xPF6qJh/BTcY41RJOWsAOUR9oWej79
 PsXnzm9xZ96NN7nyzjcCLJ1WU5Hwq4gWIJLB8inAO9ChlLeQ/YJaHVr8an0SSFOGUs8L
 pIchgpHHIMUjN/Z5wQg/SlwBpzFhI9lVKrYrk3/HCcjf/ORjy/zd5hP/EQzvB/bcqrvA
 adRQ==
X-Gm-Message-State: APjAAAVjYzj4dxgU9yerQFMxD1FzF4TbAoAuVGB1Eu6yJfe6cEyjc33U
 0NpXoYDZNgv5qLaMTyu4GfuMHutuVbdUWogo2DZ+TdF/iDbeLUL0XSKXeWvolQDdOZ79S1VnbR/
 Z1QGYfutMukxHrJ5BOBhsi9UXO7E=
X-Received: by 2002:aca:c58f:: with SMTP id v137mr906219oif.144.1567672196055; 
 Thu, 05 Sep 2019 01:29:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw25M+jTxHgDDzYgUeJ474KXf+qVJ/2LRe1tqE1P2NOsJy0+G7ix6zBjCJgxNzTrlm95iTlMu8ddbw868cQ5zQ=
X-Received: by 2002:aca:c58f:: with SMTP id v137mr906202oif.144.1567672195630; 
 Thu, 05 Sep 2019 01:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
In-Reply-To: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 5 Sep 2019 16:29:44 +0800
Message-ID: <CAEemH2fiJkau0A3yQH+nHVPXMwtTzyV3_weTQRniZFR+EJqN_g@mail.gmail.com>
To: Shuang Qiu <shuang.qiu@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise09:Change PAGES size to the value more
 than 32
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

On Wed, Sep 4, 2019 at 2:01 PM <shuang.qiu@oracle.com> wrote:
>
> From: Shuang Qiu <shuang.qiu@oracle.com>
>
> In upstream patch 1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state()),
> it modify the lruvec state in batch,equal and less than 32 MADV_FREE pages will not trigger
> the account of lruvec_stat,and will not be free in memory pressure either.
> So the testcase may fail with:
> ...
> madvise09.c:219: INFO: Memory hungry child 6178 started, try 10
> madvise09.c:254: INFO: Memory map: pppppppppppppppppppppppppppppppp
> madvise09.c:259: FAIL: No MADV_FREE page was freed on low memory
> ...
> Change the PAGES to the value more than 32 can fix such issue.
>
> Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>
> ---
>  testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
> index 01075f6..3759053 100644
> --- a/testcases/kernel/syscalls/madvise/madvise09.c
> +++ b/testcases/kernel/syscalls/madvise/madvise09.c
> @@ -57,7 +57,7 @@ static int sleep_between_faults;
>
>  static int swap_accounting_enabled;
>
> -#define PAGES 32
> +#define PAGES 64

I'm not sure why 64 pages is a proper value? Can you explain more?

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
