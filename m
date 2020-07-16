Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F0A221C55
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 08:07:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 662503C2958
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 08:07:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4191B3C136A
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 08:07:13 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D13AF1401424
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 08:07:12 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id o8so8682121wmh.4
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 23:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=7b2Hs9BUD9KbuVSxrNLLNr15BdmLQYsicvNDhL/xjTM=;
 b=bcjkedDnIRS6HiDFWd8Vbzs9kpRd5WnicC6JxhPLIFlthER+Q+8F7Vx9fvORwrpwsZ
 iEGT/0U/mwyEeOyp5EfStB4Al4KueXmOZIM6jJvlkplou9TxkWA6NDHy6CvuBvIg5Dlr
 TS7o4WfNtPOPpRoy7IdTvNoBipk3ZDHOp9dtt6nR19MI2Aa/4e690sJsBLMzTVuDHnYc
 URKuaZfO30z4IxtkP/gA1Uk0zE4rlY2yBnl9SZnaKtxdzJSnp4T9iFu5F5am8EmYietk
 ulLuYxemltiDGothQ+uwX89Br0o/pkDv0D2JMJ8cc5kmURXUQItguFwnP/14F7Rt7TEc
 C+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=7b2Hs9BUD9KbuVSxrNLLNr15BdmLQYsicvNDhL/xjTM=;
 b=CbbDz0zr5nBviMJcwX8cWyeDyCDX6c8UPBeYhaHjV3r9MAbK5794ccdolQbdhP6RMu
 VCmY4WqI1DqxCVOUCz8jrwMmfcoT9Zz1MDbLOa9rWEIqiCOufFaTEqVhy89DH8YZnjIA
 h/HwSYUhqiffgBtY9zUXexEn8YNfw2vpZkcRq8NDHjcISM1MVyYj6In2PMiaGm51broD
 MSuy1/yyWdp7y1Nn2H3n7PTdO8RrkwScupATwRXgp5jNjAugLlCnYxeDZIrzOj9HfyFX
 Jsx4+3X+RTW/6Sj3srS+tu3aJz3CRrSJCnG3THH1alglGk/zPqQovSZIR1bKzGQY6jgx
 GNhQ==
X-Gm-Message-State: AOAM531mnDDrHwtiW/5+0OBzW+doIj2NAT5fDHiTwiIonEwi7NY54SvA
 YBx/lKRTxU4/DtvdySfcxew=
X-Google-Smtp-Source: ABdhPJwcI4XrkLZCmUMFI2vpjXlhQ8l7+2dcC2hj67BamxTcPysNaI73yaMmc3HdsGYgR2mIJ2aO0w==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr2956733wmc.106.1594879632448; 
 Wed, 15 Jul 2020 23:07:12 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id a15sm7622616wrh.54.2020.07.15.23.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:07:11 -0700 (PDT)
Date: Thu, 16 Jul 2020 08:07:10 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Qais Yousef <qais.yousef@arm.com>
Message-ID: <20200716060710.GA3812@dell5510>
References: <20200714152510.13470-1-qais.yousef@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714152510.13470-1-qais.yousef@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qais,

thanks for your patch.
BTW this has already been reviewed and tested by Huacai Chen [1].
LGTM, although I'd prefer to detect with with polling, isn't it possible? [1].

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/pull/706#issuecomment-658492329
[2] https://people.kernel.org/metan/why-sleep-is-almost-never-acceptable-in-tests

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
