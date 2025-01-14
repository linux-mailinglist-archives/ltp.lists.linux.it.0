Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB958A109AC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736865971; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=WWtKDvxzrkwxQxXuqrgiz642zZlQEXaY57Vzja0+zkQ=;
 b=Zv7hDR1zsodZOik6DYgd9d3plakhWc15y1rWICkS08ADTc1cLmervQ8/KYO9hIaTz9skt
 WqC9EiTOGMJRItB36+DzO4NsJTG103Wj5uhfOptTsOM6FfTghcaXgRiAN5n+/bnHwjUoeaK
 OQH4Iza26luWvAAKJDSF7ArHJhTzujA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A67B33C7ADB
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2025 15:46:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27DDC3C0503
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:46:09 +0100 (CET)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 65FF3632810
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 15:46:08 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so1172678366b.3
 for <ltp@lists.linux.it>; Tue, 14 Jan 2025 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736865968; x=1737470768; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B30ohH/c9yaojp3tUKsLEJyi3Oj5wWX1CzCNUKAvszk=;
 b=MNQJnVverWDdVPjO+tv03z7lkOdZ7zvMylU3wUjqyESa/SgHfRxQUbtHrNKdGn3o1P
 QbTwRUILoU6Ogj0b5/CcGOsSJ/mvwCkY60PssIZw5Oa7GhCiC4FINVIbcgNFUUFrZ2SS
 RJXxmPB7Udxghv65y81OoxTs1r0MqjHClaypNHkmuRrRmBD7AtwKJcFn86YGRpf6rOGg
 fnms0wAyrBhS1BDWRmROyiuPn9Xq2qeUFWBkMq7bLoXEh+rDIh7+WugIA0/lJF/vOLmJ
 zTrwogkI6zH3Mt9tvH3dNbqmTS8eR0YTrsWJENnd0Jqhr5PnVbvdcP1IsgvjgUhlsxFb
 4Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736865968; x=1737470768;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B30ohH/c9yaojp3tUKsLEJyi3Oj5wWX1CzCNUKAvszk=;
 b=iRg2KQ3EJPQGhU3qkpe9dwXuI0+OB+uTv/+LuoGc68ePoDlDJrlWc/Q6BzBVW/ZalS
 ltMCjmCr25477BFB9BTlheqa1MaekeNGIqO/RJuFBeem7VhAY8qWH14chWanODUHo6Dv
 Sj+exYmVloJHwa7bvDL/uWF0TiidCpXGLZCVYmHrTLoZGfoVkuHUOtgKF3roEqtnDuVP
 jgn2mOfcL7vYXHiegzd6Tlukl7+hDs12aILn0O+ladQ8gSzVg1I4UnyrPRmjHoev0VbJ
 cewiKaaYd9tnr4aMAEaKhfudbMI2WQboI5K1dfT3/lM3c+p78zxxbBVInMEO41BnCiTo
 6UiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu9pqP6gy+ke+P8dHf90d6wHJKo2u5jRjhTS/Db4ToSLGfmb4iZUM+qOM5KBOSpHyJC38=@lists.linux.it
X-Gm-Message-State: AOJu0YxY33HYw92AuCz7ahxbU72MU81tGx1ajzf4pEhf9V5pnomUyaIq
 hUjLqBPTZegz5U91Q7hsIR4Gzb2H/JuS6rpAjnMtJUDAtc/WaY3eyYNptod5Vyc=
X-Gm-Gg: ASbGncsU0wluGFUjPWCgmu0k3u/SScNsHSBsbfisZuEqbtcTkk1q9OtpWtJpXW8bAxq
 qhZfEVBpnm+9D3M2RfAhG1YQ+Yj5EwoqsPMzVN9YKbOcAlypxfS6E2cng5FSoTS4AaMP3N3Twax
 AL7nfAc49S5sdcLVJBka8I31sSjff1TzM2kwjmKxCH37PswBOxuLzW9zDT1/JU+GVFxyGxV6ZFA
 lXhQdIRGbEr9Ox0O9oMei/lnQOHN53bRYnuEjpI/XKyNzYcVAIfiDoBDeNOn6cCheo=
X-Google-Smtp-Source: AGHT+IEv+CCPqcjDnne3FaRMyLgZS8WP1hgmnOsuzyEv6VDKmZkmbcg7RJ6Uv4BD6Zq6Pqbk7pN4Uw==
X-Received: by 2002:a17:907:704:b0:aa6:7933:8b31 with SMTP id
 a640c23a62f3a-ab2abca94e1mr2621069466b.46.1736865967723; 
 Tue, 14 Jan 2025 06:46:07 -0800 (PST)
Received: from [10.232.133.36] ([88.128.90.43])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95647efsm637568266b.117.2025.01.14.06.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:46:07 -0800 (PST)
Message-ID: <9cda6edd-6644-46f6-980e-b8939f6f2240@suse.com>
Date: Tue, 14 Jan 2025 15:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20250109132334.212281-1-pvorel@suse.cz>
Content-Language: en-US
In-Reply-To: <20250109132334.212281-1-pvorel@suse.cz>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] [RFC] macros: Remove TEST_VOID()
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

I'm kinda surprised something so ugly even existed :-) Thanks for 
cleaning up.
Feel free to merge the whole patch-set.

Reviewed-by: Andrea Cervesato <andrea.cervesato@suse.com>

Andrea

On 1/9/25 14:23, Petr Vorel wrote:
> TEST_VOID() macro was meant for syscalls whose return type is void, e.g.
> sync(). It was used only sync03.c, which was later merged to sync01.c
> and later removed. Now it's unused, therefore remove it.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   include/old/usctest.h     | 14 --------------
>   include/tst_test_macros.h |  7 -------
>   2 files changed, 21 deletions(-)
>
> diff --git a/include/old/usctest.h b/include/old/usctest.h
> index 2d46c40451..b984c343fd 100644
> --- a/include/old/usctest.h
> +++ b/include/old/usctest.h
> @@ -60,20 +60,6 @@ extern int TEST_ERRNO;
>   		TEST_ERRNO = errno; \
>   	} while (0)
>   
> -/***********************************************************************
> - * TEST_VOID: calls a system call
> - *
> - * parameters:
> - *	SCALL = system call and parameters to execute
> - *
> - * Note: This is IDENTICAL to the TEST() macro except that it is intended
> - * for use with syscalls returning no values (void syscall()).  The
> - * Typecasting nothing (void) into an unsigned integer causes compilation
> - * errors.
> - *
> - ***********************************************************************/
> -#define TEST_VOID(SCALL) do { errno = 0; SCALL; TEST_ERRNO = errno; } while (0)
> -
>   /***********************************************************************
>    * TEST_PAUSE: Pause for SIGUSR1 if the pause flag is set.
>    *	       Just continue when signal comes in.
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index b2ca32f771..b2b446b70c 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -16,13 +16,6 @@
>   		TST_ERR = errno; \
>   	} while (0)
>   
> -#define TEST_VOID(SCALL) \
> -	do { \
> -		errno = 0; \
> -		SCALL; \
> -		TST_ERR = errno; \
> -	} while (0)
> -
>   extern long TST_RET;
>   extern int TST_ERR;
>   extern int TST_PASS;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
