Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B743B295818
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 07:47:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 514463C5688
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 07:47:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 034693C2481
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 07:47:55 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 81CCE1000BF7
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 07:47:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603345673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7onHnkNsDaL0waEXafJYZQeWFDMuxtuugE7+2Ndmm0=;
 b=B6zCIpxZRqM6Yv7Ce/4h4Thsv92y3NNqBuUiTXi21NAgPm7mnyhDiyV6RHVNCd+hxPgQ3K
 CAj50jBkTQyp2S/fN1hOIg1jnnbeVp0thljOWrkGED5QeiNQt31bQGTGiLYeO0w9rIPIxr
 BsMEIRYuUuclGN9Zi6gCpqSJ37BNd4A=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-pGG0XeFKNsWOrb8Q0WDP9w-1; Thu, 22 Oct 2020 01:47:51 -0400
X-MC-Unique: pGG0XeFKNsWOrb8Q0WDP9w-1
Received: by mail-yb1-f198.google.com with SMTP id h64so643019ybc.1
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 22:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7onHnkNsDaL0waEXafJYZQeWFDMuxtuugE7+2Ndmm0=;
 b=gfwN8qBl2C7+5KQsaLLLO5fziMqYIIcw6DIKebybPbwiNYD3xVb+kIxuGfNWzb/acI
 i+5k6yeXk/cjSTu+cnAAuVKvukkw4o97CZ9UamBHq9888QkzL41XBHnjyjmUFTzS9bRq
 GQGdOdfby/8OnisJXbB8qsJqAWt9v8A5YHfTezjtJOWQ8oUWGFfW1Sg1Z1ktrlacEH1W
 EJRG4f32HgOgn5o+XK2kzeQMiFHCM0t/x/dxTWOYcje1/8tF2HxqjIg2sIiT0+qy8xCj
 8BPfhPcnNMNKOLSbnM9h/RzL77YuDnkzvCPglsSImSUMupZB+lKiv3uMw4MucA1BTLxk
 mfcw==
X-Gm-Message-State: AOAM5326Y6Vjx3FFRcztW4Bl+M+ihHnELnHVXvGjvaw31wPsiSPZwVRG
 wZ4lcrmUwKBv9C15yxA+ArdUOm4tFCrF2pYeGkIn/5YhqSMxGoBf4ya7Yu/Q5sjweVKrFQHdOH0
 Ei6CCYQRqa38GkN8zDjK0nBo25IE=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr977392ybj.366.1603345670531; 
 Wed, 21 Oct 2020 22:47:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykUA2a1R0DHmZ0GWNjj9PlMjmEiEi2mTY9vbgqBPWYSaNQzHFlevTPpe7JQKkJbhEzdiOXRYWqF/e1xKlXMpQ=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr977376ybj.366.1603345670298; 
 Wed, 21 Oct 2020 22:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201021193547.GA49488@x230>
 <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
 <5F90F214.20102@cn.fujitsu.com> <5F91163D.9030307@cn.fujitsu.com>
In-Reply-To: <5F91163D.9030307@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 22 Oct 2020 13:47:38 +0800
Message-ID: <CAEemH2eUfSgvmDB4EA6i3K6O9CCgiSa8CA5sKLQS2a_wOhDtXw@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Broken Fedora build
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

Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> >> I prefer to go replace ftime() by gettimeofday() or clock_gettime()
> >> way to solve this from root.
> > +1
> >
> > I have seen the hugetlb.c and trace_sched.c code, they all use the
> > time to generate a random value for ftok or sched_priority. So using
> > gettimeofday() also looks ok.
> Hi,
>
> It is fine for me to replace ftime(), but I wonder if we can remove
> fime() and srand()/srandom() directly? :-)
> It seems unnecessary to set the seed for random number.

That's true, but random() will generate the same number each time.
I slightly tend to keep setting the seed by srandom() to get a different
randomized number for test variety.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
