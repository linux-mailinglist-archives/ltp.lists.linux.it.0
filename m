Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3C189A14
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 11:58:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF6563C551E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 11:58:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A9A7A3C29B2
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 11:58:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D11236012B2
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 11:58:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9754ABF4;
 Wed, 18 Mar 2020 10:58:25 +0000 (UTC)
Date: Wed, 18 Mar 2020 12:02:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200318110212.GA1690@haruka.lan>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200221160351.GA26393@rei.lan>
 <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
 <20200224142034.GA2210@rei>
 <1d62bf3e-3f34-fd05-8662-08ff16523673@cn.fujitsu.com>
 <9e73a02e-7169-7229-8bc0-2ac84129bf31@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e73a02e-7169-7229-8bc0-2ac84129bf31@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/fcntl30: clean up && add more
 range test
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

Hi!
> Ping.
> diff as below:
> diff --git a/testcases/kernel/syscalls/fcntl/fcntl30.c 
> b/testcases/kernel/syscalls/fcntl/fcntl30.c
> index 860d42e8d..28cdee165 100644
> --- a/testcases/kernel/syscalls/fcntl/fcntl30.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl30.c
> @@ -31,8 +31,7 @@ static struct tcase {
>          {0, 0, 0, 1, "set a value of below page size"},
>          {0, 0, 0, 1, "set a normal value"},
>          {0, 0, 1, 1, "set a value of below page size"},
> -       {0, 0, 1, 1, "set a normal value"},
> -       {0, 0, 1, 1, "set a max value"},
> +       {0, 0, 1, 1, "set a normal value(8M)"},
>          {0, 0, 1, 0, "set a value beyond max"},
>   };
> 
> @@ -145,13 +144,10 @@ static void setup(void)
>          tcases[2].setsize = (1 << pg_shift) - 1;
>          tcases[2].expsize = 1 << pg_shift;
> 
> -       tcases[3].setsize = 2 << pg_shift;
> -       tcases[3].expsize = 2 << pg_shift;
> +       tcases[3].setsize = 1 << 23;
> +       tcases[3].expsize = 1 << 23;
> 
> -       tcases[4].setsize = 1 << shift;
> -       tcases[4].expsize = 1 << shift;
> -
> -       tcases[5].setsize = (1 << shift) + 1;
> +       tcases[4].setsize = (1 << shift) + 1;
> 
>          pw = SAFE_GETPWNAM("nobody");
>   }

Do we have to keep the shift in here?

Given that we are not aiming at a precise value now, we should be fine
as long as we request the buffer to be a few megabytes in lenght and we
can drop all the arch specific code from here, right?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
