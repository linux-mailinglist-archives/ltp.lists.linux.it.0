Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C61DABC7
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:16:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C4383C4E29
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 09:16:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D84B63C0331
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:16:35 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC5D1201DCA
 for <ltp@lists.linux.it>; Wed, 20 May 2020 09:16:34 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id f6so1029056pgm.1
 for <ltp@lists.linux.it>; Wed, 20 May 2020 00:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4m8qzWd8178dASVTT7RsX3ot/bj1/5AfdZSW0qz+CYE=;
 b=q1Cgg/vd0vBNQGBsnzXZOiD8hLQYL1x2zk/e3v1Dt+YItEtuL/aIlxeVf5Dkj7RX7K
 dYmswm1/hbigLP1zryzM9xufRWb+KLO4BVkd2kDXyKtOdtc+ApJtOP3xzxwn8GdMv7pP
 0zOcKmo4nJhsrVMMYkD5AKytq4g/TQnpL5A0B5TiTFdMpyJHF/0QnVdZ6xhWRB252eIt
 fkycUDqjRDO/GtSnmq3bVFWxvgXOkPigEb5bfTDyAKXUQLNw7OkC6kVMzaBYMG1WQrL4
 RPNbyeaxrGuOZQHU15KD0CjXw3JtDw3jOYDx5fzG7Npr2AvhcW7EBoN6hLDenSAJPI3m
 Hbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4m8qzWd8178dASVTT7RsX3ot/bj1/5AfdZSW0qz+CYE=;
 b=jZR/8hu9jDzKeV4L41XM+8B0pVkz18Pnrb85PcBq+MWZJ6OK7DI32ChPDdQyQCdYub
 MRPBCubmT5AmGF0Qy6VBJsDNnwmuDXNRB1dl7cb963gIp3LdxDRJ9kdn24orKNdJXESu
 5SgMhFvFLAG9Y4drWes6EUTXFExAOWJ5rXc+OfhTvzz0vrDXI4CBFywjU2RvZ3WjesZz
 zWB/TMtJV5VFG3D854RIMBT4fIhKCLwlxmG8xwVX63jzNSVWizUbpRua42iBbdzKoQtf
 dZmawIGhcopQwB85FfUuQu92neCjYTRwt/d/tPUb2JdqLhdPooGnfb9m4QAjzVXPK7wE
 ZR9Q==
X-Gm-Message-State: AOAM531qNZHy43YbqSWOf2Xs7gB4F+zCv6+Ekpg+pBEnKYLTCmMWBYjA
 p1YSkS8oSf8FFiM3KLLs3HW4ng==
X-Google-Smtp-Source: ABdhPJwchcLEUd/EXhrNCFFyBbWqfWc8ps3+q8qPxpA25qiuqT2GKcB8N62vpNhwSyywY89k3wMN8g==
X-Received: by 2002:a63:5c1d:: with SMTP id q29mr2867221pgb.105.1589958993088; 
 Wed, 20 May 2020 00:16:33 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id z13sm79716pfq.16.2020.05.20.00.16.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 00:16:32 -0700 (PDT)
Date: Wed, 20 May 2020 12:46:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200520071630.mfash3ix2u4m7eb3@vireshk-i7>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
 <931bddab3d92f73f07f32dd7e1770078fdc07e0e.1589877853.git.viresh.kumar@linaro.org>
 <20200519121617.GA16008@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519121617.GA16008@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] syscalls: settimeofday: Use gettimeofday()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-05-20, 14:16, Cyril Hrubis wrote:
> Hi!
> You can set the .restore_wallclock flag in the tst_test structure for
> these two tests and remove the setup() and cleanup() as well.

Done.

> Also in the settimeofday02 I would be inclined to just remove the clock
> restoration code, since there is no way the tim will be changed unless
> the kernel is buggy.

If I understand it correctly, you now suggested to get rid of the
.restore_wallclock() flag from 02.c ? I think it is better to keep it as the
kernel can be buggy and we must get back to a working state in such a case. So,
I didn't remove it :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
