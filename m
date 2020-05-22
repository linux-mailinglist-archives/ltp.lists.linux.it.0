Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7421DE0AD
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:13:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72C7F3C4CA7
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:13:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2F9993C2352
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:13:03 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5D8ED2009FE
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:13:02 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id n15so4594952pjt.4
 for <ltp@lists.linux.it>; Fri, 22 May 2020 00:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R4MI6HYFSLC69f5A/xyom65q78vZ6GLfAXnfVWwpR5o=;
 b=HxvSExlEwvQSZEPrzWyMe9n51VU5cqv5Z82PtSYn2o1ZMJStH9CSXyD6LCT1jKnkeO
 9wTL5xrQW1t0PkwA+aO/H9Fo+6Z3J1UpQGWzVS4iytgSXzZbDCn/zSHUM9earaJ6fkZh
 LLv2VNvg9H9alW3y36wbxQnZuDjLBe6/b5/icHqrAMgwZbczPKy4W/yTwi5i2++EMd2c
 HQRuiS4dcaz36iG+kSB35Lbg99XAElKcF9XYln8nCM2wU8UpIveFaJJMKbUEgpy3Lbj7
 3sycK8fhSw33yQ77hFLWatJrVW3YeYFSVZaBqDBarEX1PAGvR2lMcNGoI2b46jXHdD7w
 W7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R4MI6HYFSLC69f5A/xyom65q78vZ6GLfAXnfVWwpR5o=;
 b=ZKc9cgIc4yRTt/JLDLFR69oF74zQIq/3+IFvmtoTPtgkgHBXcJDxu6T/BOcM1rN23N
 ZgDIJHv6O3A356AoTdb08folVWpoD/WD7SXv0z2UZ6fPdCNkhiGpsyArzugRcCr3G/vd
 +iyxxAjrZQOk5+9FckEfuk1BpOFUVmivkHWzxMfDlaUKXzXyNeEv/uLS61s1ak5u/d1P
 K4t7CoeyvPjOH0oX8Joy7IpfEtd000VtMhmxBOoEIjLYSsonyji7hnvQnVgUth4Ggt7m
 Sxeioi/0BFXR8xOkGuANU5qU4QDJt531alEUDXvz8ijibe2iGvaqXUlulGuFWQYOXSYf
 vAow==
X-Gm-Message-State: AOAM530hkG+1hrh3NJtMJDE5igaKEP5mgTga0wFsC7sFAMsrkMJeNqxx
 LBUwZ/2L9y1MKctG59/PZ8ng7Q==
X-Google-Smtp-Source: ABdhPJxmNoIVJqiOn9jWtL09vlIpHJZGmfqnffDaY/WIR+lN0Y6wEH4DFCdeipy1GLK27UHyi5Iyhw==
X-Received: by 2002:a17:902:d915:: with SMTP id
 c21mr13251801plz.49.1590131580600; 
 Fri, 22 May 2020 00:13:00 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id v127sm6152521pfb.91.2020.05.22.00.12.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 00:12:59 -0700 (PDT)
Date: Fri, 22 May 2020 12:42:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200522071258.bgajo3a7mngmhr6y@vireshk-i7>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <5d502fbc7070644ed83c423713941b457c3a7aff.1590057824.git.viresh.kumar@linaro.org>
 <CAK8P3a0pxv5wauMcf223n=_7zNJ4mn1Y0WvcssFC13pcvz9wmQ@mail.gmail.com>
 <20200521142621.GE7833@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521142621.GE7833@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls: semctl: Add new test to verify the
 _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 21-05-20, 16:26, Cyril Hrubis wrote:
> Hi!
> > > The _time_high fields must be reset by the kernel, add a test to verify
> > > that.
> > >
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > Right, here you do need to copy the struct definitions since I forgot
> > to add a way to detect the presence in the kernel header files,
> > sorry about that.
> > 
> > Possibly you could just have a check in the Makefile that lets
> > skips the test if it fails to build because of old kernel headers?
> > Or maybe check LINUX_VERSION_CODE to see if the headers
> > are at least from linux-4.19?
> 
> We usually include autotools checks and fallback definitions in
> include/lapi.h in this case.

And that's what my patches are doing. They check for 

#ifndef HAVE_MSQID64_DS

and then only go define them.

We can't work with kernel versions due to possible backporting of the
patches to older kernels.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
