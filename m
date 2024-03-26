Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F3B88BBB8
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Mar 2024 08:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1711439620; h=message-id :
 date : mime-version : to : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-transfer-encoding : content-type : sender : from;
 bh=prZPmARWOLmANFDw9C/6vSdrgIHpOMoV9qaTRWIcET4=;
 b=qycGzqdAxnNQXG080ifAVRlLZD52zDVPTz4WVhOBga8m0rLR+8k7XkXiuxKA9By4ozSGe
 z69nAkaj1gdjFDidaPF3jf85X1O8ffPUkTfGMtv/72UI2RsipxSzrcjM98o1KKY0mUpAfvI
 0XxPSg51ugXukrQS4fJY8wRFcEl4qaU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEE233CE529
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Mar 2024 08:53:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1BEDB3CE520
 for <ltp@lists.linux.it>; Tue, 26 Mar 2024 08:53:31 +0100 (CET)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08FCD600713
 for <ltp@lists.linux.it>; Tue, 26 Mar 2024 08:53:31 +0100 (CET)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-513dc9d6938so6575008e87.2
 for <ltp@lists.linux.it>; Tue, 26 Mar 2024 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1711439609; x=1712044409; darn=lists.linux.it;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2W+UVh1dJYVjUnrqNwDhdeV7yFBnY8fMNpIcTKSyscs=;
 b=f1daOtmkCXJnUhu0NdOsdwaAGMsf27EzLi9YcrPf+tZX/K7qkKDnDyVsZr8fcJqI89
 3pL+bfbV7P8rmRm14qRglHWg4ogSEPaaXZtRjy3Mdqu3G2SymWETXk6JliV2q2vUinsz
 TfhzbyXFV4W21ZmuGyZwkiaJV157dm+rCL2QVAajWMAEKMkflNndKDkM0jZdXo/9RVa0
 h1Di9yeZ1TjwcDPg2bWvKCdOqEFwJ1OhudOX3vVdldbO33/1sQUWzliQrmtfR0i8ydG1
 e6f+VT1oxjPaLdgmIvCC0wJy2N8Tc7wifz7QZduQoBR4AGvTmwic3UvitMLeUxP0Jjiu
 4VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711439609; x=1712044409;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2W+UVh1dJYVjUnrqNwDhdeV7yFBnY8fMNpIcTKSyscs=;
 b=ALiKW+jYf9GM8VU/eR9jlmdma+5BqcvkAN4eIYmJBdczpnWP+5d1hOt7KBpbM0OmOm
 8ztnBLieU5u8/Qqci7nBtjSkTHymASice2IgV6wb0guKeuDXZxUoT1GwoJwDEmSM7BrZ
 pvvOgI/hQArI/V3vm9HKytoXdIAqfPMH1qWQ4SD2aGN1PmlG6cZp1u33UtP2T5EjVJKO
 O+sVvybCghAguIwQcysIoeDSl8QRnaRbaDCoNf6mNRz+Cmzq8CDxqDm29znsISlsZLAP
 3dKUDdmf6Y7emIPJuT+SUYa+A19rvng8Hqf6MZVPp1ElJDovR/ZcajB0sbjHTfMqmbUN
 qMeA==
X-Gm-Message-State: AOJu0YxP/Me/lDJtYKdqPlo5CXvORNpEm8rV7wUEMOxCfxrmGky2BAxF
 /nbmMCZSciKexkdQLwehcaPiY2S21AowgR1hJpokXNe9WjHhSBbH6EzS5IZOtbDmPp1ZvYiA8Az
 LbTFHxacjevk=
X-Google-Smtp-Source: AGHT+IG5t1tcuIQc3ktI7e2Y65sNhalaUP3gaqDEqJIWE6Bm8IOt4WX/XKwY8AZzgZqDJ0tIqksWAw==
X-Received: by 2002:a05:6512:3711:b0:513:c28e:8215 with SMTP id
 z17-20020a056512371100b00513c28e8215mr316428lfr.64.1711439609495; 
 Tue, 26 Mar 2024 00:53:29 -0700 (PDT)
Received: from [192.168.178.40] ([212.86.62.247])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a0564021c0500b0056c1bf78a3asm1221313edb.28.2024.03.26.00.53.29
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 00:53:29 -0700 (PDT)
Message-ID: <fd34e495-75cd-4db2-bbf6-975f3697cd51@suse.com>
Date: Tue, 26 Mar 2024 08:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] Open monthly meeting 4th of April 09:00 UTC
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

Hello everyone,

this is a friendly reminder for the LTP mailing list about monthly meeting.
As previously discussed.

Next meeting will be on the 4th of April 09:00 UTC.
Platform: https://meet.google.com/jon-gytf-uei

Thank you,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
