Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF0668C5EE
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Feb 2023 19:38:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 320213CC263
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Feb 2023 19:38:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D39553C9339
 for <ltp@lists.linux.it>; Mon,  6 Feb 2023 19:38:34 +0100 (CET)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CBE071000936
 for <ltp@lists.linux.it>; Mon,  6 Feb 2023 19:38:33 +0100 (CET)
Received: by mail-yb1-xb30.google.com with SMTP id cf30so10251991ybb.11
 for <ltp@lists.linux.it>; Mon, 06 Feb 2023 10:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wt+lghRAcI+mmaJogPUCFs2cR6phf6FDYAUuzX8lHGw=;
 b=soI8eVrLHK+x6skHNi5yZb4H4pkHwWC1zkOmncQIh8gCUgmLGcVXNQ0lwKWyMRt3VB
 4MY7zyWowzZKH03nLjswOGXEA/yieutqeLFYCNrneSjAGRgur6xtdoZuFUgscPEpYnlp
 TkybAO7cmSlkp7zF0v234bcZIY2YzNzs2l9B+DEOOzgvjaJwrTTYd+hPwMuaeHQgkDFp
 1nIgw/v01cwZOu4z71owQQ7H4ykJMz++p01xI5GcY+b3mzvNVhpW2BuTuzDV3O+yyOvW
 s+bt2OlOqGdQ3zJXTBiIYcZXJ2B5WQEsWD25QqocOgAhgXqm9bWP/G3gf5Css3IDnLoh
 3RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wt+lghRAcI+mmaJogPUCFs2cR6phf6FDYAUuzX8lHGw=;
 b=h4a6JYZ3CML8OGgwwcyOeMzx9nLo12vUhIWrG7yJfhdC4kOeL5BqjFNHyAIg7PZN2K
 SlN+1/8XMjUWuGavkvgd3U7ZPK4igaUs3uSym1ca/5zAyX4uMay/Tn2pXSMfaGkxaskJ
 7reGi0B2Q1dXDJGP2z/FTT+ahn11Osfl7nHgzWq4EJwWJrjnH4+2/zN8iM6zGYbF0FQZ
 RRECrnuF7SautLLadaPeiWC1DyahhZ/S+mTEmDgoCu/8rvwCfExLSpZfxKRjMzk2Wmly
 vzyxNWIRgMmS2J8aVvmF0FM8dcgJKOZr0FYuO8I0LmacOucsMApBJQOec0zuLuPnucjF
 VJ0Q==
X-Gm-Message-State: AO0yUKWRfNLN/8p07/jMmmIt/Hm80R2CpsYVurlWoaq2KgngVLtMh7+V
 fxYW3FXjCmfgYtOoDWrH4n5g4d+Oj6wTJvWbPlb6TA==
X-Google-Smtp-Source: AK7set8MHp6TZDlxZSyjuvbR2da6eujvDlZFBOom3KdDJqqerMt9VMEZEGgOd5bThH/MQRM/cY7fjBdYZS0TqHOe1YU=
X-Received: by 2002:a05:6902:d2:b0:86b:91af:f231 with SMTP id
 i18-20020a05690200d200b0086b91aff231mr88569ybs.255.1675708712494; Mon, 06 Feb
 2023 10:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20230131002532.459456-1-edliaw@google.com>
 <Y9paGafh97zKnu/j@pevik>
 <CAG4es9V2773dyVrDwt7fiUq=VkUrn0Tr8icCC=X3xx+RGrbR9A@mail.gmail.com>
 <Y9trG4QnXUEbhBbJ@pevik>
 <CAASaF6xQPu1ZgAFKMLjbLtcP4woq7+uQ_H4phB5TO_6CLsy_kQ@mail.gmail.com>
 <Y9tyNEspOUlHMOGU@pevik>
 <CAG4es9X=_vaE_3oX4JD598BNSX8RmQmAKVJS2kZdE1XzUjRu+A@mail.gmail.com>
 <Y9zfkeF3MdzMeizT@pevik> <Y9zhLO27YMWd6p6n@pevik>
 <CAG4es9Wy8pnEJqr2D2WvL=4kmP_JF+QTGVKYixCrBenv7Lg83A@mail.gmail.com>
 <Y+CR8VDtE4CpmDAA@pevik>
In-Reply-To: <Y+CR8VDtE4CpmDAA@pevik>
Date: Mon, 6 Feb 2023 10:38:06 -0800
Message-ID: <CAG4es9Ux5Vc6YDn0A0NepH1yHMRacyqns5z5CfkmZBy6eTrYfQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] close_range: check for kernel support below 5.9
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Thanks, I will do that in the future.  This is the only time I've
encountered this so far but will look into doing that if there is
another.

Thanks,
Edward

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
