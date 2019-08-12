Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4A8A2FA
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 18:09:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B65F43C1D23
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 18:09:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 67A333C0731
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 18:09:14 +0200 (CEST)
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81CCD600AAE
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 18:09:15 +0200 (CEST)
Received: by mail-qt1-x841.google.com with SMTP id z4so103411036qtc.3
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnaZNj6OcIrJnBFWcRbWSkY4xvepDmg4dEtDDEvjaC0=;
 b=rM4BK921mK8jKTrz9MbRlgFiOPaChAQ15XigvY/jAwEMMmDjYs+frqzS9w0lCcBJ2y
 LGHmgem/txYDZlL6lL1NndLexe2xsTsATmLxsr1ZR6w/ArOF8I+GYdm5k4I4zt4w8d9m
 4B/bfXraf5DMKa6mheJn03H+NfDgHpFJEo4P7dUZ1UI81eKjI2XkWslh07PPm1Igq83k
 S4rnb5ZrF04v9S0JYjHJyPaZ/tsGcqfmski9/9jrIBiLvPgz24cpRvO9W2N3xQlgGKZB
 2sgoRt+hNct+yDOozBW3wK30nlZ3XJ1XyvHVscTMM4skUtmNFIOOphCzkMVN+2ykIxiW
 YP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnaZNj6OcIrJnBFWcRbWSkY4xvepDmg4dEtDDEvjaC0=;
 b=kZwcKsupAgFEooM1tcuFMkasmMb7h5IPcSZEe8I5WU7LAzSpaaa3C32JHNDEy+H6Fz
 KtjNwfmJooSFGbg7KmuUT1+QzL9Vv8NzdqVnL6/D7Vb6N1Bns16qA5yMum6LXeGBgbcU
 joBO/zuQdzB7IZCBn47YF4yllvqW0PqSOPcB5ja7lPpYfoQZulRuXENl5A9qs41ADXMS
 JoHT+GfwtvLodXMEi8g4WSlg+2phPWzMW5Z/KSlbq0hEf54KG9/GmDaFX49mUL/xhGRF
 5P3D+mhp3j5S/YNnhdzIsOKIMrh9w66Ph+qODx25vLq2kD0f7gOk8jWIRtv4ejF+kTPO
 w1KQ==
X-Gm-Message-State: APjAAAX1SGk149waMwzcyRC7VHG+2SygUJSgclBb/feXKHFArfe29+W0
 DDKBPNcu3lN2joayKpIipi6DMg==
X-Google-Smtp-Source: APXvYqw1JCAIgiCqB+pKXAs2o/kKQN4tbl59wY+nts7LpDjypCtYx4/rlvkaywOcvdN+2GK2rbwv4w==
X-Received: by 2002:a05:6214:10ea:: with SMTP id
 q10mr15711217qvt.128.1565626151734; 
 Mon, 12 Aug 2019 09:09:11 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id o50sm19991310qtj.17.2019.08.12.09.09.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 09:09:11 -0700 (PDT)
