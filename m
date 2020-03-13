Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76D183FE1
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:00:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 578BB3C5ED3
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:00:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EF43D3C5E6D
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:00:18 +0100 (CET)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1B8760095D
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:00:17 +0100 (CET)
Received: by mail-pf1-x441.google.com with SMTP id c144so4380548pfb.10
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 21:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=n6NtbtE85b8ZPRKyWPKQqzuSm1bln+aga68htTec1tA=;
 b=R1QnQQ/r2cJ50gLtwsQx2YKV2pnd8gLUMB/8FbH7pfgMnCWKheTUGoT1xH4ym3oYfR
 evz9t9TriAy6/x0VkbBnZez7Lk8SY7U0/GM30D0k4iyfE9UzNrA+UopW62yAiKw2CdND
 MfCPut/r13Kv99ma7e6m5Nax6n5ZVi5TaHqyQDihvk/1wItKG4MvDaBXC86UQfoye6gs
 OdAsLc/2lAKYjmbKW1omhla1lvdy9KD4nXTmwXBeVyWigxL64qwFnS1/gYdRGQe/1inU
 GCuwjTkr8VkXJ/t8zkRaBI5fi+LPudDDV7avHP+6IkM7TUAFopEMIn4S13r/2OGqJ5lc
 B+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n6NtbtE85b8ZPRKyWPKQqzuSm1bln+aga68htTec1tA=;
 b=egx9KgMqnxbgSBHk6WVlIVgrglz6z5Fu+kwjewiJmKwCC1fK+47g9fwBQggWZzx/LF
 lhHTFdRyWqB1USb5RH29xZG/jH6Ac0R2RqR+1qRv7p8ANPEMC4//QZuwFprfGxd3X212
 ygBE/dH7lGIr0vg7XSmn1ZvlFVKmFtXGkqrFRsBqrjUpeF2vAa4pxHMKbI+Cms4fL9a5
 vUAxoyhwe+UztZtiiqICTdwcjb4LGjDZVzAIafdHsbosYqn4nUvLT1ijw9C97xOf8Cfe
 LBE+QuXPhPEZ9fHLGV4E8OlQBq3kjDaTXSnttsIGMtnLGJ5eNstPXnF8S9ZiCzK7iZmv
 Zj9g==
X-Gm-Message-State: ANhLgQ24qmeG8RG5OhMyYnLCfzXZ/oOg2KsGid4ev+Abp5LKlHalNxnf
 kVZU4SY8iXydXhY7tvo4blzTkA==
X-Google-Smtp-Source: ADFU+vtulSOP8OvSvkxBZMJLrcIznUkrxg5FPKULJHIU/Os8uPjW375yJ+80RVOHh8Fum8E6oOMu8Q==
X-Received: by 2002:aa7:8618:: with SMTP id p24mr11902081pfn.3.1584072016302; 
 Thu, 12 Mar 2020 21:00:16 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id y143sm7190033pfb.22.2020.03.12.21.00.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 21:00:15 -0700 (PDT)
Date: Fri, 13 Mar 2020 09:30:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
 <20200312191025.GD3803@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312191025.GD3803@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12-03-20, 20:10, Cyril Hrubis wrote:
> Hi!
> Pushed with two minor changes:
> 
> diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> index d05350ce2..aea6db822 100644
> --- a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> @@ -77,6 +77,8 @@ static void run(void)
>                 SAFE_UMOUNT(MNTPOINT);
>                 tst_res(TPASS, "fsconfig() passed");
>         }
> +
> +       SAFE_CLOSE(fd);

This isn't required as cleanup() routine is taking care of it and this
is a test_all type test.

>  }
> 
> We need to close the fd here, because the test will run out of file
> descriptors for large enough -i parameter, since cleanup is executed
> only at the test end. Also note that SAFE_CLOSE() sets the fd to -1 so
> that cleanup is no-op unless we trigger some of the tst_brk()
> statements.
> 
>  static struct tst_test test = {
> diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> index b07a5f3ab..586524f14 100644
> --- a/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> @@ -94,6 +94,7 @@ static struct tst_test test = {
>         .test = run,
>         .setup = setup,
>         .cleanup = cleanup,
> +       .needs_tmpdir = 1,

I probably didn't add this as we weren't mounting anything here.

>         .needs_root = 1,
>         .needs_device = 1,
>  };
> 
> The test creates a file hence it has to request temporary directory.
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
