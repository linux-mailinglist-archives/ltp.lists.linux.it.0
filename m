Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34A1CD2A1
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:33:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD7B63C5615
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:33:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0B29F3C1A4E
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:33:20 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 414561A00E5C
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:33:19 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so7430073pjb.1
 for <ltp@lists.linux.it>; Mon, 11 May 2020 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KCOmuoTM3xQdLEkWKKHHQdiaghCLMGQblBEKFlBfCq0=;
 b=KSVAbmWLtTdu5YAylvM3q/y7LnCypxW44FEPXqniX7VdZN93tbuAYO1XHbvGb4KLnp
 S8YtQ1AZVGMczES3z+DN7MmsA65S1b8HxxbLMoKPc1raT8YlfzWZjPOpnyBxi+Fn6PpL
 k2mGbh5LqDUzo94JM3OqWiRVLqYNK6+D0qg9GDZmpwmfvu/uPAwIxDlXQ6bv8NS9ZtGc
 anK37ppKfBNjH8myR5SPLZDx3ZQUqj7Zg8vexY4BMcX/xceqBzwhPJAyUEjwNvl9IG+J
 HZsKpBRclQlLahpfjShb3Fptds9DkIuz45NpAoEJcpTj+sEHxLn+ZApN6VCUBN54N3u/
 +JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KCOmuoTM3xQdLEkWKKHHQdiaghCLMGQblBEKFlBfCq0=;
 b=iexQdHBXSPas1jWzzseAXK+iZyj10pXZcroMfdFI8otnXKQy3lIwL083zLVzCi632T
 i6Gb94RWWWTdtzlRxR7ULxY7JyNLXN6Td/X65ddHBsrWfa/zaEcVaP9SWjQMTYoboGxh
 +PdGmuPOiyVvVxnrrlVy2FqUwrRC2fsrosSfrBcONYbJ7C+8sgCXjTqVXLv06V9BZL69
 JngqtZouiUYRAux6PzP8k4xWmSJNtyiPrVrHigCdP4FoWdg9zSf04NMNq1JezgJ73fxI
 2G1covxWc5ArxFVMQuztvEl1ApaNFZie1MpHmf59ARyq+S3QSYWisGGDSQytbiv3bFof
 O2VA==
X-Gm-Message-State: AGi0PuaZj8ZGzhs1SbypiQzMvwl5RNEceM57fG7k8jjWE29Lrx2sna1a
 SLmI6xaN7Hwi7P6pg0vHr5L3oA==
X-Google-Smtp-Source: APiQypIxfOLWmmQEWhpaEaj/NOL8eT8HrGBiPkW4+2ym3Mwsj+u+Wf3p4bM94YbbUDnU4kP4AUkXHA==
X-Received: by 2002:a17:90a:25cb:: with SMTP id
 k69mr20278069pje.93.1589182397671; 
 Mon, 11 May 2020 00:33:17 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id q21sm7043871pgl.7.2020.05.11.00.33.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 00:33:17 -0700 (PDT)
Date: Mon, 11 May 2020 13:03:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200511073315.gws5lhw6tsaaijpi@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
 <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-05-20, 09:20, Arnd Bergmann wrote:
> It looks like you are still missing a test for the libc semtimedop function with
> TST_LIBC_TIMESPEC, but perhaps this is in a different place?

The libc test is missing for few of the syscalls, as it was already missing for
them because the headers may not have the definition.

And so I didn't add them separately.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
