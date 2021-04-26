Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C41736B2E5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:18:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D6543C6706
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:18:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C24D3C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:18:04 +0200 (CEST)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CAAB8100040A
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:18:03 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id zg3so2480506ejb.8
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2DL1f3iwCIgRS33TTSmHy8hMSybmA0Mt/9KqCm10xkg=;
 b=v0h6hATEwrrUGzgja8OeqBVeB/WuwdEAipFsaANeNYaXNavpkT7hrAW0ikyBEA1aBm
 LzOZV307j8sClnF8puwM5a+RWA7Ur1dhEKAHYND07HimP6gN4fmwCJrJM3XrQY4IEjex
 ybogQzssLyvuP2/g92ATveMJe7p4nKc4U36IMC/SZ0AD7tasMYF+4ULsc0cEYyO+pzxC
 yChfc9SgJ9btMEBRTQHx/a3sWnKPeCIjeQ0T10kBDcnW/fVkmd/f25wDKFtlv3X2KzOt
 yTE5y4lWrJ9W3ewvf6Ag18d/Bwzmkdvl1Yp9OWo6l/f9lDGGc/k4ThwFfJCqo3nAvgHx
 V0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2DL1f3iwCIgRS33TTSmHy8hMSybmA0Mt/9KqCm10xkg=;
 b=LCfbU4GDbqoeRVaN60CGH7XoRXJMaL6TeFjdFCmuCrDUzRs/qHE0tIUaftsyyoe2vI
 3CGY3q5KomD01k10Ss3vohmxwyJczkAY3AzcdhZ+XTF13+/dBD0oIe7cAlsAnxJTUgCV
 8jX3NihpBgyyeqCUT5LGeRXTikmn2/o30E632Esq4NRp8iVseWtNfJJMapWnLkdojd5j
 AXprB1t7a9vJackcZyDjEPJTnWzmlTeH2sbRzZRqfwymIUUo3c5RmSh0gsADJGE/AIjk
 iaZlr7RYn4DawuO9OlzzznzAsfQSccBnJkI13T5Kd2QFaW4xmc8ymHGBuW3liL+JAhSZ
 imRA==
X-Gm-Message-State: AOAM533xMBwPadj2z79xoZ/2QCbKEPMHP2ENlvACZ7hF/jgckqk2Z/ld
 jycRC7ftvLAhaMWuea2Ifv4WzCe2aM2PUJ9mPGO4FA==
X-Google-Smtp-Source: ABdhPJwOLL/qPbhyeSI9XELZVQbH44As/eU7LYKQJIhn75uC8tQ3phXf85lnVAuy/PbIB0J1tmEQbBZJXPGu7Cn19Y0=
X-Received: by 2002:a17:906:c348:: with SMTP id
 ci8mr18480929ejb.303.1619439483326; 
 Mon, 26 Apr 2021 05:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <YH7Z8nOX90qjsMpa@yuki> <YIE0INnCJOMGYQQR@pevik>
In-Reply-To: <YIE0INnCJOMGYQQR@pevik>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 26 Apr 2021 14:17:50 +0200
Message-ID: <CADYN=9L9ic-q44dNPvDmDo1T+-=U+gDqUrKWGX_L2tUkpamYPA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] runltp-ng and possible ltp-pan deprecation
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, 22 Apr 2021 at 10:30, Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Cyril,
>
> Thank you for bringing the discussion to upstream runltp-ng.
>
> I'd prefer to add the project to ltp git

I agree with that too.
Also if we can seamlessly move from runltp to runltp-ng, since we
don't want the behavior to change.
Or we need to support both for a release or two and then remove runltp.


Cheers,
Anders

>, in runltp-ng/ in root directory.
> And add either a symlink runltp-ng/runltp-ng to the root directory or have a
> shell script which runs it:
> perl -I$(readlink -f $0)/runltp-ng $(readlink -f $0)/runltp-ng/runltp-ng $@
>
> Kind regards,
> Petr
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
