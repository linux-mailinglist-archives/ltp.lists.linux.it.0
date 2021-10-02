Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC341FD61
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Oct 2021 19:23:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BC493C8867
	for <lists+linux-ltp@lfdr.de>; Sat,  2 Oct 2021 19:23:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B179C3C6C40
 for <ltp@lists.linux.it>; Sat,  2 Oct 2021 19:23:53 +0200 (CEST)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B3F6E10006A1
 for <ltp@lists.linux.it>; Sat,  2 Oct 2021 19:23:52 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id u18so21011376wrg.5
 for <ltp@lists.linux.it>; Sat, 02 Oct 2021 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=FOUVuPO3hNbeyjvXgbg4HoTMyH0Ch9m0aPPtRVvlFDU=;
 b=Ck/fUq1DOIKoi/5JBQCJ/OyMpYeq3kJKxSa0x3L/SoVn0mV+MbwJs3a994qfi9kZJ2
 ob3CzF9ty6tz0hhMLiOkWzJmGP8vkLEHVXsUr8sUZXp4sWRaYWnf7Cjpk2Ed1mtHJ0aX
 isDx3E+HXGPzoZ2t2ALQPE+BteR8rf+PLvUDZYsxz9uC5zUkGAQm/8YlqC9pSoiygI4m
 msSSbyg0kwVADqSRBpTnArDEWH2IJ6/IZKJPu6GMZT0Xx5MQRWIr+YZ/MwGiCHDCkqSE
 DWpfDh15Kvq802JNnv0fGiGMpJ8AGCf2hMC4MHg80o+lnV+v2RMRTuNjVN6q5HaBxZcz
 S/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=FOUVuPO3hNbeyjvXgbg4HoTMyH0Ch9m0aPPtRVvlFDU=;
 b=vhqrIRS8Ya97rQHKVRHDe/AC6iS6UJkA2mCiz+UEdmhlK3M2OM+o+LqiNubUaHSiFr
 fdY+iihSGZaC5wwJFNgr3bVZCjz2RNtTZ4fZ1AZrBY80C3w4uB/3D2AkIMPqeRUQYmvP
 2ydbFw3oeus6Ow2KYYGhsmBxEwdXTy5JaFBySljKnOGxftjGXK9v2hw9ocD1BKJvUQcn
 nXoA6I0HrlCAdHI3rqZXyIjnwPrOOP02hVv9hurBhoJPdLjta0U3VjEgVQj2SWl+oCEJ
 m2Xb6uc0xqOeqF5EVZ8hXtCNqfnRR0YuhnG4rWM92k9uHbEumXF+Nm0OxbECKwA5XaC/
 rlMg==
X-Gm-Message-State: AOAM5335n5pfQGT9NfuUZhbYl2uUf0BhIAmt/xrAdfGIpv2EGk0bpiE9
 vZ3f24QWNn/PfXXryIAp7gI=
X-Google-Smtp-Source: ABdhPJykMcxK+yTqNWaf12RxeEtGZ5fc2JKGK1zicexBLcfy19SNACWuGRa6xlXmj5mdE5ewKR2+BA==
X-Received: by 2002:a5d:5234:: with SMTP id i20mr4378231wra.415.1633195432311; 
 Sat, 02 Oct 2021 10:23:52 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c15sm9268015wrs.19.2021.10.02.10.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 10:23:51 -0700 (PDT)
Date: Sat, 2 Oct 2021 19:23:49 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YViVpZZG4VvSd7Nc@pevik>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
 <20210930183058.5240-4-petr.vorel@gmail.com>
 <8868d50b-0f30-7570-5d26-d93d809e6cf6@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8868d50b-0f30-7570-5d26-d93d809e6cf6@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 3/3] lapi/if_addr.h: Define IFA_FLAGS
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

Hi Martin,

> Hi,
> commit message for this patch should be "Define IFA_F_NOPREFIXROUTE" but
> that can be fixed during merge. Apart from that, the whole patchset
> looks good.
Ah, keep doing silly errors, thanks for catching this!

> Reviewed-by: Martin Doucha <mdoucha@suse.cz>
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
