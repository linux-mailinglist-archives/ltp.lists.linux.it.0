Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2C24FB24
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 12:16:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0770B3C56C6
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 12:16:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 33A8E3C13D8
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 12:16:44 +0200 (CEST)
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8ACC06005F0
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 12:16:43 +0200 (CEST)
Received: by mail-vk1-xa34.google.com with SMTP id o2so1840575vkn.9
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OiCnBS3GYYoc2kTu6U4ScV/ziyrA981gLnUbVdRpKoY=;
 b=J7Wbx9EmaRP0OLY3dh6kuTXPZs9/tD8i70xzq0R0UJLlPGvI+QuyEXm0317YUV78wI
 77sU+R+hq+azI2/J3yBcN9y9LuvaLS324FEGORsIJh/EYAoQzPM5NSmMFrtrKOoCKHoS
 DTBZaI9c1Iv4jWmPWv1q4GM6oz1jvOPwLVfPZDpkOSK242goI8eNhpuE9qsEducUHHKS
 Qsm/CmGzEqNmI7ykmtkIxxS6iv2obxKOq+t1LMYhf44YZQ9+3r2WokkeTKvha/Z6JcRQ
 qSUpWFpThpFDZGhtXOBxIdJpjbakZLgukJxr6JWI2bI5E3cRp8rI1dr71zWdENcEg0eG
 r6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OiCnBS3GYYoc2kTu6U4ScV/ziyrA981gLnUbVdRpKoY=;
 b=pSXYHpd0NoMx0WeEdJAFS9P3KTSa8b9+Pm0iV37nGg6xwOjlJ/iGMFwKNu5bYfgiuq
 tthXIZp23IL+gihQCnwd1kdLHEYnXRQzanGHFFIP/iDG2GwZ6xnjcPevdpy3ySFs4V3a
 CxDdsai2FjAa9YbTGcQ5FidYtFUlQQgQMKuCQAvyU1sZEIqyDm5vcjNlYVKtsJU/pqD4
 Rju9KTyvhwHoln4ABWGNd0Db10CHMCmLDEsqmWfaGZrlGj5DDRje4QIF6UhaYNT2Yq4d
 H74dFnQHYPNo/UuX1ogGg6iaTllarg2gpF9rpr30FrUms81lFNwO5kjm4b5l6jIXuYlV
 xN7A==
X-Gm-Message-State: AOAM530T89N4kSGkFIVL/acai4YSm7/9EsNs1eeqKQFTH8CWmA+lgXRb
 zCgJFbl8iWG7oFCc1Ao4tZx7UWv/qtBspvgimXkrIQ==
X-Google-Smtp-Source: ABdhPJyL/7mPRqeQIbvTo4BErUCy3JkI6gdC46co6kFSio+FPo/F2dgD3SAvRWGLInV9c6P76V1Lf7HyDhKIwGTMGWA=
X-Received: by 2002:a1f:a256:: with SMTP id l83mr1859945vke.78.1598264202330; 
 Mon, 24 Aug 2020 03:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
In-Reply-To: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 24 Aug 2020 15:46:30 +0530
Message-ID: <CA+G9fYtVCb6p_eeBayp_bzJGYFBOx+yG+Bgpda3KcFy-Yj1VgA@mail.gmail.com>
To: linux-mm <linux-mm@kvack.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org, Andrew Morton <akpm@linux-foundation.org>, 
 LTP List <ltp@lists.linux.it>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] BUG: Bad page state in process true  pfn:a8fed on arm
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, opendmb@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, Peter Xu <peterx@redhat.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, afzal.mohd.ma@gmail.com,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 24 Aug 2020 at 15:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Kernel BUG noticed on arm architecture on linux next 20200824 tag kernel
> while running LTP CVE "thp01 -I 120" , LTP mm, LTP hugetlb test cases
> and libhugetlbfs test suite.

BAD: next-20200820
GOOD: next-20200819

We are trying to bisect this problem and get back to you shortly.

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
