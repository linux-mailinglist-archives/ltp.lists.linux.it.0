Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896EA06FF7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 09:29:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736411346; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=VDkmBxbQ10DW1qpcAKYTs1/d+atqPdX8IHRLFS3f5Iw=;
 b=OlMpoQdWv0rpSokP0KHuI0/E8AdTnhwuzcjFfH40heTsegsC3hwshHjLHVZMN8vH3EBdg
 FsEnRBq6E2lnsGNwyGVt73uFM7+s5fCyxQJ7KBH1qH1+gUG2kjLFlfbHe4FLd3C35iqgSLq
 L+XvTKt0m7u0G81S4X+lShx80/3QeCo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24D333C213E
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2025 09:29:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29C943C1D6B
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 09:28:54 +0100 (CET)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6D41022E80E
 for <ltp@lists.linux.it>; Thu,  9 Jan 2025 09:28:53 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so262583f8f.1
 for <ltp@lists.linux.it>; Thu, 09 Jan 2025 00:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736411333; x=1737016133; darn=lists.linux.it;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43s0Bhmw5k8GX+bl+DKKL/J16J6QItiXzgGf7xycJAE=;
 b=O4lBrgVr7LJXDKrShAGBS04MNN4A31nKKKimzkmk1vJwFJ/tsriefaO2Z2dGPg9oWp
 8IhCv/BX1KoIgtE1X+UUgeuu76GhrV54AkZLvr90sYHqshi+vZeTcOBXJesYs6L3tIdQ
 FAiqvVeF8bcbUGYeO5p7vqVKpOMV03RoMixLrncUtKm4kxJT7ISJ9Gnim/sMFA0latBo
 F+LQ6zr2Of/ihcPoNCFPT4wfEgA32zhuC76ZO7RmiFayFium4Fvb5n0Loaywj3BE4jXH
 TUv3puElw8Dw/kdhRmaUCRDvy48kL/SbnHprZ9ZkyorTEJsUYaBbOTR3Qc8augUx5Za8
 gzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736411333; x=1737016133;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=43s0Bhmw5k8GX+bl+DKKL/J16J6QItiXzgGf7xycJAE=;
 b=xK+G+FTE/vBVUk9MB8u9utC/4hNFo/ah//Vqu8i6hugSBHcDa5DU0yXlzBdGUJktlz
 m4mN3CZwskQWgsCr7ksOwXSzCmlohUTdT8QZqn/kUnltBAlVPYOGxmJ5RGgj0deBiUmf
 sRJaUAgYsMF4ZEOYOvLT8XwF5kT544rcxR3pDbSuNUO8y7Bd6W5PhvlZjROMT2Ke2jy1
 /z21X/wcrMpjCsa1OCNlOIWIErYEkgGjre6up+BJJYOLI5j7sFSPDzJ0Rl91MCwTA0Vm
 lq3KpaSyEhAi+BXj/yBPpSS0OfilgmsamlODGDxoE8tTvUbVrwTA/RVN0MPoCGjqMlq/
 7NVA==
X-Gm-Message-State: AOJu0Yz+jDGTt85aArD7xIfzvorql3+91iJmcR3bwPuYFD/3GpEByPUR
 jykziWeiK9+KqyZaXJtJrSrpuGYoJeFS+hXAwnGPLCOyL0whDG79NmlJVbULvl8=
X-Gm-Gg: ASbGncugKkSrTcFnv4BH5uhT8BlnB267v+9e76NrnlRheOA51ajgCqCDeeYOUn94bSS
 cZQdQLwRRBEGlqQ4xnaVKpllmd6QaH0iPJq8RHAVFaBbs6pZ5qCgyYj1elzlU02ic19j75BDoIx
 WtNEj1ysuNmIT2fUbrubn06B/Fw7wNm3nBRADBXBjoXlQq6pBOFtoU7mxdB+QhLx9uXPl9UbLfW
 8cGqAK5t4umcymXTjjh7XjHvdHigl6zft4rhl7Lla3A+fO7upwx7wrEq/gpnFAnXac=
X-Google-Smtp-Source: AGHT+IHhNw1C8v6ywehcgZpHlMEpx5GkqV6qoJ0xw2ESm8MVBRGt/yBV628QWs/4WL3OI+rjmLymtg==
X-Received: by 2002:a05:6000:401e:b0:38a:4184:151c with SMTP id
 ffacd0b85a97d-38a8730ad01mr4819579f8f.27.1736411332834; 
 Thu, 09 Jan 2025 00:28:52 -0800 (PST)
Received: from [10.232.133.32] ([88.128.90.77])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1ca9sm1131105f8f.92.2025.01.09.00.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 00:28:52 -0800 (PST)
Message-ID: <563e0875-dfba-4a1b-bf1d-53f9f3ccb15a@suse.com>
Date: Thu, 9 Jan 2025 09:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20250106-fix_setsid_tests-v2-0-c43f57a2bab6@suse.com>
 <20250106-fix_setsid_tests-v2-9-c43f57a2bab6@suse.com>
 <20250108123946.GA27248@pevik>
Content-Language: en-US
In-Reply-To: <20250108123946.GA27248@pevik>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v2 09/11] Refactor pty01 test
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

On 1/8/25 13:39, Petr Vorel wrote:
>> +	SAFE_STAT(slavename, &st);
>> +	TST_EXP_EQ_LI(st.st_uid, getuid());
>> +
>> +	/* grantpt() is a no-op in bionic. */
>>   #ifndef __BIONIC__
>> -	if (st.st_mode != (S_IFCHR | S_IRUSR | S_IWUSR | S_IWGRP)) {
>> -		tst_brkm(TBROK, NULL, "mode mismatch (mode=%o)", st.st_mode);
>> -	}
>> +	TST_EXP_EQ_LI(st.st_mode, 0620);
> Here it continues testing, does it makes sense? Previously it quit with
> tst_brkm().

I'm not even sure if the check makes sense...do you have any idea?

Andrea

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
