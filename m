Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD3C9C3B12
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2024 10:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1731318069; h=message-id :
 date : mime-version : to : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-transfer-encoding : content-type : sender : from;
 bh=J6E3p+SPYflvaOnY+lYvvUULG8lpu14CzrCcX6D0ofo=;
 b=Cn7WYfWN+ZbLvFBbHTtZfVVCUgD7AcH5xC96VdzVRfvnuaAQrQp+xTC8m2zcDbJkRveSI
 NAk47UvFzXWMjZHKpgbuBP0zn4YTOjJYs8cbIl6pWbuNeDw3uSCJQ3j6FCnF9G5mCnLyo/Z
 kWPqcm5zVhXgsgD/qyTtCIAyRNAnJNU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFE363D530F
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2024 10:41:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 482383C5DE6
 for <ltp@lists.linux.it>; Mon, 11 Nov 2024 10:40:57 +0100 (CET)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 077F8145592A
 for <ltp@lists.linux.it>; Mon, 11 Nov 2024 10:40:55 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-539f84907caso4721714e87.3
 for <ltp@lists.linux.it>; Mon, 11 Nov 2024 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1731318054; x=1731922854; darn=lists.linux.it;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdSVPJ6zFHhhad6bCNUpb4jbg9Bzfz3iBnjlvoHTaK8=;
 b=MFZGdEc4Pk2jkp6R7Sx5BdMqE6bCAWDu/rU+/D77t/5DxwnWs8JPsWWWVHGPwFSboi
 xi5jbiR0d69xpDwhO8zTGpKM031R3P1p396mzq03VZ9Q86H4PBQpw98Pk1IGeVo2WAaw
 bltuZx4T30h9S8rtm26uq3w3eJa1WOM+Nrc2vsJSaOyp3cqaTQI2W1qc5JhIMHcvCD8M
 8ZY4YbDCAvR4esKI7tqq324DB3kreyS2hiCJK4IOvOrD4uIhVFyBrOSlSWtXU1boJb7n
 KoNov9febexyB1Jc+1DU6F2fLpA2FaBFSdIGS2p99OeH06f1QTMoyiS21TwI8VPtKlIj
 8hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731318054; x=1731922854;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bdSVPJ6zFHhhad6bCNUpb4jbg9Bzfz3iBnjlvoHTaK8=;
 b=jfYdpLQxGChjOiS1a8zuLmxzWxUXpbevD0Kqf7Fz/PrE3QQP1gQJ2SjuAnpZsP7spI
 w/XKzlNCWu8HA9WfQYbta+kCoFlVZ1ag217Mr489uegwvMr6YOBdeWFAi7EmesVYO7wB
 cWphLmsG5pxNF8qJZaJPuorJ3+avFdE724PjkpA9E1QgYdKBm1UOoApoCzQme8cWe3bK
 JrlgFKPiHfw2XxfE3QaiT+g/1vWJJmuZPY3o1UdNgwjdwAC1FYFlh7yPtLLiWTFjx6AV
 qVSHzVuxxHLVJCuRmGEGkIoTynmksTpkOeKL6HcCmV3CCEGha1IloJKVm8ezLa7WlOIr
 R2sw==
X-Gm-Message-State: AOJu0YwjcEhpeq2GjRHtQa97DlA4Gy0S6rSkW0gF56t/70gQMP6VoQrO
 hYPQE4MBZZK2BErd/O23XSLWQD3hybY+jCZkbyt6INhC089kgWFQ9VHe39T79QtI4YOe3o9IRiL
 NLjIz8Q==
X-Google-Smtp-Source: AGHT+IF5ps8FX6sPTCumFIDxXWj1Zqa9fwukViseGGrC2qee2flz/AhpMkqlagDgOzFnIDPUdOAgmw==
X-Received: by 2002:a05:6512:3a88:b0:539:edea:9ed9 with SMTP id
 2adb3069b0e04-53d862bbd5fmr4959229e87.1.1731318053890; 
 Mon, 11 Nov 2024 01:40:53 -0800 (PST)
Received: from [10.232.133.32] ([88.128.90.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0566544sm165487835e9.24.2024.11.11.01.40.53
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:40:53 -0800 (PST)
Message-ID: <4003e3dd-0769-4305-b7cc-3b5541179319@suse.com>
Date: Mon, 11 Nov 2024 10:40:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ltp@lists.linux.it
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] Open LTP meeting 13th of November 09:00 UTC
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

this is a friendly reminder for the LTP mailing list about the next LTP 
meeting.
As previously discussed.

Next meeting will be on the 13th of November 09:00 UTC.
Platform: https://meet.google.com/jon-gytf-uei

Thank you,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
