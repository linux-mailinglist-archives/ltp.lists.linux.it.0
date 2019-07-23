Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 402BF71DC3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 19:32:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08A2B3C1D18
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 19:32:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 49C9C3C1C7C
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 19:32:50 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3963C1000C0E
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 19:32:44 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id u17so19760838pgi.6
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 10:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5+cax57ba/TuhJGYE/xp/GSuO5MTGHkH7FMNTK5N9/g=;
 b=e8P4WWqkSVB/5DzNgpMtQWQlp7n2KKu94e7dKdXp/kWvlXv2oPzS8smCKIr1V8HonP
 05DsbRkhBpVQFETML7u7PCYQ2luWWIVa73i8xLCKejpCgA5MinRahGoWbkmDCmEUqH5X
 F//K36ujARUfxC0/7SbZgkNay4/dY8Rn1vKo+4XNxQPgGOvkK3z9tgzPJ4gY6FB3Vlua
 C1g8BxoBgoXDijY+Ys+ZRkVXnep97YwjUbvwKA4Fx8IlcIUNNmuzw+E3Zi7Zw7vf6iov
 zKin36j2Y35EnU3qmK1IRen79BK4X8vc9Nug0XxAn7DYQIrm9BTLouBen2dEG8qD9QJf
 9fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5+cax57ba/TuhJGYE/xp/GSuO5MTGHkH7FMNTK5N9/g=;
 b=XsX6WaakF+w1Lo6Mn9Q945kLFLC7/sZTCit2ZjpUGEi2qoGKCmZSVWADwGBpzKYGL1
 HLKIsVCOvN3aMSd/7yyYI7A6Vr56784zGJVlirfUrA92JFx49Z/j4Mf622gZhyIDihCS
 uifi+6a9t5cK6RFDvp+LTShQDPF1epjXLtJteT58r1frvMaAXuOW62/NMNvDeIgUq5OL
 jy891mzKPME0EiYRegBgRUj9pDfXvFJ7RUdiodsJIFEr773aTrZdsdcLrAVYrZD0G25i
 KWIPon6fZo9mPzvPQnkIJ4dMuFx+dRkm32bdT/WKmYryA5LJrO3cClkMKdURNRFqIUVz
 e/rg==
X-Gm-Message-State: APjAAAVbd2kc+wZ24NcV5ROPoOjyXN2amieMW1zi7XnC0tBEhp2I9i0p
 w106c36xqgchwguikz/X+vYiew==
X-Google-Smtp-Source: APXvYqxPJyZVJprcYdLeeSelD5F20HrQa+XG9iZFr20qCSwNRxK/xsk+oKmgBR+tXNELnpxnC2hFNA==
X-Received: by 2002:a62:be04:: with SMTP id l4mr6659240pff.77.1563903167511;
 Tue, 23 Jul 2019 10:32:47 -0700 (PDT)
Received: from smuckle.san.corp.google.com
 ([2620:15c:2d:3:d440:a026:9220:62ba])
 by smtp.gmail.com with ESMTPSA id m20sm43677430pff.79.2019.07.23.10.32.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 10:32:46 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190722194439.161904-1-smuckle@google.com>
 <20190723110306.GB22630@rei.lan>
From: Steve Muckle <smuckle@google.com>
Message-ID: <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
Date: Tue, 23 Jul 2019 10:32:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190723110306.GB22630@rei.lan>
Content-Language: en-GB
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 7/23/19 4:03 AM, Cyril Hrubis wrote:
> Hi!
>> A filesystem may preallocate blocks (ext4 does this), so even though the
>> contents of the file may fit into a single block, statx may report more
>> than one block. Loosen the test to accommodate this.
>>
>> Signed-off-by: Steve Muckle <smuckle@google.com>
>> ---
>>   testcases/kernel/syscalls/statx/statx01.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
>> index 23ea99b4a..5e705dc7d 100644
>> --- a/testcases/kernel/syscalls/statx/statx01.c
>> +++ b/testcases/kernel/syscalls/statx/statx01.c
>> @@ -92,7 +92,7 @@ static void test_normal_file(void)
>>   			buff.stx_mode, MODE);
>>   
>>   
>> -	if (buff.stx_blocks <= buff.stx_blksize/512)
>> +	if (buff.stx_blocks <= 128)
> 
> Why 128?

Was just restoring it to what it was previously.

> Can't we rather multiply the buff.stx_blksize/512 by 16?

That would work for ext4, but should this be loosened further to give 
some headroom in case some FS preallocates more? Or is it preferable to 
keep the test as strict as possible and loosen it when/if failures happen?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
