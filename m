Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600E3FF998
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 06:33:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8D343C27D2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 06:33:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D1C8A3C26CF
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 06:33:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 290731A00145
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 06:33:08 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 13DE19F66D;
 Fri,  3 Sep 2021 04:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630643588; bh=8HgIhO8r+u/zJo+7ERBgbve0aHq9N9dvXjIZBfrR4Qk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=SRtC/TBcjUoy8J7ThwjwcZjO5ZtRmB4AWx1YYvY5i1PyM+udnM156cQiirZ8LGaxO
 k6+iuhQuQMwDGWHukXx6w888dFobC/EVPfcR94FpMGqmB+cWEWznQs1czJm1UUshYa
 ww4fTUYeujhfNtIRwfaLtxr08z9gTpTvM8YzdFt8=
To: Arnd Bergmann <arnd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
References: <20210902093655.6104-1-lkml@jv-coder.de>
 <20210902094219.xy73hs5ccafkrysr@vireshk-i7>
 <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <84a0c4aa-4faf-4271-36c4-5570f8c3a004@jv-coder.de>
Date: Fri, 3 Sep 2021 06:33:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3jH=4gq7gg64E-L158d8QZCpPjEaKBZiEY+mE+jN61Fw@mail.gmail.com>
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] syscalls/aarch64: Remove 32 bit only syscalls
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Arnd,

On 9/2/2021 8:32 PM, Arnd Bergmann wrote:
>
>>> I am not 100% sure, how the syscall table for aarch64 is generated.
>>> There are also compat version for some of the 32 bit only 64 bit syscalls,
>>> but I think they are only available, when running an 32 bit arm application.
> The syscall table for aarch64 is generated from the kernel's
> include/uapi/asm-generic/unistd.h, which has a number of #ifdefs in
> it. A lot of these are disabled on aarch64 since they refer to older or
> 32-bit-only calls.
>
> https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html has a table
> with the correct set of syscalls for each architecture, and scripts to generate
> them from both the old asm-generic/unistd.h method (now only still used on
> modern architectures) and the newer syscall.tbl format (used on older
> architectures)
Thanks for this explanation, I already found this site, but wasn't sure 
if it is "correct".
>
> It would be good to finally convert asm-generic/unistd.h to the new format
> in order to automatically generate tables like the one used by ltp. In the
> meantime, please double-check all architectures against Marcin's tables.
> The same problem likely also exists elsewhere, e.g. for rv64.

@all
After Arnd's explanation, I guess this patch is correct and can be merged?
Other architectures and the remaining syscalls should be checked as well.
Maybe we can integrate Marcin's tool for extraction into ltp?
See: https://github.com/hrw/syscalls-table

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
