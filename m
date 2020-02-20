Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFA1656A9
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:21:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B053A3C250E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:21:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id C86A13C24C9
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:21:04 +0100 (CET)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8322C1000A34
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:19:45 +0100 (CET)
Received: by mail-pg1-x530.google.com with SMTP id g3so1304710pgs.11
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eD722JItrYsU4/ve8F1YZVnK939SJGkaHTMg5JWazok=;
 b=oZUiuJw1bUFtaqV9I4EbuYX4+ndTz/6QS4sCqIcYQ3RvdR1KEEMyI1JgyO9saFCjdl
 KUQ3E/sbYA8cFaZANaGy1E0eO+vBe8ZyI4gYuiTC9of5hT84LHsSsJ5XKVMna5nLJIiP
 uaCAKM5LJAxP7/D3EK8x0OwCOpxa5Q58nVPfSNqVGS7jZ7SNJbcgXGpnbkdW0I064yPb
 uTsCC3iJudxUeTpILSF0GO7c7MooTNoPEkwkKYb7gTWkNpWptphYSXme3E9glbLZJNHr
 bOhMoGp3d6U0OqK9efZnsgBu0riAGx5aE4iaIYCfM68QU3ow3fhFX6mBOwLtXp/7Rr/P
 8zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eD722JItrYsU4/ve8F1YZVnK939SJGkaHTMg5JWazok=;
 b=fcegZxsxv3jlLig5WzXGmSfSvpKkp3co4WemxqNQcDW61NGkYpchCsvr7CWnk3B7rV
 LfhxaAp4EorL+cQ6j5kE9GgEV5teM3qth5WvIJEj0Kamj2qSvu4899RujhiXvmKI8sic
 EHQ5k0FQDi3yyBMs+QUqU7hM2CYvWUGshKI4818GWh8x/etxvdsSlU3Fld2xjlYtjoxp
 JAnrKkwsY3AQWRGYNPOSsmc0TNZ4F1MUkw1qnxmBXCy0H0uTo62wOvBABH1ObUk74VBj
 ieYr/LcHl7onO37ZOq/jHCiGVJ+x7cZBP8PdeOFGsWEx+VeKw7cFBPRfaXOIIvpstE0g
 p8jw==
X-Gm-Message-State: APjAAAUaVRgnuXAeRL4HtQGXu72Z4uEZ0mSkhv1o9GNTLpTQ+HFo49p1
 Rzfb3KEb/y+ok0gxj+My+3YTyg==
X-Google-Smtp-Source: APXvYqzl/EKPHeVjsvQYSueZMrhROVOlzWLXRBQSrT2+nxJXuu3UTOh6PW7cWyAckZYrvn1HzfPJDw==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr31731902pgb.121.1582176060877; 
 Wed, 19 Feb 2020 21:21:00 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id 144sm1515631pfc.45.2020.02.19.21.20.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 21:20:59 -0800 (PST)
Date: Thu, 20 Feb 2020 10:50:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200220052058.opgcrpnmk2clfrmh@vireshk-i7>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <199f58740e42bbdbcba0c847c194f62d2b3bb37b.1582104018.git.viresh.kumar@linaro.org>
 <CAEemH2d9DmK3-1hNH4Y-L+qikN7GXPbtguM7q4AQ__9is2MoPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d9DmK3-1hNH4Y-L+qikN7GXPbtguM7q4AQ__9is2MoPA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 01/10] tst_device: Add tst_ismount() helper
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

On 20-02-20, 13:10, Li Wang wrote:
> I have slightly thought to rename it as 'tst_is_mounted(const char *path)',
> but it also depends on other reviewer's opinion, I have no strong insist
> here.

I didn't apply much brain and just used the name you suggested last :)

Sure, we can name it anything we like. I also thought about
tst_verify_mount() though :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
