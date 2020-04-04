Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D819E658
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 18:06:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAB973C2F07
	for <lists+linux-ltp@lfdr.de>; Sat,  4 Apr 2020 18:06:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8FF593C2EFF
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 18:06:32 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D53221A00991
 for <ltp@lists.linux.it>; Sat,  4 Apr 2020 18:06:31 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id t17so10089736ljc.12
 for <ltp@lists.linux.it>; Sat, 04 Apr 2020 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JRGsKivxe9j13Vrd41+3vZjk/D6J0Gm5H+Vo+RNnIsM=;
 b=u4VBZf8DWGri/CJMWdVajTa0xQcpmwrb+zk6ESFEMFIjPcYc7GaaSQI52drILyLNiN
 H0vEw6qLWWZAhN1c4ou2EZlKI9Of30F0J5hxr9BOAG/OlJGMPmfMu5b8PRH2Xdk7e7Jt
 wj1IwuHfmIesbu6AM5K5flkC9Y/cTvAoRJe//WGVL3r2TlRIvPcMYnBmz8L5Z2iWBXZU
 JIsmfsNl0WLCwXOuqxWSz2B6ihRBWbevfP/o81JCvUxx3NFYp2zvQw3EK0ONTqSmn79s
 xMTSqirmJJ2FlE0SXQyXWzUYQsNa1psjDxAUVnjP2mRiGwo8wzamf1q9k0sobnjbA5g3
 tNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JRGsKivxe9j13Vrd41+3vZjk/D6J0Gm5H+Vo+RNnIsM=;
 b=np17mX4imF0h6h3MiIvc7mgP/BBWNGlMxMCW52QmcsoJx1v2f4Uuns+0uKBskGEduS
 BPeB/FkJZa2YG0fo6BgokzDoLbmoGrOEgnvgubXMbavq4ABjToPHivCYCciYiUtVZxCE
 YyZdKKL8u/6nVnZYg/wLQ85gY5KKFUkXTNQNcfz+Sw+N+1wKEW/a7RESHf/cKkYZVAVE
 2hHMW2d594FuUCxUF7ydYxtaZVrxn68QMeJMgo3hhAJy+L6pJhTkayzd4U14YG32eUPP
 HAfGTWM9xxXh3FPGxjfXAXghy+1zL3ZFqs+mneMv8c+BT9tvevkxbzOU6/NfNNNBYUmj
 7qBw==
X-Gm-Message-State: AGi0PuYy//G5pGs+1w6tPDkJWjpRA6tcOEwfODuEA7GKsE2OKRhDZfx+
 D6abHRAkOaG962iRSgZALj6JPQ==
X-Google-Smtp-Source: APiQypIxW1eygGjnq/xOojjEUtOkk5jCDkQIz/ZzxBIqBHtRYYpksysAGE43MzcbDGuPRZjIEHHdOw==
X-Received: by 2002:a2e:82d0:: with SMTP id n16mr7945847ljh.174.1586016391180; 
 Sat, 04 Apr 2020 09:06:31 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id x29sm5236114lfn.64.2020.04.04.09.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 09:06:30 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 5519C101B5B; Sat,  4 Apr 2020 19:06:31 +0300 (+03)
Date: Sat, 4 Apr 2020 19:06:31 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200404160631.7eny3swsqn665m2p@box>
References: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
 <20200402133849.mmkvekzx37kw4nsj@box>
 <CA+G9fYv0xNtnD=eBmxVqYqEoYTbMk6mdn04WmgSUasDw2L7uFg@mail.gmail.com>
 <20200403133252.ivdqoppxhc6w5b47@box>
 <CA+G9fYsnD0vkCpSH98Lpsi6nxXBS+JYbSPhTnNE16CrQ4s4QhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsnD0vkCpSH98Lpsi6nxXBS+JYbSPhTnNE16CrQ4s4QhQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] mm/mremap.c : WARNING: at mm/mremap.c:211
 move_page_tables+0x5b0/0x5d0
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
Cc: William Kucharski <william.kucharski@oracle.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will.deacon@arm.com>, linux- stable <stable@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 lkft-triage@lists.linaro.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, Apr 04, 2020 at 08:10:42PM +0530, Naresh Kamboju wrote:
> On Fri, 3 Apr 2020 at 19:02, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > On Fri, Apr 03, 2020 at 12:56:57AM +0530, Naresh Kamboju wrote:
> > > [  734.876355] old_addr: 0xbfe00000, new_addr: 0xbfc00000, old_end: 0xc0000000
> >
> > The ranges are overlapping. We don't expect it. mremap(2) never does this.
> >
> > shift_arg_pages() only moves range downwards. It should be safe.
> >
> > Could you try this:
> 
> Applied the patch and tested and still getting kernel warning.
> CONFIG_HIGHMEM64G=y is still enabled.
> 
> [  790.041040] ------------[ cut here ]------------
> [  790.045664] WARNING: CPU: 3 PID: 3195 at mm/mremap.c:212
> move_page_tables+0x7a7/0x840

Are you sure the patch is applied? The line number in the warning supposed
to change.

-- 
 Kirill A. Shutemov

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
