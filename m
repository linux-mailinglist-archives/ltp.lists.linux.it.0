Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4FEB9FC88
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Sep 2025 16:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1758808981; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=92L8n0wXES8G9s90p1AOEX8cFmmScUfQv4qCOdrcFZM=;
 b=URa1gBHawyHAU9ih1eWgyW7No41EJm98+5m+0ncOri3Nd99wNe83Cc7zBDveBzny2gEQc
 tlgvzNkzRwcHwkiSNutJrf/BLqa5iGqC9nHsWwDGyOv+AJOAGzsnqySX6pteVVXGEZ3QwT3
 PDy7J9xgn/jiuIZJXQEaKvWI5EogSjY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DFDF3CDE69
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Sep 2025 16:03:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1581E3CB2AF
 for <ltp@lists.linux.it>; Thu, 25 Sep 2025 16:02:47 +0200 (CEST)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DEFAE1400DA3
 for <ltp@lists.linux.it>; Thu, 25 Sep 2025 16:02:46 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b30f8d14b9cso159909366b.3
 for <ltp@lists.linux.it>; Thu, 25 Sep 2025 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758808966; x=1759413766; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Eq1yFAojs2H4LeGIQa5l7j+fmeYOdodvxjv3KZ67Lqg=;
 b=Vm5ZB3lS4hhnZ+dYEtYzzzeaEic8/5RZmkTzejFfLL5W+CWHJhxatus+lJF7pgCvq9
 OlRbmZJKFP4/Yj63mMzqcp/NprsDLQDR5Iy+oZ0rn5ejsJVBWSJ4J9KuMxftDZ1Pl+nq
 wevfyAvMtOiY1Z9bvxgGEcI16uIOl2AISNRr6HMsgYhnugrLFHUb1Bp5lmnpT6voeOrn
 z4S1ZRZFJ7SznFEB6JD7T+RSXBgUZcEEJpU4MVVP0gpv5DjbRzO6fhZcSUgfclCI2F9e
 YmUdIPBdx7nXVkja5Ls8Izq61eCMoIkc/tDmRW0SVSuoPm+Yj5mPTPh2WA/wICGoxRzw
 W4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758808966; x=1759413766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq1yFAojs2H4LeGIQa5l7j+fmeYOdodvxjv3KZ67Lqg=;
 b=qD7OL2dPQZ1xEw9vyOIriBSZRw1dMdJdurYVo/ixyUhEdbjckLyQl/05YydmZQi6JS
 EZcsmP/jLdkDIz+iRQcx9z1h5xr8vRO7uCPzWlmtIX2biNN0QgD8l3vRaUYFgBX1Er5T
 5xIEj+7J8HygNm2fNvmDdMPn80ICZk5ouaua04qT+kIv92I899CG9Ratozn1iP/776QD
 H4N2rvtmCG2bZmfbczSQZQHNhHtP5qIfLhpjWgly473Tayvqae7lsASLNQEocFg2UoVx
 r/fGwYy64xNn+gJ7vnZCKMNraW8BgTLWtKzabWduDqevolvttNPOU5QAuEokaGxYfvCC
 f39g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTFajMq0fe+GUyWWpfSphA727Xt8Sd9opXzhoW7G4/uM3gvMq5vKp5mspaY/8Y5ncmNa4=@lists.linux.it
X-Gm-Message-State: AOJu0Yxduk9zH++c2TpvpT/lRlBB2G35Kq++U44K/18rCJi+5179/sgA
 A99YagKLSVl/Xs8KQXdbsXzKd7kCc6LY8311sQ/f7LPYnIh2oBXkHnrd47pAkeJF51c=
X-Gm-Gg: ASbGncswmh+toV2f8yPERC2EJVoe9QsFr8AK5zpz0+/cw9wA9wGI25cTVH5+7/r7VaD
 +SUzeAGjEJPJ0k0yJKb0dBKjgItVYSkx2V/uYOGJo5Fherafurb7jcsVh9t/58Ctk3M+NgiLV/q
 dxPFmKJUcm4cNJW0MKfIKrJJshY5HXdzuyyvYqtfqoxP3GlwkuV/9te2ZobpElyzVx05HZrx+rt
 ZTnS1tqoLpmah8YKSvKpMoirca43svBp2hnxF+la0Wn874GLKc5wSmLmlEfmHYatbD4+UHzJlSA
 Uxq/Miy/o/IuFuZLCBvoStJn9lvqGFNS63eLkZ5wZefgHLnzfrEMZs4k7QCnocVyme6WVaAW3Ld
 CrzwnIPXX2VY9DGgZI0LuIaqywebHisrQ
X-Google-Smtp-Source: AGHT+IEO1am32/sR0Xk0Uf1WBG1V9LUNAQVmR/dYvdU8ttC9mFc6zC9DpaDmkkqX+dpWqnPrKcUEhw==
X-Received: by 2002:a17:907:6e92:b0:af9:6bfb:58b7 with SMTP id
 a640c23a62f3a-b34b80b52demr380214266b.5.1758808965824; 
 Thu, 25 Sep 2025 07:02:45 -0700 (PDT)
Received: from [10.232.133.64] ([88.128.90.0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7834sm170332566b.65.2025.09.25.07.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 07:02:45 -0700 (PDT)
Message-ID: <f7783e14-67d0-4158-9112-c4d803215323@suse.com>
Date: Thu, 25 Sep 2025 16:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>
References: <20250917-open_tree_attr-v3-0-d78d4150b662@suse.com>
 <d9c5cee7-4f95-4c3e-8915-eedeffe1b6e6@suse.com> <aNVLGcXFcOnKPX-b@rei>
Content-Language: en-US
In-Reply-To: <aNVLGcXFcOnKPX-b@rei>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 0/2] open_tree_attr syscall coverage
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 9/25/25 4:00 PM, Cyril Hrubis wrote:
> Hi!
>> Should I merge this one? I got Reviewed tag already.
> We are in a pre-release git freeze now, so only fixes should go in until
> the release.
>
Ok thanks, I will merge it once we have the release.

- Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
