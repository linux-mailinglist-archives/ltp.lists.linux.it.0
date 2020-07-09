Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1E219BA6
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:06:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A1A3C2979
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:06:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B936A3C00E7
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 07:16:32 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B309F600486
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 07:15:25 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id q17so499801pfu.8
 for <ltp@lists.linux.it>; Wed, 08 Jul 2020 22:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=91cgWNdNTjuywuMBqdp6jcGvPo/gEqZWR0GA9Vdmqs4=;
 b=eAof9Wa/baDPpwGfDSvNMqcmulK5NTQAeiso5xODHHXSCnA7z0K8xb7mPwhjRxAT4g
 //EVlIUYHqZRywU/+4bUNf0Um8uANMgERfnimmksPGhYlwJGVdZAhjPbMIu5XQySJHBR
 rH1fNakfNGRf/FVCr4kpUBENfwoDxeNdlHlDqTRpFi4NJwj+2+SHgWwykkdZyX+7K5zC
 6xEQ/rVbbUNcx7C3pPclpH4+PjU/qSJkah6E4PInFLfuvnMud5WO7gYvwStZDHaAy8li
 ER+dx9FjTtt4fA1XzoIP4tuX9Z1QUieuuhg2NM+bXbeFtGhSlTmJYjbXgRAD6KFWKp8Y
 q2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=91cgWNdNTjuywuMBqdp6jcGvPo/gEqZWR0GA9Vdmqs4=;
 b=DViOgXtamGKoe+qQW00DHLaUvAxz6olbhVEkiAYZw1CP7L+yCk5VdggJe4LbhLosl8
 kHO6EnYR63997nvx82sXLUXq/xVrpDLIslsJj4T3EnbYK7KwXePdXpaTptmlriIeddWX
 OUHrVkA6IdKmPGsKXSALDeSbTM2BRUjK78pyscA9AZU7BPlyMkDETPo+RzqRO2P7Di8g
 9oJj/9rM6Sr0gV1IhwupAVk89dFA2oYVoagvrLCHEaSTd0HrawNkcvV/e2BsBJ+/hVyS
 WhJoFKRCmMc+HCPH3ISb9bxrr/ORXhnZo6AIubDk69yHVANtJrw++pPU2BzddV752/cE
 3sQw==
X-Gm-Message-State: AOAM533V8xDqg/EDLiNZAg2ezDdKHqEGDpgkJjhP8e5EJO/WTZcSlhVO
 uqDDTD9XJkqJS2H7pgJa5AI=
X-Google-Smtp-Source: ABdhPJxRAWzAVCj+ltV+EgEao0QfDkJRJJOJBELElndaan+ZHkjQ8rK4N5zzVlmHvJ9UnYHcWwS4TQ==
X-Received: by 2002:a63:a558:: with SMTP id r24mr54074568pgu.70.1594271790216; 
 Wed, 08 Jul 2020 22:16:30 -0700 (PDT)
Received: from ?IPv6:2001:470:67:5b9:5dec:e971:4cde:a128?
 ([2001:470:67:5b9:5dec:e971:4cde:a128])
 by smtp.gmail.com with ESMTPSA id h3sm1056943pjz.23.2020.07.08.22.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 22:16:28 -0700 (PDT)
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>,
 linux-arm-kernel@lists.infradead.org
References: <CA+G9fYs3EavpU89-rTQfqQ9GgxAMgMAk7jiiVrfP0yxj5s+Q6g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <559c5a04-a2ab-bfa2-c26e-4fbbf6d273ed@gmail.com>
Date: Wed, 8 Jul 2020 22:16:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYs3EavpU89-rTQfqQ9GgxAMgMAk7jiiVrfP0yxj5s+Q6g@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 09 Jul 2020 11:06:25 +0200
Subject: Re: [LTP] BUG: KASAN: global-out-of-bounds in
 is_affected_midr_range_list on arm64
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
Cc: Mark Rutland <mark.rutland@arm.com>, saiprakash.ranjan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com,
 Marc Zyngier <marc.zyngier@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, james.morse@arm.com,
 ascull@google.com, Basil Eljuse <Basil.Eljuse@arm.com>,
 catalin.marinas@arm.com, steven.price@arm.com, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



On 7/8/2020 9:36 PM, Naresh Kamboju wrote:
> While running LTP cpuhotplug test on mainline 5.8.0-rc4 the kernel BUG noticed
> on arm64 Juno-r2 KASAN config enabled kernel.
> 
> steps to reproduce:
> - boot KASAN enabled Juno-r2 device
> - cd /opt/ltp
> - ./runltp -f cpuhotplug
> 
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>   git commit: 63e1968a2c87e9461e9694a96991935116e0cec7
>   kernel-config:
> https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/kernel.config
>   vmlinux: https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/vmlinux.xz
>   system.map: https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/System.map
> 
> Test log:
> Name:   cpuhotplug02
> Date:   Thu Jul  9 00:09:24 UTC 2020
> Desc:   What happens to a process when its CPU is offlined?
> 

Just sent a tentative fix:

https://lore.kernel.org/linux-arm-kernel/20200709051345.14544-1-f.fainelli@gmail.com/
-- 
Florian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
