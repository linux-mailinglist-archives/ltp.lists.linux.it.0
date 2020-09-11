Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F92656DA
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 04:06:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E44183C2C27
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 04:06:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4C4FE3C1C7A
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 04:06:29 +0200 (CEST)
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A470F1401260
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 04:06:28 +0200 (CEST)
Received: by mail-il1-x143.google.com with SMTP id f82so2965448ilh.8
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 19:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lae1Wak7Sl/igDoKDKH3Due0QxvSmEpj62hUClacNV8=;
 b=R4ehCFft+7yVct5JWAlOBUf3UxCsLnZYFUa9TnTRA0KvS5gJVqkGK8a9py83mFaO2L
 HMWDhMepmhOGRchQpATmAFV8DtqfoPXaXwx8H3CTwqrDjqUdACLHZHfjLALqEUuGGGfs
 x2Ekr22WTP/CvUboFdPMvEu3lAud+AFtHkFhk44M3+wL7I5dJaMnwPvysnck9Cyzal8B
 GhNLwvzsIeNk/9JKy7drkDQXMj4u+vrDaxGMlhmr+oq0i31vtYYGjds0A/Dc7YaTdo2B
 DQ5nrGUKVQdU2iYVaBhdD4JwdjRcv9g9TMOeLrs2TnjTamSqsvy2lGMb1/vQwALjMi3A
 SV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lae1Wak7Sl/igDoKDKH3Due0QxvSmEpj62hUClacNV8=;
 b=ukHYD2IwmK3L+m51BlJLWvlT4mI/92mTDm0tqed1HE72N6HX+q1LYNKxW+PMaLgESE
 UElodLOlHU/hpwCb0jSyQeYo/xAsADJkWK0ytO/hgTmUMrFu7Yl3SPPEsZoCSnBXn9oi
 ciKHhhvVW7tF4N4GNF1qf59loWyRuUD9phoUqobquADgpctIuXjqapQ0sjA6L1Dwsikp
 1EeJsEkP6ktlWBgf6gyfrdQHdKXtC2QHw7StUGZbptY0eSx01uveMuUtsYfiyEvnlx4X
 g4PymaH2zhQMZ0QY07i49gGut5DE02CoCp0DiJfEETSCJjppil43VojuJUHZ2rLbME7G
 BT/A==
X-Gm-Message-State: AOAM530/YQTlGQ2sKl/KtbSHPNlrgg4Vjxr7EaD6R37CrdHsEK1GP5Ay
 zSOXj4e5MHYx5skJ3WHJKcS02EtQwPADTEJAl6s=
X-Google-Smtp-Source: ABdhPJzKkkW38nCHdzwBUZ03k0oYvkocmHT86vRJQVfIGeXbzb4NcvvzH7YVgekNCPzd9bOejewYXczr7HnYyAdST98=
X-Received: by 2002:a92:c7b0:: with SMTP id f16mr8947833ilk.137.1599789987410; 
 Thu, 10 Sep 2020 19:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200910121628.18505-1-pvorel@suse.cz>
 <20200910153035.GA12601@yuki.lan>
In-Reply-To: <20200910153035.GA12601@yuki.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 11 Sep 2020 05:06:16 +0300
Message-ID: <CAOQ4uxjaiT4N1uvwzh8Jer4wc3HR+pqxNM_CLzFWZDbxZDxEHA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify10: Treat ignore mask bug as TCONF
 for < v5.9
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

On Thu, Sep 10, 2020 at 6:30 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> >                       if (ret > 0) {
> > -                             tst_res(TFAIL, "group %d (%x) with %s and "
> > -                                     "%s ignore mask got event",
> > +                             tst_res((tst_kvercmp(5, 9, 0)) < 0 ? TCONF : TFAIL,
> > +                                     "group %d (%x) with %s and %s ignore mask got event",
> >                                       i, fanotify_class[p], mark->name, ignore_mark->name);
>
> I do not like that much, how the tst_kvercmp() is sandwitched inside of
> the tst_res() call, since it makes it easier to be overlooked.
>
> The question is how can we do better, maybe set a variable in test
> setup?
>

I apologize. I did not review this change carefully.

What I suggested was to skip only the test cases with non zero
tc->ignored_onchild for kernel < 5.9.

Those are the new test cases that are failing due to missing fix
"497b0c5a7c06 fsnotify: send event to parent and child with single"
Which is not likely to be backported.

I see no reason to run those test cases and then report the failure as
TCONF.
The TCONF message can say that ignored mask in combination with
flag FAN_EVENT_ON_CHILD have undefined behavior on kernel < 5.9.

While at it, please remove the stray line from header comment:
 *     497b0c5a7c06 fsnotify: send event to parent and child with single...
 *     eca4784cbb18 fsnotify: send event to parent and child with single...

And please remove commit id 497b0c5a7c06 from .tags, otherwise,
stable kernel maintainers are still going to be bothered by attempting
to find a backport if that test fails due to other reasons on a stable kernel.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
