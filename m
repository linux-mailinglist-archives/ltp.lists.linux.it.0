Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B395CB91872
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 15:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1758549305; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=IKkuvsPdFibmHQGuu+U+ML+FfHbtbFW4D1EISriawJw=;
 b=aexEOJeOj0DtBDFM16ORlVelfRJpLQJee+ZSnB80lbN+BydtnWGX1gLF0k4pAHperFUgE
 rc4svw2OBnHcQVONc9gSMMKdlCsBURi72ugENLwRJlwXQ3KjKBu7jPP3W0i53TPwN/+GFZH
 G3fqzKLM8sQWzErGjLX9G/JKDIjosnw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C69A3CDE5E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Sep 2025 15:55:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE2743C0433
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 15:54:52 +0200 (CEST)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6816560048E
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 15:54:52 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-62105d21297so7518116a12.0
 for <ltp@lists.linux.it>; Mon, 22 Sep 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758549292; x=1759154092; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OmboAnlk9Vaz2+DbEtwZDXLHIWPpNCcSLECDP1lXwDk=;
 b=ICyHHkTvWwy9Cgcgs8W+qx4/ayc45VQGCaEbIUL/1eN2MIfqTgRYVvxwhxmm/Js4C/
 Pk4C8bhZi9eUMLEBIjesy3BZZKo8Lotf47GUG4lmId+lgiQGVDgGbUdnMOPsrEYojBRO
 LMDuqzD6L4yQJSHo5orzruZmvOl/R85SWqjJr2gs3SnaCX5c4FJZ/XwI2sBe4omhcSIl
 UKg+Yuix7MdqwPmwfr6nHFn7DqZJjLKhQei6rcH00H7/XNAQuZmxogNz0f08MRZxct9y
 c3UbDOiV0UQNtgfcKwDiUJTcMWpitlhi79QFIwUXGSLr8jtymExB5OYt7QIJ3ZtZ9Vbg
 ZbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758549292; x=1759154092;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OmboAnlk9Vaz2+DbEtwZDXLHIWPpNCcSLECDP1lXwDk=;
 b=a/q6u5grN1k6viwk9r53JMMSFBKP++tNv57uD0yO2aoWNz/aBEHV33atawSDkjvBti
 mglBTKwNNYzIbmVfuF8nXvU/cLDfX0/3e4UchnbayaJmAYojmnUmSFdEwgmTJA1f6opY
 SUtaL0yZd4F8oyiWj1dZHPZ7Uh87x+X3KLLucKjs1CfPgt9cXJhX2/37+QvXVQQ2VfNd
 bqKODOBvZjaFzZmsEbmFHZ3E2Nbk8xTcpLo82Vw1RAJuNHPY93I1Or7rB7o/OGKjkexg
 WFLWb3zaPAA7EkBTOgf5QE9dSVpckjwNPPBDL5N/SDTNYI29WOp6brbVq7oaJpas9idF
 LqdA==
X-Gm-Message-State: AOJu0YxGpO0RLAXJUZmVkxHvHPJK2l1YBCiV6Q0VpTF9fuQNX7Q/6Ney
 FpIp787jYGdRA5lruZ9lfqbj4EJYEnge6W6k3bjNKDi/asLORY0K4J6WOUbcFa2jPnU=
X-Gm-Gg: ASbGncvggNoLzgY+ocW3P3bqVNXqedJmHpXbZXN6WSRQwG9Rs+Aa8B5FGhypLwvR9Om
 HntILkFVvYi/O/BxnrIi9L1JG5s/E9JZWNlKxJd5YwtnBtfYyf4V17A+oITk7m5rQmfwxaXTCyI
 2zgbWcuIDLbVNU5VDw73d10sd7/EGIHFDl7pDCU8Jf1NM42pE623zxOUy3vfala8l9CIpnh9pNF
 sCbMFYlYAsC2I9/B2MIUb6Qlb2pQqIy1+2OpyuOT3A8M/BLg0lNFbHM1srUWP1YpLS9TwwoI9+A
 07kuaCb9nXNAuNwYojEejNVbN+uPfDT7Q1LMxKYa0kk+sx0CZTcXSRwD6EWDZOG5b3J53GWbT7q
 pXDR3/bDWaQyY0l4SzlIuIlN1+EGtZQ6Opg==
X-Google-Smtp-Source: AGHT+IH+6c3fUzIwigbAepAzUmPva8PAEiPpz3dtlrfZGZVRqPMUaC93RXw8Lqgey/8G2aqchPERgA==
X-Received: by 2002:a05:6402:35d2:b0:632:d131:7df9 with SMTP id
 4fb4d7f45d1cf-632d131808fmr3850851a12.21.1758549291622; 
 Mon, 22 Sep 2025 06:54:51 -0700 (PDT)
Received: from [10.232.133.64] ([88.128.90.76])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5f28511sm8789374a12.40.2025.09.22.06.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 06:54:51 -0700 (PDT)
Message-ID: <18af0288-53fc-438c-88d6-317bd3e32d7b@suse.com>
Date: Mon, 22 Sep 2025 15:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20250922-kirk_2-3-v1-1-af3fc729bbdf@suse.com>
 <20250922132828.GA38024@pevik>
Content-Language: en-US
In-Reply-To: <20250922132828.GA38024@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] kirk: upgrade to v2.3
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

Pushed thanks!

- Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
