Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E887E1CD152
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 07:44:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E5DA3C5600
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 07:44:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A1BC53C55D9
 for <ltp@lists.linux.it>; Mon, 11 May 2020 07:44:07 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 043AF1000466
 for <ltp@lists.linux.it>; Mon, 11 May 2020 07:44:06 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id x15so3663483pfa.1
 for <ltp@lists.linux.it>; Sun, 10 May 2020 22:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xYG32VxosqGV+wiIv9AeujZdY9vrS6eT0LODG9w414k=;
 b=x5Lokjn26PqmhD5+4LmlJ41sG4wUIqFrQGAXZ4fPdlXGpuYVZVq45SBnbxGYduse44
 tgjwT+58XZdY71x6K45fPJLjEIzYZOeqo7VMOnRPEluwZxxkw/D0s42EbUKdpRxTpH8a
 o3flj9+HM+487ngwff8C++hGewODjPm3W9q3DsGToWDO4KzI3fBGqY+apu7k5oLHmT+w
 LlkhWNTnuAWvNREuinVMb2AND5JPU0d9Mp8wkay9DxBhkcxtBXm82bgHmo+DVGMVtRsr
 W51Hb/rt7qsUIVyCN4iQufoUo1cxYH6M4dAcQuyoRola3S/Sb6RKE9Ylg81rh9BtNz1p
 ATrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xYG32VxosqGV+wiIv9AeujZdY9vrS6eT0LODG9w414k=;
 b=nD3ckDGOhts8ETZ5e5iotA+bcerTqPqZFOg41CyJmjD7djiBhrqiVd0khKGEDCZATO
 q9c8ipX//v27lqUDK8gfWpGCfS9bHd0TRDa6ikVWYchtRJDU5Af/h2UZKQihTzSS5mTn
 wmwkM+rW3le5VrZLkqyPcYQn9y3SWU64EkdAYdES6D/EH2uMZqRr9YarWdh5E3lMYW/D
 ynY2HbgOMYrMM/s84YAx6wgMYQsrmaap3IxQlc36AZ3PQ+e99Y7dLHLw3a16zsXoqyis
 9WhfO0KcxEguSTBDuIT9RgqnCwJnfO6wjVLcJ3smCPARQsdTihWqf1vRZTdNernUFfgf
 rwgA==
X-Gm-Message-State: AGi0PubISnKg/OeKxa+dtHTMRLEdG20+4bDizP1QxreHNIaqAWBug2F3
 FgNyf2UlAlyRHhbByk09EFO7Dg==
X-Google-Smtp-Source: APiQypKi4BnY/yZiVMRmA/lWUjr+WxzdapzpCSdbv2iC08hyEwFfTrowtj9Uo/kASb7K/NH8FMsixA==
X-Received: by 2002:a63:dc09:: with SMTP id s9mr12034697pgg.95.1589175845243; 
 Sun, 10 May 2020 22:44:05 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id g184sm8047410pfb.80.2020.05.10.22.44.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 22:44:04 -0700 (PDT)
Date: Mon, 11 May 2020 11:14:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200511054402.fhldrqkaasvv3n7r@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200508085657.ousiwqakcq7zegpo@vireshk-i7>
 <CAK8P3a0PCX_KzKLVD7ZT10xxpOXapUh8o5hhE5OOzyPjxf=GAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0PCX_KzKLVD7ZT10xxpOXapUh8o5hhE5OOzyPjxf=GAw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-05-20, 11:24, Arnd Bergmann wrote:
> __NR_semtimedop can only be called with the 'old' timespec, which
> may have either 32 or 64 members depending on the architecture.
> On x32 it uses 64-bit members, and on riscv32 it does not exist at all.
> 
> I think you already have a correct __kernel_old_timespec definition,
> so what I'd expect to see here is code that passes __kernel_old_timespec
> into __NR_semtimedop whenever __NR_semtimedop is defined.

Ahh, so on ARM64 and x86_64, fields will be 8 bytes long even with the old
timespec. I missed that and so the confusion.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
