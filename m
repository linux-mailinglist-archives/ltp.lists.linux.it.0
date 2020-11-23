Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 930CA2C0178
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:36:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56D3E3C4E77
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 09:36:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 72F753C63D5
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:36:15 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2187A1400FA9
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 09:36:15 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id p6so6119999plr.7
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=siKr041CFTUpC2Qw4djtY15I/WTR5JgBjVNZpGW/2F4=;
 b=ZMoqmDkvbFR4cWDzvBmAcR4+w+IGh+t/t5CM+mi/2xteF3LNP5Bkc97B2258B+QhQK
 XS4LkTxNLL4hMTsc0uyilH5umlhhXf4S41EFZgezsfinYgq9zIywsQadtFJMZVgE1A/7
 YbfCqEHSyCjNfL9by0ZGBjrhYHK+SlBVATh4AdXbssH7aohq+S/rXgGZlT9u2v8UNRY8
 WI9aLYxchEhSjMaPne/Wz5SdelwHoa3aheeFqOLXIrQmKFRLgcPLHIKkeRB4un9maLKw
 SopnYiImb7xJD30HLTvZfxLeI8XqNi3Lfmb/Adfy3pkaypCPlFMqdYq4apEeFpzN5aWn
 Zd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=siKr041CFTUpC2Qw4djtY15I/WTR5JgBjVNZpGW/2F4=;
 b=LxeflXw1hCxBPm2vT/ojLJrWubaFTGNjiritx7f/L+r1G1+wMdUkmQ21x6fnKS6KsG
 umDV2jmq8ig8aB3bQ88e+ym8XniHPNstq7JrcesO4cDr//BRzbJtyCiQwll2nNJCe06I
 CPk0EEM+MIMUpukAyifFbFBpTMV/1qNk4THw3gD/4HbFG6Cr+Wltturinm59CBtPcO/l
 FgifQieZToLjhbNM04soEWLKn4qy1cKcKipgNsnkKQqzARmBU3Y4xWpbRWiRv6ARL87F
 X1dgJjr7cVgVHp/hzzHJkJH2V+yLqOprXL23zKjwDlBVpKBFRSvsXtcWOwzks9bLX8hb
 Sh3Q==
X-Gm-Message-State: AOAM5322IxCKGvEO/0TwSyYBf2kKaVsFMwkFAQoAco13wcJOGvbDoJPP
 tejf3Y751ahMgFV1evTBgm7swQ==
X-Google-Smtp-Source: ABdhPJzkOagDprVWsWKX+54wsn0UiaFNqm6uXHiE+RgghW1NFcjaYnga6XeWW7ygDX0hOwxw93n8Dg==
X-Received: by 2002:a17:902:ea84:b029:da:cb7:b839 with SMTP id
 x4-20020a170902ea84b02900da0cb7b839mr2897752plb.2.1606120573714; 
 Mon, 23 Nov 2020 00:36:13 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id dw5sm9055856pjb.24.2020.11.23.00.36.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Nov 2020 00:36:13 -0800 (PST)
Date: Mon, 23 Nov 2020 14:06:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201123083611.u32sexlnwgdibbum@vireshk-i7>
References: <9c4453f49394a7864ec9c84ccd561663f54bae51.1605862411.git.viresh.kumar@linaro.org>
 <20201120104105.GB4910@yuki.lan>
 <20201123055201.tvouwhjydn46jjps@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123055201.tvouwhjydn46jjps@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: Add tests for name_to_handle_at() and
 open_by_handle_at()
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

On 23-11-20, 11:22, Viresh Kumar wrote:
> On 20-11-20, 11:41, Cyril Hrubis wrote:
> > We does not seem to use it in any way, I guess that we should add
> > fallback definitions to a lapi header in the same way we do for example
> > in lapi/setns.h so that these tests would compile on older libcs.
> 
> These syscalls were added long back in 2.6.38 and so I stayed away
> from adding a header and userspace (where we care) must already have
> the definitions. Should I add that header ?

I have resent patches now, ignore this.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
