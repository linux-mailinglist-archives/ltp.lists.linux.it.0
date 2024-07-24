Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E693AFF0
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2024 12:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1721817740; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=TZwh6JNxJvKpA5wqwPZAAKIo6lIYLGoV9UJanBICMXM=;
 b=ZtNX04yDv0fTZiapX/N9NpyHAkQiszhFHhGiC6lTY9lSPzmmahGE0fOedB2dhnBXsuRCC
 dbaIdQ8A7i03qg4lnxcrVn/2Mbcc3g0z1hoMEehDcCvXRNOUnRUBrP2/gYfWcSVeVCbLHPk
 kbTrkajM1NSUjH7uIBO+l1Dt8PsTnXA=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3C823D1C0E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2024 12:42:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 77D613D0895
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 12:42:18 +0200 (CEST)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9A10204B63
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 12:42:17 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a1c496335aso3058111a12.1
 for <ltp@lists.linux.it>; Wed, 24 Jul 2024 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1721817737; x=1722422537; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s0Oa7VwVmBWNxOeAxVDkA5PuF1LNl6R42FUqdtIobHg=;
 b=fXfFXHGHOvtTDYopJ9+Hq6uUXsHFndYbixPDc+jj5Cg92fBDvXdDoGHXOuvTheQKd4
 9ht3EMENxIxCLtiNkoV5hQyqDGJh2Z2sf8GAcADYr7JbVHjjAs+w96kNLIiedhakzmJ7
 uJ8QBy31eELe3x/PolLsvyH0XHOYjH9dUizcF4/Zmx6Ci1wGd/kVRZszsSV2g9/MdKCS
 ALjNVqEQ9rmeA8j6YQRWZRkhDLDtPAIsXALra8PeK9STKDJ9iknPD+Xi1Bg1gD7axCnr
 XZfXGldkRs1x+BvQeFyQfmw+HRNFEMe5rB99lJdZ5T7pAtYRzaUbkp/Wx1IgJDmIcVnN
 Bb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721817737; x=1722422537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s0Oa7VwVmBWNxOeAxVDkA5PuF1LNl6R42FUqdtIobHg=;
 b=uLWWrc6x25qtGOuQQtxH+yKJANKvVs4pI+kTTRYATROnhqcJ7rf0evvt+s/U1+636t
 bXQ5uN27w7x3BpKGy7Zg2afrsRzf4Ya2VezJshOmfI/Km+frnJICeqFBWiQ8XcNZ/zwC
 AePOBP3UHoRrVCKM1oOlEBfRSwyeh1bqFD8Ku87KAXjM6fncVdjq74C7xKQtheWNSzEG
 Kr5BxegPnHlPzme9rb7bJ11A+9cojdHYclRj9iXqpjvYBMyhglE7VDTUxra0BZH8zLDz
 W8DemOML+TgvOnkPBhihRiXax7jt7LGGHFJHiQ6bvcLZAH5HZF59ghSqokDd5TwdhF0p
 8oXA==
X-Gm-Message-State: AOJu0Ywptr5K4t5owJCwDzEhTDeLELMscY/R5B1MUEcDW0vJiTvSs+H5
 EwLSDnSEi4mlh5Zm7nyVcaaNAVYrNmlLU/yI2ub7j6b1J63H40cXq3FmhCPmCa4=
X-Google-Smtp-Source: AGHT+IE/POZ994qjqndBdmRliGKZx/WnwWr17tdMHIoTcWLAr+NlQt74pjBAQmFfjNB0K1OwnoYGbQ==
X-Received: by 2002:a50:c314:0:b0:5a2:c1b1:4d3 with SMTP id
 4fb4d7f45d1cf-5aaa50c9c7emr2090242a12.28.1721817721315; 
 Wed, 24 Jul 2024 03:42:01 -0700 (PDT)
