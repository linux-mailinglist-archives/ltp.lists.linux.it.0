Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B857E396ADB
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 04:08:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B5C53C90A2
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 04:08:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6ECC53C5A3C
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 04:08:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 08A681A00CB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 04:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622513312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuO9V4Z/PZUYkRfXE5FtrGObbF8ifWG9OHdjCgq9Qck=;
 b=dXFESCrD0Ju4ZBVsv/hEdK55ztSclz7eL/GN+J6sezTTGI5QgQVZ/LX0U4j4PzdGbGrqJ+
 LFbPrSFZFQ6hHRiMYYNqMxs/pvIp6CEFi3A6+HwEF5RWSehutNVo5wm0Gvd7DioQkMYDsA
 fDbxU10nO3p0XQhfgNFhU8UMdvF/5Rg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-UtCYWEWeNY-WgZQX_EhW_w-1; Mon, 31 May 2021 22:08:31 -0400
X-MC-Unique: UtCYWEWeNY-WgZQX_EhW_w-1
Received: by mail-yb1-f197.google.com with SMTP id
 v63-20020a2561420000b029053606377441so7793046ybb.15
 for <ltp@lists.linux.it>; Mon, 31 May 2021 19:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vuO9V4Z/PZUYkRfXE5FtrGObbF8ifWG9OHdjCgq9Qck=;
 b=QWh/Un8T+CNihlbxAJ3h7dFVsNQfX65covtQcybR3cTGL52RJ6+NIS5/7Bd2Kcau1B
 VnT5VV8ruWXEAgmdjy91KAqchVsE9EBJgm0EP8bNJUR0hKv5LasLXSf1OLS9dqYN6Ck6
 RcSMMq1OU9I2MjWNm95FvqMA0xAodny5lY7khHBqEIFhtrnRDMYDnK1C05uAMK9k2MJS
 9PzvYKT2bMVO0EDL5OgLZ5zjrte8qopC1w08FSBq0lklYfEG12+Sr870mPfrg9H6WTXU
 uqIAh6i85CUNoYdhTr2Tkx04/kdLMN04CYtH3dGVvX6S0kzSHuuXk54s0pM1q5/oq6t3
 gQog==
X-Gm-Message-State: AOAM530FpHPc4Qkj4jhtxD8bvD1L/rBZGCYXpA7SoddXpu6BJ7CZl4IQ
 XmgKK1JsJw5m1jtND3jevPH0aH1xZvYtUy2NME5SsvJ0mxmEtiNXnaYJM8aBSBDF1ePjwsAXiSV
 TBu3zcLsmL5tbpueUxaHsFLhK5jY=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr34353569ybp.366.1622513310501; 
 Mon, 31 May 2021 19:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3rW9DLnJ6YAaWrc9lmyFcP3sSa3MbzgThQ5C0xNwO4kUYdQudn1kWm3FwgWPlhef8idNLTe6ljsEYeiO79z4=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr34353551ybp.366.1622513310297; 
 Mon, 31 May 2021 19:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210518122610.17171-1-liwang@redhat.com>
 <20210518122610.17171-2-liwang@redhat.com>
 <YLTbXU1ZF4ZiXKdt@yuki> <20f87781-e66d-e8c6-1ac5-de208667a7f2@jv-coder.de>
 <YLTdT3v4AscW1PIE@yuki>
In-Reply-To: <YLTdT3v4AscW1PIE@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 1 Jun 2021 10:08:18 +0800
Message-ID: <CAEemH2dCBG6VqncBCG=SmRbC0kHaxpwfXpAU4ovPe8RcYd6D_A@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test: using SIGTERM to terminate process
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

> Okay. Let's go with this version, it's simple enough and anything that
> would behave better would only overcomplicate the code again.
>
> For the patch:
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks for the review, I helped merge the patch V2.
(tiny updates in v2: 'add comments + remove trap' from timeout03)

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
