Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDF7157E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 11:49:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F8B23C1D17
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 11:49:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2E4383C183E
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 11:49:08 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71188600CEF
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 11:49:07 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id r3so28354080vsr.13
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 02:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kWbGsZeNfU+8ZbxaNwG7T1fiLMRUyT1L23IprRd/VE=;
 b=dU8qqaB9ruIJarthWw/sInajUI94rM8ZvwUeQu3e2jU5RmFdPScvzEJRApu3ucZKHE
 3UF1LvO5NsRdz3la3dLHNTbZMMlTzXd705LihGvjr4WzDJdiKoob1nY/ik2cygjtKuNc
 kM/RXQkvjDi3GwVo9dKtNbjNI2qKzKwzkgte8FdPg/b8yzXQJUYMeZOqriCXbwHq0WwR
 L0MeZRW4wxq8l7e+T5Zyhtb64qna3sOp6YdDfpAQkeaKaHqCX0pO8fpLI7Q8jm9ax6Qx
 26f0Yez7jMTMIXsXXyrSie5YQ8kJqUlxoqCobPqPNL14lC16THGGGAnaXdpj+aVCqfFo
 K30g==
X-Gm-Message-State: APjAAAXYq2zLB+/yu9MWsSVVwwB/cgyYpNpyS6ToybJkpRjPSdXc6c34
 O4wka5Q1EQ0zUVl9VUrI1ro8hJNtEHyC1HMTxtZDkQ==
X-Google-Smtp-Source: APXvYqxQEZ5+gcqqZLWNnzqCOBQ62LjnV6vheykBFFJWse99erJMpvmFJYvBxkLMzVkI+LVl+RwdCuA6OR3J3+J1xZQ=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr2825743vsp.130.1563875346187; 
 Tue, 23 Jul 2019 02:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190722150316.27395-1-chrubis@suse.cz>
 <CAEemH2dapin31=WrPsA97wgX=2d5rzQy8+D7LVta6nr6BwFN5A@mail.gmail.com>
 <20190723093310.GA22630@rei.lan>
In-Reply-To: <20190723093310.GA22630@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 23 Jul 2019 17:48:55 +0800
Message-ID: <CAEemH2dNcNmrqgg2o2acOk3=aYg9A4HpPnHGEQfjyORm_98pUw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mbind0{2,3,4}: Add basic mbind tests
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

On Tue, Jul 23, 2019 at 5:33 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> > Why not test MPOL_INTERLEAVE for mbind02? I guess it also makes sense
> > to add here.
>
> Good catch, we have a bitmask with a single node, so I guess that this
> would work as well. Have you tested it?

Yes, it works for me.

> > I remember there are some ppc64le which have non-continuous numa nodes
> > in hardware configuration. I'm not sure if that special config will
> > break the mbind04 test, will update details to you after I run this
> > test on such a system.
>
> The LTP NUMA library should handle that, the nodes->cnt is the
> lenght of the NUMA map and the actual node ids are in the nodes->map[]
> array.

You're right, I verified that it doesn't affect by the non-continuous
node system.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
