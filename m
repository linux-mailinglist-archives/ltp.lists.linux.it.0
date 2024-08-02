Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4F945C30
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 12:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1722595097; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=fMLj91ljXks/XkBjS93dhdaR7JxRsAham/gDrTF6oxg=;
 b=gXg1+1VOc1IpEcbC40VkEkIsMyOsQUl2HnT5UaFlaogzLFc2qJBURdDgbJJdKnhbmMk5D
 ++yu97H8zEanaLvUCyXKGozFOh0Ln+LR8QP8S7E+NoLE3iD8zP8AuobilVHKZAkBsCewx3+
 n65l7koR351qnIIiefoa3lkcIHlea7o=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4648C3D1F44
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 12:38:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 918CA3D1D11
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:38:14 +0200 (CEST)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0D081601295
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:38:14 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42812945633so54212885e9.0
 for <ltp@lists.linux.it>; Fri, 02 Aug 2024 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1722595093; x=1723199893; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Mz/5bRGyoAbNNbrGYqeDq/elvngt6Vh8tR07kgplSs=;
 b=e5UekyqHV7ZDA4lOREofX0HYGhUFzT4sLKm8EHtaRleWO6aYVkfXEbkcx4e6cvzrPm
 KZurnU+Ps+m/43LltMWU6SuEL9i988FvIg0HMYGMSDuG02WkriZIA2jWo9a8PDXwXKHL
 qrQBp4vec/KbUatZVRe57adzfgTXKVYfoA/rH/8mojm1H25K9F9w3i45QtnDlnwMkhzC
 HcDu1/K2gg+Y1UXl6amQOCo8gBhkD/yFOA8Vf/PFE/w38Bw4ALmfGdXePZhICT0L33KJ
 VStviAAd4iwJwKnSVaiMBhCNzHDildKZQgmRIdH1vFe6dBvcE9D8nruTKy+ByxB1bw1t
 vUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722595093; x=1723199893;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Mz/5bRGyoAbNNbrGYqeDq/elvngt6Vh8tR07kgplSs=;
 b=bnaVUbyr04LLkPG5G8fVuRzxSD3PVUQFcZlDQD+cfwv5S0j3SAF98MqX8QTFQ1lk1b
 oNw+UfIfo/0Mgac7GPrG3/e7MSwdk+uX+mKEXYQmHwWNuiMrGpxkcbAcp2tHeScWMzJa
 lPzveQ078jAEx1zGYkIA0Xc1u4loHgANnegwoxQPYe/+IvsED4IdOOFpSHJJjV9ERr4d
 8qZjLUlQgi9a+3NCuqnTIdXkXd3Uwzv4gUKVZlh/NoLsQ0wqcIvzPcCReESCgxWwvpik
 NQOUzmH7+a1haVS5+cSnBMWuep0AZZWZngzAKSZUr3BRUXwqM9EwZVbYcSGI8DQRAwuY
 ujqg==
X-Gm-Message-State: AOJu0YxSs7gEJC9Duq474CgB58+kgewCNxbuEUkstM9gcucItIR7vBJz
 BZaWFu12V2QX1UPQz+Fw4JKEeLVyBmus8+5KBr9I9a0/4UbJprYPR8ZszS9wehh0kcoI8amLZyz
 PtaM=
X-Google-Smtp-Source: AGHT+IGrUvEJLW27sA6DFC7PpE3byLt4WvTXZiHP3MlDH0roZlWLXo8fbTLQqGi0FKzfeCcRK7yHZA==
X-Received: by 2002:a05:600c:a43:b0:428:16a0:1c3f with SMTP id
 5b1f17b1804b1-428e6b83288mr21983335e9.32.1722595092776; 
 Fri, 02 Aug 2024 03:38:12 -0700 (PDT)
Received: from [192.168.1.59] ([151.51.15.217])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428ead4118fsm15126575e9.32.2024.08.02.03.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 03:38:12 -0700 (PDT)
Message-ID: <25cf4465-ce2b-4783-86be-b012e4d155d4@suse.com>
Date: Fri, 2 Aug 2024 12:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240802-fchmodat2-v5-0-bff2ec1a4f06@suse.com>
 <20240802-fchmodat2-v5-3-bff2ec1a4f06@suse.com>
 <20240802095503.GC1613449@pevik>
Content-Language: en-US
In-Reply-To: <20240802095503.GC1613449@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 3/5] Add fchmodat2 fallback definition
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

Hi,

On 8/2/24 11:55, Petr Vorel wrote:
> Hi Andrea,
>
>
>>   include/lapi/stat.h | 16 ++++++++++++++++
> What is the reason this to be added to include/lapi/stat.h?
>
> It's not a general function? (otherwise tst_safe_macros.c would be more
> appropriate).
>
> And because one day it will be defined in <sys/stat.h>?
>
> Probably ok due both reasons, but I'm just curious, also because static inline
> brought various problems in the past.
>
I was asked by Cyril to use proper headers instead of safe macros 
headers, which contain anything.
>>   1 file changed, 16 insertions(+)
>> diff --git a/include/lapi/stat.h b/include/lapi/stat.h
>> index 3606c9eb0..8e38ecfef 100644
>> --- a/include/lapi/stat.h
>> +++ b/include/lapi/stat.h
>> @@ -229,4 +229,20 @@ static inline int statx(int dirfd, const char *pathname, unsigned int flags,
>>   # define STATX_ATTR_VERITY	0x00100000
>>   #endif
>> +#define SAFE_FCHMODAT2(dfd, filename, mode, flags) \
>> +	safe_fchmodat2(__FILE__, __LINE__, (dfd), (filename), (mode), (flags))
>> +
>> +static inline int safe_fchmodat2(const char *file, const int lineno,
>> +		int dfd, const char *filename, mode_t mode, int flags)
>> +{
>> +	int ret;
>> +
>> +	ret = tst_syscall(__NR_fchmodat2, dfd, filename, mode, flags);
>> +	if (ret == -1)
>> +		tst_brk_(file, lineno, TBROK | TERRNO, "%s(%d,%s,%d,%d) error",
>> +			__func__, dfd, filename, mode, flags);
>> +
>> +	return ret;
> The code itself is obviously correct.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Kind regards,
> Petr
>
>> +}
>> +
>>   #endif /* LAPI_STAT_H__ */

Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
