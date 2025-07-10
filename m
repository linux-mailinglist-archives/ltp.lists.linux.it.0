Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B81AFFCC0
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 10:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1752137284; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=oim+42BXsdUGQJa03+cVmInMqiBWvok+tQA9qRdHaeE=;
 b=dA5P95wb0h6LEq/d99ldTiNLu/5bfZZDWje9R13XgxlWY/UJqqc6RF8h6Wa2efDyr41LX
 LyJdetJUD9rk39WC1i9AfpLuDAIuwhIGSq0MmI4/3i5ygjttZOkIBV+IefqQ8wHhkVmmlJZ
 puUGXWVt6tH2KHvL/e6uoQPksINcXbI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F69A3C9B29
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jul 2025 10:48:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E980E3C627B
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 10:48:02 +0200 (CEST)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 36A921000347
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 10:48:02 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so4962325e9.0
 for <ltp@lists.linux.it>; Thu, 10 Jul 2025 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1752137281; x=1752742081; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QbU+VV8lxZ6grXeBxG4vZ5JNU9S3qNktJkgDUuxobfY=;
 b=X7Ood4wStx/0UM8aR14IfxEvwErkcBsKNtJEpKKn/2h3n/1st6BYvUpNSAOee2JAb0
 WGxqulxMkq4IeA6Cer7DxKhj6jcENgA/BO6oZfxPQBtMJaFOHxrgId8Sn2Y20WUlYJYF
 Kxr5r+mOdIGpm4XtMfTxB7RGfJ/CS5O6/1x5usxmOOl3Yd4UGJJDa5+OCyJp7pC5DQgg
 P0HiKzk/QL37Z2nsS7kfhUy34xmXUg8u0QDAeBkUc2gn6HRMPcIX6ixYH3M4oKa3SGXJ
 eCMmkeGYYv4X8rxXxANovENIqTBvXs75uzF0mrxF1omm9fKKuF19O47d4OSje0w0bRhQ
 zDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752137281; x=1752742081;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QbU+VV8lxZ6grXeBxG4vZ5JNU9S3qNktJkgDUuxobfY=;
 b=a1S1mufI/IdVpVAqnYY4dZXZE1QtU8me/FSGF2jTaYDJi3ax54hxT3veOkUK1FRie+
 OyNlE6300JAcfHbsP/Wbf3xfzOV/ZTvDH/MvrQrvaNN5PpM1mIpUb+NY1gdkfAez2aoo
 EMO6OTHeOg7FYUNyX79k1cVGMUuu3cmWeqsj1nbq9V0v5SfMIDZnRSF6GkUS4+XWIxt9
 pgNOin81W4PntE9cOc/f2jTaYTvIBMQpLUGTN9OkpP4EmK9z69bvEgwXJg9Rau88SV4z
 KqO6w5325EiHjHnvjW4dG6ikOhY+5N6QrGEL12KOeg4rgJO1h0K99IeWyho1sBXOYB5e
 7D0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5shd32bfwHYFDRkBHj2qcTK038A/tQIUPiE3kHkk6tPS+PIMWsvga+dDgFtspngGhKNw=@lists.linux.it
X-Gm-Message-State: AOJu0YxXxKXs11CjF0+L408MuftinsYuiHZ0YUcy6iOzu9hVvzHKPaRz
 W7u4Av/Q6QdQFBzC79nsyzljmo15O6SjtUnocjMdilPRO53MaCGjT53oBmn39Hxbx9k=
X-Gm-Gg: ASbGnctOhnVO6jUOQr7tkrRabhHu3zTCREaxpkfvLAeSP5cj8vzAl4T0fP95l/jU1CQ
 J6VDhSdRCE8Vea6blLpeLExQ330waKvgyUyCHzokaNSqZgXEMnjcufBHmgviJlu8ZYUqj650Vg/
 vb5S3tWuK9nl772wM3/ZPwd/SFlakVx3J1I5+P18L4i4/2ddD7FrpBXHK62+cSidb/bjegmeoYB
 hhzRotdFX4ckMucO4VwEc691+5DIGwE19JMRqeMUElLGWlxMFCdvsR4IXPLmkH7P1p2F5hGlAtC
 FjNvF46O24bPuRvlQBSrWkKEqr2gVtz1OwMtmoT9vIju1+sK9Qb87+VV4OyGt67RZGt0/HCQVbZ
 EtNX/8eKV4YWOAbH7tUC+mBY2ckkJCpOLrZb3q29sROfe/AgP8XAKjAwTCLEUPecwLZsmo8R4S2
 47YEWpwC7SRG8Iecyn630nZxrKrw==
X-Google-Smtp-Source: AGHT+IFY4HN5hThRo6+jeqwJfbXVyPGzplXvqLOXnJdBZ8P1RUgQmsuB7NqSSthPXSzecKSkyO7fpA==
X-Received: by 2002:a5d:5f8d:0:b0:3a6:ec1b:5742 with SMTP id
 ffacd0b85a97d-3b5e44e6a71mr4592191f8f.22.1752137281398; 
 Thu, 10 Jul 2025 01:48:01 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f2e:9a00:8d36:debd:d407:5caf?
 (p200300ef2f2e9a008d36debdd4075caf.dip0.t-ipconnect.de.
 [2003:ef:2f2e:9a00:8d36:debd:d407:5caf])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4322e23sm15011875ad.104.2025.07.10.01.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:48:00 -0700 (PDT)
Message-ID: <581805f2-0633-4e94-9252-b1be2bd47112@suse.com>
Date: Thu, 10 Jul 2025 10:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Avinesh Kumar <akumar@suse.de>, ltp@lists.linux.it
References: <20250710082000.11641-1-akumar@suse.de>
 <12708664.O9o76ZdvQC@thinkpad>
Content-Language: en-US
In-Reply-To: <12708664.O9o76ZdvQC@thinkpad>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cgroup_regression_test: Use unique names for
 hierarchies in each test
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
Cc: mkoutny@suse.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/10/25 10:24 AM, Avinesh Kumar wrote:
> I forgot to mention that I also tried to use
> tst_umount() helper routine, but that did not help as umount does not
> really report any failures here.

The solution doesn't really convince me. If it's true that a util-linux 
upgrade to v2.41 is causing this issue, we should probably research why 
this is happening in there and (eventually) fix it. Or, if it's not a 
library bug, we should fix tst_umount() in order to recognize when a 
cgroups folder hasn't been fully unmounted.

@Cyril WDYT ?

- Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
