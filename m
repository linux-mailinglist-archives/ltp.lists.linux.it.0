Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E77A02604
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2025 13:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736167934; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=JIDLiqonYXqZoCmq45Tm67l1IlM9/xz6kmneh2WZSAo=;
 b=JWtsaT1X2i4IPXap7xCRn7+h7ngDKoel3apuvCbwQLFvqXic2cH4aZLG3jaTY4ha1x8E6
 gN+bpSrG5coHAuNtQeplBqucF3tqE7RErdE9It+q/gxU11ovWltDF1zND5b2emBDzxtwjA2
 pYOdF45X914kWWkSZ3Xo/YY8veXeOvM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADC473C4BC8
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2025 13:52:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 41F553C4B57
 for <ltp@lists.linux.it>; Mon,  6 Jan 2025 13:52:11 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DE009141DE53
 for <ltp@lists.linux.it>; Mon,  6 Jan 2025 13:52:09 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so163345485e9.1
 for <ltp@lists.linux.it>; Mon, 06 Jan 2025 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736167929; x=1736772729; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SB+zfxkfrJI4kFMjqcgOW6hfiFNG4hX1J6za04NsbhU=;
 b=UC0wtzxGY1vrBUWeSgNmuAXElSjBPyH+2EIFIBqoKB12TnYOpRWeYtKiQfXv1hnG2m
 4oIBK75tvo9Si+KStCpAzlDP0PmZRQzTcBiWH+MFs8f+q+Ln9Zskfw3IPDRE4cm4J+Ya
 thZG16sOxsWJTEvDA+t/Q24qbTbDqgVOS2c7ka1AeXp4eUh+FeYKDS8hWd+tUAG4ZB3w
 zK6A7Et8mflZnCQeCZ+BY1PQh1gAquPWrsTr3XQFScnDNYWJLvHb4zq+CKFJUSHLq5/d
 UX06ZNLEGsEALZ6FQoLoWlg/YcU4w/AnEep8N0NwTCEYoR5UG72hLa9fPX47W3Zov/Mk
 Xrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736167929; x=1736772729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SB+zfxkfrJI4kFMjqcgOW6hfiFNG4hX1J6za04NsbhU=;
 b=Qv8O/4BPti2fCiXLXXxKXG/knV/7DZ2herf/ewETtODz0hQ40s6jXXsMN4I0r9MXuZ
 +c/JbRPPB3ALH3hxPTLOXaEXyra7u6StTiwMAdjGZkWMVb0tnOt8iLR58QFRC8ghdTpK
 6ICNjqlfyzQ3GIXlqVqWGf8d02WXHK/L3EMUspNxfueQQ3e1uKFkGUOpTS+Ta/r7rlmM
 kids+1CDkqPqGEGzUYqwk6R99E5jd5+QUiHGIoBDu/igfIy3uZJ80FQ70+PI48bW+doD
 enGxiTsTU3j/ONdrJ6MGxf9FWkOcmh7FyhErFwaMx/RuVyE73DrAncZ+z3eaWG4Od0GB
 6YyA==
X-Gm-Message-State: AOJu0Yz6Npp9mhYhTE6S17wK9cDm9boZZhpj79CywPXm5FJ59H6mwCrn
 YiTND4f6+q8q8rshekxLXL718C1Dn+SlFkfE7zT0XAdMOi52tn554iK58Ti6s5ieIHT08TLKrU9
 ss2M=
X-Gm-Gg: ASbGncsASP0hxcOTZgAlzDkZH/Ae59hme9mAoKYcpM2LEAKJUtzv92Ehs55aGAY91Yu
 cviPmCzxD1pJw1J5WCXPqqW+gb7Oj37rYuvEHPYMVnf6IVCo2Glf4D5mTRO+wFAZA1/WyX2Mn3F
 TODAw/w3QaVlW5UpnT66VDBmqIoZfj2VfdbG4CMaZN3Meqqj7/r5GkuhtMfVSzmK7KonPlZZ/jt
 GCuoVJP2QVuyUbL1KybwIuKFUeNZw5sqA6ZhfWb3GkKz5iUEcDPeIMUGxlsbJOz0ks=
X-Google-Smtp-Source: AGHT+IGpWs77euRn4cqo8FH235ifq73G3LwLxgRYfHpXZCxf8IX/s1nj0QnubJ5VXop868OnBkwyMQ==
X-Received: by 2002:a05:6000:4a03:b0:385:f638:c68a with SMTP id
 ffacd0b85a97d-38a221f9f58mr44970300f8f.30.1736167928864; 
 Mon, 06 Jan 2025 04:52:08 -0800 (PST)
Received: from [10.232.133.32] ([88.128.90.44])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c833149sm47351716f8f.39.2025.01.06.04.52.08
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 04:52:08 -0800 (PST)
Message-ID: <29ede694-fb9a-48f6-9ea5-32c1460548e0@suse.com>
Date: Mon, 6 Jan 2025 13:52:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <Z3vJ6zXDVPACBIGd@yuki.lan>
Content-Language: en-US
In-Reply-To: <Z3vJ6zXDVPACBIGd@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP Release preparations
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

Hi Cyril,

I would like to push the following testsuites at least:

- https://patchwork.ozlabs.org/project/ltp/list/?series=432378&state=*
- https://patchwork.ozlabs.org/project/ltp/list/?series=438982

First one requires a new version and the second one is done.

Thanks!
Andrea

On 1/6/25 13:17, Cyril Hrubis wrote:
> Hi!
> We are supposed to produce another LTP release at the end of January.
> As usuall I will try to look at the patchwork and get as much as
> possible reviewed in the next two weeks. If there is something that you
> think should get reviewed ASAP please let me know.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
