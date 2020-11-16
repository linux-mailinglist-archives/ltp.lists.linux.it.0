Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C02B5159
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 20:42:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 943713C6AF7
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 20:42:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 503F23C4F3C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 20:42:15 +0100 (CET)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E43EB100048E
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 20:42:14 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id me8so26092414ejb.10
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=4YuQez7uCY55liaFEHnM0mdEquPnLBuTkvhv5QDKFW4=;
 b=OUPumGpsWCEjO5ERFa5Nu/0cxsEW09RYxJ2NPaOk2rk3tabBQxmBKOwmScRznrgBAL
 zBPDBd9Tja71Ad8jUrBMps8AZJjLMORQ0zhM8hXJMJF4L28XR3KDihqEzgnx58tmq7J2
 aFNdfclOCU3GTxU9k5TuRQ5yw92csb/u7+h49pFVG7OTp1XfJkcGV7PfLxuwPgEq5rPo
 IL3YPKmECj9Ssud7gYu1/n6XQ3dTZ+gc67aLtRoH/F0iO7YtiGHKGI5KLqIugSaRHUWK
 ppEs/kzPDhckXQ90bhFu+rzfkAWsDlydgeiE0PKTcHeV082KYa8J/07/XjVvrn0uI9dq
 VCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=4YuQez7uCY55liaFEHnM0mdEquPnLBuTkvhv5QDKFW4=;
 b=VH7I8x75JRNbiZnozDvtPmn0vDJ33MFZYFAwEAiO6Kx71i2YtToO679Vu9ij8XDrFo
 qb2s0WfinIBMACLZsgH4O3JO60/wcdeTqnco5DIbU3P40rhPZuJfNIaloVgJc9ieL3GM
 luhBqh7fm4k0n2iwZU8Ogv6HB/svc4RKXIebdgFnGoOM/+hiinPfUt2LqOlk7W0jDaGe
 PCJcHQd1G0Emf67OrLZJjgMLSoarfLwxxwY5UEV5BaE+eojiCk+vUeyqb2drHviQ0O5N
 z8+r4sTNAd3rkuL41AKuEZaWyFMSMQCkw+1FFrgerQX1auljwm160+duyZTRNipqIujn
 SA3A==
X-Gm-Message-State: AOAM5310zs+bDx7y7XRG0zF1DUfKpODMWKGB9E+6CtzX6m5EtDExK71Y
 pgVpOmy9gMG84BBoP7aU92c=
X-Google-Smtp-Source: ABdhPJxVT+k3ltevSHOXjn6rbH9/nOJq6F+wutO5mMmsItz5T7QxrEnrPLwllPZGxRoc9Y5JNhBSRQ==
X-Received: by 2002:a17:906:4dc2:: with SMTP id
 f2mr15808626ejw.446.1605555734518; 
 Mon, 16 Nov 2020 11:42:14 -0800 (PST)
Received: from pevik ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id gl2sm1708213ejb.29.2020.11.16.11.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 11:42:14 -0800 (PST)
Date: Mon, 16 Nov 2020 20:42:12 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201116194212.GB181383@pevik>
References: <20201116124611.16919-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116124611.16919-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] Convert network stress tests to tst_net.sh
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi,

> this patch series converts (all?) remeianing tests in network/stress to
> use tst_net.sh
Please see my comments in first patch, they apply to second one and mostly to
third one as well (it should use route-lib.sh).

Ad all: I've never reposted fixed version for route{4,6}-rmmod [1] (needs a cleanup)
I'll do it soon.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2017-July/005079.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
