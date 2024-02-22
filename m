Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9B85F7A2
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 13:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1708603376; h=message-id :
 date : mime-version : to : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-transfer-encoding : content-type : sender : from;
 bh=HOCsNSzllMMtFgyHZzQF+fNJb3raG0NPKBR6MwyZ8zw=;
 b=WwqVCQfZA0+43jQLKfQDTA2He197e6K+4WoNCywziV8NjGqmbeeEZF1iM8SX9p3+f7Lw/
 mLZblP5KGIE8EYGCXUrfFWWasN9MDCtMID327v3e1ftw7Bqz21cfc2QdyEnSJPYHaBTmOuj
 M5+2N1B05cghwuBPtLchogIs7cponxU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78DDD3CF17E
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 13:02:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54D143C8697
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 13:02:54 +0100 (CET)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 69C64601B28
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 13:02:53 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-511976c126dso2552604e87.1
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1708603372; x=1709208172; darn=lists.linux.it;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8ozbGux0+SCuTBMdpabR3ckwEL9S0NuJyza07w3FyE=;
 b=Aspha93sc6idDGslmHKKbY7XEjYFlPXSwE8gfs5f7LuKtxwkm0Vqyn/V1VB5psLPHM
 wkfc0UHf76WS9ZwsbEgc88IZL7tmvmtBEHKqL9hN1aqmpJlm/0J8CAE2cjRbLn4rzgX5
 YRDv1StyxvuqBIX+CI1TDEhip+JKrt4KDD+xPGyW8MtL84WnEMyXE+R4JZd0+ejajoHR
 u+v/50yJIF9Vvk3lnW3UEFEF3HxZmqugM8QaBtOKtD3f6D/4wV83KXyx7vSa5IqsXoTu
 fyb0+qZ3pZKK8EHAKQTPARX5jlYyefWtF2ezVj/QKQ5nBrib60MFG2nGk4UXrBJmXUT8
 Ao9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708603372; x=1709208172;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s8ozbGux0+SCuTBMdpabR3ckwEL9S0NuJyza07w3FyE=;
 b=lUVh8crTx07bmeSp45yV3/628XJOmVAnVFs0pDr3+6XuvHfFw50sgYF0L8gd4w5ine
 TU96jHfC29y+pLNWRtxWts+gCC1pmQ1HlL+fOWt3VbgJ3Mjsm25JN0WCkKLr+VSApAou
 zILRFrUQj6qWOZOB4pyiBxGgYkoteDrzAWgsR6OY28RF/pY4xpaUzmkK+aitK7IrNOwv
 85hSYGGC4mikVmn+sWhN14/Jqw2M7cKJz+jHF9CaZ8vHAJgx3Q+mtcwDLgC9lGM3cKVm
 M9AgvILlAk6mLkwDEj+himuE14McHRhh7himV/OxOBTNOdIAo9TU/Z8etvY5kQTijzIe
 hpGg==
X-Gm-Message-State: AOJu0YzIRXviGxSucXzSToXxgTD33u7AWVL0VIlDXM88X+XghmAfP0rs
 KSip6MyL6B4fwUMdln+mwIth+IoSqkyfeFZsdLmXdVGXsJeRBU8pxytN3MYNd4mR9RH3ffwZwq/
 8YnU=
X-Google-Smtp-Source: AGHT+IGECSyS5yvBqG+peWtljUNKYkxLJsJXnV5pfULGaGjvq5NfjYlE6ZYLChygXJDO/X5s0rpoww==
X-Received: by 2002:a19:6510:0:b0:512:dc96:11f0 with SMTP id
 z16-20020a196510000000b00512dc9611f0mr1090869lfb.1.1708603371717; 
 Thu, 22 Feb 2024 04:02:51 -0800 (PST)
Received: from [192.168.178.40] ([79.140.125.203])
 by smtp.gmail.com with ESMTPSA id
 ts4-20020a170907c5c400b00a3e0119b4a3sm6018865ejc.140.2024.02.22.04.02.50
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 04:02:51 -0800 (PST)
Message-ID: <07b542ef-1c14-4011-915e-48f07c7776aa@suse.com>
Date: Thu, 22 Feb 2024 13:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] Open monthly meeting 6th of March 09:00 UTC
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

Time and date: First Wednesday each month at 09:00 UTC.

Next meeting will be on the 6th of March 09:00 UTC.
Platform: https://meet.google.com/hrv-hbpj-ird

Thank you,
Andrea


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
