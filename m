Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A50213588
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:51:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3D1C3C5608
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:51:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E0B183C07D4
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:51:40 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 39EA41A0193E
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:51:40 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id bf7so3029827plb.2
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 00:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZecSZ+q3vcqeM0KA4fs0JkXVATMjuZ8zZFS8Fcwwgbo=;
 b=bXlDyo4y23/bSQ8EGrXcYo+FWOHE7C0+fXhOox+G4eaCsF8GOObJUA+wgzq+yzwRjO
 CmuVfdBLedqjDy2oWvgSQ6Y1zTpngujmI3FNWcO6Q3F/mjCLXzhJWmKjVHlhnYqr8ZeN
 d0zfPNHjtCXkwMpXn9pTR5t+frLEWH+4pwbjolc0Pzd6ivWV0PjuhnNzbx1LvTbzdeg9
 KMImzqBMZ4BKBgbwdismNbJFhYL+SUBxpcZwGVcr2F4FsOd4DMIHxkyqA+HF1Z4k5yYl
 mphpQTCQmZDGavemGf4q5nH1lJVhNrrEP02LzuodlUt+sB974jntil8kUfQVV8umf9R3
 yWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZecSZ+q3vcqeM0KA4fs0JkXVATMjuZ8zZFS8Fcwwgbo=;
 b=pVtAAORM5K0Ozne5+xavLsi6/ncbJDu0WlQDcorm+/k4TdOkOjXavj2/c68Hyo6LKU
 FdGVEWfV7WAaeyFQKmWfZGOFkZQ4EERTp/iyDl7hXoujrXX5Q13FKJI0Kuix4/3JPznE
 ufWowhY2zlrnUhBEukabeTnzj68tggGvs3Z2orO0fw4ZF+N77kbr/hFzD97FOj1qOuTI
 HY62fMIz09AHHzhz0jG1ZY5RAYTLwirymvvPQJv3m3UDH7ugSUr1i1t2hClb0T5s5woS
 HN+SijjG3Q3ygghfae/sP9XDI9uNiqW63maAHj+/0DkY8dkRSTrN89xMzIDpHAYG4iZp
 t5CA==
X-Gm-Message-State: AOAM532H418i5eWkeM6axDZKGOxGsXrZAtCsaVLUl+JvsilHcxEtUzXM
 ZTOAASVurBly7IyOOgnohc1iMzYtcJQ=
X-Google-Smtp-Source: ABdhPJz+Zt8wtZPnvoot6Hi/Y9m4kyIz7GrYAETxG2tMV4QwEj80BI04duDHRTCyWsnVDscl8JT9Dg==
X-Received: by 2002:a17:90a:d206:: with SMTP id
 o6mr33938517pju.132.1593762698776; 
 Fri, 03 Jul 2020 00:51:38 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id r8sm9696756pfh.29.2020.07.03.00.51.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 00:51:38 -0700 (PDT)
Date: Fri, 3 Jul 2020 13:21:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200703075136.enu2ovlfo25cwyca@vireshk-i7>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
 <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sched_rr_get_interval: Validate the
 timeslice
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 03-07-20, 15:43, Yang Xu wrote:
> Hi Viresh
> 
> Can we add a linux tag for this case(also a regression test for the before kernel patch).

Right, so this patch must be tested for kernels >= v3.9. I missed
that. This is what you were referring to, right ?

What's the regression test you are suggesting here ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
