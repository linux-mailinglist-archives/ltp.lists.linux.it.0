Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA26378C6E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 14:45:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E6603C6580
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 14:45:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D8C783C4FB1
 for <ltp@lists.linux.it>; Mon, 10 May 2021 14:45:49 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7BBEB60083C
 for <ltp@lists.linux.it>; Mon, 10 May 2021 14:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620650747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Q/pcDdmx+bYgEFqL9Vjg/ohvCV7+0CWonIN4+KwrHo=;
 b=blnPnxYgdIS1X11LAfLLfv6lgDVOnwMt063WFTBZyTgZpfAJntoheyUlHaGsCOZc1/4boo
 CgnAsAEgO19OhY4gs7gSpbpyY/zit9/VcuDDD00qwriuDRmv/8y3Yum6Fg7YyccOhtTYJy
 zCEWdc4VidVQ3wUbAP2Qyrt1H2f8/ZI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--mGQpsWNNAm_mt-1-BAXbA-1; Mon, 10 May 2021 08:45:45 -0400
X-MC-Unique: -mGQpsWNNAm_mt-1-BAXbA-1
Received: by mail-yb1-f197.google.com with SMTP id
 i8-20020a0569020688b02904ef3bd00ce7so19532214ybt.7
 for <ltp@lists.linux.it>; Mon, 10 May 2021 05:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Q/pcDdmx+bYgEFqL9Vjg/ohvCV7+0CWonIN4+KwrHo=;
 b=ID4bREqWST6DlzDZyfVe+nIhQjjV3lvWgv80Me/k+ABwctr2Su+ETj0uflQVvFhHHy
 etUhwjASa3G3jSt5qz16wvRGOqNtCJf66/KaOXCoBFEjDRnZGNJvtvn5wfTyv/+nP0Rv
 12T/8p8NgpVqGg5SuUW+z42tPTlDk8xw39fhNh6LXm+Uiy+Nnehfx9UljApkmEXxGFLG
 MEm8HxPLNNAxTI4fYOwuL6I9eAT2diAN4l6ZhqbUrJ2Vhx4PyL5+cEx8v69WqpwkRjAi
 DohDSea64R5WkLdAyZ81bpJ/nwCxqEQIUpn0ANY0upQtyhHiHNf7wu/CjSAx15KU1ZY6
 hqUg==
X-Gm-Message-State: AOAM532jjExm8dmsTI2il7JshI/Vz4KSy2GU9doj2n2lQEpjTJOXNoqC
 T4ssX7rFn7jBywX8bFMiFMOS0CLsLY4xVKPxJkUZZR545mU2vyz54xm1XZH8vh20kxsPnh4YsGS
 xHN2yTxVNKdwJsOU8B3Xe7Czi4Pw=
X-Received: by 2002:a25:1455:: with SMTP id 82mr32306501ybu.403.1620650744760; 
 Mon, 10 May 2021 05:45:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyORTCgmZ2Pc+F7j2Wd2+EI09kFF7FdgDCjv4nLTH1rE9wnQnGU7g45r57GfUekRx7c9io04AG9BpzbskHU8UA=
X-Received: by 2002:a25:1455:: with SMTP id 82mr32306474ybu.403.1620650744503; 
 Mon, 10 May 2021 05:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210508055109.16914-5-liwang@redhat.com> <YJkfphiZtXZGxJR+@yuki>
In-Reply-To: <YJkfphiZtXZGxJR+@yuki>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 May 2021 20:45:33 +0800
Message-ID: <CAEemH2eMKumHr=f-Bp3M=dH8yDsQv9SKVxG=VcLLBmZOM_qKPg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/4] lib: reset SIGTERM to original disposition
 if timeout occured
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

On Mon, May 10, 2021 at 8:23 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>
> The whole series looks good to me. I'm ok with merging these changes
> beofre the release.

Thanks for the review! Patchset tweaked with your suggestions and merged.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