Message-ID: <1565626149.8572.1.camel@lca.pw>
From: Qian Cai <cai@lca.pw>
To: Sasha Levin <sashal@kernel.org>, Michal Hocko <mhocko@kernel.org>
Date: Mon, 12 Aug 2019 12:09:09 -0400
In-Reply-To: <20190812153326.GB17747@sasha-vm>
References: <20190808074736.GJ11812@dhcp22.suse.cz>
 <416ee59e-9ae8-f72d-1b26-4d3d31501330@oracle.com>
 <20190808185313.GG18351@dhcp22.suse.cz>
 <20190808163928.118f8da4f4289f7c51b8ffd4@linux-foundation.org>
 <20190809064633.GK18351@dhcp22.suse.cz>
 <20190809151718.d285cd1f6d0f1cf02cb93dc8@linux-foundation.org>
 <20190811234614.GZ17747@sasha-vm> <20190812084524.GC5117@dhcp22.suse.cz>
 <39b59001-55c1-a98b-75df-3a5dcec74504@suse.cz>
 <20190812132226.GI5117@dhcp22.suse.cz> <20190812153326.GB17747@sasha-vm>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlbfs: fix hugetlb page migration/fault race
 causing SIGBUS
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
Cc: xishi.qiuxishi@alibaba-inc.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, ltp@lists.linux.it,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 2019-08-12 at 11:33 -0400, Sasha Levin wrote:
> On Mon, Aug 12, 2019 at 03:22:26PM +0200, Michal Hocko wrote:
> > On Mon 12-08-19 15:14:12, Vlastimil Babka wrote:
> > > On 8/12/19 10:45 AM, Michal Hocko wrote:
> > > > On Sun 11-08-19 19:46:14, Sasha Levin wrote:
> > > > > On Fri, Aug 09, 2019 at 03:17:18PM -0700, Andrew Morton wrote:
> > > > > > On Fri, 9 Aug 2019 08:46:33 +0200 Michal Hocko <mhocko@kernel.org>
> > > > > > wrote:
> > > > > > 
> > > > > > It should work if we ask stable trees maintainers not to backport
> > > > > > such patches.
> > > > > > 
> > > > > > Sasha, please don't backport patches which are marked Fixes-no-
> > > > > > stable:
> > > > > > and which lack a cc:stable tag.
> > > > > 
> > > > > I'll add it to my filter, thank you!
> > > > 
> > > > I would really prefer to stick with Fixes: tag and stable only picking
> > > > up cc: stable patches. I really hate to see workarounds for sensible
> > > > workflows (marking the Fixes) just because we are trying to hide
> > > > something from stable maintainers. Seriously, if stable maintainers have
> > > > a different idea about what should be backported, it is their call. They
> > > > are the ones to deal with regressions and the backporting effort in
> > > > those cases of disagreement.
> > > 
> > > +1 on not replacing Fixes: tag with some other name, as there might be
> > > automation (not just at SUSE) relying on it.
> > > As a compromise, we can use something else to convey the "maintainers
> > > really don't recommend a stable backport", that Sasha can add to his
> > > filter.
> > > Perhaps counter-intuitively, but it could even look like this:
> > > Cc: stable@vger.kernel.org # not recommended at all by maintainer
> > 
> > I thought that absence of the Cc is the indication :P. Anyway, I really
> > do not understand why should we bother, really. I have tried to explain
> > that stable maintainers should follow Cc: stable because we bother to
> > consider that part and we are quite good at not forgetting (Thanks
> > Andrew for persistence). Sasha has told me that MM will be blacklisted
> > from automagic selection procedure.
> 
> I'll add mm/ to the ignore list for AUTOSEL patches.
> 
> > I really do not know much more we can do and I really have strong doubts
> > we should care at all. What is the worst that can happen? A potentially
> > dangerous commit gets to the stable tree and that blows up? That is
> > something that is something inherent when relying on AI and
> > aplies-it-must-be-ok workflow.
> 
> The issue I see here is that there's no way to validate the patches that
> go in mm/. I'd happily run whatever test suite you use to validate these
> patches, but it doesn't exist.
> 
> I can run xfstests for fs/, I can run blktests for block/, I can run
> kselftests for quite a few other subsystems in the kernel. What can I
> run for mm?

I have been running this for linux-next daily.

https://github.com/cailca/linux-mm

"test.sh" will give you some ideas. All the .config has almost all the MM
debugging options turned on, but it might need some modifications to run on QEMU
 etc.

"compile.sh" will have some additional MM debugging command-line options, and
some keywords to catch compilation warnings for MM.

> 
> I'd be happy to run whatever validation/regression suite for mm/ you
> would suggest.
> 
> I've heard the "every patch is a snowflake" story quite a few times, and
> I understand that most mm/ patches are complex, but we agree that
> manually testing every patch isn't scalable, right? Even for patches
> that mm/ tags for stable, are they actually tested on every stable tree?
> How is it different from the "aplies-it-must-be-ok workflow"?
> 
> --
> Thanks,
> Sasha
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
