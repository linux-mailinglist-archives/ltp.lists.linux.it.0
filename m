Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 02437260C5A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:47:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1B493C53BB
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:47:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2499D3C093E
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:47:38 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BE8471A010F1
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:47:37 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id 7so9450249pgm.11
 for <ltp@lists.linux.it>; Tue, 08 Sep 2020 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xqZLQhHIYtL+8yOba2ZBFaAl3UUwDemZuHI5cR7Nd40=;
 b=kNbtedYGbpoj+ydQ0QX3SBIuKmPG8LUiPt11i6sutCgSPdEMMjxlCRqOzg/lBVsHuZ
 cjAOwF5jqX2fGd6UbBGeqM2DCTt13tXadE5bOnRzjQ/thOMLBhhtM9JzeLaJiRfKdRfv
 5Cg5pWoiTSb9EbfNkw7mhrouDzfHSz/iQsw5s8xxeMVIQjF1PLj3d0uI8n+s1ezCy2yQ
 HLBQnHNPRW4wScdTZeHoT5QFS1evK3+i5eOp1a2De3Qa2h6uoy/Kthiga+wRfGzSEl3Z
 zN3qlaQfCyKBrk9/UQ8U12kl9N4r8QAeFZLC36jt4zdyTAauiivtN99npyh21L3SEQ3N
 +u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xqZLQhHIYtL+8yOba2ZBFaAl3UUwDemZuHI5cR7Nd40=;
 b=nYcfGiupkzs7r9YZW1JQfVAYcm84jPbBYqrQBf6wQmERYjXWK1dy4hUs/Qdm0Kyio/
 jSjvx+c+9px/4/IDwZJQSRvbbsyN+iwoOxF6eKIhefYENa4ZPdzZwMPhsEPJww7Yohr4
 tD48jy8EkYxaoBAJtsHOoxMkWdnHTWWKgatIkfEx//kRtGx/ywC2vOeXpcPVf0cdkmoQ
 uW6XpPgamdWg0DLUz4c7iQ73MXqqIr/1yThPmsWJWuefxSRR9qrSyNyh0bPbXzEpQXQl
 dB7YVz80HLwdva0dH/WIRbD7KOjpHoeAoSOedZNVD/LVbA5V03qqFFbmkgfeJzoOK3jO
 dqTg==
X-Gm-Message-State: AOAM533cGqDGkeYplfkozPFKQ02dz9uJvT+0YgAgPjTLhmDWRaYvJqd0
 V2bAWlkrbp6WHyYPODJOGyBocWzesbiogw==
X-Google-Smtp-Source: ABdhPJyzwybmnhq4yFRYUVUpLcysRC1c9BrWlwUS6RlMdz2lomjx2Mm4hf5vgeVQcDS9ck/fq3TTFw==
X-Received: by 2002:a05:6a00:2a6:: with SMTP id
 q6mr7509223pfs.154.1599551256203; 
 Tue, 08 Sep 2020 00:47:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id a6sm14314178pgt.70.2020.09.08.00.47.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Sep 2020 00:47:35 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:17:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200908074728.imbxcswztx3h5ssd@vireshk-i7>
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
 <f7855857470b26fdbebcfe4adf1cd4779852f7ff.1599115178.git.viresh.kumar@linaro.org>
 <a68a049a-c362-ae0e-3cc8-19cac4cfd741@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a68a049a-c362-ae0e-3cc8-19cac4cfd741@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls: select: Rename select04.c to
 select02.c
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-09-20, 15:39, Yang Xu wrote:
> Hi Viresh
> 
> IMO, we don't need to rename select04 to select02. The later new case can
> use select02 name. It makes select history more clean.

Why keeping such history is important ? I think it will look rather
confusing why we have files named as 01 and then 04.

Anyway, I will keep the patch in the series and will leave it for
Cyril to decide if he wants to pick the patch or not.

Thanks Yang.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