Received: from [172.20.10.3] ([37.162.198.48])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d7105sm8763802a12.19.2024.07.24.03.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 03:42:01 -0700 (PDT)
Message-ID: <8cf9898c-c656-4cff-b3a6-7c8492a8f277@suse.com>
Date: Wed, 24 Jul 2024 12:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240711-landlock-v3-0-c7b0e9edf9b0@suse.com>
 <20240711-landlock-v3-9-c7b0e9edf9b0@suse.com>
 <20240716172725.GC549165@pevik>
Content-Language: en-US
In-Reply-To: <20240716172725.GC549165@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3 09/11] Add landlock04 test
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

Hi Petr,

I honestly have no idea why it fails on that machine. All the landlock 
features we are using are there since version 1 and this test should 
work from kernel 5.13, so EINVAL is not justified to that. The 
exable_exec_libs is correctly guessing the path of the libc and that is 
also correct.

Andrea

On 7/16/24 19:27, Petr Vorel wrote:
> Hi Andrea,
>
> ...
>> +static void enable_exec_libs(const int ruleset_fd)
>> +{
>> +	FILE *fp;
>> +	char line[1024];
>> +	char path[PATH_MAX];
>> +	char dependency[8][PATH_MAX];
>> +	int count = 0;
>> +	int duplicate = 0;
>> +
>> +	fp = SAFE_FOPEN("/proc/self/maps", "r");
>> +
>> +	while (fgets(line, sizeof(line), fp)) {
>> +		if (strstr(line, ".so") == NULL)
>> +			continue;
>> +
>> +		SAFE_SSCANF(line, "%*x-%*x %*s %*x %*s %*d %s", path);
>> +
>> +		for (int i = 0; i < count; i++) {
>> +			if (strcmp(path, dependency[i]) == 0) {
>> +				duplicate = 1;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (duplicate) {
>> +			duplicate = 0;
>> +			continue;
>> +		}
>> +
>> +		strncpy(dependency[count], path, PATH_MAX);
>> +		count++;
>> +
>> +		tst_res(TINFO, "Enable read/exec permissions for %s", path);
>> +
>> +		path_beneath_attr->allowed_access =
>> +			LANDLOCK_ACCESS_FS_READ_FILE |
>> +			LANDLOCK_ACCESS_FS_EXECUTE;
>> +		path_beneath_attr->parent_fd = SAFE_OPEN(path, O_PATH | O_CLOEXEC);
>> +
>> +		SAFE_LANDLOCK_ADD_RULE(
>> +			ruleset_fd,
>> +			LANDLOCK_RULE_PATH_BENEATH,
>> +			path_beneath_attr,
>> +			0);
> Unfortunately, on 6.6.15-amd64 kernel (random Debian machine) it fails (after
> fresh boot) with:
>
> ...
> tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
> tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
> tst_test.c:1746: TINFO: === Testing on ext2 ===
> tst_test.c:1111: TINFO: Formatting /dev/loop1 with ext2 opts='' extra opts=''
> mke2fs 1.47.0 (5-Feb-2023)
> tst_test.c:1123: TINFO: Mounting /dev/loop1 to /tmp/LTP_lant6WbKJ/sandbox fstyp=ext2 flags=0
> landlock_common.h:30: TINFO: Landlock ABI v3
> landlock04.c:151: TINFO: Testing LANDLOCK_ACCESS_FS_EXECUTE
> landlock04.c:123: TINFO: Enable read/exec permissions for /usr/lib/i386-linux-gnu/libc.so.6
> landlock04.c:131: TBROK: landlock_add_rule(3, 1, 0xf7f13ff4, 0): EINVAL (22)
> tst_test.c:1746: TINFO: === Testing on ext3 ===
>
> It works on 6.10.0-rc7-3.g92abc10-default (Tumbleweed), 6.9.8-amd64 (Debian).
>
> Any hint, what could be wrong?
>
> Kind regards,
> Petr
>
>> +
>> +		SAFE_CLOSE(path_beneath_attr->parent_fd);
>> +	}
>> +
>> +	SAFE_FCLOSE(fp);
>> +}



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
