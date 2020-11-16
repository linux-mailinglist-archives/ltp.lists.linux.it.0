Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F62B4F05
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:19:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D76F43C6AF4
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 19:19:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 671F83C4F3C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:19:56 +0100 (CET)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 246C2200C1F
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:19:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id f20so25783767ejz.4
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 10:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=NTGfdoHGXkCq7vt0kZUN/xDWBf3HfW40exJHG9blRzk=;
 b=oftTGIK1YvX1cZ9qdAyj3v/sIWe20WHlsDAYoPq8CtbHJWllKkrCB0tCZY7mYmDACm
 fPZh8faLugswn0iQxlYKAmRFfW2OsJFRNrGTzLWR8Go2ruz7nbUsDd/WAupstbWV8W7E
 +TnTUmvsS3dGXwaOaQFwKtisQx4t6tiKi4uAg/IW9k/7VLsqO4G75KjAG2IovxVd80E9
 mCioLP6GY5KyuwEsUkVsPbveUEGrJu4dbaftkdo9oGRyIRJxVItJuqjawxpLzyWdtCKg
 O6hm476xo6wzkxl4saBfNdwRR1waRXrdY1SG9AYzLvPog5SbOsIJvCPFd8cXQsdNZ5sM
 m8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=NTGfdoHGXkCq7vt0kZUN/xDWBf3HfW40exJHG9blRzk=;
 b=fiFN4oJDaM4fht/413Aai2+8RVgN/WWU2lNnS2Vkm9V28Au2a+BDt8cCCl1ncPK/Kb
 rTyozSmnpfRE58h0aHebKI9bbjVbQVDJDf1MYOd4x0oEqz/m+kwCfiSbxzABkJ+nHqko
 r2zfS7pTWlTDVNOt7B2k0s4S3ix8Fe8LnRFCsdiC0frZjHXXWJCVCzjOKJkuY9l+S0HP
 ohYui6FZ1DNvYc4olDZCQGc/0+5y4IxZFqAq5zL+Kr4j8+h7/OzRa84yvwTa88MMaJwI
 I43gfmJsL7mt965rSsT+WTKRmwITPNnifcwH3hH1APUfX4KzBT2p9SwVdnPerfZnQvmE
 z5Iw==
X-Gm-Message-State: AOAM530qd/5O3TpfW5U/DtLgY3rjdabdwlc6JHurBPA2aBfbT/71QjEL
 EzqGt+1pA1GdhRWWaWZK/E/HOvcfKQHGLw==
X-Google-Smtp-Source: ABdhPJzKnoneLp+ktcjPKQvOZry/Ekrec8BgSWnY9slYVIpv44/jnFpH3D71zh6WM6XSZZYm4VXh3A==
X-Received: by 2002:a17:907:1112:: with SMTP id
 qu18mr16063576ejb.507.1605550795750; 
 Mon, 16 Nov 2020 10:19:55 -0800 (PST)
Received: from pevik ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id lf18sm7912857ejb.74.2020.11.16.10.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 10:19:55 -0800 (PST)
Date: Mon, 16 Nov 2020 19:19:53 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20201116181953.GD152616@pevik>
References: <20201116003345.3261577-1-raj.khem@gmail.com>
 <20201116070857.GB81864@pevik>
 <CAMKF1sqjVMexm38VVt=grmL-K63=hyfA-0aoNyi=53TyFVXJ0w@mail.gmail.com>
 <20201116170320.GC152616@pevik>
 <CAMKF1srem0H=hkjkD_Yb1qzyygbbosB06y9x6=g+PasASQrqRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMKF1srem0H=hkjkD_Yb1qzyygbbosB06y9x6=g+PasASQrqRQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Define SYS_futex on 32bit arches using 64-bit
 time_t
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

Hi Khem,

...
> I tested https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af
> and it works fine. So please use this one.

Thanks for a confirmation, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
