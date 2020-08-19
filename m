Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85431249DFC
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:33:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CE433C5848
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 14:33:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 16BFE3C04C3
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:33:50 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AE75E1400DDB
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 14:33:49 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id ha11so1060165pjb.1
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=88Lq/43rSvTUqx1csD64ZTwhKkedzhvuJitccSbVUec=;
 b=cdNq5GrjECZynOB5t7Zu5qak1jLC0GJQ5bY6gzKUj3hWz1ihvsbfMbAyfrfVwb05JO
 HOhpt+oBJluu7xG4N9mKzRme5NRMJnKAVD/1rQA1S9VYJElvAJnU7QPUYnb0W5rFZcwG
 2Y1cW8CN3f8cCoKShtPfGO1VW60UQiw1k58v6lQ5Zs6KYjDSAwWOS/Vqm53TxCG/nFcL
 t0vzSsbt2dPn47NpWK6b27a63bSzSkrKjoKzJrF3smOAvQPCZ8hJDVna/OGJZ5SWR8hi
 Os7hHkBLF4Ny+a55CzZB8pNXA4KwjCqd/Fmg3qEDhF2TVyHqQiXTRrwQPiUtPNxz4CyY
 C3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=88Lq/43rSvTUqx1csD64ZTwhKkedzhvuJitccSbVUec=;
 b=Xb77WvBIMYgeI8bF+YVmMXtRJrc397AVmbrSrN6AXg7PIjKtiqjFxNX7GNfx/gCG2K
 AtDCjEz4ZZTkLuOBmHVKc1HheG2eHcqQpyLREpYnTXWOD72FYirv+wY4HWAB59z2mw+7
 sKRXVrQz7CIECUxo88CqrDNRK/pYsoodcqyQXd6+iGvgnhnZnm8XY/GXFVSL+ILk0khJ
 W5RWiqw0YjXluLhe6PstHuyD+2vUlS6pdOH/Qfr2fX5GBNAn9d+LWD40PdQndAASK9//
 ++4cVkv06v/lc7Q8FxVF2h7ZVzofHoSEMCI9rnTodb2L7VQGGhA6aDwftj1uCRJepBCX
 Ir1w==
X-Gm-Message-State: AOAM531YRT7jYUayaPYkgT9+V9PvuEck7xfbff0uwXC+Zj39CXyQUHEK
 zZWIeEPksRsgcmHdvd/ag5rwrQ==
X-Google-Smtp-Source: ABdhPJzJu1uq2bM/fGnWz9xFmVZp+i0kj6Qv1TNw6pU7buWR9c7CL5T5pqJMR8/wIo1csg62L+CUXA==
X-Received: by 2002:a17:902:8b8b:: with SMTP id
 ay11mr19348350plb.241.1597840428238; 
 Wed, 19 Aug 2020 05:33:48 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id v5sm2942113pjz.33.2020.08.19.05.33.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 05:33:47 -0700 (PDT)
Date: Wed, 19 Aug 2020 18:03:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200819123345.guu63kqd6zob5oir@vireshk-i7>
References: <20200819083843.26435-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819083843.26435-1-liwang@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] clock_settime03: change to use CLOCK_REALTIME
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 19-08-20, 08:38, Li Wang wrote:
> CLOCK_REALTIME_ALARM requires an RTC with alarm support, which may not be
> present on a system. In that case, the kernel will return EOPNOTSUPP, which
> is defined as ENOTSUP in userspace.
> 
> Here use CLOCK_REALTIME instead of the CLOCK_REALTIME_ALARM because we do
> NOT need suspend the SUT during test.
> 
> For issue #712:
>   https://github.com/linux-test-project/ltp/issues/712
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Viresh Kumar<viresh.kumar@linaro.org>
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Cc: Jan Stancek <jstancek@redhat.com>
> Tested-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/syscalls/clock_settime/clock_settime03.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
