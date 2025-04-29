Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DAAA0612
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Apr 2025 10:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1745916433; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=sIaWgn/BDzmD2aiDn3SD8BNeb7ygwPzaU71BNsdt/s8=;
 b=CL1nOiAMTfy81dZ4FeknlDd6FUbCu1xxJRYZD0oztkofRGAdln9iVIJa55a0JQ7CkVsZU
 uTwxYQnY8eesE4re6cp+/HOMAPqAuF0NsBKk3fz5EkCya1BuuuudbCpAHMdnf72+vjes0H7
 dbaKBZDLqZoBSnc+cBtEHYgTymJUWGo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 968883CBC15
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Apr 2025 10:47:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 251193C0266
 for <ltp@lists.linux.it>; Tue, 29 Apr 2025 10:47:00 +0200 (CEST)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 417D92005F7
 for <ltp@lists.linux.it>; Tue, 29 Apr 2025 10:46:59 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so6612268f8f.3
 for <ltp@lists.linux.it>; Tue, 29 Apr 2025 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1745916418; x=1746521218; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIluu10TD5PITg0wwisqN3qRhwS5RVfSQqWfKiJmG/Y=;
 b=KUQgB1malJx03EfGNlGBhHMvYVSbYD3mi+4rItUBWyZiM9/80caefEdZWbUnlcbYH8
 otO8skewITsu9qld1MYVGrG1lqmS4jQB5fkCweSlAdttXCx2E0b6c51tpE+3c3jGQCsz
 YprzQZIrl0HMKOolrWETQD1BFHJcEe2QngnzPNphWw4wi9FIIbbtI2Y0PNCLZ/bbexEH
 ZXyBr9NZC+nMW7T+2kDqr+La6b7bUQrnab7QVnQMBg0CGwZWFEx4lZ5RZAH7Ri4Oz3SM
 Zk3l7vQxLrDZrOBRnkFBmvjPI71sVS0XVjIVrJjF/OcY2TbEzCtIFxiuVAQ5hhHRlSAs
 5J9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745916418; x=1746521218;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QIluu10TD5PITg0wwisqN3qRhwS5RVfSQqWfKiJmG/Y=;
 b=hTcp0KnEf/IlsoWnpmNcQMt+mAdAj1MxiZOBCAIcUQEvcB+AFCVEgpLj18I6z8Fk5v
 QzidkDdXT2jbLFKOn6ILedsF6J7IlXh3dG928wC42GwBZKO+Z8WskrjocyZLSAxFkusO
 +z9ZW8rZkGZI3EPfyvUECeJGd28ss5S4h5mOA1yAyIpGIIy9sAPQrdFWheV47wdoTg45
 RgHpWaGe0gqZ79xoBBoe2XkspL227KAfwQfct2vpebInwUPhWmaJSa6k2RaCprFnn+GL
 w+4XdbHP0UoyRxua70d/UrVMvV22mDi5fDvN5acrXdriajkIXLKcOd6aPAamd1i5krbS
 KDJQ==
X-Gm-Message-State: AOJu0YxIAFu6t4xS01uH1NDgihRipcQNpODQxlYHjDnfTfBBTLQFowbP
 byjMQJKQesfxLD785k7HoTntdesVyIPvwLcbIfCvF4o/OtusiAa2Md/MRsoegjI5vW+vXvCoLqi
 n
X-Gm-Gg: ASbGncss/2L7ysVEB6n+TGWcl+omyqQBt76rYfhYo0ATwvTGdiwk2yGwkbCi67v3/oF
 PJC1M2lxyZRX0B/4b4HE1MtP2DK1U/KDytpH8zBp9qtCyvr3p20wOon2qT0gGpawELEbDQ41v92
 gy6hBN70U8cbBOlCL5mr0nJ4KG5BASuIMxmdUe2fRkxtzSCRVrzD6VUdJWzsTKoNN3MzQK6hae3
 4h7keafE7jMtTM56w2xNQUcmWkgMW9nVW4gylfHOpDCl+VpmiG4zjzs3lmmrLi5TxxQtZkUocgs
 pFfM1tmMJgsgWwRtc6RGV7q3k6mA+iDuWdTbI9JzKrzsey3HQ74gqK+H8a4bydS91m24k96dx7x
 W1YTwBbALFUaKccp2ligA098nR76qxzBeSiI2r/P1QEpFBZiTYmERtEE1mnNRuXekgYSWKS8KHQ
 EwueE=
X-Google-Smtp-Source: AGHT+IEI7lOgiUm9HIAf7mZwjWqeFhW/caUvsQdFu8ltTQ6nxgyuqQn76zTIVRfVfL5gK67GBEHAUw==
X-Received: by 2002:adf:ed08:0:b0:39f:91:43fd with SMTP id
 ffacd0b85a97d-3a0890acefbmr2044626f8f.22.1745916418478; 
 Tue, 29 Apr 2025 01:46:58 -0700 (PDT)
Received: from ?IPV6:2003:ef:2f1a:ea00:b220:7501:321e:5c31?
 (p200300ef2f1aea00b2207501321e5c31.dip0.t-ipconnect.de.
 [2003:ef:2f1a:ea00:b220:7501:321e:5c31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e460b2sm13475945f8f.70.2025.04.29.01.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 01:46:58 -0700 (PDT)
Message-ID: <4abcec92-43c9-43ea-8e99-9339f26777c7@suse.com>
Date: Tue, 29 Apr 2025 10:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <20250408161745.9757-1-chrubis@suse.cz>
 <20250429084311.GA238584@pevik>
Content-Language: en-US
In-Reply-To: <20250429084311.GA238584@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib/tlibio: Get rid of support for old UNIXes
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

Hi Petr!

On 4/29/25 10:43, Petr Vorel wrote:
> Code is really old and would deserve refactoring.
I started to refactor growfiles.c as I mentioned in the previous 
comment, but it's quite a thing.
Hopefully we will do it one day, since it's an important test for the 
whole LTP suite.

I'm going to merge this patch. Thanks for the review.

Kind regards,
Andrea Cervesato


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
