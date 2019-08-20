Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8495C2C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:21:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A066B3C1D0C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 12:21:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E46DD3C1347
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:21:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CD22560099D
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 12:21:12 +0200 (CEST)
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 641CEC08EC30
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 10:21:08 +0000 (UTC)
Received: by mail-vk1-f198.google.com with SMTP id r17so2775742vkd.23
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 03:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onmpFfh2gTHm837A92B00MPRb11RiY7oeaAKkxTrJPQ=;
 b=nYrB8vjfRRkPo9GQ3u8N0yH9af0Kimr8/ma9zpsyVvmjj7awO6xQo0sqYw5slbXyXe
 UBx/0YQRs9anzcxzlfp44fXszdhZ5epOo04mhFz8bvjXRFjNckqShSasWtrIbcY136Yk
 3QPTU9TmmbQMi4gL8gnFywArOqIs2KjKvs/r8/1+bALvyOOq5kKSj2GJ9w/xgR4jELkk
 G5ZAMPfdX9aV1wns+zGUbpfwD2rIciIO/v63moplOOF5bcdEbRaqZQ3YkJzgMEEdRNtq
 PWAX7El57BgYshFAZyeqopy+qIZDDVLtp5zy9jxlgxUcEPFAgYqbMEfAJGWE8+fmn5Nj
 dn9Q==
X-Gm-Message-State: APjAAAW4VPfq1NUnAoj4nUd8u5ff+uJA1GSv2CpI244ELzOd2AopVDCV
 zQEZFR1U762DEHni/7yxZlMRrc23suc2dM/38XSSVRoJELP60n0l81OWPJsRwiNfhccyJ7i2JF/
 U3e2mleyx8V6D79iGFd2wVIgFgs4=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr9733223ual.89.1566296467690;
 Tue, 20 Aug 2019 03:21:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYpbh8r64yC9h7jXHejrZfi5kbG3PUIMnh1Txo67nrcNwkdhizLFR9V1WGxSE44nfhHS/UDub7lsRXp4/4fps=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr9733214ual.89.1566296467319;
 Tue, 20 Aug 2019 03:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190819133618.7538-1-rpalethorpe@suse.com>
 <20190820095521.GA22253@rei.lan>
In-Reply-To: <20190820095521.GA22253@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Aug 2019 18:20:56 +0800
Message-ID: <CAEemH2cX1CO=zLzf1ZHQM+MUNS=FLKpGD1ypx=2uGst5qXn4YQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_res: Print errno number in addition to error
 name
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 20, 2019 at 5:55 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > It appears we are atleast missing ENOTSUPP (524) which is probably returned by
> > create_timer for some alarm clocks on none x86 arches. This isn't entirely
> > clear, but what is clear is that it would help to know what the error number
> > is without using strace.
>
> Can we please also patch the lib/errnos.h so that the ENOTSUPP is
> included there as well?

Not sure if we should do that since it(from google) says ENOTSUPP is
not intended to used in userland.

But if we just for catching more errors to report in LTP, I also think
it does not hurt anything.

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
