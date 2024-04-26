Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B088B3371
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 10:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1714121843; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=WpB3I5BANFH+JIMlG6eyVAHvu1DElBZds7jU5ij4YHE=;
 b=i+eK4QNGJGR0wSPYWdOqEgtg2VggMyu8TKXBq6B62cHS9qJmQigNVJLKz0npiTSsNSZwv
 wVc68pjvWOEZtk3Dr/cjslEQC16BsR+dRPKI3MDMi2saRRjyKHvktes125xQtgb8O1ziuu+
 qPoJLATjbVbexyA8vnKsjLEwtCUvIuQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BA6C3CE955
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 10:57:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D441C3CE955
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 10:57:11 +0200 (CEST)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 595BF201108
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 10:57:10 +0200 (CEST)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-51abd9fcbf6so3220516e87.1
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1714121829; x=1714726629; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WvkOcgUx2PyoCwgEFOO10L02oUVaUELIVnmlf+87AUg=;
 b=glj/asV06WjyCe6qdPwuqSTkd8/MSLfzBe+MzRfoOMsSe2q3Mqx/VolJXC5IjkweIy
 jueBfc71JZoqGUDae6v/3oW5I+C31mrl7OLB9Qo/dx5UDuPgLvi7rvFNy99RWzWc5Sdp
 1sWKMHmCoo53sF1wWPpQeDx8FMXq3De74XKLR0T9OR49BaqPP+nBNSZ+Hhkz8ySPwDJt
 If9O4UkLxkQ4fShvPr5VQAOcMyqDTpPIBl82A9nu/IvkAal1B3JUisDWBWKb/2EoMtYt
 TobocSaKZ4CE2wWWJbLUFX7/xZ54MV02qnBdN94dBVXeqWfaK2/0xl7Aa3k2gJKGASzk
 02RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714121829; x=1714726629;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WvkOcgUx2PyoCwgEFOO10L02oUVaUELIVnmlf+87AUg=;
 b=kxFSrSyRJfudTHVgP2+E3Se4nFSIFYpvEEOZNbz6URdjk3Uq9NR++qi8Yg4S/E7JWU
 f5BWiP8fRmn3E/mdxxv4YVn7lc5Irj2QMyM0ZPFpRB78OWtMYTVk4zztVRvWuY5saXj5
 sB+7qVPUnl52vWr0yh5qsCsWGbDNNDZOBz1t6PTaarL3jyKs5ZirceAv9X6844haI/Hb
 +eKcWlhW1rqfwup19Tz8tz4+dgB7nXjrDZ6yFDIOWs3rCxISRyu8/G1T3LLYtzO3mc0J
 f4SOVzIqHpGM4T9h91R5pY+5ePDPmtEV4Dc83XN9AMQXhYoq4HWYUQoeMw2M0rG6Q49j
 qgnQ==
X-Gm-Message-State: AOJu0Yxan3kik3zDahEc3ETBHp7tlztH2sWNM0ykwIE1RJ2CIQy9kVS1
 TpSwQL2zTP5x+7057hkfslMCqi5NhV3UJ3SuxV1cz7t6e1NZoTl2LES3fGGaT7I+HyXh2xmzetB
 HxphokQ==
X-Google-Smtp-Source: AGHT+IFjmYvUbB1kqnEW2Iyx9SZX7Gf9jd10V4fvQvGrlHyE+CoWKBZ+GA9LYUJ2LxqOEJSA5YtCzw==
X-Received: by 2002:a19:ae17:0:b0:518:9ce1:a5bb with SMTP id
 f23-20020a19ae17000000b005189ce1a5bbmr1317748lfc.54.1714121829285; 
 Fri, 26 Apr 2024 01:57:09 -0700 (PDT)
Received: from [10.232.133.119] ([88.128.88.8])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170906ef0100b00a587cfd7a37sm4225178ejs.84.2024.04.26.01.57.08
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 01:57:09 -0700 (PDT)
Message-ID: <d1a45ca3-064a-4f08-b92b-c03ba18dfb5f@suse.com>
Date: Fri, 26 Apr 2024 10:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <Zitm2aUAcydofMlF@yuki>
Content-Language: en-US
In-Reply-To: <Zitm2aUAcydofMlF@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP Release planning
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

I actually have a lot of patches under review, but the most important 
ones are msgtress01 and fcnt14:

https://patchwork.ozlabs.org/project/ltp/patch/20240425121012.30094-1-andrea.cervesato@suse.de/
https://patchwork.ozlabs.org/project/ltp/patch/20240126101108.21994-1-andrea.cervesato@suse.de/

It would be nice to include them in the next release.

Thanks,
Andrea

On 4/26/24 10:33, Cyril Hrubis wrote:
> Hi!
> As usuall we are supposed to produce a release at the end of the next
> month, so let me start with the call for patches that should be
> included. I do plan to look at the patchwork next week and try to review
> and merge as much as possible, however if there is anything that I
> shouldn't really miss, please let me know.
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
