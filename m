Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id 03121163FCA
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:51:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E45FB3C250C
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:51:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 517593C0BA3
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:51:30 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2352E140186D
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:51:30 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id dw13so2281441pjb.4
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 00:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JI4hGHq4aIt+NMWEnG37QF0wXQokBM2lZ3dEUEOEkP8=;
 b=bT6MjDcE0k/oEb4p2Fis3WQOHMktcr3MTINVtJV26QrlOVEpIYzWmRBGEbyDrONQax
 2GEbkMbOqQyPChUIqhqxATVkGJodV93rM9vbrrCVbRCZQUNKbUPDH+6bJp3SIhh1BKfG
 7E4dM/h4CGMLOOLQh0aZJK2f+vzVMyVn7S+61Q9s+5wDjU2U8oPR9zw3FfWvdYU8rOas
 ssQ7Dwf3ZdTyOALSrIROrXoIGTmrA1hLBmwCAugJQjO/oS0prsNBZf1ftZhPOBoR4pAn
 m17yMgsp4i4jGWVyewT8eCX/k/8gZnuulcrR/H7IpApZDQPzh1iXa814LrHgsKFvMZj7
 7A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JI4hGHq4aIt+NMWEnG37QF0wXQokBM2lZ3dEUEOEkP8=;
 b=ni2ACWmJKq6JE8BjrgPR5HpPrdzIjCaPjmYbPsI5/0+dfdZKjAGIqM91VeywPxim/3
 I2lo5xtYDzuJzdVlWWMz02faJ+PPKcyCty0LKrsa9CjVfaG0zcbi5+pJ44S8BMdceCqf
 rFl9HlAqox+gP+EnShwcshRdmkY1aqMeTBaXI3hV+pz4FrscYNzSwQfmBHaW7DZM/a37
 KwdHbyJKf0nhcE+67yK6bNQD/rn9zVJh879/FKpnLqLSk4TtiCQS/mYIRq4jODyvmMIF
 /xRuufTVRnQ+0irkzQGIgHh1VWOP8GtD7yaDMjNTVhEcE+nCN5KmO8CCnbcyLrsHDXTu
 0s1Q==
X-Gm-Message-State: APjAAAXXe6BoIsp+877dxbuAEgihN+L/jsVtmIA2eBysAFWm+ZY5+AXz
 0/fXNCNt8aBV/aTsGnlQrSNuJEwjcNg=
X-Google-Smtp-Source: APXvYqyViCYGTwoxrMluSmlIbvuLw2brvNu2bvZHJ8KZa/MojcVeVNcyzpY19QJdYuiEMgaMe+mcOA==
X-Received: by 2002:a17:90a:da03:: with SMTP id
 e3mr7893433pjv.57.1582102288538; 
 Wed, 19 Feb 2020 00:51:28 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id d14sm1881679pfq.117.2020.02.19.00.51.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 00:51:27 -0800 (PST)
Date: Wed, 19 Feb 2020 14:21:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200219085125.rxqrxropw6cavf25@vireshk-i7>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
 <20200219085018.GB21099@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219085018.GB21099@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-02-20, 09:50, Petr Vorel wrote:
> Hi,
> 
> > On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> 
> > > ...
> > > > > +static struct tst_test test = {
> > > > > +       .min_kver = "5.2",
> 
> 
> > > > I suggest removing .min_kver check in all of the tests to let they can be
> > > > running on many distributions(which backport the features).
> 
> > > If we do that we have to explicitely check for ENOSYS errno in each
> > > test, quite possibly with a dummy call to the tested syscall in test
> > > setup, because once these calls gets libc wrappers we will no longer
> > > call the tst_syscall() that checks for it.
> 
> 
> > +1 add dummy call to the tested syscall in the setup.
> > Agree, thanks for point out this.
> Could anybody add it to fsmount/fsmount01.c instead?

I am doing it.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
