Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A756D7430E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 04:02:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6259A3C1CF8
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 04:02:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F2F293C1C90
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 04:02:24 +0200 (CEST)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D2FE61A007E9
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 04:02:23 +0200 (CEST)
Received: by mail-vs1-f67.google.com with SMTP id 2so32660113vso.8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 19:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3Qh5CURFrtIITH2FUglwFi7IjBMC3BWsWOHBFi66JE=;
 b=Qvp+0HKHJJUrbssAOVW1FvR76FHbfuTbmJYh+XtL/SnysJ7x2FIo3v8hOycHVv1O/f
 E7mSbOo7SjhX5La0wL8t5XJcmdFGeoGFZvCgk1Le6y3Z/mgr+qTPbGI9i6jzfeQg6g4g
 vz0UdMCRQP6OHFbDYmxmXfMPABOVyCEI7K6mswqPKgGf7ePWFuRoZ9QyFVot6AjwuFoW
 Txj/Rrmsifl5F6eFyVuPUJX/El1h4svyc8sjkfb13k0G+C+qwwmlYr6mTZqGXpkFPYT7
 CRP55mpjpIbfC8QGpFQXQjXmcQLQM/pA0DEPEFaCc3Stwx103klqo+a/dJMV8i+SPjq1
 SBLQ==
X-Gm-Message-State: APjAAAU1p+gHOmBVY3rWNsn2opzUke4M74ki2YCJjfNs3baWPOyVXTO8
 PyBk3oPt6QoS+HHU5VAyf+BQZzpemKYEFBo67ZjIPw==
X-Google-Smtp-Source: APXvYqwZ0ZdbQkFXxlkXaocEWweNggiad8VOMIdI7X8x8U+N2LefZy+iXMuMIJm6pxIDWPqMNRdthJNaAI6G9qs8T5o=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr10642960vsp.130.1564020142724; 
 Wed, 24 Jul 2019 19:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190723115937.27247-1-chrubis@suse.cz>
 <CAEemH2d2+X=qOvfb-B9r-CKTvOmC=0kuDGqci0XLFc3bM9U_fA@mail.gmail.com>
 <20190724105236.GB17426@rei.lan>
In-Reply-To: <20190724105236.GB17426@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Jul 2019 10:02:11 +0800
Message-ID: <CAEemH2dkj_9sg4H7u69_cGWUhoLWGQQmT-_2rdPf-7umLzx3Xg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/mbind0{2,3,4}: Add basic mbind tests
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

Hi Cyril,

> Should I send a v4 or can I push the patch with your ack with these two
> issues fixed?

I have done around build & test on kind of systems(x86_64, ppc64le)
and confirmed it works well. I think we can push it.

    Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
