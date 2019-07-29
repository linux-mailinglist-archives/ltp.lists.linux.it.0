Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F878D51
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:59:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F2AE3C1D6B
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 15:59:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7F8A53C1D26
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:59:54 +0200 (CEST)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F3B141400C46
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 15:59:53 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id v15so59440621eds.9
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lxtlt7400gHZV727cuWtw4gSZ89HCSh/xSKYw7D7izU=;
 b=TAfKt8rFeYqDqpYporTOn8Y/4cZiNHiK9EEEpy+/GmnVQPj0O7JEzlp8vUU/oXPVSJ
 Uov5yxsWM//W9QBmedfaxUaqIuRyvFapuTbUaBYQ0A4WNpFcNeVu74WJRJIcGojOBvFB
 mB2/aS56gPG4bY4uvWwrGGguA40R425RPYVxyOqXgvJ5I7HW+ZARd4n3U59ABFbBcBHt
 sVWlos6Pc1ZPDoHms4eyev4q4sj/kr7daglNAoH0Nzd42eALAoPtcZjkWh013/L9zLIu
 NdM24jbUSEk1nvx8U901cnmRm+0m4LVkPaGdF+K7RxyP3/QKlntV5YSumGyR76/sG7YX
 mT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lxtlt7400gHZV727cuWtw4gSZ89HCSh/xSKYw7D7izU=;
 b=EgytyRnhA186NiXp8dUex4WZzLCiPU/iRaVYB9lBQyjO7jh1fGRD0H+pXNRTE9TKns
 AxhShBinVyp9v+OinEKY2xxD4Ha4/gauiHej+tf77kR65CV55aPpVXbrBamGJlUrcLcI
 N4NtrRXMHAIvlLhHDFwIF4JXZuRihn9PQMXUaNPqKHb3I7Ze6IdtGDHP2lNB9+QspIvh
 rVSIoo+J9e7sDmfmyPGGpKYWoHEZMCvQDBAzaCESGdWNuW9KInModU4QBgaGjhxHT+FI
 ukbjPxX6WmWv+SknNtzDfzkeBHhrEQCrwkXaKbOW9U0nd36hQZZCEfT/Vbl3B5SUrn3K
 09Ag==
X-Gm-Message-State: APjAAAVtoi4Oi9kQMk/XtHFlMRcD3Ck2yYjFak5ZOcwjekDOfag6K9Eu
 37b4NvGTqLbNU3OzZ7iJ9RY=
X-Google-Smtp-Source: APXvYqxy9cH1MSuG9ONtKlumqYMz7Qstrit3SbGJm2y6ixIlzBLQNoeQYkrfcIuO/nu7Bww8JJAABA==
X-Received: by 2002:a17:906:7f91:: with SMTP id
 f17mr82469230ejr.250.1564408793407; 
 Mon, 29 Jul 2019 06:59:53 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id w6sm7587937edq.81.2019.07.29.06.59.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 06:59:52 -0700 (PDT)
Date: Mon, 29 Jul 2019 15:59:52 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190729135951.GA32069@dell5510>
References: <20190711125108.GB8709@rei>
 <1563356676-2384-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1563356676-2384-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729135627.GA31077@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729135627.GA31077@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] syscalls/copy_file_range01: add
 cross-device test
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

Hi,

> Hi,
> > Amir has relaxed cross-device constraint since kernel commit 5dae222a5(vfs:
> > allow copy_file_range to copy across devices), I think we can test it in
> > copy_file_range01.

> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> Whole patchset LGTM, but here we got quite a lot of failures after increasing
> test coverage with .all_filesystems = 1 (which use should be noted in commit
> message):

> copy_file_range02.c:120: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL
> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
> ...
> copy_file_range02.c:126: FAIL: copy_file_range returned wrong value: 16
I'm sorry this was meant to be sent for v6.

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
