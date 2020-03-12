Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B60182CF5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 11:03:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D5453C5E7B
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 11:03:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 86DB73C5E5A
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 11:03:21 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C28851A007AA
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 11:03:20 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id f16so2476531plj.4
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CNMMaNtOqLpGX/00l7KaAYdVPTiJkAtlWqdcjWR+0vU=;
 b=qra1suBzJjiBBFS0yKk7SpApB9LBXZmMXfYPyjV48IY34nwbJLhm6wcL6F69wdU9EK
 zrwuG5sLpOmik8al2MfROnHyZHbvMSltCAZX9ayfO7BA2ab1SYRA8TghJIwfliMWVm9S
 JH/VUGGN7nwEW94iMQfDf2p+b9Ebbqu5EeB6ZGysQrLtJQm2V6FfCALtdFNkVPMJaNRV
 PzEfpMYcUGSLFWXFkzMzw9+AtY264G7auEYEPI9vvV3wAveAS9oRO4dX79evlXsSc3Io
 ZkNcJZqISMOts9UHeTuPAxh8+A189AD0CCwO+o9LWO/q6VbTZ+wZW6kXNCCaZOJCOIAl
 GBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CNMMaNtOqLpGX/00l7KaAYdVPTiJkAtlWqdcjWR+0vU=;
 b=RpygbsFJzG/WmezlP8Cs6UEosQbj1Vz95qwN4II/ILgPqmrYLbbdk7waruWEQX0u5P
 A8PHyjdFPoTnHK2lo9ZfH2ejIQIe0rOyqD6QtGM+O6XT+0b+OlEStaElRqF0q7DQRV9q
 faUottyhEDPW4trNfoG1sPH4llgX74K/PTuq02iLribFhpgnHpVl1AE5RLFszAXtxXJ4
 h36i2DTXuSudCVfPxFCxgIx+iS9TyiMAZo0Yc8dJNO7fC6muAz9RAvEX6y7yXTkUXwUN
 ifXDRBqZUUrMM41oSr2qvzrYC+HckI/SEicDke9NzCqV5mISUEvrZc8MNSnvG54BZwjx
 Rhbg==
X-Gm-Message-State: ANhLgQ1ackmFCh+bNXLMoorRuQlBspqpjLG6D7NHWGkZI6tc7fwHNHp8
 XktLcEH0mfZDwToBfp416f6JGg==
X-Google-Smtp-Source: ADFU+vsKELQFbZK6CfMJRKFdXsNlQOVg0qbbuLPcf6dn4anO9vj8Q01JfpsGBUswbqaR3X1gitkn4Q==
X-Received: by 2002:a17:90a:218b:: with SMTP id
 q11mr3240410pjc.163.1584007398885; 
 Thu, 12 Mar 2020 03:03:18 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id h3sm53995369pfo.102.2020.03.12.03.03.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 03:03:18 -0700 (PDT)
Date: Thu, 12 Mar 2020 15:33:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200312100316.7w67e5salel3dfue@vireshk-i7>
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <495a95969c63d67868b82d2b15bd663f19780d0e.1582779464.git.viresh.kumar@linaro.org>
 <20200306131046.GC3375@rei.lan>
 <20200311072502.hpj5bycslu6ygk74@vireshk-i7>
 <20200312081153.GA16928@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200312081153.GA16928@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 04/10] syscalls/fsopen: New tests
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
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12-03-20, 09:11, Petr Vorel wrote:
> Hi Viresh,
> 
> > > > +	TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> > > > +			MOVE_MOUNT_F_EMPTY_PATH));
> > > > +
> > > > +	SAFE_CLOSE(fsmfd);
> > > > +
> > > > +	if (TST_RET == -1) {
> > > > +		tst_res(TFAIL | TERRNO, "move_mount() failed");
> > > > +		goto out;
> > > > +	}
> > > > +
> > > > +	if (tst_is_mounted(MNTPOINT))
> > > > +		tst_res(TPASS, "%s: fsopen() passed", tc->name);
> > > > +
> > > > +	SAFE_UMOUNT(MNTPOINT);
> 
> > > I gues sthat the SAFE_UMOUNT() should be inside of the if here and in
> > > the rest of the testcases.
> 
> > Petr had a similar comment earlier and here is my explanation to it.
> 
> > There should always be a unmount() in response to a successful call to
> > mount() APIs. What if, because of some other bugs in the kernel or
> > testsuite, tst_is_mounted() returns 0? We should still do the
> > unmount() part as the mount() API didn't return an error.
> But IMHO if device is not mounted we get TBROK due EINVAL in safe_umount().

But why won't move_mount() fail if device isn't mounted ? Why do we
need the tst_is_mounted() helper at all ? Just to catch a case where
move_mount() is buggy and doesn't report the failure properly, right ?
In case of that bug, isn't it possible that move_mount() allocates
some resources which must be freed with a call to umount()
nevertheless ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
