Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 118839312AB
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2024 12:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1721041119; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=MCsGomk3JTGn43qGhYahOzVRHeJ8bWzQ3ZOCyGCm3DQ=;
 b=boJfoOQc7D5lejlWM0y+dXYmXKl/Tx77/agVaq3XMrg2SVDqBURuUQWx0tM+O8LNGXcc6
 LMu5XrCb9EP4sTzAvzs53ijirkEbChR0qt6LshYkViZVo+CpDT6g6RgFQ53NPUsJ89ZwGmt
 WBdQ9UXCt06kinr8etgXTzQ030vp4UM=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE8403D1A20
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2024 12:58:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 199073C0350
 for <ltp@lists.linux.it>; Mon, 15 Jul 2024 12:58:36 +0200 (CEST)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4F251A01166
 for <ltp@lists.linux.it>; Mon, 15 Jul 2024 12:58:35 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eecb63de15so45355481fa.0
 for <ltp@lists.linux.it>; Mon, 15 Jul 2024 03:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1721041115; x=1721645915; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AYuw8b5VqgbsyezUw+DlzgtOT8FnOqcFuyrXRq4Qeb8=;
 b=D/SWLD5EV/ilDROIfHozL9ab7CiPY/qsExJ9fPsqCLIYDp3gqhn2+Vfkd7R8wEkPH4
 zcJ0Eqd7sLnG0LCgR6JsLxvJkvKuzKkKb7CrsavOVffz8i8O4QColK4PDOW49JfzH44v
 kJPomwyr9+Dh+oOBLhr2nxCjdJiLTGDcjX/9JPV/Ik7Q0jAJIgfXOJdjS6e5riTIp1rP
 I1DbDjOlD8zOoJQsW3HzuvcgWa5P9qS4hwMzsHWTypORlen331J2uMYeQzSGYVIDTW+O
 0z6GnoJ7KSdMQbthvE54U/TYpjyGGmtJIqPmr/JuK28OSY110vCb0kUCR078zYYdxont
 G4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721041115; x=1721645915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AYuw8b5VqgbsyezUw+DlzgtOT8FnOqcFuyrXRq4Qeb8=;
 b=TnXLlQolpmXBQGpO1i3V+A8TXb9pL4V99upCYHI8cXmD1wKNoi+GobZ79Nisv7hq06
 Y8n7/i6h8DtR1QopkWhwZo/s9KpQa1H/fbf3IHSnXERtwO4Px+p0eIPXIqcDdCKMc4g5
 siyU53BKd9O9gNgyWsYAIw+uwc2C/jfpIT4p41GlYqO6Qrn6mp4UWLQj1CsDPCk+MakP
 4Uqw3tfzkjSnR1Tnl/kTw6Tehx8JB0oAMrYcM5EQZdqx2Hs9csAXrIOcx0b1G9Kqghe8
 jVsNdNYUNmUteTVdPrh1DR4OReEv0tFSqwHp8/4LGBeEjT87B6uoId7/TQul7H65zdpw
 4NPw==
X-Gm-Message-State: AOJu0YxE88ul+RqXFUibHDxYBOly3ZGVHTUBWt4tRpwvWmRZMv4l154n
 Gug9vSAwr+IwBrBDEORUMkKxbq+iTnDaSJxmjBw4ngK0vGR7qMZ+bCsAcb3dyn0=
X-Google-Smtp-Source: AGHT+IEJ9S82XertNd7u7vdhujNzNt2fDgpmM1ZKwEW2KtvF949v453q+QDQbAiFLdzW7q4GWCDHVw==
X-Received: by 2002:a2e:9bd5:0:b0:2ee:5ed4:792f with SMTP id
 38308e7fff4ca-2eeb30b8416mr121755701fa.2.1721041113618; 
 Mon, 15 Jul 2024 03:58:33 -0700 (PDT)
Received: from [192.168.178.49] ([178.20.93.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-78e32f3e451sm3135323a12.4.2024.07.15.03.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 03:58:33 -0700 (PDT)
Message-ID: <57ab5ebb-64d2-44b5-acad-b7ac01ba7b28@suse.com>
Date: Mon, 15 Jul 2024 12:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cyril Hrubis <chrubis@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.de>
References: <20240516104227.25381-1-andrea.cervesato@suse.de>
 <Zov59BQ_7j-1080J@yuki>
Content-Language: en-US
In-Reply-To: <Zov59BQ_7j-1080J@yuki>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 0/3] cachestat testing suite
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

Hi!

On 7/8/24 16:38, Cyril Hrubis wrote:
> Hi!
> This series is missing all kind of "interesting" tests namely:
>
> - tst_fd iterator test that passes all kinds of unexpected fds to the
>    cachestat syscall
I had a try, but it seems like the only 2 unsupported file types are 
TST_FD_OPEN_TREE and TST_FD_PATH.
I don't know if it makes much sense to add this test.
> - invalid parameters tests, invalid fd, invalid pointers
>    - what does happen if we supply len = 0
>    - what does happen if we pass off or len out of the file?
>
> All these corner cases are probably more interesting that the basic
> functional test.
>
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
