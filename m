Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 817182B4BF6
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 18:03:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A6403C6508
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 18:03:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 228883C2F6C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 18:03:23 +0100 (CET)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8C7B260099D
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 18:03:23 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id cw8so25408930ejb.8
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=WJVrtIV+kYpA0f0udlzav68xAftdj48rCrdcY6r+Uv4=;
 b=rr5PilxdaYa428U2hIk1iVMVMklJ8T++WX3LNJaVmEmwBSJBDcussQ20FYqQ/1EMIl
 gNwnMBEgfwB7Kzbl4DC2+2p9hKCNZgv/+/Er1Khtx1Kb9uZFSGxnx7168EiPgHpxFwkO
 6nFg2QZONNrjKVc2aGTVzcXWo9Am+Yw0wgrOo7pBlFECAJ/AjKSAd+6N1cwWnIpWlQrF
 UBkFvOto3sFvhB1Jypwn39rv/GXCe7MIqiOEjq+d8wkpWC56Z93X5feT68mtFhsEkFPj
 8GnpUsGUzRRHc6bOyGkzeH7Yr8CZAq1G/PLmBuToppfS2IaZJU9zdSc1QwPTN/cs+7gL
 rsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=WJVrtIV+kYpA0f0udlzav68xAftdj48rCrdcY6r+Uv4=;
 b=Fnsx3be7fBD7iAP9zIhFUrZZbIUtFZVOuDwtA2qhlxhcRZi0/95mXE4ApyMXWj+9c6
 XpxyryVTfl9gAhlRTWuwJBsJiGg2Z4BjFThzVtVcEEhMFAHH4OKkJBVfs4P7hIYVmrAs
 LkFe18rJPoV1Y533jm/6hyKcSGBBpX752apD7HNKBm0/vdWgh/R+q6HGz0QYUMezVciW
 flH5BFdBfSLtxHC2nfIeoHH76vT2890l7UbQEltLRAKFy2gZHsq7z7+Tue11sKPi/JQV
 1myT4+XNCUL6zE9fP+IT6TEVIq82JMVxgPSw18sD6ayYTTP1GaUA6uhzSUuOolnZVunO
 NN+A==
X-Gm-Message-State: AOAM532/LX7ZD6cwbs70GgPJrtJ6yWzi3pFFkigncasrvunPJav6eZAX
 SDBB3v42VAXpSt6n4RHstQk=
X-Google-Smtp-Source: ABdhPJyL/JnaE2C6xgqVN9DVIHKHLl8kxCl20cthC/ZwRnlho0GkkdrwSh/sZS4P+dY/Z5giF/Ua5Q==
X-Received: by 2002:a17:906:180b:: with SMTP id
 v11mr15252038eje.466.1605546203086; 
 Mon, 16 Nov 2020 09:03:23 -0800 (PST)
Received: from pevik ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id zm12sm10530470ejb.62.2020.11.16.09.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:03:22 -0800 (PST)
Date: Mon, 16 Nov 2020 18:03:20 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20201116170320.GC152616@pevik>
References: <20201116003345.3261577-1-raj.khem@gmail.com>
 <20201116070857.GB81864@pevik>
 <CAMKF1sqjVMexm38VVt=grmL-K63=hyfA-0aoNyi=53TyFVXJ0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMKF1sqjVMexm38VVt=grmL-K63=hyfA-0aoNyi=53TyFVXJ0w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

> On Sun, Nov 15, 2020 at 11:08 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Khem,

> > > Newer 32bit arches like RISCV32 and ARC are using 64bit time_t
> > > from get go unlike other 32bit architecture therefore aliasing
> > __NR_futex to
> > > __NR_futex_time64 helps avoid the below errors

> > > tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'

> > Thanks for your fix.

> > I wonder if this could be defined just in include/lapi/futex.h and this:


> > https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af


> It could be but it did not work everywhere when I tried it I guess this
> header has to be included in all needed placed

Sure, but that's done :)

You put the changes into 3 files:
lib/tst_checkpoint.c
testcases/kernel/syscalls/clone/clone08.c
testcases/kernel/syscalls/futex/futextest.h

Check the affected files:

I put changes into include/lapi/futex.h
and load it in
testcases/kernel/syscalls/clone/clone08.c

The other two (testcases/kernel/syscalls/clone/clone08.c
testcases/kernel/syscalls/futex/futextest.h) already include lapi/futex.h.

Are you sure it's failing when you try my patchset?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
