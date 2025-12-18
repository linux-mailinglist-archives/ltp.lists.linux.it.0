Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6ACCC251
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Dec 2025 14:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1766066329; h=mime-version :
 date : message-id : to : references : in-reply-to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=dYe902Du5FZ6IuncrDdBPq4F7Io/JE/x2ioL6T4uxt0=;
 b=fppOkxJfkIn7NlDADMzhyueqVIfmu8Lc3iflAW+k3eq3O+waO2LECSQJ40BwxxfteTQAA
 lG6xteuvy5wBty1wL5j0ANMIL966Eo55YSAZTjwaGKWDEOJWl9iR6Tqa1PTLbB+DsLtIXMs
 63inKKqGSUuMTG6iznxM+fNtDL8a8+M=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1413C3D0491
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Dec 2025 14:58:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DCEC43C9DEF
 for <ltp@lists.linux.it>; Thu, 18 Dec 2025 14:58:34 +0100 (CET)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 75E291400E7B
 for <ltp@lists.linux.it>; Thu, 18 Dec 2025 14:58:33 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so334795f8f.0
 for <ltp@lists.linux.it>; Thu, 18 Dec 2025 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766066313; x=1766671113; darn=lists.linux.it;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8NLU3joiknDe9rTvcja8SWS8aU8SOU0W6VtY2I4YQQ=;
 b=IrxvqSi3JQzD9AQCj7iFONKYYNA8qt9AF4M4BFEhGeEMgYgHHYSNg3xZlKx+B7cgKS
 UuPGMLYS5cMAomN85Ufd8DenlDwedL+kgM6zLEONGb6a7BNLf7Aa3K9QuCFb4aIu9Aff
 4azKNllEEnch3wMTAlWtvnJkA+Wixnw2f0eYNG0VkNCztbxv+K1UHmMRKm69I/Rr6Pwq
 UQQAiKwofWIjLFlVkulwQelDru3gH041bAH0/jt/RoayG0vJekfGIC5QEhROiOnOUIUL
 Woga4E/YYeWwWnOY4JnAiO5bhP2XBKY7vpBXmpSRfBumg46h77146ye3vgFRxNwRgd/7
 vqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766066313; x=1766671113;
 h=in-reply-to:references:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c8NLU3joiknDe9rTvcja8SWS8aU8SOU0W6VtY2I4YQQ=;
 b=BTaCzM/u2JhoX37tDJRsUC6uVWUgfDinmbfd4IKQnw8t2S01EiTawydKY7RJEqBWBP
 HIGAxfpNKAdCCHX4k0GKJV2MWVV4xRMnDSS6bwum1RE/H9A7OQOAKkcIIb+gkPPpRj6B
 xysAQLdj6tU0C4tUOsD4MG6DVUg+w56yTMpaFyQ35qU9hKoFBQdWQ2NdYm52gEksS+jt
 Ut5gHOVVdTdX4fm0v6U56nK0YsgsnXvLH7zj1bZJyuCVeRIQSOkk0y13jr8g1o1RABpQ
 V7zglWIl1xYnjGnmf0+u5SApCVHpeJRQpcmM2LW/Nzl34WAT0GbRo35nXjaMcO78hDKS
 d8dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI1rldEwZj5PqMhT+0rycTGQi8vYvrk1TVyFy6z/jcUUQI4yuOl9icvXdfgaKJcU+I7s8=@lists.linux.it
X-Gm-Message-State: AOJu0Yy0TbXCsAnS4KOP0TYC2qy6sCY9CdnnoPQsjPb7ktUP3WfQTzIc
 D0fFm7CxBw4CJJid9Kl6EDWHTh3Viq3Jk7z9fQWIKL67vZtP0nozJ/uIjDsVqMQWagwz/a8TWWQ
 pG9IbkhE=
X-Gm-Gg: AY/fxX5BrCtRVxnRt8WOx2F9NXapPYgPzhHCSnUo1oPgM/6I9RLFI6GzEEEl/4orF/g
 PRJzM9O/FbPUIMEyN4WavHYowjUDc9k8xCRhw2XaZ0FP6cqSlIUnVxaswU9DgQXjZy5+hg6d+I+
 Lr8cMfh9vqP1er1xOpL/Vx7E+FFb4zg7R2Vr16f9448lWEcXSFkdNVA1ur/x0qq6/2oGT4clzHj
 uR9I2u8iL7PpJnl3JZDMWNnJ1G2hC+w5rRM1NtNoJ9XiBDpWBjYfVd3Vo6hTMcf6SsDjLIDObJH
 MSeEhtyUikWB8Ev+Nn/sJiIO3JCA6V4UzUnOl0ZT6W3WrqjXfCSyvTiSW9UaLzQuyuW51bMgTGd
 V7SSoPaNDEnZvu3yWqIrWyei1AoWMQxNyMEUKOKEtXiZuBZAa8Xclqdo3rfnSpnQS3YVabxjfmq
 MCxbNenYi9i6j4qXc=
X-Google-Smtp-Source: AGHT+IErwSWCP6yfB/3kSsBYU5oJBRSF0Z/r5P9/e3JrD2Ilhh04+yE3uAh+RHnSAgwSjTHxRoaemw==
X-Received: by 2002:a5d:5f43:0:b0:431:2ff:12ab with SMTP id
 ffacd0b85a97d-43102ff1527mr12035828f8f.61.1766066312752; 
 Thu, 18 Dec 2025 05:58:32 -0800 (PST)
Received: from localhost ([153.19.102.214]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324493fe32sm5478770f8f.14.2025.12.18.05.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:58:32 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 18 Dec 2025 14:58:31 +0100
Message-Id: <DF1E9B4BBI1H.CD5EU74AK17I@suse.com>
To: "Andrea Cervesato" <andrea.cervesato@suse.de>, "Linux Test Project"
 <ltp@lists.linux.it>
X-Mailer: aerc 0.18.2
References: <20251211-modules_livepatch_gitignore-v1-1-610cdbaf3b4e@suse.com>
In-Reply-To: <20251211-modules_livepatch_gitignore-v1-1-610cdbaf3b4e@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] Git ignore modules.livepatch files after build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Merged!


-- 
Andrea Cervesato
SUSE QE Automation Engineer Linux
andrea.cervesato@suse.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
