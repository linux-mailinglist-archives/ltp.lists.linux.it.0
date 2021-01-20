Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF52FD350
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:59:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5894F3C78E9
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:59:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 55E3B3C2365
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:59:08 +0100 (CET)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B8B1B200B73
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:59:07 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id l9so28232375ejx.3
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 06:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9vhkuMKHLbrnMkatp5jxrri+/wYoGjFrLmYAUFivcM=;
 b=EVu8CzO4PwWRtFyO76yMhxFrnZFpXUElHORCnIiJUlvHjUEY2BVgnla+i6v1vTe/u5
 f4DDEBSqaGcAYmNshZk8k5BHFnRzPmHtLmmjpNYVe86MwdolI+9jw7hj7f7qcOXwWeSg
 3va/cgIT1gyPEyjWZGgM27oo2fJ4OTMV7W9vB52apTbT8ZmMT24/b9oohEYN6cPARY0p
 hvGSEMYC7UdmNRq9nBFCDlI4iCcWzQvPOnKdb5xCU3s+E+LajWkE2G1oKh6LEBzyNPO6
 m/cmpkSwqFmZjmZkcxGIeX4ig+wRkA29IVEqRhKB2pbDvnJ2JmEUBtAyq2LTpp3ms9Mr
 mSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9vhkuMKHLbrnMkatp5jxrri+/wYoGjFrLmYAUFivcM=;
 b=c3KNKAZu8VGmarLkZyJkXQACV4+XR2taIGdWgIgm+lxQRvydrtX2H1eG9KJzlO7ktZ
 NjrR5kS6vPCDRvMMl7wrvcTAMi74XuO+1OcmgqhrihXiaUtzEXFN8AjlEnxGJmgl5QAt
 Vf1EnXIB4T84NxVzTIicdjNQq+LnsgPvzh7BT0L9kwkKX4vaU8yopJj9EidVW+RVWUZz
 cDoYzwxA+mz1brWYBG8hc1hkFnK5eBr3lWBc2US79umPhCW388BkhIGJq6x/c2Y9dzPS
 LdlN/8c/hyulJ312HwHOj0R3n7I1V9f/I8SbaQaNElAavQ+9ZuyF4cE5XlYgcGjSAx9V
 7xeQ==
X-Gm-Message-State: AOAM533tizD/sGF/LIOxkbq/zeWep4FZNefPBlasbGvZZZ65615ruOpv
 tXxqLrQKL4ZdCTC5SVnc3mzLB8iGJsyi+DzZaMHxQQ==
X-Google-Smtp-Source: ABdhPJz8wkbLUHPlVGyy1vOgSPB7MXJJEOYAyE7/oScr9kPl8JFh0BdMesiI1adw3NiWXn5AYLtBrM6WBmFN615FPNM=
X-Received: by 2002:a17:906:4443:: with SMTP id
 i3mr5996445ejp.133.1611154747275; 
 Wed, 20 Jan 2021 06:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20210118163240.29558-1-mdoucha@suse.cz>
 <YAbT62ecN/lq12cT@yuki.lan>
 <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
 <YAhEEzWShFLlHrk1@yuki.lan>
In-Reply-To: <YAhEEzWShFLlHrk1@yuki.lan>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Jan 2021 20:28:55 +0530
Message-ID: <CA+G9fYuDpnJOcHA5Me4KM4v+NaFW=2_3id=Am6skbDavb1iACw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_pollute_memory(): Set minimal safety margin
 to 64MB
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

On Wed, 20 Jan 2021 at 20:23, Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > > -     safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
> > > > +     safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 64 * 1024 * 1024);
> > > > +     safety /= info.mem_unit;
> > >
> > > I guess that this is safe enough for the release, since it will only
> > > increase the safety margin.
> > >
> > > Naresh can you please test this patch ASAP?
> >
> > I have applied your patch and rebuilt completely and retested
> > ioctl_sg01 test case in a loop on three different devices.
> >
> > 1 PASS out of 20 runs with overcommit_memory 0 on x86_64.
> > 1 PASS out of 20 runs with overcommit_memory 1 on x86_64.
> >
> > Which means 19 times the test case triggered oom-killer and the test was broken.
>
> So it looks like 64MB is not enough in your case.
>
> Does it work with 128MB or 256MB?
>
> i.e.:
>
> safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
> safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 256 * 1024 * 1024);


I will test with these changes and get back to you.

Meanwhile,

20 PASS out of 20 runs with overcommit_memory 2 on x86_64.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
